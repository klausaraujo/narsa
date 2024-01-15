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
	public function dash()
	{
		$this->load->model('Dashboard_model'); $idsuc = $this->input->post('sucursal'); $anyo = $this->input->post('anio');
		
		$cobrar = $this->Dashboard_model->cobrar(['idsucursal',$idsuc]);
		$pagar = $this->Dashboard_model->pagar(['idsucursal',$idsuc]);
		$caja = $this->Dashboard_model->caja(['idsucursal',$idsuc]);
		$art = $this->Dashboard_model->articulos('idsucursal = '.$idsuc.' AND YEAR(fecha) = '.$anyo);
		
		$data = array(
			'cobrar' => $cobrar,
			'pagar' => $pagar,
			'caja' => $caja,
			'articulos' => $art,
		);
		echo json_encode($data);
	}
}