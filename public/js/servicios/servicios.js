let tablaServ = null, inputSaldo = $('#saldo');

function muestraSaldo(val){
	let valor = formatMoneda(val);
	inputSaldo.removeClass('text-danger'); inputSaldo.removeClass('text-success'); inputSaldo.removeClass('text-primary');
	if(parseFloat(valor) < 0) inputSaldo.addClass('text-danger');
	else if(parseFloat(valor) > 0) inputSaldo.addClass('text-primary');
	else inputSaldo.addClass('text-success');
	inputSaldo.val(valor);
}

jQuery(document).ready(function($){
	if(segmento2 == ''){
		tablaServ = $('#tablaServicios').DataTable({
			ajax:{
				url: base_url + 'servicios/lista',
				type: 'POST',
				data: function (d) {
					d.anio = $('.anio').val(),
					d.mes = $('.mes').val(),
					d.sucursal = $('.sucursal').val();
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language:{ lngDataTable },
			columns:[
				{
					data: null,
					orderable: false,
					render: function(data){
						let nulable = 0; if(data.idtipooperacion === '7' || data.idtipooperacion === '9' || data.idtipooperacion === '11' || data.idtipooperacion === '12' ||
							data.idtipooperacion === '13') nulable = 1;
						let hrefEdit = btnEdit && nulable ?  'href="'+base_url+'servicios/editar?id='+data.idmovimiento+'&suc='+$('.sucursal').val()+'"' : '';
						let hrefAnular = btnAnular && nulable ? 'href="'+base_url+'servicios/anular?id='+data.idmovimiento+'&suc='+$('.sucursal').val()+'"' : '';
						let btnAccion =
						'<a title="Editar Operacion" '+hrefEdit+' class="bg-warning btnTable editar '+((!btnAnular || !nulable)?'disabled':'')+'"><i class="fas fa-pen-to-square" aria-hidden="true"></i></a>'+
						'<a title="Anular Operaci&oacute;n" '+hrefAnular+' class="bg-danger btnTable anular '+((!btnAnular || !nulable)?'disabled':'')+'"><i class="far fa-trash" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{ data: 'idtipooperacion' },{ data: 'tipo_operacion' },{ data: 'sucursal' },{ data: 'tipo_operacion' },
				{ data: 'monto', className: 'text-left', render: function(data,type,row,meta){ return isNaN(data)? '0.00' : formatMoneda(data); } },
				{ data: 'fecha_registro' },
			],
			columnDefs:headers,order: [],
		});
	}
});
$('.anio').bind('change', function(){
	tablaServ.ajax.reload();
});
$('.mes').bind('change', function(){
	tablaServ.ajax.reload();
});
$('.sucursal').bind('change', function(){
	let suc = $('.sucursal').prop('selectedIndex');
	if(!$('#form_caja').length)tablaServ.ajax.reload();
	
	//if($('#form_caja').length)$('#form_caja')[0].reset();
	$.ajax({
		data: {'sucursal': $('.sucursal').val()},
		url: base_url + 'servicios/saldo',
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function (){ },
		success: function (data){
			if($('#form_caja').length){
				$('#form_caja')[0].reset();
				$('#saldoActual').val(data);
				muestraSaldo(data);
				$('.sucursal').prop('selectedIndex',suc);
			}else muestraSaldo(data);
		}
	});
});
$('.tipoCaja').bind('change', function(e){
	let suc = $('.sucursal').prop('selectedIndex');
	if((parseInt($('#saldoActual').val()) === 0 || parseInt($('#saldoActual').val()) < 0) && this.value !== 7){
		alert('No hay saldo suficiente para la Sucursal elegida');
		$('#form_caja')[0].reset();
		//$(this).prop('selectedIndex',0);
		muestraSaldo($('#saldoActual').val());
		$('.sucursal').prop('selectedIndex',suc);
		//$('.obs').html('');
		
	}
});
$('#btnEnviar').bind('click', function(e){
	if(parseFloat($('#monto').val()) > parseFloat($('#saldoActual').val()) && parseInt($('.tipoCaja').val()) > 7){
		alert('El monto a pagar es mayor que el saldo');
		e.preventDefault();
	}
	if(parseInt($('#monto').val()) === 0){
		alert('El monto no puede ser igual a cero');
		e.preventDefault();
	}
});

$('#tablaServicios').bind('click','a',function(e){
	let evt = e.target, a = $(evt).closest('a');
	
	if(a.hasClass('anular')){
		e.preventDefault();
		let confirmacion = confirm('Está seguro que desea anular la Transacción?');
		if(confirmacion){
			a.html('<i class="fas fa-spinner fa-pulse fa-1x"></i>');
			$.ajax({
				data: {},
				url: a.attr('href'),
				method: 'GET',
				dataType: 'JSON',
				beforeSend: function () { a.addClass('disabled'); },
				success: function (data) {
					if (parseInt(data.status) === 200){
						tablaServ.ajax.reload();
					}else{
						a.removeClass('disabled');
						a.html('<i class="far fa-trash" aria-hidden="true"></i>');
					}
					muestraSaldo(data.saldo);
					//$('#rescta').val(formatMoneda(data.edocta));
					$('html, body').animate({ scrollTop: 0 }, 'fast');
					$('.resp').html(data.message);
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
				}
			});
		}
		return false;
	}
});