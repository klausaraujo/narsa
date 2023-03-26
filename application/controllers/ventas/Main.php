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
	public function ventas()
	{
		$this->load->model('Proveedores_model'); $this->load->model('Ventas_model');
		$id = $this->input->get('id');
		$hSalidas = array(
			'0'=>['title' => 'Acciones', 'targets' => 0],'1'=>['title' => 'ID', 'targets' => 1],'2'=>['title' => 'A&ntilde;o Gu&iacute;a', 'targets' => 2],
			'3'=>['title' => 'Nro. Gu&iacute;a', 'targets' => 3],'4'=>['title' => 'Fecha', 'targets' => 4],'5'=>['title' => 'Proveedor', 'targets' => 5],
			'6'=>['title' => 'Sucursal', 'targets' => 6],'7'=>['title' => 'Estado', 'targets' => 7],'8'=>['targets' => 'no-sort', 'orderable' => false],
			'9'=>['targets' => 1, 'visible' => false],
		);
		$articulos = $this->Proveedores_model->listaArticulos(['activo' => 1]);
		$tipoPago = $this->Ventas_model->tipoPago(['activo' => 1]);
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
		$data = json_decode($_POST['data']); $pago = json_decode($_POST['pago']); $guia = 0; $reg = 0;
		$tipoDesc = $pago->tipoPagoVta === '1'? 'VENTA DE PRODUCTOS (EFECTIVO)' : 'VENTA DE PRODUCTOS (OTROS MEDIOS)'; $mov = 0;
		$message = 'No se pudo registrar la venta'; $status = 500;
		
		
		$f = $this->Proveedores_model->factor(['destino' => 3,'idtipooperacion' => $pago->tipoPagoVta,'activo' => 1]);
		$fcli = (!empty($f)? $f->idfactor : 1);
		$tipoopcaja = $this->Proveedores_model->tipoOperacion_caja(['tipo_operacion'=> $tipoDesc,'activo' => 1]);
		$f2 = !empty($tipoopcaja)? $this->Proveedores_model->factor(['destino' => 2,'idtipooperacion' => $tipoopcaja->idtipooperacion,'activo' => 1]) : array();
		$fcaj = !empty($f2)? $f2->idfactor : $fcli;
		
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
				'idfactor' => $fcli,
				'fecha_movimiento' => date('Y-m-d H:i:s'),
				'idusuario_registro' => $this->usuario->idusuario,
				'fecha_registro' => date('Y-m-d H:i:s'),
				'activo' => 1
			);
			$mov = $this->Ventas_model->regMovCliente($movCliente,$fcaj,$pago);
			if($mov){
				$message = 'Venta registrada exitosamente';
				$status = 200;
			}
		}
		$resp = array(
			'status' => $status,
			'message' => $message,
		);
		echo json_encode($resp);
	}
}