<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Usuario_model extends CI_Model
{
    public function __construct() { parent::__construct(); }
	
    public function iniciar($data)
    {
        $this->db->select('*');
        $this->db->from('usuarios');
        $this->db->where($data);
		$this->db->limit(1);
        return $this->db->get();
    }
	public function anio(){
		$this->db->select('*');
		$this->db->from('anio');
		return $this->db->get();
	}
	public function mes(){
		$this->db->select('*');
		$this->db->from('mes');
		return $this->db->get();
	}
    public function listaModulo($data)
    {
        $this->db->select('modulo.idmodulo,descripcion,menu,icono,url,modulo_rol.activo,imagen,mini');
        $this->db->from('modulo');
        $this->db->join('modulo_rol', 'modulo_rol.idmodulo = modulo.idmodulo');
        $this->db->where($data);
        $this->db->order_by('orden', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
}