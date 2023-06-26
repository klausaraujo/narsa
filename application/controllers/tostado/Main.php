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
		$this->load->model('Tostado_model');
		$anio = $this->input->post('anio'); $mes = $this->input->post('mes'); $sucursal = $this->input->post('sucursal'); $certificaciones = [];
		$tostados = $this->Tostado_model->listaTostados(['t.idsucursal' => $sucursal,'anio_tostado' => $anio,'SUBSTRING(fecha,6,2)' => sprintf("%'02s",$mes),'t.activo' => 1]);
		echo json_encode(['data' => $tostados]);
	}
	public function nuevo()
	{
		$tostado = null;
		if($this->uri->segment(1) === 'nuevotostado')header('location:' .base_url(). 'tostado/nuevo');
		else{
			$this->load->model('Tostado_model');
			$art = $this->Tostado_model->articulos();
			
			if($this->uri->segment(2) === 'editar'){
				$id = $this->input->get('id');
				$tostado = $this->Tostado_model->listaTostado(['t.idtostado' => $id, 't.activo' => 1]);
			}
			$data = ['articulos' => $art, 'tostado' => $tostado];
			$this->load->view('main',$data);
		}
	}
	public function registrar()
	{
		$this->load->model('Tostado_model');
		$status = 500; $message = 'No se pudo registrar el Proceso';
		$fecha = $this->input->post('fecha'); $anio = date_format(date_create($fecha),'Y'); $suc = $this->input->post('sucursalTos');
		
		$dataTost = array(
			'anio_tostado' => $anio,
			'fecha' => $fecha,
			'idsucursal' => $suc,
			'idproveedor' => $this->input->post('idproveedor'),
			'idarticulo' => $this->input->post('articulo'),
			'cantidad' => $this->input->post('cantidad'),
			'cascara' => $this->input->post('cascara'),
			'malla15' => $this->input->post('malla15'),
			'malla14' => $this->input->post('malla14'),
			'descarte' => $this->input->post('descarte'),
			'eliminacion' => $this->input->post('eliminacion'),
			'seleccion' => $this->input->post('seleccion'),
			'tostado' => $this->input->post('tostado'),
			'molido' => $this->input->post('molido'),
			'envasado' => $this->input->post('envasado'),
			'observaciones' => $this->input->post('obs'),
		);
		
		if($this->input->post('tiporegistro') === 'registrar'){
			$numero = $this->Tostado_model->numeroTost(['idsucursal'=>$suc,'anio_tostado'=>$anio]);
			$dataTost['numero'] = $numero;
			$dataTost['idusuario_registro'] = $this->usuario->idusuario;
			$dataTost['fecha_registro'] = date('Y-m-d H:i:s');
			$dataTost['activo'] = 1;
			
			if($this->Tostado_model->guardaTost($dataTost)){
				$this->session->set_flashdata('flashMessage', '<b>Proceso</b> Registrado Exitosamente');
				$this->session->set_flashdata('claseMsg', 'alert-primary');
			}
		}elseif($this->input->post('tiporegistro') === 'editar'){
			$dataTost['idusuario_modificacion'] = $this->usuario->idusuario;
			$dataTost['fecha_modificacion'] = date('Y-m-d H:i:s');
			
			if($this->Tostado_model->actualizaTost(['idtostado' => $this->input->post('idtostado')],$dataTost)){
				$this->session->set_flashdata('flashMessage', '<b>Proceso</b> Actualizado');
				$this->session->set_flashdata('claseMsg', 'alert-primary');
			}
		}
		
		header('location:'.base_url().'tostado');
	}
	public function anular()
	{
		$this->load->model('Tostado_model');
		$id = $this->input->get('id'); $status = 500; $msg = 'No se pudo anular el Proceso';
		
		if($this->Tostado_model->anular(['idtostado' => $id],['activo' => 0])){
			$status = 200; $msg = 'Proceso Anulado';
		}
		
		$data = [ 'status' => $status, 'message' => $msg ];	
		echo json_encode($data);
	}
}