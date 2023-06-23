<?php
if (! defined("BASEPATH")) exit("No direct script access allowed");

class Main extends CI_Controller
{
	private $usuario;
	
    public function __construct()
	{
		parent::__construct();
		if($this->session->userdata('user')) $this->usuario = json_decode($this->session->userdata('user'));
		else header('location:' .base_url());
	}

    public function index(){}
	
	public function listaTostado()
	{
		//$this->load->model('Certificaciones_model');
		$anio = $this->input->post('anio'); $mes = $this->input->post('mes'); $sucursal = $this->input->post('sucursal'); $certificaciones = [];
		
		/*$certificaciones = $this->Certificaciones_model->listaCertificaciones(['c.idsucursal' => $sucursal,'SUBSTRING(fecha,1,4)' => $anio,
				'SUBSTRING(fecha,6,2)' => sprintf("%'02s",$mes), 'c.activo' => 1]);*/
		echo json_encode(['data' => $certificaciones]);
	}
}