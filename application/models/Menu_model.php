<?php
if (! defined('BASEPATH'))
    exit('No direct script access allowed');
class Menu_model extends CI_Model
{    
	public function __construct(){ parent::__construct(); }
    
	public function listaMenuPermisos($data)
    {
        $this->db->select('pm.idmenu,idmodulo,descripcion,nivel,url,icono,pm.activo');
        $this->db->from('permisos_menu pm');
        $this->db->join('menu m','pm.idmenu=m.idmenu');
		$this->db->where($data);
		$this->db->order_by('pm.idmenu', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function listaSubMenuPermisos($data)
    {
        $this->db->select('pd.idmenudetalle,idmenu,descripcion,url,icono,orden,pd.activo');
        $this->db->from('permisos_menu_detalle pd');
        $this->db->join('menu_detalle md','pd.idmenudetalle=md.idmenudetalle');
        $this->db->where($data);
        $this->db->order_by('pd.idmenudetalle', 'asc');
		$this->db->order_by('orden', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
}