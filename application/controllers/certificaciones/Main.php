<?php
if (! defined("BASEPATH")) exit("No direct script access allowed");

class Main extends CI_Controller
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
	
	public function listaCertificaciones()
	{
		$anio = $this->input->post('anio'); $mes = $this->input->post('mes'); $sucursal = $this->input->post('sucursal');
		$this->load->model('Certificaciones_model'); $operaciones = [];
		/*$operaciones = $this->Servicios_model->listaCertificaciones(['idsucursal' => $sucursal,'SUBSTRING(fecha_movimiento,1,4)' => $anio,
				'SUBSTRING(fecha_movimiento,6,2)' => sprintf("%'02s",$mes)]);
		echo json_encode(['data' => $operaciones]);*/
		echo json_encode(array());
	}
	public function nuevo()
	{
		if($this->uri->segment(1) === 'nuevacertificacion')header('location:' .base_url(). 'certificaciones/nuevo');
		else{
			$this->load->model('Certificaciones_model');
			$proveedores = $this->Certificaciones_model->proveedores();
			$proceso = $this->Certificaciones_model->proceso();
			$variedad = $this->Certificaciones_model->variedad();
						
			if($this->uri->segment(2) === 'editar'){
				$id = $this->input->get('id');
			}
			$data = array(
				'proveedores' => $proveedores,
				'proceso' => $proceso,
				'variedad' => $variedad,
			);
			$this->load->view('main',$data);
		}
	}
}