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
						let btnAccion =
						'<a title="Editar Operacion" '+(btnEdit? 'href="'+base_url+'servicios/editar?id='+data.idmovimiento+'"':'')+' class="bg-warning '+
							'btnTable editar"><i class="fas fa-pen-to-square" aria-hidden="true"></i></a>'+
						'<a title="Anular Operaci&oacute;n"  '+(btnAnular? 'href="'+base_url+'servicios/anular?id='+data.idmovimiento+'"':'')+
							' class="bg-danger btnTable "><i class="far fa-trash" aria-hidden="true"></i></a>';
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
	tablaServ.ajax.reload();
	$.ajax({
		data: {'sucursal': $('#sucursal').val()},
		url: base_url + 'servicios/saldo',
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function (){ },
		success: function (data){
			//precioVal = data;
			muestraSaldo(data);
			//$('#rescta').val(formatMoneda(precioVal));
		}
	});
});