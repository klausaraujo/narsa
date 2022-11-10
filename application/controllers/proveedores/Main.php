<?php
if (! defined("BASEPATH")) exit("No direct script access allowed");

class Main extends CI_Controller
{
	private $usuario;
	
    public function __construct(){
		parent::__construct();
		$this->load->library('User');
		if($this->session->userdata('user'))
			$this->usuario = unserialize($this->session->userdata('user'));
		else header('location:' .base_url());
	}

    public function index(){}
	
	public function nuevo(){
		if($this->uri->segment(2) === 'nuevoproveedor'){
			$this->load->model('Proveedores_model');
			$tipodoc = $this->Proveedores_model->tipodoc();
			$this->load->view('main',['tipodoc' => $tipodoc]);
		}else header('location:' .base_url(). 'proveedores/nuevoproveedor');
	}
}