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
	private $op = [];
	
	public function setSucursal($data){ $this->idsucursal = [ 'r.idsucursal' => $this->db->escape_str($data) ]; }
	public function setAnio($data){ $this->anio = [ 'anio' => $this->db->escape_str($data) ]; }
	public function setArticulo($data){ $this->articulo = [ 'articulo' => $this->db->escape_str($data) ]; }
	public function setProductor($data){ $this->productor = [ 'productor' => $this->db->escape_str($data) ]; }
	public function setNombre($data){ $this->nombre = [ 'nombre' => $this->db->escape_str($data) ]; }
	public function setOp($data){ $this->op = [ 'idtipooperacion' => $this->db->escape_str($data) ]; }
	
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
		$this->db->distinct();
        $this->db->select('ge.numero as nro_op,r.*,DATE_FORMAT(r.fecha,"%d/%m/%Y") as fecha,FORMAT(r.cantidad,2) as cantidad,FORMAT(r.costo,2) as costo');
        $this->db->from('articulos_ingresados r');
		$this->db->join('guia_entrada ge','ge.idguia = r.idguia');
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
		$this->db->distinct();
        $this->db->select('va.numero as nro_op,r.*,DATE_FORMAT(r.fecha_guia,"%d/%m/%Y") as fecha,FORMAT(r.cantidad,2) as cantidad,
			FORMAT(r.costo,2) as costo,ge.idvalorizacion');
        $this->db->from('articulos_valorizados r');
		$this->db->join('guia_entrada_detalle_valorizacion ge','ge.idguia = r.idguia');
		$this->db->join('valorizacion va','va.idvalorizacion = ge.idvalorizacion');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->anio) $this->db->where($this->anio);
		if($this->articulo) $this->db->where($this->articulo);
		if($this->productor) $this->db->where($this->productor);
		$this->db->order_by('guia', 'DESC');
		$this->db->order_by('articulo', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function repXValorizar()
    {
		$this->db->distinct();
        $this->db->select('ge.numero as nro_op,r.*,DATE_FORMAT(r.fecha,"%d/%m/%Y") as fecha,FORMAT(r.cantidad,2) as cantidad,(r.cantidad*0) as costo');
        $this->db->from('articulos_x_valorizar r');
		$this->db->join('guia_entrada ge','ge.idguia = r.guia');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->anio) $this->db->where($this->anio);
		if($this->articulo) $this->db->where($this->articulo);
		if($this->productor) $this->db->where($this->productor);
		$this->db->order_by('guia', 'DESC');
		$this->db->order_by('articulo', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function repCtasCobrar()
    {
        $this->db->select('r.*,FORMAT(r.monto,2) as monto');
        $this->db->from('cuentas_cobrar r');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->nombre) $this->db->where($this->nombre);
		$this->db->order_by('r.idproveedor', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function repCtasPagar()
    {
        $this->db->select('r.*,FORMAT(r.monto,2) as monto');
        $this->db->from('cuentas_pagar r');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->nombre) $this->db->where($this->nombre);
		$this->db->order_by('r.idproveedor', 'ASC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function repMovProv()
    {
		$this->db->select('idtransaccion as nro_op,tipo_operacion,sucursal,nombre,FORMAT(monto_factor_final,2) as monto,
			FORMAT(tasa,2) as tasa,DATE_FORMAT(fecha_movimiento,"%d/%m/%Y") as fecha');
        $this->db->from('lista_movimientos_proveedor r');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->nombre) $this->db->where($this->nombre);
		$this->db->order_by('idtransaccion', 'DESC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function repCobrar()
	{
		$query = 'SELECT idsucursal,sucursal,idproveedor,ANY_VALUE(idtransaccion) as nro_op,ANY_VALUE(tipo_operacion) as tipo_operacion,
			ANY_VALUE(nombre) as nombre,FORMAT(ANY_VALUE(monto_factor_final), 2) as monto FROM lista_movimientos_proveedor WHERE liquidado=0 and ';
		if($this->idsucursal) $query .= 'idsucursal='.$this->idsucursal['r.idsucursal'];
		if($this->nombre) $query .= " AND nombre='".$this->nombre['nombre']."'";
		$query .= ' GROUP BY idsucursal,sucursal,idtransaccion,idproveedor,tipo_operacion HAVING SUM(monto_factor_final)<0 ORDER BY ANY_VALUE(idtransaccion) DESC';
		$res = $this->db->query($query);
		return ($res->num_rows() > 0)? $res->result() : array();		
		
		/*$this->db->select('ANY_VALUE(idtransaccion) as nro_op,tipo_operacion,sucursal,nombre,FORMAT(monto_factor_final,2) as monto');
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Aca deberias usar la Vista: select * from cuentas_cobrar
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		$this->db->from('lista_movimientos_proveedor r');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->nombre) $this->db->where($this->nombre);
		$this->db->group_by(array('idsucursal','sucursal','idproveedor'));
		$this->db->having('SUM(monto_factor_final) < 0');
		$this->db->order_by('idtransaccion', 'DESC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();*/
	}
	public function repPagar()
	{
		$query = "SELECT idsucursal,sucursal,idproveedor,idtransaccion as nro_op,tipo_operacion as tipo_operacion,
			nombre as nombre,FORMAT(monto_factor_final, 2) as monto FROM lista_movimientos_proveedor WHERE liquidado=0 and ";
		if($this->idsucursal) $query .= "idsucursal='".$this->idsucursal['r.idsucursal']."'";
		if($this->nombre) $query .=" AND nombre='".$this->nombre['nombre']."'";
		$query .= " GROUP BY idsucursal,sucursal,idproveedor,idtransaccion,tipo_operacion HAVING SUM(monto_factor_final)>0 ORDER BY idtransaccion DESC";
		$res = $this->db->query($query);
		return ($res->num_rows() > 0)? $res->result() : array();
		
		/*$this->db->select('idtransaccion as nro_op,tipo_operacion,sucursal,nombre,FORMAT(monto_factor_final,2) as monto');
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Aca deberias usar la Vista: select * from cuentas_pagar
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		$this->db->from('lista_movimientos_proveedor r');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->nombre) $this->db->where($this->nombre);
		$this->db->group_by(array('idsucursal','sucursal','idproveedor'));
		$this->db->having('SUM(monto_factor_final) > 0');
		$this->db->order_by('idtransaccion', 'DESC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();*/
	}
	public function tipoop()
	{
		$res = $this->db->select('*')->from('tipo_operacion_proveedor')->get();
		//$res = $this->db->select('*')->from('tipo_operacion_proveedor')->where(['idtipooperacion' => 1,'combo_movimientos' => 1])->get();
		//$res = $this->db->select('*')->from('tipo_operacion_proveedor')->where('idtipooperacion = 1 AND combo_movimientos = 1')->get();
		//$this->db->select('*')->from('Employees')->like('Designation', 'Executive')->order_by('EmpName', 'desc')->limit(10, 1);
		//$query = $this->db->get();
		return ($res->num_rows() > 0)? $res->result() : array();
	}
	public function anulados()
    {
		$this->db->select('idtransaccion as nro_op,tipo_operacion,sucursal,nombre,FORMAT(monto_factor_final,2) as monto,FORMAT(tasa,2) as tasa,
			DATE_FORMAT(fecha_movimiento,"%d/%m/%Y") as fecha');
        $this->db->from('lista_movimientos_proveedor_anulados r');
		if($this->idsucursal) $this->db->where($this->idsucursal);
		if($this->nombre) $this->db->where($this->nombre);
		if($this->op) $this->db->where($this->op);
		$this->db->order_by('idtransaccion', 'DESC');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function rep2articulos($where)
	{
		$this->db->select('numero,anio_guia as anio,sucursal,numero_documento,nombre,articulo,DATE_FORMAT(fecha,"%d/%m/%Y") 
				as fecha,FORMAT(cantidad,2) as cantidad,costo');
		$this->db->from('lista_ingresos_proveedores');
		$this->db->where($where);
		$this->db->order_by('anio', 'desc');
		$this->db->order_by('numero', 'desc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function rep2valorizados($where)
	{
		$this->db->select('numero,anio_valorizacion as anio,sucursal,numero_documento,nombre,articulo,DATE_FORMAT(fecha,"%d/%m/%Y") 
				as fecha,FORMAT(cantidad,2) as cantidad,FORMAT(costo,2) as costo');
		$this->db->from('lista_valorizaciones_proveedores');
		$this->db->where($where);
		$this->db->order_by('anio', 'desc');
		$this->db->order_by('numero', 'desc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function promedio($where,$tabla)
	{
		$this->db->select('FORMAT(SUM(costo*cantidad)/SUM(cantidad),2) as promedio');
		$this->db->from($tabla);
		$this->db->where($where);
		//$this->db->order_by('numero', 'desc');
        $result = $this->db->get();
		$rs = ($result->num_rows() > 0)? $result->row() : array();
		$costo = !empty($rs)? floatval($rs->promedio):0;
		return $costo;
	}
	public function total($where,$tabla)
	{
		$this->db->select('SUM(cantidad) as total');
		$this->db->from($tabla);
		$this->db->where($where);
		//$this->db->order_by('numero', 'desc');
        $result = $this->db->get();
		$rs = ($result->num_rows() > 0)? $result->row() : array();
		$total = !empty($rs)? floatval($rs->total):0;
		return $total;
	}
}