<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Usuarios_model extends CI_Model
{    
	public function __construct(){ parent::__construct(); }
    
	public function listaUsuarios()
    {
        $this->db->select('*');
        $this->db->from('usuarios');
		$this->db->order_by('idusuario', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function perfil()
	{
		$this->db->select('*');
		$this->db->from('perfil');
		$this->db->where('activo','1');
		$this->db->order_by('idperfil', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
}