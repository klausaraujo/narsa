<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Ventas_model extends CI_Model
{    
	private $usuario;
	
	public function __construct(){
		parent::__construct();
		if($this->session->userdata('user')) $this->usuario = json_decode($this->session->userdata('user'));
		else header('location:' .base_url());
	}
    
	public function listaClientes()
    {
        $this->db->select('cl.*,td.tipo_documento');
        $this->db->from('cliente cl');
		$this->db->join('tipo_documento td','td.idtipodocumento = cl.idtipodocumento');
		$this->db->where('cl.idcliente >',1);
		$this->db->where('cl.activo',1);
		$this->db->order_by('idcliente', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function listaCliente($data)
    {
        $this->db->select('cl.*,td.tipo_documento');
        $this->db->from('cliente cl');
		$this->db->join('tipo_documento td','td.idtipodocumento = cl.idtipodocumento');
		$this->db->where($data);
		$this->db->order_by('idcliente', 'ASC');
		$this->db->limit(1);
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->row() : array();
    }
	public function registrar($data)
	{
		if ($this->db->insert('cliente', $data))return true;
        //else return $error['code'];
		else return false;
	}
	public function editar($data,$id)
	{
		$this->db->db_debug = FALSE;
		$this->db->where($id);
		if ($this->db->update('cliente',$data)) return true;
        else return false;
	}
	public function listaVentas($data)
    {
        $this->db->select('gs.*,su.sucursal,cl.nombre');
        $this->db->from('guia_salida gs');
		$this->db->join('sucursal su','su.idsucursal = gs.idsucursal');
		$this->db->join('cliente cl','cl.idcliente = gs.idcliente');
		$this->db->where($data);
		$this->db->order_by('gs.idguia', 'DESC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function medioPago($where)
	{
		$this->db->select('idmediopago,medio_pago');
        $this->db->from('medio_pago');
		$this->db->where($where);
		$this->db->order_by('idmediopago', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function tipoPago($where)
	{
		$this->db->select('idtipooperacion,tipo_operacion');
        $this->db->from('tipo_operacion_cliente');
		$this->db->where($where);
		$this->db->order_by('idtipooperacion', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function ingresaVenta($data,$pago,$idtran)
	{
		$i = 0; $idguia = ''; $numero = 1;
		
		$this->db->trans_begin();
		
		foreach($data as $row):
			if($i === 0){
				$this->db->select('MAX(numero) numero');
				$this->db->from('guia_salida');
				$this->db->where(['idsucursal'=>$pago->idsucursal,'anio_guia'=>date('Y')]);
				$result = $this->db->get();
				if($result->num_rows() > 0){
					$result = $result->row();
					$numero = floatval( $result->numero ) + 1;
				}
				$guia_salida = ['anio_guia'=>date('Y'),'numero'=>$numero,'fecha'=>date('Y-m-d H:i:s'),'idsucursal'=>$pago->idsucursal,'idcliente'=>$pago->idcliente,
							'idtransaccion'=>$idtran,'monto_valor'=>$pago->total_vta,'monto_pagado'=>$pago->total_vta,'observaciones'=>$pago->obs,
							'idusuario_registro'=>$this->usuario->idusuario,'fecha_registro'=>date('Y-m-d H:i:s'),'activo'=>1];
				//$guia_entrada[] = $tran;
				$this->db->insert('guia_salida',$guia_salida);
				$idguia = $this->db->insert_id();
			}
			$rowdet[$i] = ['idguia'=>$idguia,'idarticulo'=>$row->idarticulo,'cantidad'=>$row->cantidad,'humedad'=>$row->humedad,'calidad'=>$row->calidad,
						'costo'=>$row->costo,'tasa'=>$row->tasa,'costo'=>$row->costo,'activo'=>1];
			$i++;
		endforeach;
		
		/* Insertar array de valores en la base */
		$this->db->insert_batch('guia_salida_detalle',$rowdet);
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return 0;
		}else{
			$this->db->trans_commit();
			return $idguia;
		}
	}
	public function transaccionVta($data)
	{
		if($this->db->insert('transacciones', $data))return $this->db->insert_id();
		else return 0;
	}
	public function regMovCliente($data,$f,$pago)
	{
		$this->db->trans_begin();
		/* Isertar en la tabla movimientos proveedor */
		$this->db->insert('movimientos_cliente', $data);
		unset($data['idmediopago']);
		unset($data['idcliente']);
		$data['idfactor'] = $f;
		$data['base_imponible'] = $pago->base_imponible;
		$data['impuesto_igv'] = $pago->imp_igv;
		$data['check_igv'] = $pago->check;
		$data['serie_comprobante'] = $pago->serie;
		$data['numero_comprobante'] = $pago->num;
		/* Isertar en la tabla movimientos caja */
		$this->db->insert('movimientos_caja', $data);
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return 0;
		}else{
			$this->db->trans_commit();
			return 1;
		}
	}
}