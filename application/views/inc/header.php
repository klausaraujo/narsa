<!-- Desactivar cache del navegador 
<meta http-equiv="Expires" content="0">
<meta http-equiv="Last-Modified" content="0">
<meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
<meta http-equiv="Pragma" content="no-cache">-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="<?=base_url()?>/public/images/favicon.jpg"/>
<link rel="icon" href="<?=base_url()?>/public/images/favicon.jpg" type="image/x-icon">
<link rel="stylesheet" href="<?=base_url()?>/public/css/bootstrap.css">
<link rel="stylesheet" href="<?=base_url()?>/public/datatable/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<?=base_url()?>/public/css/typography.css">
<link rel="stylesheet" href="<?=base_url()?>/public/css/style.css">
<link rel="stylesheet" href="<?=base_url()?>/public/css/responsive.css">
<link rel="stylesheet" href="<?=base_url()?>/public/css/fontawesome.css">
<style>
/* Formulario de Login */
.login {
		position:absolute;min-width:500px;height:570px;top:50%;left:50%;background:#ffffff;transform: translate(-50%, -50%);
		border-radius:20px;border: 1px solid #dd5f1a;overflow:auto;
}
.sign-in-from { padding:0 45px; position: relative; top: 5%; bottom: 5% }
@media(max-width: 500px){
	.login { min-width:100%;height:70% }
}
@media(max-width: 360px){
	.login { height:85% }
}
.btn { padding: 0.3rem 0.7rem 0.3rem 0.7rem; }

label, .btn, .pagination, .form-control, .nav-pills .nav-item.nav-link, a, li, span { font-size: 12.5px }
.nav-pills .nav-item.nav-link { padding:0.4em 1em }
@media(max-width: 1299px){
	body.sidebar-main .iq-sidebar { width: 260px; left: 0; z-index: 999; background: rgba(221,95,26,1); background: -moz-linear-gradient(left, rgba(173,104,64,1) 0%, rgba(221,95,26,1) 100%); background: -webkit-gradient(left top, right top, color-stop(0%, rgba(173,104,64,1)), color-stop(100%, rgba(221,95,26,1))); background: -webkit-linear-gradient(left, rgba(173,104,64,1) 100%) 0%, rgba(221,95,26,1) 100%); background: -o-linear-gradient(left, rgba(173,104,64,1) 0%, rgba(221,95,26,1) 100%); background: -ms-linear-gradient(left, rgba(173,104,64,1) 0%, rgba(221,95,26,1) 100%); background: linear-gradient(to right, rgba(173,104,64,1) 0%, rgba(221,95,26,1) 100%); filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#A0522D', endColorstr='#8B4513', GradientType=1); }
}
@media (max-width: 479px){
	.iq-top-navbar .navbar-toggler, .iq-top-navbar .iq-navbar-custom .iq-menu-bt{ top: 18px; }
	.navbar-collapse{ top: 75px; }
	.content-page, body.sidebar-main .content-page { padding: 95px 0 0; }
}
@media (max-width: 992px){
	.iq-top-navbar .navbar-toggler{ right: 20px; }
	.iq-top-navbar .iq-navbar-custom .iq-menu-bt { right: 80px; }
}
@media(min-width:767px) and (max-width: 1699px) { .sign-in-detail { height: 100%; min-height: 470px; } }
.modal-lg, .modal-xl { max-width: 900px; }
.modal-ing { max-width: 1100px; }
table.dataTable tr, th, td{ font-size: 0.7rem }
#tablaCobros tr, #tablaCobros th, #tablaCobros td, #tablaPagos tr, #tablaPagos th, #tablaPagos td, #tablaPagosVal tr, #tablaPagosVal th, #tablaPagosVal td{font-size: 0.7rem;}
div.dataTables_wrapper div.dataTables_length .form-control-sm{
	line-height: 1.5;
	background: #fff url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='4' height='5' viewBox='0 0 4 5'%3e%3cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3e%3c/svg%3e") no-repeat right 0.75rem center/8px 10px;
}
div.dataTables_wrapper .far, div.dataTables_wrapper .fa, div.dataTables_wrapper .fas {
	line-height: 1.6;
	font-size: 17px;
}
.fallecido {
  font-weight: bold;
  animation-name: parpadeo;
  animation-duration: 1s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;

  -webkit-animation-name:parpadeo;
  -webkit-animation-duration: 1s;
  -webkit-animation-timing-function: linear;
  -webkit-animation-iteration-count: infinite;
}

@-moz-keyframes parpadeo{  
  0% { opacity: 1.0; }
  50% { opacity: 0.0; }
  100% { opacity: 1.0; }
}

@-webkit-keyframes parpadeo {  
  0% { opacity: 1.0; }
  50% { opacity: 0.0; }
   100% { opacity: 1.0; }
}

@keyframes parpadeo {  
  0% { opacity: 1.0; }
   50% { opacity: 0.0; }
  100% { opacity: 1.0; }
}
</style>

<?if(($this->uri->segment(1) === 'proveedores' && ($this->uri->segment(2) === 'nuevo' || $this->uri->segment(2) === 'editar')) || 
		($this->uri->segment(1) === 'ventas' && $this->uri->segment(2) === 'cliente' && ($this->uri->segment(3) === 'nuevo' || $this->uri->segment(3) === 'editar')) ||
		($this->uri->segment(1) === 'tostado' && ($this->uri->segment(2) === 'nuevo' || $this->uri->segment(2) === 'editar'))){ ?>
<script>
	function initMap(){}
</script>
<script src="<?='https://maps.googleapis.com/maps/api/js?key=AIzaSyA85CP4w2NVLGUH5VQzjVJMcOWdmsj3-r0&callback=initMap'?>" async ></script>
<?}elseif($this->uri->segment(2) === 'parametros'){?>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<?}?>