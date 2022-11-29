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
	
	public function nuevo()
	{
		if($this->uri->segment(1) === 'nuevoproveedor')header('location:' .base_url(). 'proveedores/nuevo');
		else{
			$this->load->model('Proveedores_model');
			$tipodoc = $this->Proveedores_model->tipodoc();
			$data = array( 'tipodoc' => $tipodoc );
			if($this->uri->segment(2) === 'editar'){
				$id = $this->input->get('id');
				$proveedor = $this->Proveedores_model->listaProveedor(['idproveedor' => $id]);
				$data['proveedor'] = $proveedor;
			}
			$this->load->view('main',$data);
		}
	}
	public function registrar()
	{
		$this->session->set_flashdata('claseMsg', 'danger');
		if($this->input->post('tipodoc') != '' && $this->input->post('doc') != '' && $this->input->post('nombres') != ''){
			$this->load->model('Proveedores_model');
			$data = array(
				'idtipodocumento' => $this->input->post('tipodoc'),
				'numero_documento' => $this->input->post('doc'),
				'RUC' => $this->input->post('ruc'),
				'nombre' => $this->input->post('nombres'),
				'domicilio' => $this->input->post('direccion'),
				'zona' => $this->input->post('zona'),
				//'activo' => 1,
			);
			if($this->input->post('tiporegistro') === 'registrar'){
				$data['activo'] = '1';
				$this->session->set_flashdata('flashSuccess', 'No se pudo registrar el Proveedor');
				if($this->Proveedores_model->registrar($data)){
					$this->session->set_flashdata('flashSuccess', 'Proveedor Registrado Exitosamente');
					$this->session->set_flashdata('claseMsg', 'success');
				}
			}else if($this->input->post('tiporegistro') === 'editar'){
				$id = $this->input->post('idproveedor');
				$this->session->set_flashdata('flashSuccess', 'No se pudo actualizar el Proveedor');
				if($this->Proveedores_model->editar( $data, ['idproveedor'=>$id] )){
					$this->session->set_flashdata('flashSuccess', 'Proveedor Actualizado');
					$this->session->set_flashdata('claseMsg', 'success');
				}
			}
		}else{
			$this->session->set_flashdata('flashSuccess', 'Campos Vac&iacute;os');
		}
		header('location:'.base_url().'proveedores');
	}
	public function transacciones()
	{
		$this->load->model('Proveedores_model');
		//$id = $this->input->get('id');
		$headers = array(
			'0'=>['title' => '', 'targets' => 0],'1'=>['title' => 'Acciones', 'targets' => 1],'2'=>['title' => 'Nro. Operaci&oacute;n', 'targets' => 2],
			'3'=>['title' => 'Tipo Operaci&oacute;n', 'targets' => 3],'4'=>['title' => 'Sucursal', 'targets' => 4],'5'=>['title' => 'Proveedor', 'targets' => 5],
			'6'=>['title' => 'Transacci&oacute;n', 'targets' => 6],'7'=>['title' => 'Monto', 'targets' => 7],'8'=>['title' => 'Fecha', 'targets' => 8],
			'9'=>['title' => 'Fecha Vencimiento', 'targets' => 9],'10'=>['title' => 'Usuario Registro', 'targets' => 10],'11'=>['title' => 'Estado', 'targets' => 11],
			'12'=>['targets' => 'no-sort', 'orderable' => false],
		);
		$tipo = $this->Proveedores_model->tipoOperacion(['activo' => '1']);
				
		$data = array(
			'tipo_op' => $tipo,
			'headers' => $headers,
		);
		$this->load->view('main',$data);
	}
	public function listatransacciones()
	{
		$this->load->model('Proveedores_model');
		
		$id = $this->input->post('id');
		$lista = $this->Proveedores_model->listaOperaciones(['mp.idproveedor' => $id]);
		$filtro = []; $i = 0;
		
		foreach($lista as $row):
			foreach($this->usuario->sucursales as $sucursal):
				if($row->idsucursal === $sucursal->idsucursal){
					$filtro[$i] = (OBJECT)[ 'idmovimiento' =>$row->idmovimiento, 'idtipooperacion' =>$row->idtipooperacion, 'idsucursal' =>$row->idsucursal,
						'idproveedor' =>$row->idproveedor,'idtransaccion'=>$row->idtransaccion,'monto' =>$row->monto,'fecha_vencimiento' =>$row->fecha_vencimiento,
						'fecha_movimiento'=>$row->fecha_movimiento,'idusuario_registro'=>$row->idusuario_registro,'fecha_registro' =>$row->fecha_registro,
						'activo' =>$row->activo, 'tipo_operacion' =>$row->tipo_operacion,'sucursal' =>$row->sucursal, 'nombre' =>$row->nombre,'usuario' =>$row->usuario,
					];
					$i++;
				}
			endforeach;			
		endforeach;
		
		echo json_encode(['data' => $filtro]);
	}
	public function registraop()
	{
		$this->load->model('Proveedores_model');
		$status = 500; $message = 'No se pudo registrar la Transacci&oacute;n';
		$id = $this->input->post('idproveedor'); $fecha = date('Y-m-d H:i:s'); $vence = $this->input->post('fechavenc');
		
		$dataTransaccion = array(
			'fecha' => $fecha,
			'vencimiento' => $vence,
			'monto' => $this->input->post('monto'),
			'activo' => '1',
		);
		$tran = $this->Proveedores_model->regTransaccion($dataTransaccion);
		if($tran != false){
			$data = array(
				'idtipooperacion' => $this->input->post('tipoop'),
				'idsucursal' => $this->input->post('sucursal'),
				'idproveedor' => $id,
				'idtransaccion' => $tran,
				'monto' => $this->input->post('monto'),
				'fecha_vencimiento' => $vence,
				'fecha_movimiento' => $fecha,
				'idusuario_registro' => $this->usuario->idusuario,
				'fecha_registro' => $fecha,
				'activo' => '1',
			);
			if($this->Proveedores_model->registraop($data)){
				$message = 'Transacci&oacute;n registrada exitosamente';
				$status = 200;
			}
		}
		
		$data = array(
			'status' => $status,
			'message' => $message,
		);
		
		echo json_encode($data);
	}
	public function anulaop()
	{
		$this->load->model('Proveedores_model');
		$status = 500; $message = 'No se pudo anular la Transacci&oacute;n';
		$id = $this->input->get('id'); $op = $this->input->get('op'); $fecha = date('Y-m-d H:i:s');
		
		if($op === 'operaciones'){
			if($this->Proveedores_model->anulaTransaccion(['idtransaccion'=>$id],['activo'=>0],'transacciones')){
				$dataop = array('idusuario_anulacion'=>$this->usuario->idusuario,'fecha_anulacion'=>$fecha,'activo'=>0,);
				if($this->Proveedores_model->anulaTransaccion(['idtransaccion'=>$id],$dataop,'movimientos_proveedor')){
					$message = 'Transacci&oacute;n anulada';
					$status = 200;
				}
			}
		}
		
		$data = array(
			'status' => $status,
			'message' => $message,		
		);
		
		echo json_encode($data);
	}
}