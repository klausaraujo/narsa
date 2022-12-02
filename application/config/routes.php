<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
/* Controlador por defecto */
$route['default_controller'] = 'login';

/* Formulario de Login */
$route['login'] = 'login/login';
$route['dologin'] = 'login/doLogin';
$route['logout'] = 'login/logout';

/* Programacion en general */
$route['proveedores'] = 'main/proveedores';
$route['curl'] = 'main/curl';
$route['upload'] = 'main/upload';
$route['cambiapass'] = 'main/password';
$route['usuarios'] = 'main/usuarios';

/* Proveedores */
$route['proveedores/lista'] = 'proveedores/main/listaProveedores';
$route['nuevoproveedor'] = 'proveedores/main/nuevo';
$route['proveedores/nuevo'] = 'proveedores/main/nuevo';
$route['proveedores/editar'] = 'proveedores/main/nuevo';
$route['proveedores/registrar'] = 'proveedores/main/registrar';
$route['proveedores/transacciones'] = 'proveedores/main/transacciones';
$route['proveedores/transacciones/lista'] = 'proveedores/main/listatransacciones';
$route['proveedores/transacciones/operaciones'] = 'proveedores/main/registraop';
$route['proveedores/transacciones/anular'] = 'proveedores/main/anulaop';
$route['proveedores/transacciones/ingresos'] = 'proveedores/main/ingresos';

/* Usuarios */
$route['usuarios/lista'] = 'usuarios/main/listaUsuarios';
$route['nuevousuario'] = 'usuarios/main/nuevo';
$route['usuarios/nuevo'] = 'usuarios/main/nuevo';
$route['usuarios/editar'] = 'usuarios/main/nuevo';
$route['usuarios/registrar'] = 'usuarios/main/registrar';
$route['usuarios/habilitar'] = 'usuarios/main/habilitar';
$route['usuarios/reset'] = 'usuarios/main/resetear';

/* Cambiar perfil del usuario */
$route['usuario/perfil'] = 'main/perfil';
/**/
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
