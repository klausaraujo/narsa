<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Usuarios_model extends CI_Model
{    
	public function __construct(){ parent::__construct(); }
    
	public function listaUsuarios()
    {
        $this->db->select('us.*,td.tipo_documento');
        $this->db->from('usuarios us');
		$this->db->join('tipo_documento td','td.idtipodocumento = us.idtipodocumento');
		$this->db->order_by('idusuario', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function listaUsuario($data)
    {
        $this->db->select('us.*,td.tipo_documento');
        $this->db->from('usuarios us');
		$this->db->join('tipo_documento td','td.idtipodocumento = us.idtipodocumento');
		$this->db->where($data);
		$this->db->order_by('idusuario', 'asc');
		$this->db->limit(1);
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->row() : array();
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
	public function registrar($data)
	{
		if($this->db->insert('usuarios', $data))return true;
        //else return $error['code'];
		else return false;
	}
	public function actualizar($data,$id)
	{
		$this->db->db_debug = FALSE;
		$this->db->where($id);
		if($this->db->update('usuarios',$data)) return true;
        else return false;
	}
	public function permisosOpciones()
	{
		$this->db->select('*');
		$this->db->from('permiso');
		$this->db->where('activo','1');
		$this->db->order_by('orden','asc');
		$result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function buscaPermisos($data)
	{
		$this->db->select('*');
		$this->db->from('permisos_opcion');
		$this->db->where($data);
		$this->db->order_by('idpermisoopcion','asc');
		$result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function registrarPer($where,$data)
	{
		$this->db->trans_begin();
		
		$this->db->where($where);
		$this->db->delete('permisos_opcion');
		
		$this->db->insert_batch('permisos_opcion', $data);
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return false;
		}else{
			$this->db->trans_commit();
			return true;
		}
	}
	public function buscaPerByModByUser($where)
	{
		$this->db->select('idpermiso');
		$this->db->from('permisos_opcion');
		$this->db->where($where);
		$this->db->order_by('idpermiso','asc');
		$result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
}