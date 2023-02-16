let btnCurl = $('.btn_curl'), btnCancelar = $('.btn-cancelar'), upload = $('.upload-button'), file = $('.file-upload'), imgperfil = $('.profile-pic'), perfiltop = $('.top-avatar');

$(document).ready(function (){
	$('html, body').animate({ scrollTop: 0 }, 'fast');
	setTimeout(function () { $('.msg').hide('slow'); }, 3000);
});

/*$('body').bind('click','a',function(e){
	let el = e.target, a = el.closest('a');
});*/
/*$('#form_proveedores').validate({
	submitHandler: function (form, event){
		let btnSubmit = $('#form_proveedor button[type=submit]');
		
		btnSubmit.html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
		btnSubmit.addClass('disabled');
		btnCancelar.addClass('disabled');
	}
});

$('#form_usuarios').validate({
	submitHandler: function (form, event){
		let btnSubmit = $('#form_usuarios button[type=submit]');
		
		btnSubmit.html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
		btnSubmit.addClass('disabled');
		btnCancelar.addClass('disabled');
	}
});*/

/*$('.numcurl').bind('keydown',function(e){
	let key = e.which, len = ($('.numcurl').val()).length + 1;
	//alert(key);
	if(key >= 48 && key <= 57 || key >= 96 && key <= 105 || key == 46 || key == 8){
		/*if(len <= $('.numcurl').prop('maxlength')){
			if($('.nombres').prop('readonly') === true){ $('.nombres').prop('readonly', false), $('.direccion').prop('readonly', false), $('.apellidos').prop('readonly', false) }
			if($('.nombres').val() !== '' || $('.apellidos').val() !== '' || $('.direccion').val() !== '' || $('.usuario').val() !== ''){
				$('.nombres').val(''), $('.direccion').val(''), $('.apellidos').val(''), $('.usuario').val('')
			}
		}
		if(len === $('.numcurl').prop('maxlength')){
			let palabra = $('.numcurl').val() + String.fromCharCode(key);
			$('.usuario').val(palabra);
		}
		return String.fromCharCode(key);
	}else
		return false;
});*/
/*function mascara(o,f){  
	v_obj=o;  
	v_fun=f;  
	setTimeout("execmascara()",1);  
}  
function execmascara(){   
	v_obj.value=v_fun(v_obj.value);
}  
function cpf(v){     
	v=v.replace(/([^0-9\.]+)/g,''); 
	v=v.replace(/^[\.]/,''); 
	v=v.replace(/[\.][\.]/g,''); 
	v=v.replace(/\.(\d)(\d)(\d)/g,'.$1$2'); 
	v=v.replace(/\.(\d{1,2})\./g,'.$1'); 
	//v = v.toString().split('').reverse().join('').replace(/(\d{3})/g,'$1,');    
	//v = v.split('').reverse().join('').replace(/^[\,]/,''); 
	return v;
}*/
/*$('.numDec').bind('keydown',function(e){
	let key = e.which;
	alert(key);
	if(key >= 48 && key <= 57 || key >= 96 && key <= 105 || key == 46 || key == 8 || key == 37 || key == 39 || key == 9 || key == 116){
		return String.fromCharCode(key);
	}else
		return false;
	
	//jQuery(this).val(jQuery(this).val().replace(/[^0-9]/g, ''));
});*/
function formatMoneda(v){
	let n = parseFloat(v).toFixed(2);
	n = (n).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return n;
}
function ceros( number, width ){
	width -= number.toString().length;
	if ( width > 0 ){
		return new Array( width + (/\./.test( number ) ? 2 : 1) ).join( '0' ) + number;
	}
	return number + ""; // siempre devuelve tipo cadena
}

$('.tipodoc').bind('change',function(e){
	if($(this).val() === '1') $('.numcurl').prop('maxlength',8);
	else if($(this).val() === '2') $('.numcurl').prop('maxlength',9);
	
	$('.borra').val('');
	$('.perfil').val('2');
	//if($('.nombres').prop('readonly') === true){ $('.nombres').prop('readonly', false); $('.direccion').prop('readonly', false); $('.apellidos').prop('readonly', false); }
	$('.numcurl').focus();
});

$('.moneda').bind('input',function(e){
	//return mascara(this,cpf);
	jQuery(this).val(jQuery(this).val().replace(/([^0-9\.]+)/g, ''));
	jQuery(this).val(jQuery(this).val().replace(/^[\.]/,''));
	jQuery(this).val(jQuery(this).val().replace(/[\.][\.]/g,''));
	jQuery(this).val(jQuery(this).val().replace(/\.(\d)(\d)(\d)/g,'.$1$2'));
	jQuery(this).val(jQuery(this).val().replace(/\.(\d{1,2})\./g,'.$1'));
});

$('.num').bind('input',function(e){
	jQuery(this).val(jQuery(this).val().replace(/[^0-9]/g, ''));
});

$('.mayusc').bind('input',function(e){
	jQuery(this).val(jQuery(this).val().toUpperCase());
});
btnCancelar.bind('click', function(){ $(location).attr('href',base_url+segmento); });
upload.bind('click',function(e){ file.trigger('click'); });

file.bind('change',function(){
	var e = e || window.event;
	let file = e.target.files;
	let img = URL.createObjectURL(file[0]);
	let formData = new FormData($('.uploadFileAjax')[0]);
	$.ajax({
        url: base_url + 'upload',
        type: 'post',
        dataType: 'html',
        data: formData,
        cache: false,
        contentType: false,
	    processData: false
	}).done(function(data){
		//console.log(data);
		imgperfil.attr( 'src', img );
		perfiltop.attr( 'src', img );
	});
	
});

btnCurl.bind('click',function(){
	let doc = $('.doc').val(); $('.nombres').val(''); $('.direccion').val(''); $('.ruc').val(''); $('.apellidos').val('');
	let tipodoc = ''; if($('.tipodoc').val() === '1') tipodoc = '01'; else if($('.tipodoc').val() === '2') tipodoc = '03';
	
	if(tipodoc !== '' && doc !== ''){
		if(doc.length < 8){ alert('Debe ingresar un documento válido'); $('#doc').focus(); return}
		if(tipodoc === '01' && doc.length !== 8){ alert('Debe ingresar un número de doc válido, 8 caracteres'); $('#doc').focus(); return}
		if(tipodoc === '03' && doc.length < 9){ alert('Debe ingresar un número de documento válido, 9 caracteres'); $('#doc').focus(); return}
		/*if(tipodoc === '04')tipodoc = '0' + (parseInt(tipodoc)-1).toString();*/
		$('.error_curl').html('');
		
		$.ajax({
			data: { tipo: tipodoc, doc: doc },
			url: base_url + 'curl',
			method: 'POST',
			dataType: 'json',
			error: function (xhr) { btnCurl.removeAttr('disabled'); btnCurl.html('<i class="fa fa-search aria-hidden="true"></i>'); },
			beforeSend: function () { btnCurl.html('<i class="fa fa-spinner fa-pulse"></i>'); btnCurl.attr('disabled', 'disabled'); },
			success: function (data) {
				let msg = data.errors? data.errors[0].detail : '';
				btnCurl.html('<i class="fa fa-search aria-hidden="true"></i>');
				btnCurl.removeAttr("disabled");
				if(msg === ''){
					//console.log(data);
					if(tipodoc === '01' || tipodoc === '03'){
						if(segmento === 'proveedores'){
							$('.direccion').val(data.data.attributes.domicilio_direccion);
							$('.nombres').val(data.data.attributes.apellido_paterno+' '+data.data.attributes.apellido_materno+' '+data.data.attributes.nombres);
							//$('.direccion').prop('readonly', true);
						}else if(segmento === 'usuarios'){
							$('.apellidos').val(data.data.attributes.apellido_paterno+' '+data.data.attributes.apellido_materno);
							$('.nombres').val(data.data.attributes.nombres); $('.usuario').val(doc);
							//$('.apellidos').prop('readonly', true);
						}
						//$('.nombres').prop('readonly', true);
					}//else console.log(data);
				}else{
					alert(msg);
					//$('.nombres').prop('readonly', false); $('.direccion').prop('readonly', false); $('.apellidos').prop('readonly', false);
				}
			}
		}).fail( function( jqXHR, textStatus, errorThrown ) {
			btnCurl.html('<i class="fa fa-search aria-hidden="true"></i>'); btnCurl.removeAttr("disabled"); alert(jqXHR + ",  " + textStatus + ",  " + errorThrown);
		});
	}else{ 
		if(tipodoc == ''){ alert('Debe elegir un tipo de Documento'); $('#tipodoc').focus(); }
		else{ alert('Debe ingresar un número de documento válido'); $('#doc').focus(); }
	}
});

$('#formPassword').validate({
	errorClass: 'form_error',
	rules: {
		old_password: { required: true },
		password: { required: true, minlength: 6 },
		re_password: { required: true, equalTo: "#password" }
	},
	messages: {
		old_password: { required: '&nbsp;&nbsp;Ingrese la contrase\xf1a actual' },
		password: { required: '&nbsp;&nbsp;Ingrese la nueva contrase\xf1a', minlength: '&nbsp;&nbsp;Por lo menos 6 caracteres' },
		re_password: { required: '&nbsp;&nbsp;Ingrese nuevamente la contrase\xf1a', equalTo: '&nbsp;&nbsp;Las contrase\xf1as deben ser iguales' }
	},
	errorPlacement: function(error, element) {
		error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		event.preventDefault();
		$.ajax({
			data: $('#formPassword').serialize(),
			url: base_url + 'cambiapass',
			method: 'POST',
			dataType: 'JSON',
			beforeSend: function () {
				//$('.resp').html('<i class="fas fa-spinner fa-pulse fa-2x"></i>');
				$('#formPassword button[type=submit]').html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
				$('#formPassword button[type=submit]').addClass('disabled');
			},
			success: function (data) {
				//$('.resp').html('');
				$('#formPassword button[type=submit]').html('Realizar Cambio');
				$('#formPassword button[type=submit]').removeClass('disabled');
				//console.log(data);
				if (parseInt(data.status) === 200) {
					$('.resp').html(data.message);
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 1500);
				}else {
					$('.resp').html(data.message);
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 1500);
				}
			}
		});
	}
});

$('.dep').bind('change', function(){
	let cod = this.value, html = '<option value="">-- Seleccione --</option>';
	$.ajax({
		data: { cod_dep: cod },
		url: base_url + 'provincias',
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function () {
			$('.dis').html('<option>-- Seleccione --</option>'); $('.pro').html('<option> Cargando...</option>');
		},
		success: function (data) {
			$.each(data, function (i, e){ html += '<option value="' + e.cod_pro + '">' + e.provincia + '</option>'; });
			$('.pro').html(html);
			console.log(data);
		}
	});
});
$('.pro').bind('change', function(){
	let cod = this.value, html = '<option value="">-- Seleccione --</option>';
	$.ajax({
		data: { cod_dep: $('.dep').val(),cod_pro: cod },
		url: base_url + 'distritos',
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function () {
			$('.dis').html('<option> Cargando...</option>');
		},
		success: function (data) {
			$.each(data, function (i, e){ html += '<option value="' + e.cod_dis + '">' + e.distrito + '</option>'; });
			$('.dis').html(html);
			console.log(data);
		}
	});
});
$('.dis').change(function(){
	let id = this.value, dpto = $('.dep').val(), prov = $('.pro').val();
    if (id.length > 0) {
		$.ajax({
			data: { cod_dep: dpto, cod_pro: prov, cod_dis: id },
			url: base_url + 'cargarLatLng',
			method: 'POST',
			dataType: 'JSON',
			beforeSend: function(){},
			success: function (data) {
				console.log(data);
				/*const {ubigeo} = data;*/
				var opt = {lat: parseFloat(data[0].latitud), lng: parseFloat(data[0].longitud), zoom: 16};
				//console.log(map.getZoom());
				console.log(opt);
				map.setCenter(opt);
				if($('.ajaxMap').css('display') == 'none' || $('.ajaxMap').css('opacity') == 0) $('.ajaxMap').show();
				/*$.ajax({
					data: {lat: parseFloat(ubigeo[0].latitud), lng: parseFloat(ubigeo[0].longitud), zoom: 16},
					url: 'urlCurl',
					method: "POST",
					dataType: "json",
					beforeSend: function () {},
					success: function (data) {
						console.log(data);
					}
				});*/
			}
		});
	}
});
$('.blur').on('blur',function(){
	let id = $(this).attr('id');
	if(id === 'pesocafe' || id === 'pesosub' || id === 'pesodesc' || id === 'pesocasc'){
		let totPeso = 0, porcPeso = 0, porc = 0, sib = $(this).closest('div').siblings().find('input'), h = null, input = $(this).closest('ul').find('input.blur');
		
		$.each(input,function(i,e){
			if(e.value !== '') totPeso += parseFloat(e.value);
			else e.value = '0.00', h = $(e).closest('div').siblings('div').find('input'), h.val('0.00');
		});
		
		$.each(input,function(i,e){
			h = $(e).closest('div').siblings('div').find('input');
			if(e.value !== '' && parseFloat(e.value) > 0){ porc = (parseFloat(e.value)/totPeso)*100, h.val(formatMoneda(porc)), porcPeso += porc; }
		});
		
		if(totPeso > 0) $('#pesototal').val(formatMoneda(totPeso)), $('#porctotal').val(formatMoneda(porcPeso));
		else $('#pesototal').val('0.00'), $('#porctotal').val('0.00');
	}
	if(id === 'malla16' || id === 'malla15' || id === 'malla14' || id === 'mallabase'){
		let totmalla = parseFloat($('#malla_gen').val()), totMall = 0, sib = $(this).closest('div').siblings().find('input'), h = null, totPorc = 0;
		let input = $(this).closest('ul').find('input.blur');
		
		$.each(input,function(i,e){
			if(e.value !== '')totMall += parseFloat(e.value);
			else e.value = '0.00', h = $(e).closest('div').siblings('div').find('input'), h.val('0.00');
		});
		if(totMall > totmalla){
			alert('El total no puede exceder el valor de la malla');
			totMall -= parseFloat(this.value), $(this).val(''), sib.val(''), $(this).focus();
		}else{
			let porc = 0;
			$.each(input,function(i,e){
				h = $(e).closest('div').siblings('div').find('input');
				if(e.value !== '' && parseFloat(e.value) > 0){ porc = (parseFloat(e.value)/totMall)*100, h.val(formatMoneda(porc)), totPorc += porc; }
			});
			if(totMall > 0) $('#grtotmalla').val(formatMoneda(totMall)), $('#portotmalla').val(formatMoneda(totPorc));
			else $('#grtotmalla').val('0.00'), $('#portotmalla').val('0.00');
		}
	}
	if(id === 'fragptos' || id === 'sabptos' || id === 'sabreptos' || id === 'aciptos' || id === 'cuerptos' || id === 'uniptos' || id === 'balptos' || id === 'tazptos'
			|| id === 'dulptos' || id === 'apreptos'){
		let input = $(this).closest('ul').find('input.blur'), totSen = 0;
		
		$.each(input,function(i,e){
			if($(e).hasClass('blur') && e.id !== 'defsustraer'){
				totSen += parseFloat(this.value);
			}
		});
		$('#ptotal').val(totSen - parseFloat($('#defsustraer').val()));
		$('#pfinal').val(parseFloat($('#ptotal').val()) - parseFloat($('#defsustraer').val()));
	}
	if(id === 'defsustraer'){
		$('#pfinal').val(parseFloat($('#ptotal').val()) - parseFloat($('#defsustraer').val()));
	}
});