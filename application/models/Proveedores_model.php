<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Proveedores_model extends CI_Model
{    
	public function __construct(){ parent::__construct(); }
    
	public function listaProveedores()
    {
        $this->db->select('pr.*,td.tipo_documento');
        $this->db->from('proveedor pr');
		$this->db->join('tipo_documento td','td.idtipodocumento = pr.idtipodocumento');
		$this->db->order_by('idproveedor', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function listaProveedor($data)
    {
        $this->db->select('pr.*,td.tipo_documento');
        $this->db->from('proveedor pr');
		$this->db->join('tipo_documento td','td.idtipodocumento = pr.idtipodocumento');
		$this->db->where($data);
		$this->db->order_by('idproveedor', 'asc');
		$this->db->limit(1);
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->row() : array();
    }
	public function tipodoc()
	{
		$this->db->select('idtipodocumento,codigo_curl,tipo_documento,longitud');
        $this->db->from('tipo_documento');
		$this->db->order_by('idtipodocumento', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function factor($data){
		$this->db->select('idfactor');
        $this->db->from('factor');
		$this->db->where($data);
		$this->db->order_by('idfactor', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->row() : array();
	}
	public function registrar($data)
	{
		if ($this->db->insert('proveedor', $data))return true;
        //else return $error['code'];
		else return false;
	}
	public function editar($data,$id)
	{
		$this->db->db_debug = FALSE;
		$this->db->where($id);
		if ($this->db->update('proveedor',$data)) return true;
        else return false;
	}
	public function tipoOperacion($data)
	{
		$this->db->select('idtipooperacion,tipo_operacion');
		$this->db->from('tipo_operacion_proveedor');
		$this->db->where($data);
		$this->db->order_by('idtipooperacion', 'asc');
		$result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function listaArticulos($data)
	{
		$this->db->select('idarticulo,articulo');
		$this->db->from('articulo');
		$this->db->where($data);
		$this->db->order_by('idarticulo', 'asc');
		$result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function regTransaccion($dataTran,$dataOp){
		$this->db->trans_begin();
		$this->db->insert('transacciones', $dataTran);
		
		$dataOp['idtransaccion'] = $this->db->insert_id();
		$this->db->insert('movimientos_proveedor', $dataOp);
		
		unset($dataOp['idproveedor']);
		$this->db->insert('movimientos_caja', $dataOp);
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return false;
		}else{
			$this->db->trans_commit();
			return true;
		}
	}
	public function listaOperaciones($data)
    {
        $this->db->select('mp.*,to.tipo_operacion,su.sucursal,pr.nombre,usr.usuario');
        $this->db->from('movimientos_proveedor mp');
		$this->db->join('tipo_operacion_proveedor to','to.idtipooperacion = mp.idtipooperacion');
		$this->db->join('sucursal su','su.idsucursal = mp.idsucursal');
		$this->db->join('proveedor pr','pr.idproveedor = mp.idproveedor');
		$this->db->join('usuarios usr','usr.idusuario = mp.idusuario_registro');
		$this->db->where($data);
		$this->db->order_by('idmovimiento', 'desc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function anulaTransaccion($where,$array,$tabla){
		$this->db->db_debug = FALSE;
		$this->db->set($array,TRUE);
		$this->db->where($where);
		if ($this->db->update($tabla)) return true;
        else return false;
	}
}