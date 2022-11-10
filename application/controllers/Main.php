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
		$token_ruc = 'Bearer apis-token-1.aTSI1U7KEuT-6bbbCguH-4Y8TI6KS73N';//10460278975
		$api = 'http://mpi.minsa.gob.pe/api/v1/ciudadano/ver/';
        $token_reniec = 'Bearer d90f5ad5d9c64268a00efaa4bd62a2a0';
        $doc = $this->input->post('doc'); $tipo = $this->input->post('tipo');
		$token = ($tipo === '05')? $token_ruc : $token_reniec;
				
		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => $api.$tipo.'/'.$doc.'/',
			CURLOPT_HEADER => false,
			CURLOPT_MAXREDIRS => 2,
			//CURLOPT_FOLLOWLOCATION => true,
			//CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			//CURLOPT_TIMEOUT => 0,
			CURLOPT_HTTPHEADER => array('Authorization: '.$token, 'Content-Type: application/json'),
			CURLOPT_RETURNTRANSFER => true,
		));		
		$data = curl_exec($curl);
        $code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		curl_close($curl);

        echo $data;
	}
}