<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard_model extends CI_Model
{    
	private $usuario;
	
	public function __construct(){
		parent::__construct();
		if($this->session->userdata('user')) $this->usuario = json_decode($this->session->userdata('user'));
		else header('location:' .base_url());
	}
	public function activos($where)
	{
		$res = $this->db->select('COUNT(*) as cantidad')->from('proveedor')->where($where)->get();
		return ($res->num_rows() > 0)? $res->row() : array();
	}
	public function cobrar($where)
	{
		$res = $this->db->select('idsucursal,sucursal,(SUM(monto)*-1) as monto')->from('cuentas_cobrar')->where($where)->group_by('idsucursal,sucursal')->get();
		return ($res->num_rows() > 0)? $res->row() : array();
	}
	public function pagar($where)
	{
		$res = $this->db->select('idsucursal,sucursal,SUM(monto) as monto')->from('cuentas_pagar')->where($where)->group_by('idsucursal,sucursal')->get();
		return ($res->num_rows() > 0)? $res->row() : array();
	}
	public function caja($where)
	{
		$res = $this->db->select('*')->from('saldos_caja')->where($where)->get();
		return ($res->num_rows() > 0)? $res->row() : array();
	}
}