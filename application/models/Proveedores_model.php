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
	public function registraop($data){
		if ($this->db->insert('transacciones', $data))return true;
        //else return $error['code'];
		else return false;
	}
	public function listaTransacciones($data)
    {
        $this->db->select('tr.*,to.tipo_operacion,su.sucursal,pr.nombre');
        $this->db->from('transacciones tr');
		$this->db->join('tipo_operacion to','to.idtipooperacion = tr.idtipooperacion');
		$this->db->join('sucursal su','su.idsucursal = tr.idsucursal');
		$this->db->join('proveedor pr','pr.idproveedor = tr.idproveedor');
		$this->db->where($data);
		$this->db->order_by('idtransaccion', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
}