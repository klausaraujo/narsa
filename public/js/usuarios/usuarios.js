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

$('#form_usuarios').validate({
	errorClass: 'form_error',
	rules: {
		tipodoc: { required: function () { if ($('.tipodoc').css('display') != 'none') return true; else return false; } },
		doc: { required: function () { if ($('.doc').css('display') != 'none') return true; else return false; }, minlength: 8 },
		apellidos: { required: function () { if ($('.apellidos').css('display') != 'none') return true; else return false; } },
		nombres: { required: function () { if ($('.nombres').css('display') != 'none') return true; else return false; } },
		usuario: { required: function () { if ($('.usuario').css('display') != 'none') return true; else return false; } },
		perfil: { required: function () { if ($('.perfil').css('display') != 'none') return true; else return false; } },
	},
	messages: {
		tipodoc: { required : '&nbsp;&nbsp;Campo Requerido' },
		doc: { required : '&nbsp;&nbsp;Campo Requerido', minlength: '&nbsp;&nbsp;Debe ingresar mínimo 8 caracteres' },
		apellidos: { required : '&nbsp;&nbsp;Campo Requerido' },
		nombres: { required : '&nbsp;&nbsp;Campo Requerido' },
		usuario: { required : '&nbsp;&nbsp;Campo Requerido' },
		perfil: { required : '&nbsp;&nbsp;Campo Requerido' },
	},
	errorPlacement: function(error, element) {
		if (element.attr('name') == 'doc') {
			error.insertAfter('.btn_curl');
		}else error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		//alert('Enviando');
		$('#formPassword button[type=submit]').html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
		$('#formPassword button[type=submit]').addClass('disabled');
		return true;
	}
});