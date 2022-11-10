$(document).ready(function (){ $('html, body').animate({ scrollTop: 0 }, 'fast'); });

let curl = $('.btn_curl');

$('body').bind('click','a',function(e){
	let evt = e || e.target, el = evt.target, rel = $(el).closest('a').attr('rel');
	if(rel === 'proveedores'){
		$(location).attr('href','proveedores');
	}else if(rel === 'Nuevo Registro'){
		
	}
});

curl.bind('click',function(){
	let doc = $('.doc').val(), tipodoc = $('.tipodoc').val(); $('.nombres').val(''); $('.direccion').val(''); $('.ruc').val('');
	
	if(doc !== '' && tipodoc !== ''){
		if(doc.length < 8){ alert('Debe ingresar un documento válido'); $('#doc').focus(); return}
		if(tipodoc === '01' && doc.length !== 8){ alert('Debe ingresar un número de doc válido, 8 caracteres'); $('#doc').focus(); return}
		if(tipodoc === '03' && doc.length < 9){ alert('Debe ingresar un número de documento válido, 9 caracteres'); $('#doc').focus(); return}
		/*if(tipodoc === '04')tipodoc = '0' + (parseInt(tipodoc)-1).toString();*/
		
		$.ajax({
			data: { tipo: tipodoc, doc: doc },
			url: base_url + 'curl',
			method: 'POST',
			dataType: 'json',
			error: function (xhr) { curl.removeAttr('disabled'); curl.html('<i class="fa fa-search aria-hidden="true"></i>'); },
			beforeSend: function () { curl.html('<i class="fa fa-spinner fa-pulse"></i>'); curl.attr('disabled', 'disabled'); },
			success: function (data) {
				let msg = data.errors? data.errors[0].detail : '';
				curl.html('<i class="fa fa-search aria-hidden="true"></i>');
				curl.removeAttr("disabled");
				if(msg === ''){
					console.log(data);
					if(tipodoc === '01' || tipodoc === '03'){
						$('.nombres').val(data.data.attributes.apellido_paterno+' '+data.data.attributes.apellido_materno+' '+data.data.attributes.nombres);
						$('.direccion').val(data.data.attributes.domicilio_direccion);
					}else console.log(data);
				}else alert(msg);
			}
		}).fail( function( jqXHR, textStatus, errorThrown ) {
			curl.html('<i class="fa fa-search aria-hidden="true"></i>'); curl.removeAttr("disabled"); alert(jqXHR + ",  " + textStatus + ",  " + errorThrown);
		});
	}else{ 
		if(tipodoc === ''){ alert('Debe elegir un tipo de Documento'); $('#tipodoc').focus(); }
		else{ alert('Debe ingresar un número de documento válido'); $('#doc').focus(); }
	}
});

$('#form_proveedor').validate({
	errorClass: 'form_error',
	rules: {
		tipodoc: { required: function () { if ($('.tipodoc').css('display') != 'none') return true; else return false; } },
		doc: { required: function () { if ($('.doc').css('display') != 'none') return true; else return false; }, minlength: 8 },
		ruc: { required: function () { if ($('.ruc').css('display') != 'none') return true; else return false; }, minlength: 11 },
		nombres: { required: function () { if ($('.nombres').css('display') != 'none') return true; else return false; } },
		direccion: { required: function () { if ($('.direccion').css('display') != 'none') return true; else return false; } },
		zona: { required: function () { if ($('.zona').css('display') != 'none') return true; else return false; } },
	},
	messages: {
		tipodoc: { required : '&nbsp;&nbsp;Campo Requerido' },
		doc: { required : '&nbsp;&nbsp;Campo Requerido', minlength: '&nbsp;&nbsp;Debe ingresar mínimo 8 caracteres' },
		ruc: { required : '&nbsp;&nbsp;Campo Requerido', minlength: '&nbsp;&nbsp;Debe ingresar mínimo 11 caracteres' },
		nombres: { required : '&nbsp;&nbsp;Campo Requerido' },
		direccion: { required : '&nbsp;&nbsp;Campo Requerido' },
		zona: { required : '&nbsp;&nbsp;Campo Requerido' },
	},
	errorPlacement: function (error, element) {
		if (element.attr('name') == 'doc') {
			error.insertAfter('.btn_curl');
		}else error.insertAfter(element);
	},
});