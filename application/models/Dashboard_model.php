<?phpif (! defined('BASEPATH')) exit('No direct script access allowed');class Dashboard_model extends CI_Model{    	private $usuario;		public function __construct(){		parent::__construct();		if($this->session->userdata('user')) $this->usuario = json_decode($this->session->userdata('user'));		else header('location:' .base_url());	}	public function anios()	{		$res = $this->db->select('*')->from('anio')->where('activo = 1')->get();		return ($res->num_rows() > 0)? $res->result() : array();	}	public function querygeneral($tabla,$query,$where = '')	{		$res = null;		if($where) $res = $this->db->select($query)->from($tabla)->where($where)->get();		else $res = $this->db->select($query)->from($tabla)->get();		return ($res->num_rows() > 0)? $res->row() : array();	}	public function query($tabla,$query,$where = '')	{		$res = null;		if($where) $res = $this->db->select($query)->from($tabla)->where($where)->get();		else $res = $this->db->select($query)->from($tabla)->get();		return ($res->num_rows() > 0)? $res->result() : array();	}}