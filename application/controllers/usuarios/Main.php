<?php
if (! defined("BASEPATH")) exit("No direct script access allowed");

class Main extends CI_Controller
{
	private $usuario;
	
    public function __construct(){
		parent::__construct();
		//$this->load->library('User');
		if($this->session->userdata('user')) $this->usuario = json_decode($this->session->userdata('user'));
		else header('location:' .base_url());
	}

    public function index(){}
	
	public function nuevo(){
		if($this->uri->segment(2) === 'nuevo'){
			$this->load->model('Proveedores_model');
			$this->load->model('Usuarios_model');
			$tipodoc = $this->Proveedores_model->tipodoc();
			$perfil = $this->Usuarios_model->perfil();
			$this->load->view('main',['tipodoc' => $tipodoc, 'perfil' => $perfil]);
		}else header('location:' .base_url(). 'usuarios/nuevo');
	}
	public function registrar(){
		$this->session->set_flashdata('claseMsg', 'danger');
		if($this->input->post('tipodoc') != '' && $this->input->post('doc') != '' && $this->input->post('apellidos') != '' && $this->input->post('nombres') != ''
			&& $this->input->post('usuario') != '' && $this->input->post('perfil') != '')
		{
			$this->load->model('Usuarios_model');
			$data = array(
				'idtipodocumento' => $this->input->post('tipodoc'),
				'numero_documento' => $this->input->post('doc'),
				'avatar' => 'user.jpg',
				'apellidos' => $this->input->post('apellidos'),
				'nombres' => $this->input->post('nombres'),
				'usuario' => $this->input->post('usuario'),
				'passwd' => sha1($this->input->post('doc')),
				'idperfil' => $this->input->post('perfil'),
				'activo' => 1,
			);
			if($this->Usuarios_model->registrar($data)){
				$this->session->set_flashdata('claseMsg', 'success');
				$this->session->set_flashdata('flashSuccess', 'Usuario Registrado Exitosamente');
			}else{
				$this->session->set_flashdata('flashSuccess', 'No se pudo registrar el Usuario');
			}
		}else{
			$this->session->set_flashdata('flashSuccess', 'No se pudo registrar el Usuario por campos vac&iacute;os');
		}
		header('location:'.base_url().'usuarios');
	}
}