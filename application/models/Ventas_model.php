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
}