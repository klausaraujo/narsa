<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Servicios_model extends CI_Model
{    
	private $usuario;
	
	public function __construct(){
		parent::__construct();
		if($this->session->userdata('user')) $this->usuario = json_decode($this->session->userdata('user'));
		else header('location:' .base_url());
	}
	
	public function anio()
	{
		$this->db->select('*');
        $this->db->from('anio');
		$this->db->where('activo', 1);
		$this->db->order_by('idanio', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function mes()
	{
		$this->db->select('*');
        $this->db->from('mes');
		$this->db->where('activo', 1);
		$this->db->order_by('idmes', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function listaOperacionesCaja($where)
    {
        $this->db->select('*,DATE_FORMAT(fecha_movimiento,"%d/%m/%Y") as fecha_registro');
        $this->db->from('lista_movimientos_caja');
		$this->db->where($where);
		$this->db->order_by('idmovimiento', 'DESC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function listaServicio($where)
    {
        $this->db->select('*');
        $this->db->from('lista_movimientos_caja');
		$this->db->where($where);
		$this->db->limit(1);
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->row() : array();
    }
	public function tipoOperacion($where)
	{
		$this->db->select('*');
        $this->db->from('tipo_operacion_caja');
		$this->db->where($where);
		$this->db->order_by('idtipooperacion', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function movCaja($dataTran,$dataOp){
		$idtran = 0;
		$this->db->trans_begin();
		$this->db->insert('transacciones', $dataTran);
		
		$idtran = $this->db->insert_id();
		
		$dataOp['idtransaccion'] = $idtran;
		
		$this->db->insert('movimientos_caja', $dataOp);
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return 0;
		}else{
			$this->db->trans_commit();
			return $idtran;
		}
	}
	public function traeSaldo($where)
	{
		$this->db->select('saldo');
		$this->db->from('saldos_caja');
		$this->db->where($where);
		$rs = $this->db->get();
		if($rs->num_rows() > 0){
			$rs = $rs->row();
			return is_null($rs->saldo)? 0 : sprintf("%1.2f",$rs->saldo);
		}else return 0;
	}
}