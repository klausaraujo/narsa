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
	
	public function listaProveedores()
	{
		$this->load->model('Proveedores_model');
		$proveedores = $this->Proveedores_model->listaProveedores();
		echo json_encode(['data'=>$proveedores]);
	}
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
		$hOperaciones = array(
			'0'=>['title' => '', 'targets' => 0],'1'=>['title' => 'Acciones', 'targets' => 1],'2'=>['title' => 'Nro. Oper.', 'targets' => 2],
			'3'=>['title' => 'Tipo Operaci&oacute;n', 'targets' => 3],'4'=>['title' => 'Sucursal', 'targets' => 4],'5'=>['title' => 'Proveedor', 'targets' => 5],
			'6'=>['title' => 'Monto', 'targets' => 6],'7'=>['title' => 'Fecha Reg.', 'targets' => 7],'8'=>['title' => 'Usuario Reg.', 'targets' => 8],
			'9'=>['title' => 'Estado', 'targets' => 9],'10'=>['targets' => 'no-sort', 'orderable' => false],
		);
		$hIngresos = array(
			'0'=>['title' => 'Acciones', 'targets' => 0],'1'=>['title' => 'ID', 'targets' => 1],'2'=>['title' => 'A&ntilde;o Gu&iacute;a', 'targets' => 2],
			'3'=>['title' => 'Nro. Gu&iacute;a', 'targets' => 3],'4'=>['title' => 'Fecha', 'targets' => 4],'5'=>['title' => 'Proveedor', 'targets' => 5],
			'6'=>['title' => 'Sucursal', 'targets' => 6],'7'=>['title' => 'Estado', 'targets' => 7],'8'=>['targets' => 'no-sort', 'orderable' => false],
			'9'=>['targets' => 1, 'visible' => false],
		);
		$hValorizaciones = array(
			'0'=>['title' => 'Acciones', 'targets' => 0],'1'=>['title' => 'ID', 'targets' => 1],'2'=>['title' => 'A&ntilde;o Valorizaci&oacute;n', 'targets' => 2],
			'3'=>['title' => 'Nro. Valorizaci&oacute;n', 'targets' => 3],'4'=>['title' => 'Fecha', 'targets' => 4],'5'=>['title' => 'Proveedor', 'targets' => 5],
			'6'=>['title' => 'Sucursal', 'targets' => 6],'7'=>['title' => 'Estado', 'targets' => 7],'8'=>['targets' => 'no-sort', 'orderable' => false],
			'9'=>['targets' => 1, 'visible' => false],
		);
		$tipo = $this->Proveedores_model->tipoOperacion(['combo_movimientos'=> 1,'activo' => 1]);
		$articulos = $this->Proveedores_model->listaArticulos(['activo' => 1]);
		
		$data = array(
			'tipo_op' => $tipo,
			'articulos' => $articulos,
			'headersOp' => $hOperaciones,
			'headersIng' => $hIngresos,
			'headersVal' => $hValorizaciones,
		);
		$this->load->view('main',$data);
	}
	public function listaTransacciones()
	{
		$this->load->model('Proveedores_model');
		
		$id = $this->input->post('id');
		$lista = $this->Proveedores_model->listaOperaciones(['mp.idproveedor' => $id]);
		$filtro = []; $i = 0;
		
		foreach($lista as $row):
			foreach($this->usuario->sucursales as $sucursal):
				if($row->idsucursal === $sucursal->idsucursal){
					$filtro[$i] = $row;
					$i++;
				}
			endforeach;			
		endforeach;
		
		echo json_encode(['data' => $filtro]);
	}
	public function listaIngresos()
	{
		$this->load->model('Proveedores_model');
		
		$id = $this->input->post('id');
		$lista = $this->Proveedores_model->listaIngresos(['ge.idproveedor' => $id]);
		$filtro = []; $i = 0;
		
		foreach($lista as $row):
			foreach($this->usuario->sucursales as $sucursal):
				if($row->idsucursal === $sucursal->idsucursal){
					$filtro[$i] = $row;
					$i++;
				}
			endforeach;			
		endforeach;
		
		echo json_encode(['data' => $filtro]);
	}
	public function listaValorizaciones()
	{
		$this->load->model('Proveedores_model');
		
		$id = $this->input->post('id');
		$lista = $this->Proveedores_model->listaValorizaciones(['va.idproveedor' => $id]);
		$filtro = []; $i = 0;
		
		foreach($lista as $row):
			foreach($this->usuario->sucursales as $sucursal):
				if($row->idsucursal === $sucursal->idsucursal){
					$filtro[$i] = $row;
					$i++;
				}
			endforeach;			
		endforeach;
		
		echo json_encode(['data' => $filtro]);
	}
	public function listaValorizacionDetalle()
	{
		$this->load->model('Proveedores_model');
		
		$id = $this->input->post('id');
		$suc = $this->input->post('suc');
		$lista = $this->Proveedores_model->listaValorizacionDetalle(['idproveedor' => $id,'cantidad >'=>0]);
		$filtro = []; $i = 0;
		
		foreach($lista as $row):
			if($row->idsucursal === $suc){
				$filtro[$i] = $row;
				$i++;
			}		
		endforeach;
		
		echo json_encode(['data' => $filtro]);
	}
	public function registraOp()
	{
		$this->load->model('Proveedores_model');
		$status = 500; $message = 'No se pudo registrar la Transacci&oacute;n';
		$id = $this->input->post('idproveedor'); $fecha = date('Y-m-d H:i:s'); $vence = $this->input->post('fechavenc'); $tipo = $this->input->post('tipoop');
		
		$factor = $this->Proveedores_model->factor(['destino'=>1,'idtipooperacion'=>$tipo,'activo'=>1]);
		
		$dataTransaccion = array(
			'fecha' => $fecha,
			'vencimiento' => $vence,
			'monto' => $this->input->post('monto'),
			'activo' => '1',
		);
		$dataOp = array(
			'idtipooperacion' => $tipo,
			'idsucursal' => $this->input->post('sucursal'),
			'idproveedor' => $id,
			'monto' => $this->input->post('monto'),
			'idfactor' => (!empty($factor)? $factor->idfactor : 0),
			'fecha_vencimiento' => $vence,
			'fecha_movimiento' => $fecha,
			'idusuario_registro' => $this->usuario->idusuario,
			'fecha_registro' => $fecha,
			'activo' => '1',
		);
		if($this->Proveedores_model->regTransaccion($dataTransaccion,$dataOp,(floatval($tipo) > 5?true:false))){
			$message = 'Transacci&oacute;n registrada exitosamente';
			$status = 200;
		}
		
		$data = array(
			'status' => $status,
			'message' => $message,
			'tipodetalle' => $this->input->post('tipodetalle'),
		);
		
		echo json_encode($data);
	}
	public function anulaOp()
	{
		$this->load->model('Proveedores_model');
		$status = 500; $message = 'No se pudo anular';
		$id = $this->input->get('id'); $op = $this->input->get('op'); $fecha = date('Y-m-d H:i:s');
		
		if($op === 'operaciones'){
			$anula = $this->Proveedores_model->anulaTransaccion(['idtransaccion'=>$id],['activo'=>0],['idusuario_anulacion'=>$this->usuario->idusuario,'fecha_anulacion'=>date('Y-m-d H:i:s'),'activo'=>0]);
			if($anula){
				$message = 'Transacci&oacute;n anulada';
				$status = 200;
			}
		}else if($op === 'ingresos'){
			$anula = $this->Proveedores_model->anulaIngreso(['idguia'=>$id],['activo'=>0]);
			if($anula){
				$message = 'Gu&iacute;a Anulada';
				$status = 200;
			}
		}else if($op === 'valorizaciones'){
			$idtran = $this->Proveedores_model->traeTranByIdVal(['idvalorizacion'=>$id]);
			$anula = $this->Proveedores_model->anulaValorizacion(['idvalorizacion'=>$id],['activo'=>0],['idtransaccion'=>$idtran]);
			if($anula){
				$message = 'Valorizaci&oacute;n Anulada';
				$status = 200;
			}
		}
		
		$data = array(
			'status' => $status,
			'message' => $message,
		);
		
		echo json_encode($data);
	}
	public function nuevoIngreso(){
		$this->load->model('Proveedores_model');
		$status = 500; $message = 'No se pudo registrar la Gu&iacute;a';
		// Takes raw data from the request
		$json = file_get_contents('php://input');
		// Converts it into a PHP object
		$data = json_decode($json);
		$rs = $this->Proveedores_model->ingresarProductos($data);
		
		if($rs === true){
			$message = 'Gu&iacute;a registrada exitosamente';
			$status = 200;
		}
		
		$data = array(
			'status' => $status,
			'message' => $message,
			'data' => $data,
		);
		
		echo json_encode($data);
	}
	public function informe(){
		$versionphp = 7;
		
		if(!empty($_GET)){
			$html = $this->load->view('proveedores/guia-pdf', null, true);
		}else{
			$html = $this->load->view('proveedores/edo-cta', null, true);
		}
		if(floatval(phpversion()) < $versionphp){
			$this->load->library('dom');
			$this->dom->generate("portrait", "informe", $html, "Informe");
		}else{
			$this->load->library('dom1');
			$this->dom1->generate("portrait", "informe", $html, "Informe");
		}
	}
	public function registrarValorizacion()
	{
		$status = 500; $message = 'No se pudo registrar la Valorizaci&oacute;n'; $guia = ''; /*$filasTran = []; $filaVal = []; $i = 0; $j = 0; $mto = 0; $mult = 0; $num = 0;
		$filaValDet = []; $filaValGuia = []; $fin = false;*/$guiaArray = []; $i = 0; $j = 0; $dataVal = [];
		
		$this->load->model('Proveedores_model');
		
		$json = file_get_contents('php://input');
		$data = json_decode($json);
		
		foreach($data as $row):
			if($row->idguia !== $guia){ $guia = $row->idguia; $guiaArray[$j] = $row->idguia; $j++; }
			$dataVal[$i] = ['idguia' => $row->idguia,'idarticulo' => $row->idarticulo,'monto' => $row->cantidad,'costo'=>$row->costo,'idsucursal'=>$row->idsucursal,'idproveedor'=>$row->idproveedor];
			$i++;
		endforeach;
		
		
		$rs = $this->Proveedores_model->regValorizacion($dataVal,$guiaArray,$this->usuario->idusuario);
		
		if($rs === true){
			$message = 'Productos Valorizados';
			$status = 200;
		}
		
		$data = array(
			'status' => $status,
			'msg' => $message,
		);
		
		echo json_encode($data);
	}
	
}