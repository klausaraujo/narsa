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
		$this->load->model('Proveedores_model');
		if($this->input->post('tipodoc') != '' && $this->input->post('doc') != '' && $this->input->post('nombres') != '' && $this->input->post('direccion') != ''
				&& $this->input->post('tiporegistro') === 'registrar')
		{
			$data = array(
				'idtipodocumento' => $this->input->post('tipodoc'),
				'numero_documento' => $this->input->post('doc'),
				'RUC' => $this->input->post('ruc'),
				'nombre' => $this->input->post('nombres'),
				'domicilio' => $this->input->post('direccion'),
				'celular' => $this->input->post('celular'),
				'correo' => $this->input->post('correo'),
				'zona' => $this->input->post('zona'),
				'activo' => 1,
			);
			$this->session->set_flashdata('flashSuccess', 'No se pudo registrar el Proveedor');
			if($this->Proveedores_model->registrar($data)){
				$this->session->set_flashdata('flashSuccess', 'Proveedor Registrado Exitosamente');
				$this->session->set_flashdata('claseMsg', 'success');
			}
		}elseif($this->input->post('tiporegistro') === 'editar'){
			$id = $this->input->post('idproveedor');
			$this->session->set_flashdata('flashSuccess', 'No se pudo actualizar el Proveedor');
			
			$data = array(
				'RUC' => $this->input->post('ruc'),
				'domicilio' => $this->input->post('direccion'),
				'celular' => $this->input->post('celular'),
				'correo' => $this->input->post('correo'),
				'zona' => $this->input->post('zona'),
			);
			
			if($this->Proveedores_model->editar( $data, ['idproveedor'=>$id] )){
				$this->session->set_flashdata('flashSuccess', 'Proveedor Actualizado');
				$this->session->set_flashdata('claseMsg', 'success');
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
			'6'=>['title' => 'Monto', 'targets' => 6],'7'=>['title' => 'Inter&eacute;s', 'targets' => 7],'8'=>['title' => 'Monto Total', 'targets' => 8],
			'9'=>['targets' => 'no-sort', 'orderable' => false],
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
			'6'=>['title' => 'Sucursal', 'targets' => 6],'7'=>['title' => 'Monto', 'targets' => 7],'8'=>['title' => 'Estado', 'targets' => 8],
			'9'=>['targets' => 'no-sort', 'orderable' => false],'10'=>['targets' => 1, 'visible' => false],
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
		$lista = $this->Proveedores_model->listaOperaciones(['idproveedor' => $id]);
		$filtro = []; $i = 0;
		
		foreach($this->usuario->sucursales as $sucursal):
			foreach($lista as $row):
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
		$lista = $this->Proveedores_model->listaIngresos(['ge.idproveedor' => $id,'ge.activo' => 1]);
		$filtro = []; $i = 0;
		
		foreach($this->usuario->sucursales as $sucursal):
			foreach($lista as $row):
				if($row->idsucursal === $sucursal->idsucursal){
					$filtro[$i] = $row;
					$valoriz = $this->Proveedores_model->tieneValorizacion(['idguia' => $row->idguia,'activo' => '1']);
					if($valoriz->num_rows() > 0) $filtro[$i]->anula = '0';
					else $filtro[$i]->anula = '1';
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
		$lista = $this->Proveedores_model->listaValorizaciones(['va.idproveedor' => $id,'va.activo' => 1]);
		$filtro = []; $i = 0;
		
		foreach($this->usuario->sucursales as $sucursal):
			foreach($lista as $row):
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
		$tipodetalle = $this->input->post('tipodetalle');
		
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
			'interes' => $this->input->post('interes'),
			'idfactor' => (!empty($factor)? $factor->idfactor : 0),
			'fecha_vencimiento' => $vence,
			'fecha_movimiento' => $fecha,
			'idusuario_registro' => $this->usuario->idusuario,
			'fecha_registro' => $fecha,
			'activo' => '1',
		);
		if($this->Proveedores_model->regTransaccion($dataTransaccion,$dataOp,$tipoDet)){
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
			$anula = $this->Proveedores_model->anulaTransaccion(['idtransaccion'=>$id],['activo'=>0],['idusuario_anulacion'=>$this->usuario->idusuario,
																	'fecha_anulacion'=>date('Y-m-d H:i:s'),'activo'=>0]);
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
		}else if($op === 'valorizaciones' || $op === 'valorizop'){
			$idtran = null;
			if($op === 'valorizop'){
				$idtran = $id;
				$id = $this->Proveedores_model->traeValorizByIdTran(['idtransaccion'=>$idtran]);
			}else{
				$idtran = $this->Proveedores_model->traeTranByIdVal(['idvalorizacion'=>$id]);
			}
			
			$anula = $this->Proveedores_model->anulaValorizacion(['idvalorizacion'=>$id],['activo'=>0],['idtransaccion'=>$idtran],
																	['idusuario_anulacion'=>$this->usuario->idusuario,'fecha_anulacion'=>date('Y-m-d H:i:s'),'activo'=>0]);
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
		$status = 500; $message = 'No se pudo registrar la Gu&iacute;a'; $i = 0; $j = 0; $k = 0; $dataVal = []; $guiaArray = []; $dataTransaccion = []; $dataOp = [];
		$valorizar = false; $pago = false; $pagoAdelanto = false; $valorizacion = false; $tipoop = ''; $monto = '';
		// Takes raw data from the request
		$json = file_get_contents('php://input');
		// Converts it into a PHP object
		$data = json_decode($json);
		$rs = $this->Proveedores_model->ingresarProductos($data);
		
		if($rs > 0){
			foreach($data as $row):
				if($j === 0){ $guiaArray[$i] = $rs; $j++; }
				if($row->chk_valorizar === 1){
					$valorizar = true;
					$dataVal[$i] = [ 'idguia' => $rs,'idarticulo' => $row->idarticulo,'monto' => $row->cantidad_valorizada,'costo' => $row->costo,
									'idsucursal' => $row->idsucursal,'idproveedor' => $row->idproveedor ];
					$i++;
				}
				if($row->chk_pago === 1){
					if($k === 0){
						$pago = true;
						$monto = $row->tipo_op == '8'? $row->desembolso : $row->subtotal;
						//echo $monto;
						$factor = $this->Proveedores_model->factor([ 'destino' => 1,'idtipooperacion' => $row->tipo_op,'activo' => 1 ]);
						
						$dataTransaccion = [
							'fecha' => date('Y-m-d H:i:s'),
							'vencimiento' => date('Y-m-d'),
							'monto' => $monto,
							'activo' => 1
						];
						$dataOp = [
							'idtipooperacion' => $row->tipo_op,
							'idsucursal' => $row->idsucursal,
							'idproveedor' => $row->idproveedor,
							'monto' => $monto,
							'interes' => 0,
							'idfactor' => (!empty($factor)? $factor->idfactor : 0),
							'fecha_vencimiento' => date('Y-m-d H:i:s'),
							'fecha_movimiento' => date('Y-m-d H:i:s'),
							'idusuario_registro' => $this->usuario->idusuario,
							'fecha_registro' => date('Y-m-d H:i:s'),
							'activo' => 1,
						];
						
						$tipoop = $row->tipo_op === '8'? 'ADELANTOS A PROVEEDORES' : 'PAGOS A PROVEEDORES';
						
						$k++;
					}
				}
			endforeach;
			
			if($valorizar) $valorizacion = $this->Proveedores_model->regValorizacion($dataVal,$guiaArray);
			if($pago)$pagoAdelanto = $this->Proveedores_model->regTransaccion($dataTransaccion,$dataOp,$tipoop);
			if(($valorizacion || !$valorizar) && (!$pago || $pagoAdelanto)){
				$message = 'Gu&iacute;a registrada exitosamente';
				$status = 200;
			}
		}
		
		$data = array(
			'status' => $status,
			'message' => $message,
			'data' => $data,
		);
		
		echo json_encode($data);
	}
	public function informes(){
		$versionphp = 7; $filtro = []; $i = 0; $id = $this->input->get('id'); $html = null;
		$this->load->model('Proveedores_model');
		
		if($this->input->get('op') === 'guiaing'){
			$lista = $this->Proveedores_model->guiaProv(['idguia' => $id]);
			$html = $this->load->view('proveedores/guia-pdf', ['lista' => $lista], true);
			//$html = $this->load->view('proveedores/guia-pdf', null, true);
			//var_dump($lista);
		}elseif($this->input->get('op') === 'edocta'){
			$j = 0;	$suc = [];
			$lista = $this->Proveedores_model->edoctaProv(['idproveedor' => $id]);
			foreach($this->usuario->sucursales as $sucursal):
				foreach($lista as $row):
					if($row->idsucursal === $sucursal->idsucursal){
						$filtro[$i] = $row;
						$i++;
					}
				endforeach;
				$suc[$j] = $sucursal->idsucursal;
				$j++;
			endforeach;
			
			$html = $this->load->view('proveedores/edo-cta', ['lista' => $filtro,'sucursales'=>$suc], true);
		
		}elseif($this->input->get('op') === 'valorizdet'){
			$lista = $this->Proveedores_model->valorizProv(['idvalorizacion' => $id]);
			
			foreach($lista as $row):
				$saldos = $this->Proveedores_model->saldoValorizaciones(['idguia'=>$row->idguia,'idarticulo'=>$row->idarticulo]);
				if(!empty($saldos))$row->saldo = $saldos[$i]->cantidad;
			endforeach;
			$html = $this->load->view('proveedores/valorizacion-pdf', ['lista' => $lista], true);
			//var_dump($lista);
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
		
		
		$rs = $this->Proveedores_model->regValorizacion($dataVal,$guiaArray);
		
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