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
			$tipodoc = $this->Proveedores_model->tipodoc();
			$this->load->view('main',['tipodoc' => $tipodoc]);
		}else header('location:' .base_url(). 'proveedores/nuevo');
	}
	public function registrar(){
		$this->session->set_flashdata('claseMsg', 'danger');
		if($this->input->post('tipodoc') != '' && $this->input->post('doc') != '' && $this->input->post('nombres') != ''){
			$this->load->model('Proveedores_model');
			$this->session->set_flashdata('flashSuccess', 'Prueba de span');
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
				$this->session->set_flashdata('flashSuccess', 'No se pudo registrar el Proveedor');
			}
		}else{
			$this->session->set_flashdata('flashSuccess', 'Campos Vac&iacute;os');
		}
		header('location:'.base_url().'proveedores');
	}
	public function transacciones(){
		$this->load->model('Proveedores_model');
		$id = $this->input->get('id');
		$headers = array(
			'0'=>['title' => '', 'targets' => 0],'1'=>['title' => 'Acciones', 'targets' => 1],'2'=>['title' => 'ID', 'targets' => 2],'3'=>['title' => 'Tipo Op.', 'targets' => 3],
			'4'=>['title' => 'Sucursal', 'targets' => 4],'5'=>['title' => 'Proveedor', 'targets' => 5],'6'=>['title' => 'Fecha', 'targets' => 6],'7'=>['title' => 'Monto', 'targets' => 7],
			'8'=>['title' => 'Estado', 'targets' => 8],'9'=>['targets' => 'no-sort', 'orderable' => false],
		);		
		$tipo = $this->Proveedores_model->tipoOperacion();
		$lista = $this->Proveedores_model->listaOperaciones(['tr.idproveedor' => $id, 'tr.activo' => '1']);
		$data = array(
			'lista' => $lista,
			'tipo_op' => $tipo,
			'headers' => $headers,
		);
		$this->load->view('main',$data);
	}
	public function registraop(){
		$this->load->model('Proveedores_model');
		$status = 500; $message = 'No se pudo registrar la Transacci&oacute;n';
		$id = $this->input->post('idproveedor'); $lista = null;
		$data = array(
			'idtipooperacion' => $this->input->post('tipoop'),
			'idsucursal' => $this->input->post('sucursal'),
			'idproveedor' => $id,
			'fecha' => date('Y-m-d H:i:s'),
			'monto' => $this->input->post('monto'),
			'activo' => '1',			
		);
		if($this->Proveedores_model->registraop($data)){
			$message = 'Transacci&oacute;n registrada exitosamente';
			$status = 200;
			$lista = $this->Proveedores_model->listaOperaciones(['tr.idproveedor' => $id, 'tr.activo' => '1']);
		}else $lista = array();
		$data = array(
			'status' => $status,
			'message' => $message,
			'lista' => $lista
		);
		
		echo json_encode($data);
	}
	public function anulaop(){
		$this->load->model('Proveedores_model');
		$status = 500; $message = 'No se pudo anular la Transacci&oacute;n';
		$idtransaccion = $this->input->post('id'); $op = $this->input->post('op'); $lista = null;
		$idproveedor = $this->input->post('proveedor');
		
		if($op === 'operaciones'){
			if($this->Proveedores_model->anulaop(['idtransaccion'=>$idtransaccion])){
				$message = 'Transacci&oacute;n anulada';
				$status = 200;
				$lista = $this->Proveedores_model->listaOperaciones(['tr.idproveedor' => $idproveedor, 'tr.activo' => '1']);
			}else $lista = array();
		}
		
		$data = array(
			'status' => $status,
			'message' => $message,
			'lista' => $lista,
			'idTransaccion' => $idtransaccion,
			'op' => $op,
			'idproveedor' => $idproveedor,			
		);
		
		echo json_encode($data);
		//echo 'Anular';
	}
}