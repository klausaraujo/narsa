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
	
	public function base(){ header('location:ventas'); }
	
	public function listaClientes()
	{
		$this->load->model('Ventas_model');
		$clientes = $this->Ventas_model->listaClientes();
		echo json_encode(['data' => $clientes]);
	}
	public function nuevo()
	{
		if($this->uri->segment(1) === 'nuevocliente')header('location:' .base_url(). 'ventas/cliente/nuevo');
		else{
			$this->load->model('Proveedores_model');
			$this->load->model('Ventas_model');
			$tipodoc = $this->Proveedores_model->tipodoc();
			$dep = $this->Proveedores_model->departamentos();
			$pro = null; $dis = null; $cliente = [];
			$data = array( 'tipodoc' => $tipodoc, 'dep' => $dep );
			
			if($this->uri->segment(3) === 'editar'){
				$id = $this->input->get('id');
				$cliente = $this->Ventas_model->listaCliente(['idcliente' => $id]);
				$pro = !empty($cliente)? $this->Proveedores_model->provincias(['cod_dep'=>substr($cliente->ubigeo,0,2)]) : array();
				$dis = !empty($cliente)? $this->Proveedores_model->distritos(['cod_dep'=>substr($cliente->ubigeo,0,2),'cod_pro'=>substr($cliente->ubigeo,2,2)]) : array();
				$data['cliente'] = $cliente;
				$data['pro'] = $pro;
				$data['dis'] = $dis;
			}
			
			$data['lat'] = !empty($cliente)? $cliente->latitud : 42.1382114;
			$data['lng'] = !empty($cliente)? $cliente->longitud : -71.5212585;
			//echo substr($proveedor->ubigeo,0,2).'  '.substr($proveedor->ubigeo,2,2).'  '.substr($proveedor->ubigeo,4,2);
			
			$this->load->view('main',$data);
		}
	}
	public function registrar()
	{
		$this->session->set_flashdata('claseMsg', 'alert-danger');
		$this->load->model('Proveedores_model');
		$this->load->model('Ventas_model');
		$ubigeo = $this->input->post('dep').$this->input->post('pro').$this->input->post('dis');
		$lat = $this->input->post('lat'); $lng = $this->input->post('lng');
		
		if($this->input->post('tiporegistro') === 'registrar'){
			$this->session->set_flashdata('flashMessage', 'No se pudo registrar el <b>Cliente</b>');
			$data = array(
				'idtipodocumento' => $this->input->post('tipodoc'),
				'numero_documento' => $this->input->post('doc'),
				'RUC' => $this->input->post('ruc'),
				'nombre' => $this->input->post('nombres'),
				'domicilio' => $this->input->post('direccion'),
				'celular' => $this->input->post('celular'),
				'correo' => $this->input->post('email'),
				'ubigeo' => $ubigeo,
				'latitud' => $lat,
				'longitud' => $lng,
				'zona' => $this->input->post('zona'),
				'activo' => 1,
			);
			if($this->Ventas_model->registrar($data)){
				$this->session->set_flashdata('flashMessage', '<b>Cliente</b> Registrado Exitosamente');
				$this->session->set_flashdata('claseMsg', 'alert-primary');
			}
				
		}elseif($this->input->post('tiporegistro') === 'editar'){
			$id = $this->input->post('idcliente');
			$this->session->set_flashdata('flashMessage', 'No se pudo actualizar el <b>Cliente</b>');
			
			$data = array(
				'RUC' => $this->input->post('ruc'),
				'domicilio' => $this->input->post('direccion'),
				'celular' => $this->input->post('celular'),
				'correo' => $this->input->post('email'),
				'ubigeo' => $ubigeo,
				'latitud' => $lat,
				'longitud' => $lng,
				'zona' => $this->input->post('zona'),
			);
			
			if($this->Ventas_model->editar( $data, ['idcliente'=>$id] )){
				$this->session->set_flashdata('flashMessage', '<b>Cliente</b> Actualizado');
				$this->session->set_flashdata('claseMsg', 'alert-primary');
			}
		}
		header('location:'.base_url().'ventas');
	}
}