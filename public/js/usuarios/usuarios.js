let tabla = null;

$(document).ready(function (){
	if(segmento2 == ''){
		tabla = $('#tablaUsuarios').DataTable({
			'data':lista, 'bAutoWidth':false, 'bDestroy':true, 'responsive':true, 'select':false, 'lengthMenu':[[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, 'Todas']],
			'columns':[
				{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
						'<a title="Editar Usuario" href="'+base_url+'usuarios/editar?id='+data.idusuario+'" class="bg-warning btnTable editar">'+
							'<i class="far fa-pencil" aria-hidden="true"></i></a>'
						return btnAccion;
					}
				},
				{ data: 'idusuario' },
				{ data: 'idtipodocumento' },
				{ data: 'numero_documento' },
				{ data: 'avatar' },
				{ data: 'apellidos' },
				{ data: 'nombres' },
				{ data: 'usuario' },
				{ 
					data: 'idperfil',
					render: function(data){
						let var_perfil = '';
						switch(data){
							case '1': var_perfil = 'ADMINISTRADOR'; break;
							case '2': var_perfil = 'EST&Aacute;NDAR'; break;
						}
						return var_perfil;
					}
				},
				{
					data: 'activo',
					render: function(data){
						let var_status = '';
						switch(data){
							case '1': var_status = '<span class="text-success">Activo</span>'; break;
							case '0': var_status = '<span class="text-danger">Inactivo</span>'; break;
						}
						return var_status;
					}
				},
			],
			'columnDefs':headers, 'dom': botones, 'buttons':{dom:{container:{tag: 'div',className: 'flexcontent'},buttonLiner:{tag: null}},buttons:[
			'copy','csv','excel','pdf','print']},order: [], language:{ lngDataTable },
		});
	}
});

$('body').bind('click','a',function(e){
	
});

$('#form_usuario').validate({
	errorClass: 'form_error',
	rules: {
		tipodoc: { required: function () { if ($('.tipodoc').css('display') != 'none') return true; else return false; } },
		doc: { required: function () { if ($('.doc').css('display') != 'none') return true; else return false; }, minlength: 8 },
		/*ruc: { required: function () { if ($('.ruc').css('display') != 'none') return true; else return false; }, minlength: 11 },*/
		nombres: { required: function () { if ($('.nombres').css('display') != 'none') return true; else return false; } },
		direccion: { required: function () { if ($('.direccion').css('display') != 'none') return true; else return false; } },
		zona: { required: function () { if ($('.zona').css('display') != 'none') return true; else return false; } },
	},
	messages: {
		tipodoc: { required : '&nbsp;&nbsp;Campo Requerido' },
		doc: { required : '&nbsp;&nbsp;Campo Requerido', minlength: '&nbsp;&nbsp;Debe ingresar mínimo 8 caracteres' },
		/*ruc: { required : '&nbsp;&nbsp;Campo Requerido', minlength: '&nbsp;&nbsp;Debe ingresar mínimo 11 caracteres' },*/
		nombres: { required : '&nbsp;&nbsp;Campo Requerido' },
		direccion: { required : '&nbsp;&nbsp;Campo Requerido' },
		zona: { required : '&nbsp;&nbsp;Campo Requerido' },
	},
	errorPlacement: function(error, element) {
		if (element.attr('name') == 'doc') {
			error.insertAfter('.btn_curl');
		}else error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		//alert('Enviando');
		return true;
	}
});

$('#form_ingresos').validate({
	errorClass: 'form_error',
});

$('#form_valorizaciones').validate({
	errorClass: 'form_error',
});