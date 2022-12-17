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
$route['proveedores/transacciones/lista'] = 'proveedores/main/listaTransacciones';
$route['proveedores/transacciones/operaciones'] = 'proveedores/main/registraOp';
$route['proveedores/transacciones/anular'] = 'proveedores/main/anulaOp';
$route['proveedores/transacciones/edo_cta'] = 'proveedores/main/informes';
$route['proveedores/ingresos/guia_ingreso'] = 'proveedores/main/informes';
$route['proveedores/ingresos/lista'] = 'proveedores/main/listaIngresos';
$route['proveedores/ingresos/nuevo'] = 'proveedores/main/nuevoIngreso';
$route['proveedores/ingresos/anular'] = 'proveedores/main/anulaOp';
$route['proveedores/ingresos/editar'] = 'proveedores/main/editaingreso';
$route['proveedores/valorizaciones/listaDetalle'] = 'proveedores/main/listaValorizacionDetalle';
$route['proveedores/valorizaciones/nuevo'] = 'proveedores/main/registrarValorizacion';
$route['proveedores/valorizaciones/lista'] = 'proveedores/main/listaValorizaciones';
$route['proveedores/valorizaciones/anular'] = 'proveedores/main/anulaOp';
$route['proveedores/valorizaciones/valoriz_pdf'] = 'proveedores/main/informes';

/* Usuarios */
$route['usuarios/lista'] = 'usuarios/main/listaUsuarios';
$route['nuevousuario'] = 'usuarios/main/nuevo';
$route['usuarios/nuevo'] = 'usuarios/main/nuevo';
$route['usuarios/editar'] = 'usuarios/main/nuevo';
$route['usuarios/registrar'] = 'usuarios/main/registrar';
$route['usuarios/habilitar'] = 'usuarios/main/habilitar';
$route['usuarios/reset'] = 'usuarios/main/resetear';
$route['usuarios/permisos'] = 'usuarios/main/permisosUsuario';
$route['usuarios/permisos/asignar'] = 'usuarios/main/asignarPermisos';
$route['usuarios/sucursales'] = 'usuarios/main/sucursalesUsuario';
$route['usuarios/sucursales/asignar'] = 'usuarios/main/asignarSucursales';

/* Cambiar perfil del usuario */
$route['usuario/perfil'] = 'main/perfil';
/**/
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
