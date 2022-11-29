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
	public function registraop($data){
		if ($this->db->insert('movimientos_proveedor', $data))return true;
        //else return $error['code'];
		else return false;
	}
	public function regTransaccion($data){
		if ($this->db->insert('transacciones', $data))return $this->db->insert_id();
        //else return $error['code'];
		else return false;
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
		$this->db->order_by('idmovimiento', 'asc');
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