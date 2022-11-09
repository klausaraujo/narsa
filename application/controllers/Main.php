<?php
if (! defined("BASEPATH")) exit("No direct script access allowed");

class Main extends CI_Controller
{
	private $usuario;
	
    public function __construct(){
		parent::__construct();
		$this->load->library('User');
		if($this->session->userdata('user'))
			$this->usuario = unserialize($this->session->userdata('user'));
		else header('location:' .base_url());
	}

    public function index(){}
	
	public function proveedores(){
		$this->load->model('Proveedores_model');
		$proveedores = $this->Proveedores_model->listaProveedores();
		$data = array(
			'lista' => $proveedores,
		);
		$this->load->view('main',$data);
	}
	public function curl(){
		$api = 'http://mpi.minsa.gob.pe/api/v1/ciudadano/ver/';
        $token = 'Bearer d90f5ad5d9c64268a00efaa4bd62a2a0';
        $handler = curl_init();
		$doc = $this->input->post('doc'); $tipo = $this->input->post('tipo');
        curl_setopt($handler, CURLOPT_URL,  $api.$tipo.'/'.$doc.'/');
        curl_setopt($handler, CURLOPT_HEADER, false);
        curl_setopt($handler, CURLOPT_HTTPHEADER, array('Authorization: '.$token, 'Content-Type: application/json' ));
        curl_setopt($handler, CURLOPT_RETURNTRANSFER, true);
        $data = curl_exec($handler);
        $code = curl_getinfo($handler, CURLINFO_HTTP_CODE);

        curl_close($handler);

		echo $data;
	}
}