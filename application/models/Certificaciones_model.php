<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Certificaciones_model extends CI_Model
{    
	private $usuario;
	
	public function __construct(){
		parent::__construct();
		if($this->session->userdata('user')) $this->usuario = json_decode($this->session->userdata('user'));
		else header('location:' .base_url());
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
	public function listaCertificacion($where)
    {
        $this->db->select('lmc.*,mc.observaciones');
        $this->db->from('lista_movimientos_caja lmc');
		$this->db->join('movimientos_caja mc','mc.idtransaccion = lmc.idtransaccion');
		$this->db->where($where);
		$this->db->limit(1);
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->row() : array();
    }
	public function variedad()
	{
		$this->db->select('*');
        $this->db->from('variedad');
		$this->db->where('activo', 1);
		$this->db->order_by('idvariedad', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function proceso()
	{
		$this->db->select('*');
        $this->db->from('proceso');
		$this->db->where('activo', 1);
		$this->db->order_by('idproceso', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function proveedores()
	{
		$this->db->select('idproveedor,nombre');
        $this->db->from('proveedor');
		$this->db->where('idproveedor >', 1);
		$this->db->where('activo', 1);
		$this->db->order_by('idproveedor', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
}