<?php
if (! defined("BASEPATH")) exit("No direct script access allowed");

class Main extends CI_Controller
{
	private $usuario;
	
    public function __construct()
	{
		parent::__construct();
		date_default_timezone_set('America/Lima');
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
	public function reporteventas()
	{
		$this->load->model('Ventas_model');
		$tipo = null; $medio = null;
		$tipo = $this->Ventas_model->tipoOp(['combo_movimientos' => 1, 'activo' => 1]);
		$medio = $this->Ventas_model->medioPago(['activo' => 1]);
		
		$data = array(
			'tipo' => $tipo,
			'medio' => $medio
		);
		$this->load->view('main',$data);
	}
	public function listareporteventas()
	{
		$this->load->model('Ventas_model');
		$suc = $this->input->post('sucursal'); $d = $this->input->post('desde'); $h = $this->input->post('hasta'); $query = '';
		$idop = $this->input->post('idop'); $medio = $this->input->post('medio'); $status = $this->input->post('status');
		
		if($idop !== '') $query .= ' AND gs.idtipooperacion='.$idop;
		if($medio !== '') $query .= ' AND gs.idmediopago='.$medio;
		if($status !== '') $query .= ' AND gs.liquidado='.$status;
		
		$lista = $this->Ventas_model->listaVentas('gs.idsucursal='.$suc.' AND DATE_FORMAT(gs.fecha_registro, "%Y-%m-%d") BETWEEN 
			"'.$d.'" AND "'.$h.'" AND gs.activo=1'.$query);
		
		echo json_encode(['data' => $lista]);
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
	public function ventas()
	{
		$this->load->model('Proveedores_model'); $this->load->model('Ventas_model');
		$id = $this->input->get('id');
		$hSalidas = array(
			'0'=>['title' => 'Acciones', 'targets' => 0],'1'=>['title' => 'ID', 'targets' => 1],'2'=>['title' => 'Nro. Operaci&oacute;n', 'targets' => 2],
			'3'=>['title' => 'Tipo Op.', 'targets' => 3],'4'=>['title' => 'Medio de Pago', 'targets' => 4],'5'=>['title' => 'Sucursal', 'targets' => 5],
			'6'=>['title' => 'Cliente', 'targets' => 6],'7'=>['title' => 'Fecha', 'targets' => 7],'8'=>['title' => 'Monto', 'targets' => 8],
			'9'=>['title' => 'Estado', 'targets' => 9],'10'=>['targets' => 'no-sort', 'orderable' => false],'11'=>['targets' => 1, 'visible' => false],
		);
		$articulos = $this->Proveedores_model->listaArticulos(['activo' => 1]);
		$tipoPago = $this->Ventas_model->tipoOp(['combo_movimientos' => 1,'activo' => 1]);
		$medioPago = $this->Ventas_model->medioPago(['idmediopago >' => 1,'activo' => 1]);
		
		$data = array(
			'articulos' => $articulos,
			'headersSal' => $hSalidas,
			'tipopago' => $tipoPago,
			'mediopago' => $medioPago,
		);
		$this->load->view('main',$data);
	}
	public function listaVentas()
	{
		$this->load->model('Ventas_model');
		
		$id = $this->input->post('id');
		$lista = $this->Ventas_model->listaVentas(['gs.idcliente' => $id,'gs.activo' => 1]);
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
	public function nuevaSalida()
	{
		$this->load->model('Ventas_model'); $this->load->model('Proveedores_model');
		$data = json_decode($_POST['data']); $pago = json_decode($_POST['pago']); $guia = 0; $idtrans = 0;
		$tipoDesc = $pago->medioPagoVta === '2'? 'VENTA DE PRODUCTOS (EFECTIVO)' : 'VENTA DE PRODUCTOS (OTROS MEDIOS)'; $mov = 0; $factor = 1;
		$message = 'No se pudo registrar la venta'; $status = 500; $liqui = 0;
		
		if($pago->tipoComp === '01'){
			$ruc = $this->Ventas_model->validaRuc($pago->idcliente,'cliente');
			if($ruc->RUC === '00000000000'){
				echo json_encode(['message'=>'No se puede registrar factura sin RUC','status'=>100]);
				return 0;
			}
		}
		
		if($pago->tipoPagoVta === '2') $factor = 26; else{ $factor = 25; $liqui = 1; }
		
		$f = $this->Proveedores_model->factor(['destino' => 3,'idtipooperacion' => $pago->tipoPagoVta,'activo' => 1]);
		$fcli = !empty($f)? $f->idfactor : 1;
		$tpcaja = $this->Proveedores_model->tipoOperacion_caja(['tipo_operacion'=> $tipoDesc,'activo' => 1]);
		$tpcj = !empty($tpcaja)? $tpcaja->idtipooperacion : 17;
		
		if($pago->tipo_registro === 'registrar'){
			$trandata = array(
				'fecha' => date('Y-m-d H:i:s'),
				'vencimiento' => date('Y-m-d H:i:s'),
				'monto' => $pago->total_vta,
				'activo' => 1
			);
			
			$idtrans = $this->Ventas_model->transaccionVta($trandata);
			if($idtrans > 0) $guia = $this->Ventas_model->ingresaVenta($data,$pago,$idtrans);
			if($guia > 0){
				$movCliente = array(
					'idtipooperacion' => $pago->tipoPagoVta,
					'idtransaccion' => $idtrans,
					'idmediopago' => $pago->medioPagoVta,
					'idsucursal' => $pago->idsucursal,
					'idcliente' => $pago->idcliente,
					'monto' => $pago->total_vta,
					'tipo_comprobante' => $pago->tipoComp,
					'serie_comprobante' => $pago->serie,
					'numero_comprobante' => $pago->num,
					'base_imponible' => $pago->base_imponible,
					'impuesto_igv' => $pago->imp_igv,
					'idfactor' => $fcli,
					'liquidado' => $liqui,
					'fecha_movimiento' => date('Y-m-d H:i:s'),
					'idusuario_registro' => $this->usuario->idusuario,
					'fecha_registro' => date('Y-m-d H:i:s'),
					'activo' => 1
				);
				$mov = $this->Ventas_model->regMovCliente($movCliente,$tpcj,$factor,$pago);
				if($mov){
					$message = 'Venta registrada exitosamente';
					$status = 200;
				}
			}
		}elseif($pago->tipo_registro === 'editar'){
			$trans = $this->Ventas_model->editaTransaccion(['monto' => $pago->total_vta],['idtransaccion' => $pago->idtrans]);
			if($trans > 0) $guia = $this->Ventas_model->editaVenta($data,$pago);
			if($guia){
				$dataCli = array(
					'idtipooperacion' => $pago->tipoPagoVta,
					'idtransaccion' => $pago->idtrans,
					'idmediopago' => $pago->medioPagoVta,
					'idsucursal' => $pago->idsucursal,
					'idcliente' => $pago->idcliente,
					'monto' => $pago->total_vta,
					'tipo_comprobante' => $pago->tipoComp,
					'serie_comprobante' => $pago->serie,
					'numero_comprobante' => $pago->num,
					'base_imponible' => $pago->base_imponible,
					'impuesto_igv' => $pago->imp_igv,
					'idfactor' => $fcli,
					'liquidado' => $liqui,
					'fecha_movimiento' => $pago->fecha_mov,
					'idusuario_registro' => $pago->idusuario,
					'fecha_registro' => $pago->fecha_reg,
					'idusuario_modificacion' => $this->usuario->idusuario,
					'fecha_modificacion' => date('Y-m-d H:i:s'),
					'activo' => $pago->status,
				);
				$mov = $this->Ventas_model->editaMovCliente($dataCli,$tpcj,$factor,$pago);
				if($mov){
					$message = 'Venta Actualizada';
					$status = 200;
					$idtrans = $pago->idtrans;
				}
			}
		}
		
		$resp = array(
			'status' => $status,
			'message' => $message,
			'idtrans' => $idtrans,
		);
		
		echo json_encode($resp);
	}
	public function editarSalida()
	{
		$this->load->model('Ventas_model');
		$idtran = $this->input->get('id');
		$venta = $this->Ventas_model->listaVenta(['mc.idtransaccion' => $idtran]);
		$detArt = $this->Ventas_model->articulosVta(['idguia' => $venta->idguia]);
		
		echo json_encode(['data' => $venta,'articulos' => $detArt]);
	}
	public function anularVenta()
	{
		$this->load->model('Ventas_model');
		$status = 500; $message = 'No se pudo anular'; $id = $this->input->get('id'); $cli = false; $cj = false; $guia = false; $detalle = false;
		$dataAnula = ['activo' => 0,'idusuario_anulacion'=>$this->usuario->idusuario,'fecha_anulacion'=>date('Y-m-d H:i:s')];$bco = false;
		
		$row = $this->Ventas_model->guiaVenta('guia_salida',$id);
		$idguia = $row->idguia;
		
		$tran = $this->Ventas_model->anularVenta('transacciones',['idtransaccion' => $id],['activo' => 0]);
		if($tran) $cli = $this->Ventas_model->anularVenta('movimientos_cliente',['idtransaccion' => $id],$dataAnula);
		if($cli) $cj = $this->Ventas_model->anularVenta('movimientos_caja',['idtransaccion' => $id],$dataAnula);
		if($cj) $bco = $this->Ventas_model->anularVenta('movimientos_banco',['idtransaccion' => $id],$dataAnula);
		if($bco) $guia = $this->Ventas_model->anularVenta('guia_salida',['idtransaccion' => $id],$dataAnula);
		if($guia) $detalle = $this->Ventas_model->anularVenta('guia_salida_detalle',['idguia' => $idguia],['activo' => 0]);
		
		if($detalle){ $message = 'Venta Anulada'; $status = 200; }
		
		$resp = array(
			'status' => $status,
			'message' => $message,
		);
				
		echo json_encode($resp);
	}
	public function pagoCredito()
	{
		$this->load->model('Ventas_model');
		$status = 500; $message = 'No se pudo Liquidar el Cr&eacute;dito'; $id = $this->input->post('idtransaccion'); $mto = $this->input->post('monto');
		$medio = $this->input->post('medio'); $obs = $this->input->post('obs'); $cli = false; $cj = false; $guarda = 0;
		$guia_salida = ['monto_pagado' => $mto,'idusuario_modificacion'=>$this->usuario->idusuario,'fecha_modificacion'=>date('Y-m-d H:i:s')];
		$mov_cliente = ['idmediopago' => $medio,'idfactor' => 25,'liquidado' => 1,'fecha_movimiento'=>date('Y-m-d H:i:s'),
				'idusuario_modificacion'=>$this->usuario->idusuario,'fecha_modificacion'=>date('Y-m-d H:i:s')];
		//$mov_caja = ['liquidado' => 1,'idfactor' => 25,'idusuario_modificacion'=>$this->usuario->idusuario,'fecha_modificacion'=>date('Y-m-d H:i:s')];
		
		$row = $this->Ventas_model->guiaVenta('guia_salida',$id);
		$idguia = $row->idguia;
		
		$guia = $this->Ventas_model->anularVenta('guia_salida',['idtransaccion' => $id],$guia_salida);
		if($guia) $cli = $this->Ventas_model->anularVenta('movimientos_cliente',['idtransaccion' => $id],$mov_cliente);
		
		$movpago = $this->Ventas_model->traemov(['idtransaccion' => $id]);
		unset($movpago->idcliente); unset($movpago->idmovimiento); unset($movpago->idusuario_modificacion); unset($movpago->fecha_modificacion);
		unset($movpago->idusuario_anulacion); unset($movpago->fecha_anulacion);
		$movpago->idusuario_registro = $this->usuario->idusuario; $movpago->fecha_registro = date('Y-m-d H:i:s');
		$movpago->idfactor = 25; $movpago->liquidado = 1; $movpago->observaciones = $obs;
		
		if($medio === '2'){
			$movpago->idtipooperacion = 16;
			$guarda = $this->Ventas_model->guardar($movpago,'movimientos_caja');
		}else{
			$movpago->idtipooperacion = 1;
			$guarda = $this->Ventas_model->guardar($movpago,'movimientos_banco');
		}
		
		if($guarda){ $message = 'Venta Liquidada'; $status = 200; }
		
		$resp = array(
			'status' => $status,
			'message' => $message
		);
				
		echo json_encode($resp);
	}
	public function reporte()
	{
		$this->load->model('Ventas_model');
		$versionphp = 7; $a5 = 'A4'; $direccion = 'portrait';
		$id = $this->input->get('id'); $op = $this->input->get('op'); $guia = null; $datosCli = null;
		
		$guia = $this->Ventas_model->pdfVenta(['mc.idtransaccion' => $id]);
		$idcli = $guia[0]->idcliente;
		$datosCli = $this->Ventas_model->listaCliente(['idcliente' => $idcli]);
		
		if($op === 'pdf') $html = $this->load->view('ventas/guia-pdf', ['guia' => $guia,'datos'=>$datosCli], true);
		elseif($op === 'comp') $html = $this->load->view('ventas/comprobante-pdf', ['guia' => $guia,'datos'=>$datosCli], true);
		
		if(floatval(phpversion()) < $versionphp){
			$this->load->library('dom');
			$this->dom->generate($direccion, $a5, $html, 'Informe');
		}else{
			$this->load->library('dom1');
			$this->dom1->generate($direccion, $a5, $html, 'Guía Salida');
		}
	}
	public function excel()
	{
		$this->load->model('Ventas_model');
		$reporte = null; $cab = [];
		
		$suc = $this->input->get('suc'); $d = $this->input->get('desde'); $h = $this->input->get('hasta');
		$cab = ['Nro.Op','Tipo Operacion','Medio de Pago','Documento','Cliente','Fecha Registro','Monto /S','Liquidado','Status'];
		$reporte = $this->Ventas_model->listaventas('gs.idsucursal='.$suc.' AND DATE_FORMAT(gs.fecha_registro,"%Y-%m-%d") 
			BETWEEN "'.$d.'" AND "'.$h.'" AND gs.activo=1');
		
		if(!empty($reporte)){
			//$cabecera = json_decode(json_encode($reporte[0]), true);
			$filename = 'reporte.csv';
			$fp = fopen('php://output', 'w');
			header('Content-type: application/csv');
			header('Content-Disposition: attachment; filename='.$filename);
			//fputcsv($fp,array_keys((array)$reporte[0]),';');
			fputcsv($fp,$cab,';');
			
			foreach($reporte as $row):
				$data = array(
					$row->idtransaccion,$row->tipo_operacion,$row->medio_pago,$row->numero_documento,$row->nombre,$row->fecha,
					$row->monto,($row->liquidado==='1'?'Liquidado':'Pendiente'),($row->activo==='1'?'Activo':'Anulado')
				);
				fputcsv($fp,$data,';');
			endforeach;
			
			fclose($fp);
			exit;
		}
	}
}