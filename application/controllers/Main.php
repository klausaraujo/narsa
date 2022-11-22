<?php
if (! defined("BASEPATH")) exit("No direct script access allowed");

class Main extends CI_Controller
{
	private $usuario;
	private $absolutePath;
	
    public function __construct(){
		parent::__construct();
		//$this->load->library('User');
		if($this->session->userdata('user')){
			$this->usuario = json_decode($this->session->userdata('user'));
			$this->absolutePath = $_SERVER['DOCUMENT_ROOT'].'/narsa/';
		}else header('location:' .base_url());
	}

    public function index(){}
	
	public function proveedores(){
		$this->load->model('Proveedores_model');
		$proveedores = $this->Proveedores_model->listaProveedores();
		$headers = array(
			'0'=>['title' => '', 'targets' => 0],'1'=>['title' => 'Acciones', 'targets' => 1],'2'=>['title' => 'ID', 'targets' => 2],'3'=>['title' => 'Tipo Documento', 'targets' => 3],
			'4'=>['title' => 'N&uacute;mero', 'targets' => 4],'5'=>['title' => 'RUC', 'targets' => 5],'6'=>['title' => 'Nombre / Raz&oacute;n Social', 'targets' => 6],'7'=>['title' => 'Direcci&oacute;n', 'targets' => 7],
			'8'=>['title' => 'Zona', 'targets' => 8],'9'=>['title' => 'Estado', 'targets' => 9],'10'=>['targets' => 'no-sort', 'orderable' => false],'11'=>['targets' => 2, 'visible' => false],
		);
		$data = array(
			'lista' => $proveedores,
			'headers' => $headers,
		);
		$this->load->view('main',$data);
	}
	public function usuarios(){
		$this->load->model('Usuarios_model');
		$usuarios = $this->Usuarios_model->listaUsuarios();
		$headers = array(
			'0'=>['title' => '', 'targets' => 0],'1'=>['title' => 'Acciones', 'targets' => 1],'2'=>['title' => 'ID', 'targets' => 2],'3'=>['title' => 'Documento', 'targets' => 3],
			'4'=>['title' => 'N&uacute;mero', 'targets' => 4],'5'=>['title' => 'Avatar', 'targets' => 5],'6'=>['title' => 'Apellidos', 'targets' => 6],'7'=>['title' => 'Nombres', 'targets' => 7],
			'8'=>['title' => 'Usuario', 'targets' => 8],'9'=>['title' => 'Perfil', 'targets' => 9],'10'=>['title' => 'Estado', 'targets' => 10],'11'=>['targets' => 'no-sort', 'orderable' => false],
			'12'=>['targets' => 2, 'visible' => false],
		);
		$data = array(
			'lista' => $usuarios,
			'headers' => $headers,
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
	public function perfil(){ $this->load->view('main'); }
	
	public function upload(){
		$path = $this->absolutePath.'public/images/perfil/';
		$nombre = $_FILES['perfil']['name'];
		$size = $_FILES['perfil']['size'];
		
        $config['upload_path'] = $path;
        $config['file_name'] = $nombre;
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = 0;
        $config['max_width'] = 0;
        $config['max_height'] = 0;
		$config['overwrite'] = true;
		
		$this->load->library('upload', $config);
        
        if (!$this->upload->do_upload('perfil')) {
            $data = array('error' => $this->upload->display_errors());
			//$this->load->view('upload_form', $error);
        }else{
			$resp = (object)$this->upload->data();
			$error_resize = 0; $avatar = 0;
			if($resp->image_width > 460){
				$config['image_library'] = 'gd2';
				$config['source_image'] = $path.$nombre;
				$config['create_thumb'] = FALSE;
				$config['maintain_ratio'] = TRUE;
				$config['width'] = 400;
				//$config['height'] = 320;
				//$error_resize = 'Entro en resize';
				$this->load->library('image_lib', $config);
				if(! $this->image_lib->resize()) $error_resize = $this->image_lib->display_errors();
			}
			$this->load->model('Usuario_model');
			$this->Usuario_model->setAvatar($nombre);
			$avatar = $this->Usuario_model->avatar(['idusuario' => $this->usuario->idusuario]);
			if($avatar === 1){ $this->usuario->avatar = $nombre; $this->session->set_userdata('user', json_encode($this->usuario)); }
			
			$data = array('upload_data' => $resp, 'resize' => $error_resize, 'avatar' => $this->usuario->avatar);
		}
		echo json_encode($data);
	}
	public function password()
    {
        $this->load->model('Usuario_model');
        
        $actual = $this->input->post('old_password');
        $password = $this->input->post('password');
        $id = $this->input->post('cod_usuario');
		$status = 500;
        $message = 'Contrase&ntilde;a actual no coincide';
		
		$this->Usuario_model->setPassword($actual);
		$validacion = $this->Usuario_model->validar_password(['idusuario' => $this->usuario->idusuario]);
		
		if($validacion === 1){
			$message = 'No se pudo actualizar la contrase&ntilde;a';
			$this->Usuario_model->setPassword($password);            
            if ($this->Usuario_model->password(['idusuario' => $id]) === 1){
                $message = 'La contrase&ntilde;a ha sido actualizada';
                $status = 200;
            }
        }
        echo json_encode(array('status'=>$status,'message'=>$message));
    }
}