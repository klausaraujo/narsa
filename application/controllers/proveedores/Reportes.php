<?php
if (! defined("BASEPATH")) exit("No direct script access allowed");

class Reportes extends CI_Controller
{
	private $usuario;
	
    public function __construct()
	{
		parent::__construct();
		//$this->load->library('User');
		if($this->session->userdata('user')) $this->usuario = json_decode($this->session->userdata('user'));
		else header('location:' .base_url());
	}

    public function index(){}
	
	public function nuevoreporte()
	{
		$this->load->view('main');
	}
	public function tblreporte1()
	{
		$data = array(
			'idproveedor'=>'id','fecha'=>'fecha','numero'=>'1','sucursal'=>$this->input->post('sucursal'),'proveedor'=>'NARSA'
		);
		echo json_encode(['data' => $data]);
	}
}