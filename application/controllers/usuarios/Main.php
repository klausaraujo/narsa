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
	
	public function listaUsuarios()
	{
		$this->load->model('Usuarios_model');
		$usuarios = $this->Usuarios_model->listaUsuarios();
		echo json_encode(['data'=>$usuarios]);
	}
	public function nuevo()
	{
		if($this->uri->segment(1) === 'nuevousuario')header('location:' .base_url(). 'usuarios/nuevo');
		else{
			$this->load->model('Usuarios_model');
			$this->load->model('Proveedores_model');
			$tipodoc = $this->Proveedores_model->tipodoc();
			$perfil = $this->Usuarios_model->perfil();
			$data = array( 'tipodoc' => $tipodoc, 'perfil' => $perfil );
			if($this->uri->segment(2) === 'editar'){
				$id = $this->input->get('id');
				$usuario = $this->Usuarios_model->listaUsuario(['idusuario' => $id]);
				$data['usuario'] = $usuario;
			}
			$this->load->view('main',$data);
		}
	}
	public function registrar()
	{
		$this->session->set_flashdata('claseMsg', 'danger');
		if($this->input->post('tipodoc') != '' && $this->input->post('doc') != '' && $this->input->post('apellidos') != '' && $this->input->post('nombres') != ''
			&& $this->input->post('usuario') != '' && $this->input->post('perfil') != '')
		{
			$this->load->model('Usuarios_model');
			$data = array(
				'idtipodocumento' => $this->input->post('tipodoc'),
				'numero_documento' => $this->input->post('doc'),
				'apellidos' => $this->input->post('apellidos'),
				'nombres' => $this->input->post('nombres'),
				'usuario' => $this->input->post('usuario'),
				'idperfil' => $this->input->post('perfil'),
			);
			if($this->input->post('tiporegistro') === 'registrar'){
				$data['avatar'] = 'user.jpg';
				$data['passwd'] = sha1($this->input->post('doc'));
				$data['activo'] = '1';
				$this->session->set_flashdata('flashSuccess', 'No se pudo registrar el Usuario');
				if($this->Usuarios_model->registrar($data)){
					$this->session->set_flashdata('claseMsg', 'success');
					$this->session->set_flashdata('flashSuccess', 'Usuario Registrado Exitosamente');
				}
			}else if($this->input->post('tiporegistro') === 'editar'){
				$id = $this->input->post('idusuario');
				$this->session->set_flashdata('flashSuccess', 'No se pudo actualizar el Usuario');
				if($this->Usuarios_model->actualizar( $data, ['idusuario'=>$id] )){
					$this->session->set_flashdata('flashSuccess', 'Usuario Actualizado');
					$this->session->set_flashdata('claseMsg', 'success');
				}
			}
		}else{
			$this->session->set_flashdata('flashSuccess', 'No se pudo registrar el Usuario por campos vac&iacute;os');
		}
		header('location:'.base_url().'usuarios');
	}
	public function habilitar()
	{
		$id = $this->input->get('id'); $stat = $this->input->get('stat'); $msg = ''; $status = 500;
		$this->load->model('Usuarios_model');
		
		if($stat === '1'){
			$msg = 'No se pudo deshabilitar el Usuario';
			if($this->Usuarios_model->actualizar( ['activo'=> 0], ['idusuario'=>$id] )){
				$status = 200;
				$msg = 'Usuario deshabilitado';
			}
		}else{
			$msg = 'No se pudo habilitar el Usuario';
			if($this->Usuarios_model->actualizar( ['activo'=> 1], ['idusuario'=>$id] )){
				$status = 200;
				$msg = 'Usuario habilitado';
			}
		}
		
		$data = array(
			'status' => $status,
			'msg' => $msg
		);
		
		echo json_encode($data);
		//header('location:'. base_url() .'usuarios');
	}
	public function resetear()
	{
		$id = $this->input->get('id'); $doc = $this->input->get('doc'); $status = 500;
		$this->load->model('Usuarios_model');
		
		if($this->Usuarios_model->actualizar( ['passwd'=> sha1($doc)], ['idusuario'=>$id] )) $status = 200;
		
		echo json_encode(['status'=> $status]);
	}
	public function permisosUsuario()
	{
		$id = $this->input->get('id');
		$this->load->model('Usuarios_model');
		$permisos = $this->Usuarios_model->buscaPermisos(['idusuario'=>$id]);
		
		echo json_encode(['data'=>$permisos,'idusuario'=>$id]);
	}
	public function asignarPermisos()
	{
		$this->load->model('Usuarios_model');
		$perProv = (isset($_POST['proveedoresPer'])?$_POST['proveedoresPer'] : array()); $id = (isset($_POST['idusuarioPer'])?$_POST['idusuarioPer'] : '');
		$perUser = (isset($_POST['usuariosPer'])?$_POST['usuariosPer'] : array());
		$dataArray = []; $i = 0; $msg = 'No se pudo asignar los permisos'; $status = 500;
		
		if(!empty($perProv)){
			foreach($perProv as $row):
				$dataArray[$i] = ['idpermiso'=>$row,'idusuario'=>$id,'activo'=>1];
				$i++;
			endforeach;
		}
		if(!empty($perUser)){
			foreach($perUser as $row):
				$dataArray[$i] = ['idpermiso'=>$row,'idusuario'=>$id,'activo'=>1];
				$i++;
			endforeach;
		}
		
		$regPer = $this->Usuarios_model->registrarPer(['idusuario'=>$id],$dataArray,'permisos_opcion');
		
		if($regPer){
			$msg = 'Permisos Asignados';
			$status = 200;
		}
		
		echo json_encode(['msg'=>$msg, 'status'=>$status,'data'=>$dataArray]);
	}
	public function sucursalesUsuario()
	{
		$id = $this->input->get('id');
		$this->load->model('Usuarios_model');
		$sucursales = $this->Usuarios_model->buscaSucursales(['idusuario'=>$id]);
		
		echo json_encode(['data'=>$sucursales,'idusuario'=>$id]);
	}
	public function asignarSucursales()
	{
		$this->load->model('Usuarios_model');
		$perSuc = (isset($_POST['usuariosSuc'])?$_POST['usuariosSuc'] : array()); $id = (isset($_POST['idusuarioSuc'])?$_POST['idusuarioSuc'] : '');
		$dataArray = []; $i = 0; $msg = 'No se pudo asignar los sucursales'; $status = 500;
		
		if(!empty($perSuc)){
			foreach($perSuc as $row):
				$dataArray[$i] = ['idsucursal'=>$row,'idusuario'=>$id,'activo'=>1];
				$i++;
			endforeach;
		}
		
		$regPer = $this->Usuarios_model->registrarPer(['idusuario'=>$id],$dataArray,'usuarios_sucursal');
		
		if($regPer){
			$msg = 'Sucursales Asignadas';
			$status = 200;
		}
		
		echo json_encode(['msg'=>$msg, 'status'=>$status,'data'=>$dataArray]);
	}
}