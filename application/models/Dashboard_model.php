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
		$res = $this->db->select('idsucursal,sucursal,FORMAT((SUM(monto)*-1),2,"es-PE") as monto')->from('cuentas_cobrar')->where($where)->group_by('idsucursal,sucursal')->get();
		return ($res->num_rows() > 0)? $res->row() : array();
	}
	public function pagar($where)
	{
		$res = $this->db->select('idsucursal,sucursal,FORMAT(SUM(monto),2,"es-PE") as monto')->from('cuentas_pagar')->where($where)->group_by('idsucursal,sucursal')->get();
		return ($res->num_rows() > 0)? $res->row() : array();
	}
	public function caja($where)
	{
		$res = $this->db->select('idsucursal,sucursal,FORMAT(saldo,2,"es-PE") as saldo')->from('saldos_caja')->where($where)->get();
		return ($res->num_rows() > 0)? $res->row() : array();
	}
	public function articulos($where)
	{
		$res = $this->db->select('idsucursal,sucursal,articulo,SUM(cantidad) as cantidad')
				->from('articulos_ingresados')->where($where)->group_by('idsucursal,sucursal,articulo')->get();
		return ($res->num_rows() > 0)? $res->result() : array();
	}
	public function sucursales()
	{
		$res = $this->db->select('*')->from('sucursal')->where('activo = 1')->get();
		return ($res->num_rows() > 0)? $res->result() : array();
	}
	public function anios()
	{
		$res = $this->db->select('*')->from('anio')->where('activo = 1')->get();
		return ($res->num_rows() > 0)? $res->result() : array();
	}
	public function valorizados($where)
	{
		//$res = $this->db->select('*')->from('grafico_valorizados_reporte')->where($where)->get();
		$query = $this->db->query('select anio,sucursal,articulo,ANY_VALUE(sum(valorizado)) as valorizado,ANY_VALUE(sum(no_valorizado)) 
			as no_valorizado from grafico_valorizados WHERE '.$where.' GROUP BY anio,sucursal,articulo');
		return ($query->num_rows() > 0)? $query->result() : array();
	}
	
}