let tabla = null;

$(document).ready(function (){
	if(segmento2 == ''){
		tabla = $('#tablaProveedores').DataTable({
			'data':lista, 'bAutoWidth':false, 'bDestroy':true, 'responsive':true, 'select':false, 'lengthMenu':[[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, 'Todas']],
			'columns':[
				{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
						'<a title="Editar Proveedor" href="'+base_url+'proveedores/editar?id='+data.idproveedor+'" class="bg-warning btnTable editar">'+
							'<i class="far fa-pencil" aria-hidden="true"></i></a>'+
						'<a title="Transacciones" href="'+base_url+'proveedores/transacciones?id='+data.idproveedor+'&name='+data.nombre+'" class="bg-success btnTable acciones">'+
							'<i class="far fa-house" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{ data: 'idproveedor' },
				{ data: 'idtipodocumento' },
				{ data: 'numero_documento' },
				{ data: 'RUC' },
				{ data: 'nombre' },
				{ data: 'domicilio' },
				{ data: 'zona' },
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

$('#form_proveedor').validate({
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
		$('#formPassword button[type=submit]').html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
		$('#formPassword button[type=submit]').addClass('disabled');
		return true;
	}
});

$('#form_ingresos').validate({
	errorClass: 'form_error',
});

$('#form_valorizaciones').validate({
	errorClass: 'form_error',
});