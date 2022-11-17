<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Proveedores_model extends CI_Model
{    
	public function __construct(){ parent::__construct(); }
    
	public function listaProveedores()
    {
        $this->db->select('*');
        $this->db->from('proveedor');
		$this->db->order_by('idproveedor', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function tipodoc()
	{
		$this->db->select('codigo_curl,tipo_documento,longitud');
        $this->db->from('tipo_documento');
		$this->db->order_by('idtipodocumento', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function registrar($data)
	{
		if ($this->db->insert('proveedor', $data))return true;
        //else return $error['code'];
		else return false;
	}
	public function tipoOperacion()
	{
		$this->db->select('idtipooperacion,tipo_operacion');
		$this->db->from('tipo_operacion');
		$this->db->order_by('idtipooperacion', 'asc');
		$result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
}