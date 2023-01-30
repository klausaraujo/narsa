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
		$this->load->model('Certificaciones_model');
		$anio = $this->input->post('anio'); $mes = $this->input->post('mes'); $sucursal = $this->input->post('sucursal'); $certificaciones = [];
		
		$certificaciones = $this->Certificaciones_model->listaCertificaciones(['c.idsucursal' => $sucursal,'SUBSTRING(fecha,1,4)' => $anio,
				'SUBSTRING(fecha,6,2)' => sprintf("%'02s",$mes)]);
		echo json_encode(['data' => $certificaciones]);
	}
	public function listaProveedores()
	{
		$this->load->library('datatables_server_side', array(
			'table' => 'proveedor',
			'primary_key' => 'idproveedor',
			'columns' => array('idproveedor', 'nombre'),
			'where' => array()
		));

		$this->datatables_server_side->process();
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
	public function registrarCertificado()
	{
		$this->load->model('Certificaciones_model');
		$status = 500; $message = 'No se pudo registrar el Certificado';
		$fecha = $this->input->post('fecha'); $anio = substr($fecha,0,4); $suc = $this->input->post('sucursalCert');
		
		$numero = $this->Certificaciones_model->numeroCert(['idsucursal'=>$suc,'anio_certificado'=>date('Y')]);
		
		$dataCert = array(
			'anio_certificado' => $anio,
			'numero' => $numero,
			'fecha' => $fecha,
			'idsucursal' => $suc,
			'idproveedor' => $this->input->post('idproveedor'),
			'altitud' => $this->input->post('altitud'),
			'h2overde' => $this->input->post('h2o'),
			'idproceso' => $this->input->post('proceso'),
			'idvariedad' => $this->input->post('variedad'),
			'densidad' => $this->input->post('densidad'),
			'observaciones' => $this->input->post('obs'),
			'idusuario_registro' => $this->usuario->idusuario,
			'fecha_registro' => date('Y-m-d H:i:s'),
			'activo' => '1',
		);
		
		if($this->Certificaciones_model->guardaCert($dataCert)){
			$this->session->set_flashdata('flashMessage', '<b>Certificado</b> Registrado Exitosamente');
			$this->session->set_flashdata('claseMsg', 'alert-primary');
		}
				
		header('location:'.base_url().'certificaciones');
	}
}