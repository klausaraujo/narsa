$(document).ready(function (){
	
});

$('body').bind('click','a',function(e){
	/*let evt = e || e.target, el = evt.target, rel = $(el).closest('a').attr('rel');
	if(rel === 'proveedores'){
		$(location).attr('href','proveedores');
	}else if(rel === 'Nuevo Registro'){
		
	}*/
});

function proveedores(tabla){
	tabla.on('click','a', function(e){
		let evt = e || e.target, fila = tabla.row($(this).closest('tr')).data();
		//evt.preventDefault();
		if($(this).hasClass('acciones')){ $('#idproveedor').val(fila.idproveedor); return true; }
	});
}

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
		return true;
	}
});

$('#form_ingresos').validate({
	errorClass: 'form_error',
});

$('#form_valorizaciones').validate({
	errorClass: 'form_error',
});