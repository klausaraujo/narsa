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
	
	public function cajas(){
		header('location:'.base_url().'servicios');
	}
	public function listaOperaciones()
	{
		$anio = $this->input->post('anio'); $mes = $this->input->post('mes'); $sucursal = $this->input->post('sucursal');
		$this->load->model('Servicios_model'); $operaciones = [];
		$operaciones = $this->Servicios_model->listaOperacionesCaja(['idsucursal' => $sucursal,'SUBSTRING(fecha_movimiento,1,4)' => $anio,
				'SUBSTRING(fecha_movimiento,6,2)' => sprintf("%'02s",$mes)]);
		echo json_encode(['data' => $operaciones]);
	}
	public function nuevo()
	{
		if($this->uri->segment(1) === 'nuevacaja')header('location:' .base_url(). 'servicios/nuevo');
		else{
			$this->load->model('Servicios_model');
			$tipo = $this->Servicios_model->tipoOperacion(['combo_movimientos' => 1, 'activo' => 1]);
			$data = array('tipo' => $tipo);
			
			if($this->uri->segment(2) === 'editar'){
				$id = $this->input->get('id');
				$serv = $this->Servicios_model->listaServicio(['idmovimiento' => $id]);
				$data['servicio'] = $serv;
			}
			$this->load->view('main',$data);
		}
	}
	public function registrar()
	{
		$this->session->set_flashdata('claseMsg', 'alert-danger');
		$this->load->model('Servicios_model'); $this->load->model('Proveedores_model');
		$tipo = $this->input->post('tipoCaja'); $mto = $this->input->post('monto'); $fecha = $this->input->post('fecha'); $suc = $this->input->post('sucursalCaja');
		
		$factor = $this->Proveedores_model->factor(['destino'=>2,'idtipooperacion'=>$tipo,'activo'=>1]);
		if($this->input->post('tiporegistro') === 'registrar'){
			$this->session->set_flashdata('flashMessage', 'No se pudo registrar la <b>Operaci&oacute;n</b>');
			$dataTran = array(
				'fecha' => $fecha,
				'vencimiento' => $fecha,
				'monto' => $mto,
				'activo' => 1,
			);
			$dataOp = array(
				'idtipooperacion' => $tipo,
				'idsucursal' => $suc,
				'monto' => $mto,
				'interes' => 0,
				'idfactor' => (!empty($factor)? $factor->idfactor : 1),
				'fecha_vencimiento' => $fecha,
				'fecha_movimiento' => $fecha,
				'idusuario_registro' => $this->usuario->idusuario,
				'fecha_registro' => $fecha,
				'activo' => 1,
			);
			if($this->Servicios_model->movCaja($dataTran,$dataOp) > 0){
				$this->session->set_flashdata('flashMessage', '<b>Operaci&oacute;n</b> Registrada Exitosamente');
				$this->session->set_flashdata('claseMsg', 'alert-primary');
			}
		}elseif($this->input->post('tiporegistro') === 'editar'){
			
			$this->session->set_flashdata('flashMessage', 'No se pudo actualizar la <b>Operaci&oacute;n</b>');
			$dataTran = array('monto' => $mto);
			$dataOp = array(
				'idtipooperacion' => $tipo,
				'idsucursal' => $suc,
				'monto' => $mto,
				'fecha_movimiento' => $fecha,
				'idusuario_modificacion' => $this->usuario->idusuario,
				'fecha_modificacion' => date('Y-m-d H:i:s'),
			);
			if($this->Servicios_model->editar($dataTran,$dataOp,['idtransaccion'=>$this->input->post('idtran')],['idmovimiento'=>$this->input->post('idmov')])){
				$this->session->set_flashdata('flashMessage', '<b>Operaci&oacute;n</b> Actualizada');
				$this->session->set_flashdata('claseMsg', 'alert-primary');
			}
		}
		/*$this->load->model('Proveedores_model');
		$ubigeo = $this->input->post('dep').$this->input->post('pro').$this->input->post('dis');
		$lat = $this->input->post('lat'); $lng = $this->input->post('lng');
		
		if($this->input->post('tiporegistro') === 'registrar'){
			if($this->input->post('tipodoc') != '' && $this->input->post('doc') != '' && $this->input->post('nombres') != '' && $this->input->post('direccion') != ''){
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
				$this->session->set_flashdata('flashMessage', 'No se pudo registrar el <b>Proveedor</b>');
				if($this->Proveedores_model->registrar($data)){
					$this->session->set_flashdata('flashMessage', '<b>Proveedor</b> Registrado Exitosamente');
					$this->session->set_flashdata('claseMsg', 'alert-primary');
				}
			}else{ $this->session->set_flashdata('flashMessage', 'Campos Vac&iacute;os'); }
				
		}elseif($this->input->post('tiporegistro') === 'editar'){
			$id = $this->input->post('idproveedor');
			$this->session->set_flashdata('flashMessage', 'No se pudo actualizar el <b>Proveedor</b>');
			
			$data = array(
				'RUC' => $this->input->post('ruc'),
				'domicilio' => $this->input->post('direccion'),
				'celular' => $this->input->post('celular'),
				'correo' => $this->input->post('email'),
				'zona' => $this->input->post('zona'),
			);
			
			if($this->Proveedores_model->editar( $data, ['idproveedor'=>$id] )){
				$this->session->set_flashdata('flashMessage', '<b>Proveedor</b> Actualizado');
				$this->session->set_flashdata('claseMsg', 'alert-primary');
			}
		}*/
		header('location:'.base_url().'servicios');
	}
	public function saldoCaja()
	{
		$this->load->model('Servicios_model');
		$suc = $this->input->post('sucursal');
		$saldo = $this->Servicios_model->traeSaldo(['idsucursal' => $suc]);
		
		echo floatVal($saldo);
	}
}