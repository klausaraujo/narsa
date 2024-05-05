let tabla;

$(document).ready(function (){
	if(segmento2 == ''){
		tabla = $('#tablaDashboard').DataTable({
			ajax:{
				url: base_url + 'dashboard/lista',
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language: lngDataTable,
			columns:[
				{ data: 'numero_documento' },{ data: 'nombre' },
				{ data: 'fecha', render: function(data){ return '<span class="text-danger">'+data+'</span>'; } },{ data: 'monto' },
			],
			columnDefs:[
				{title: 'DNI', targets: 0},{title: 'Raz&oacute;n Social', targets: 1},{title: 'Vencimiento', targets: 2},{title: 'Monto', targets: 3},
			], order: [],
		});
	}
});

/*$('.select').bind('change',function(){
	$.ajax({
		data: { idsucursal: $('#sucursal').val(), anio: $('#anio').val(), sucursal: $('#sucursal').find(':selected').text() },
		url: base_url + 'dashboard/dash',
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function (){ $('.spin1').html('<div class="spinner-border spinner-border-sm" role="status"></div>'); },
		success: function (data){
			let seriesChart = [], catChart = [], series = [], series1 = [], catChart1 = [];
			
			if(data.cobrar.monto) $('#cobrar').html(data.cobrar.monto);
			else $('#cobrar').html('0.00');
			if(data.pagar.monto) $('#pagar').html(data.pagar.monto);
			else $('#pagar').html('0.00');
			if(data.caja.saldo){
				let caja = parseFloat(data.caja.saldo);
				$('#caja').html(caja.toLocaleString('es-PE', opt));
			}else $('#caja').html('0.00');
			
			$.each(data.articulos,function(i,e){
				catChart.push(e.articulo);
				seriesChart.push(e.cantidad);
			});
			$.each(data.valorizados,function(i,e){
				catChart1.push(e.articulo);
				series.push(e.valorizado);
				series1.push(e.no_valorizado);
			});
			
			ApexCharts.exec('barChart', 'updateOptions', { xaxis: { categories: catChart, } }, false, true);
			ApexCharts.exec('barChart', 'updateSeries', [{ data: seriesChart }], true);
			ApexCharts.exec('valorChart', 'updateOptions', { xaxis: { categories: catChart1, } }, false, true);
			ApexCharts.exec('valorChart', 'updateSeries', [{ data: series }, { data: series1 }], true);
			
			//jQuery('.counter').counterUp({
			//	delay: 5,
			//	time: 500
			//});
			
			$('.spin1').html('');
		}
	});
});*/
