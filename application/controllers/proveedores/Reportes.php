<?php
if (! defined("BASEPATH")) exit("No direct script access allowed");

class Reportes extends CI_Controller
{
	private $usuario;
	
    public function __construct()
	{
		parent::__construct();
		//$this->load->library('User');
		date_default_timezone_set('America/Lima');
		if($this->session->userdata('user')) $this->usuario = json_decode($this->session->userdata('user'));
		else header('location:' .base_url());
	}

    public function index(){}
	
	public function nuevoreporte()
	{
		$this->load->model('Reportes_model');
		$anio = $this->Reportes_model->anio();
		$material = $this->Reportes_model->articulos();
		$op = $this->Reportes_model->tipoop();
		
		$data = array(
			'anio' => $anio,
			'articulo' => $material,
			'op' => $op
		);
		
		$this->load->view('main',$data);
	}
	public function complementarios()
	{
		$this->load->model('Reportes_model');
		$art = $this->Reportes_model->articulos();
		$totart = $this->Reportes_model->total('idsucursal=1 AND fecha BETWEEN "'.date('Y-m-d').'" AND "'.date('Y-m-d').'"','lista_ingresos_proveedores');
		$promart = $this->Reportes_model->promedio('idsucursal=1 AND fecha BETWEEN "'.date('Y-m-d').'" AND "'.date('Y-m-d').'"','lista_ingresos_proveedores');
		
		$totval = $this->Reportes_model->total('idsucursal=1 AND fecha BETWEEN "'.date('Y-m-d').'" AND "'.date('Y-m-d').'"','lista_valorizaciones_proveedores');
		$promval = $this->Reportes_model->promedio('idsucursal=1 AND fecha BETWEEN "'.date('Y-m-d').'" AND "'.date('Y-m-d').'"','lista_valorizaciones_proveedores');
		
		/*$promart = floatval($promart) > 0 && floatval($totart) > 0? number_format(floatval($promart)/floatval($totart),2,'.',','):'0.00';
		$promval = floatval($promval) > 0 && floatval($totval) > 0? number_format(floatval($promval)/floatval($totval),2,'.',','):'0.00';*/
		
		$this->load->view('main',['articulos'=>$art,'tot1'=>$totart,'tot2'=>$totval,'prom1'=>$promart,'prom2'=>$promval]);
	}
	public function tblreporte1()
	{
		$this->load->model('Reportes_model');
		if($this->input->post('sucursal') && $this->input->post('sucursal') != '') $this->Reportes_model->setSucursal($this->input->post('sucursal'));
		if($this->input->post('anio') && $this->input->post('anio') != '') $this->Reportes_model->setAnio($this->input->post('anio'));
		if($this->input->post('articulo') && $this->input->post('articulo') != '') $this->Reportes_model->setArticulo($this->input->post('articulo'));
		if($this->input->post('productor') && $this->input->post('productor') != '') $this->Reportes_model->setProductor($this->input->post('productor'));
		if($this->input->post('productor') && $this->input->post('productor') != '') $this->Reportes_model->setNombre($this->input->post('productor'));
		if($this->input->post('tipoop') && $this->input->post('tipoop') != '') $this->Reportes_model->setOp($this->input->post('tipoop'));
		
		$segmento = $this->input->post('segmento'); $reporte = [];
		
		if($segmento === 'reporte1') $reporte = $this->Reportes_model->repArticulos();
		elseif($segmento === 'reporte2') $reporte = $this->Reportes_model->repValorizados();
		elseif($segmento === 'reporte3') $reporte = $this->Reportes_model->repXValorizar();
		elseif($segmento === 'reporte4') $reporte = $this->Reportes_model->repCtasCobrar();
		elseif($segmento === 'reporte5') $reporte = $this->Reportes_model->repCtasPagar();
		elseif($segmento === 'reporte6') $reporte = $this->Reportes_model->repMovProv();
		elseif($segmento === 'reporte7') $reporte = $this->Reportes_model->anulados();
		
		echo json_encode(['data' => $reporte]);
	}
	public function tabs()
	{
		$this->load->model('Reportes_model');
		$reporte = null; $suc = $this->input->post('sucursal'); $d = $this->input->post('desde'); $h = $this->input->post('hasta');
		$costo = ''; $art = '';
		
		if($this->input->post('articulo') !== '') $art = 'AND idarticulo="'.$this->input->post('articulo').'"';
		
		if($this->input->post('tab') === 'articulos')
			$reporte = $this->Reportes_model->rep2articulos('idsucursal='.$suc.' AND fecha BETWEEN "'.$d.'" AND "'.$h.'" '.$art);
		else if($this->input->post('tab') === 'valorizados')
			$reporte = $this->Reportes_model->rep2valorizados('idsucursal='.$suc.' AND fecha BETWEEN "'.$d.'" AND "'.$h.'" '.$art);
		
		echo json_encode(['data' => $reporte]);
	}
	public function costos()
	{
		$this->load->model('Reportes_model');
		$suc = $this->input->post('sucursal'); $d = $this->input->post('desde'); $h = $this->input->post('hasta'); $costo = ''; $art = ''; $tabla = '';
		if($this->input->post('articulo') !== '') $art = 'AND idarticulo="'.$this->input->post('articulo').'"';
		if($this->input->post('costo') !== '') $costo = 'AND costo >= "'.$this->input->post('costo').'"';
		
		if($this->input->post('tab') === 'articulos') $tabla = 'lista_ingresos_proveedores';
		elseif($this->input->post('tab') === 'valorizados') $tabla = 'lista_valorizaciones_proveedores';
		
		$prom = $this->Reportes_model->promedio('idsucursal='.$suc.' AND fecha BETWEEN "'.$d.'" AND "'.$h.'" '.$art.' '.$costo,$tabla);
		$total = $this->Reportes_model->total('idsucursal='.$suc.' AND fecha BETWEEN "'.$d.'" AND "'.$h.'" '.$art.' '.$costo,$tabla);
		
		//$prom = floatval($prom) > 0 && floatval($total) > 0? number_format(floatval($prom)/floatval($total),2,'.',','):'0.00';
		
		echo json_encode(['promedio' => number_format($prom,2,'.',','),'total' => number_format($total,2,'.',',')]);
	}
	public function pdf()
	{
		$this->load->model('Reportes_model');
		$versionphp = 7; $a5 = 'A4'; $direccion = 'portrait'; $reporte = null;
		
		/*$data = json_decode($_POST['data']);*/
		
		if($this->input->get('s') != '') $this->Reportes_model->setSucursal($this->input->get('s'));
		if($this->input->get('prod') != ''){
			$this->Reportes_model->setProductor($this->input->get('prod'));
			$this->Reportes_model->setNombre($this->input->get('prod'));
			$this->Reportes_model->setProductor($this->input->get('prod'));
		}
		if($this->input->get('tipo') != '') $this->Reportes_model->setOp($this->input->get('tipo'));
		
		if($this->input->get('rep') === 'reporte1' || $this->input->get('rep') === 'reporte2' || $this->input->get('rep') === 'reporte3'){
			if($this->input->get('a') != '') $this->Reportes_model->setAnio($this->input->get('a'));
			if($this->input->get('art') != '') $this->Reportes_model->setArticulo($this->input->get('art'));
		}
		
		if($this->input->get('rep') === 'reporte1') $reporte = $this->Reportes_model->repArticulos();
		elseif($this->input->get('rep') === 'reporte2') $reporte = $this->Reportes_model->repValorizados();
		elseif($this->input->get('rep') === 'reporte3') $reporte = $this->Reportes_model->repXValorizar();
		elseif($this->input->get('rep') === 'reporte4') $reporte = $this->Reportes_model->repCtasCobrar();
		elseif($this->input->get('rep') === 'reporte5') $reporte = $this->Reportes_model->repCtasPagar();
		elseif($this->input->get('rep') === 'reporte6') $reporte = $this->Reportes_model->repMovProv();
		elseif($this->input->get('rep') === 'reporte7') $reporte = $this->Reportes_model->anulados();
		
		/*if($this->input->get('tab') != ''){
			$tab = $this->input->get('tab'); $suc = $this->input->get('suc'); $d = $this->input->get('desde'); $h = $this->input->get('hasta');
			if($tab === 'articulos'){
				$reporte = $this->Reportes_model->rep2articulos('r.idsucursal='.$suc.' AND r.fecha BETWEEN "'.$d.'" AND "'.$h.'"');
			}elseif($tab === 'valorizados'){
				$reporte = $this->Reportes_model->rep2valorizados('r.idsucursal='.$suc.' AND r.fecha_guia BETWEEN "'.$d.'" AND "'.$h.'"');
			}
		}*/
		
		if(!empty($reporte)){
			$data = ['reporte' => $reporte];
			
			if(count($reporte) > 500){
				$data['font'] = '11px';
				$data['tamano'] = '80%';
				$data['body'] = '100%';
				$data['title'] = 'Reporte HTML';
				$this->load->view('proveedores/reporte-pdf', $data);
			}else{
				$data['font'] = '9px';
				$data['body'] = '21cm';
				$data['tamano'] = '18cm';
				$data['title'] = 'Reporte PDF';
				$html = $this->load->view('proveedores/reporte-pdf', $data, true);
				
				if(floatval(phpversion()) < $versionphp){
					$this->load->library('dom');
					$this->dom->generate($direccion, $a5, $html, $this->input->get('rep'));
				}else{
					$this->load->library('dom1');
					$this->dom1->generate($direccion, $a5, $html, $this->input->get('rep'));
				}
			}
		}else{ echo '<div class="bg-warning"><h2>No hay registros</h2></div>'; }
	}
	public function excel()
	{
		$this->load->model('Reportes_model');
		$reporte = null; $cab = [];
		
		/*$data = json_decode($_POST['data']);*/
		
		if($this->input->get('s') != '') $this->Reportes_model->setSucursal($this->input->get('s'));
		if($this->input->get('prod') != ''){
			$this->Reportes_model->setProductor($this->input->get('prod'));
			$this->Reportes_model->setNombre($this->input->get('prod'));
			$this->Reportes_model->setProductor($this->input->get('prod'));
		}
		if($this->input->get('tipo') != '') $this->Reportes_model->setOp($this->input->get('tipo'));
		
		if($this->input->get('rep') === 'reporte1' || $this->input->get('rep') === 'reporte2' || $this->input->get('rep') === 'reporte3'){
			if($this->input->get('a') != '') $this->Reportes_model->setAnio($this->input->get('a'));
			if($this->input->get('art') != '') $this->Reportes_model->setArticulo($this->input->get('art'));
		}
		
		if($this->input->get('rep') === 'reporte1') $reporte = $this->Reportes_model->repArticulos();
		elseif($this->input->get('rep') === 'reporte2') $reporte = $this->Reportes_model->repValorizados();
		elseif($this->input->get('rep') === 'reporte3') $reporte = $this->Reportes_model->repXValorizar();
		elseif($this->input->get('rep') === 'reporte4') $reporte = $this->Reportes_model->repCtasCobrar();
		elseif($this->input->get('rep') === 'reporte5') $reporte = $this->Reportes_model->repCtasPagar();
		elseif($this->input->get('rep') === 'reporte6') $reporte = $this->Reportes_model->repMovProv();
		elseif($this->input->get('rep') === 'reporte7') $reporte = $this->Reportes_model->anulados();
		if(!empty($reporte))$cab = array_keys((array)$reporte[0]);
		
		if($this->input->get('tab') != ''){
			$tab = $this->input->get('tab'); $suc = $this->input->get('suc'); $d = $this->input->get('desde'); $h = $this->input->get('hasta');
			$art = '';
			if($tab === 'articulos'){
				$cab = ['Nro.Op','Año','Sucursal','Nro. Doc','Productor','Articulo','Fecha Ingreso','Cantidad Kg','Costo Promedio'];
				if($this->input->get('articulo') !== '') $art = 'AND idarticulo="'.$this->input->get('articulo').'"';
				$reporte = $this->Reportes_model->rep2articulos('idsucursal='.$suc.' AND fecha BETWEEN "'.$d.'" AND "'.$h.'" '.$art);
			}elseif($tab === 'valorizados'){
				if($this->input->get('articulo') !== '') $art = 'AND idarticulo="'.$this->input->get('articulo').'"';
				$reporte = $this->Reportes_model->rep2valorizados('idsucursal='.$suc.' AND fecha BETWEEN "'.$d.'" AND "'.$h.'" '.$art);
				$cab = ['Nro.Op','Año','Sucursal','Nro. Doc','Productor','Articulo','Fecha Ingreso','Cantidad Kg','Costo Valorizacion'];
			}
		}
		
		if(!empty($reporte)){
			//$cabecera = json_decode(json_encode($reporte[0]), true);
			$filename = 'reporte.csv';
			$fp = fopen('php://output', 'w');
			header('Content-type: application/csv');
			header('Content-Disposition: attachment; filename='.$filename);
			//fputcsv($fp,array_keys((array)$reporte[0]),';');
			fputcsv($fp,$cab,';');
			
			foreach($reporte as $row):
				fputcsv($fp,array_values((array)$row),';');
			endforeach;
			
			fclose($fp);
			exit;
		}
	}
}