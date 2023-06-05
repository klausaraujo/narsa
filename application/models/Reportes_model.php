<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Reportes_model extends CI_Model
{    
	private $usuario;
	private $idsucursal = [];
	private $anio = [];
	private $articulo = [];
	private $productor = [];
	private $nombre = [];
	
	public function setSucursal($data){ $this->idsucursal = [ 'idsucursal' => $this->db->escape_str($data) ]; }
	public function setAnio($data){ $this->anio = [ 'anio' => $this->db->escape_str($data) ]; }
	public function setArticulo($data){ $this->articulo = [ 'articulo' => $this->db->escape_str($data) ]; }
	public function setProductor($data){ $this->productor = [ 'productor' => $this->db->escape_str($data) ]; }
	public function setNombre($data){ $this->nombre = [ 'nombre' => $this->db->escape_str($data) ]; }
	
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
	public function articulos()
	{
		$this->db->select('idarticulo,articulo');
        $this->db->from('articulo');
		$this->db->where('activo', 1);
		$this->db->order_by('idarticulo', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function repArticulos()
    {
        $this->db->select('*,DATE_FORMAT(fecha,"%d/%m/%Y") as fechaguia,FORMAT(cantidad,2) as cantidad,FORMAT(costo,2) as costo');
        $this->db->from('articulos_ingresados');
		//$this->db->join('tipo_documento td','td.idtipodocumento = pr.idtipodocumento');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->anio) $this->db->where($this->anio);
		if($this->articulo) $this->db->where($this->articulo);
		if($this->productor) $this->db->where($this->productor);
		$this->db->order_by('idguia', 'ASC');
		$this->db->order_by('articulo', 'ASC');
		//$this->db->limit(1);
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function repValorizados()
    {
        $this->db->select('*,DATE_FORMAT(fecha_guia,"%d/%m/%Y") as fechaguia,FORMAT(cantidad,2) as cantidad,FORMAT(costo,2) as costo');
        $this->db->from('articulos_valorizados');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->anio) $this->db->where($this->anio);
		if($this->articulo) $this->db->where($this->articulo);
		if($this->productor) $this->db->where($this->productor);
		$this->db->order_by('idguia', 'ASC');
		$this->db->order_by('articulo', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function repXValorizar()
    {
        $this->db->select('*,DATE_FORMAT(fecha,"%d/%m/%Y") as fechaguia,FORMAT(cantidad,2) as cantidad,(cantidad * 0) as costo');
        $this->db->from('articulos_x_valorizar');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->anio) $this->db->where($this->anio);
		if($this->articulo) $this->db->where($this->articulo);
		if($this->productor) $this->db->where($this->productor);
		$this->db->order_by('guia', 'ASC');
		$this->db->order_by('articulo', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function repCtasCobrar()
    {
        $this->db->select('*,FORMAT(monto,2) as monto');
        $this->db->from('cuentas_cobrar');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->productor) $this->db->where($this->productor);
		$this->db->order_by('idproveedor', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function repCtasPagar()
    {
        $this->db->select('*,FORMAT(monto,2) as monto');
        $this->db->from('cuentas_pagar');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->nombre) $this->db->where($this->nombre);
		$this->db->order_by('idproveedor', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
}