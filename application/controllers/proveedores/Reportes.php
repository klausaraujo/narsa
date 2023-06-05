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
		$this->load->model('Reportes_model');
		$anio = $this->Reportes_model->anio();
		$material = $this->Reportes_model->articulos();
		
		$data = array(
			'anio' => $anio,
			'articulo' => $material
		);
		
		$this->load->view('main',$data);
	}
	public function tblreporte1()
	{
		$this->load->model('Reportes_model');
		if($this->input->post('sucursal') && $this->input->post('sucursal') != '') $this->Reportes_model->setSucursal($this->input->post('sucursal'));
		if($this->input->post('anio') && $this->input->post('anio') != '') $this->Reportes_model->setAnio($this->input->post('anio'));
		if($this->input->post('articulo') && $this->input->post('articulo') != '') $this->Reportes_model->setArticulo($this->input->post('articulo'));
		if($this->input->post('productor') && $this->input->post('productor') != '') $this->Reportes_model->setProductor($this->input->post('productor'));
		if($this->input->post('productor') && $this->input->post('productor') != '') $this->Reportes_model->setNombre($this->input->post('productor'));
		
		$segmento = $this->input->post('segmento'); $reporte = [];
		
		if($segmento === 'reporte1') $reporte = $this->Reportes_model->repArticulos();
		elseif($segmento === 'reporte2') $reporte = $this->Reportes_model->repValorizados();
		elseif($segmento === 'reporte3') $reporte = $this->Reportes_model->repXValorizar();
		elseif($segmento === 'reporte4') $reporte = $this->Reportes_model->repCtasCobrar();
		elseif($segmento === 'reporte5') $reporte = $this->Reportes_model->repCtasPagar();
		
		echo json_encode(['data' => $reporte]);
	}
}