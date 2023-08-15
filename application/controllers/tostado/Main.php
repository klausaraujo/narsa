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
		$anio = $this->input->post('anio'); $mes = $this->input->post('mes'); $sucursal = $this->input->post('sucursal'); $tostados = [];
		$tostados = $this->Tostado_model->listaTostados(['t.idsucursal' => $sucursal,'anio_tostado' => $anio,'SUBSTRING(fecha,6,2)' => sprintf("%'02s",$mes),'t.activo' => 1]);
		echo json_encode(['data' => $tostados]);
	}
	public function nuevo()
	{
		$tostado = null;
		if($this->uri->segment(1) === 'nuevotostado')header('location:' .base_url(). 'tostado/nuevo');
		else{
			$this->load->model('Tostado_model');
			$this->load->model('Proveedores_model');
			
			$art = $this->Tostado_model->articulos();
			$tipodoc = $this->Proveedores_model->tipodoc();
			$dep = $this->Proveedores_model->departamentos();
			$narsa = $this->Proveedores_model->listaProveedor(['idproveedor' => 1]);
			$data = array( 'tipodoc' => $tipodoc, 'dep' => $dep, 'narsa' => $narsa );
			
			if($this->uri->segment(2) === 'editar'){
				$id = $this->input->get('id');
				$tostado = $this->Tostado_model->listaTostado(['t.idtostado' => $id, 't.activo' => 1]);
			}
			$data['articulos'] = $art;
			$data['tostado'] = $tostado;
			
			$data['lat'] = 42.1382114;
			$data['lng'] = -71.5212585;
			
			$this->load->view('main',$data);
		}
	}
	public function regProveedor()
	{
		$this->load->model('Proveedores_model');
		$ubigeo = $this->input->post('dep').$this->input->post('pro').$this->input->post('dis');
		$lat = $this->input->post('lat'); $lng = $this->input->post('lng'); $msg = 'No se pudo registrar el proveedor'; $idprov = 0;
		
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
			'finca' => $this->input->post('finca'),
			'altitud' => $this->input->post('altitud'),
			'activo' => 1,
		);
		if($idprov = $this->Proveedores_model->registrar($data)){ $msg = 'Se registr&oacute; correctamente'; }
		
		echo json_encode(['msg' => $msg, 'id' => $idprov]);
	}
	public function registrar()
	{
		$this->load->model('Tostado_model');
		$status = 500; $message = 'No se pudo registrar el Proceso';
		$fecha = $this->input->post('fecha'); $anio = date_format(date_create($fecha),'Y'); $suc = $this->input->post('sucursal');
		
		$dataTost = array(
			'anio_tostado' => $anio,
			'idsucursal' => $this->input->post('sucursal'),
			'idproveedor' => $this->input->post('idproveedor'),
			'idarticulo' => $this->input->post('articulo'),
			'cantidad' => $this->input->post('cantidad'),
			'fecha' => $fecha,
			'densidad' => $this->input->post('densidad'),
			'h2o' => $this->input->post('h2o'),
			'seleccionado' => $this->input->post('seleccionado'),
			'precio_total' => $this->input->post('preciot'),
			'a_cuenta' => $this->input->post('acuenta'),
			'saldo' => $this->input->post('saldo'),
			'tipo_tostado_claro' => $this->input->post('claro'),
			'tipo_tostado_medio' => $this->input->post('medio'),
			'tipo_tostado_oscuro' => $this->input->post('oscuro'),
			'tipo_molienda_media' => $this->input->post('media'),
			'tipo_molienda_media_fina' => $this->input->post('mediafina'),
			'tipo_molienda_media_gruesa' => $this->input->post('mediagruesa'),
			'tipo_embolsado_250' => $this->input->post('peq'),
			'tipo_embolsado_500' => $this->input->post('med'),
			'tipo_embolsado_1000' => $this->input->post('gde'),
			'observaciones' => $this->input->post('observaciones'),
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
	public function pdfTostado()
	{
		$this->load->model('Tostado_model');
		$versionphp = 7; $id = $this->input->get('id'); $a5 = 'A4'; $direccion = 'portrait';
		
		$tostado = $this->Tostado_model->listaTostado(['idtostado' => $id]);
		$data = ['tostado' => $tostado];
		$html = $this->load->view('tostado/comprobante-pdf', $data, true);
				
		if(floatval(phpversion()) < $versionphp){
			$this->load->library('dom');
			$this->dom->generate($direccion, $a5, $html, 'Comprobante');
		}else{
			$this->load->library('dom1');
			$this->dom1->generate($direccion, $a5, $html, 'Comprobante');
		}
	}
}