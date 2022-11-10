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
		if($this->uri->segment(2) === 'nuevo'){
			$this->load->model('Proveedores_model');
			$tipodoc = $this->Proveedores_model->tipodoc();
			$this->load->view('main',['tipodoc' => $tipodoc]);
		}else header('location:' .base_url(). 'proveedores/nuevo');
	}
	public function registrar(){
		$this->session->set_flashdata('claseMsg', 'warning');
		if($this->input->post('tipodoc') != '' && $this->input->post('doc') != '' && $this->input->post('nombres') != '' && $this->input->post('ruc') != ''){
			$this->load->model('Proveedores_model');
			$data = array(
				'idtipodocumento' => $this->input->post('tipodoc'),
				'numero_documento' => $this->input->post('doc'),
				'RUC' => $this->input->post('ruc'),
				'nombre' => $this->input->post('nombres'),
				'domicilio' => $this->input->post('direccion'),
				'zona' => $this->input->post('zona'),
				'activo' => 1,
			);
			if($this->Proveedores_model->registrar($data)){
				$this->session->set_flashdata('flashSuccess', 'Proveedor Registrado Exitosamente');
                $this->session->set_flashdata('claseMsg', 'success');
			}else{
				$this->session->set_flashdata('flashSuccess', 'No se pudo registrar el usuario');
			}
			
			header('location:'.base_url().'proveedores');
		}
	}
}