let tabla;

$(document).ready(function (){
	if(segmento2 == ''){
		tabla = $('#tablaDashboard').DataTable({
			ajax:{
				url: base_url + 'proveedores/lista',
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language: lngDataTable,
			columns:[
				/*{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },*/
				{
					data: null,
					orderable: false,
					render: function(data){
						/*let hrefEditar = (data.activo === '1' || btnEdit)?'href="'+base_url+'proveedores/editar?id='+data.idproveedor+'"':'';
						let hrefMov = (data.activo === '1' || btnMov)?'href="'+base_url+'proveedores/transacciones?id='+data.idproveedor+'&name='+data.nombre+'"':'';
						let btnAccion =
						'<div class="btn-group">'+
							'<a title="Editar Proveedor" '+hrefEditar+' class="bg-warning btnTable editar '+((data.activo === '0' || !btnEdit)?'disabled':'')+' ">'+
								'<i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>'+
							'<a title="Movimientos Proveedor" '+hrefMov+'class="bg-success btnTable '+((data.activo === '0' || !btnMov)?'disabled':'')+' acciones">'+
								'<i class="fa fa-home" aria-hidden="true"></i></a>'+
						'</div>';
						return btnAccion;*/
						return '';
					}
				},
				{ data: 'idproveedor' },{ data: 'tipo_documento' },{ data: 'numero_documento' },{ data: 'RUC' },{ data: 'nombre' },{ data: 'domicilio' },{ data: 'zona' },
				{
					data: 'activo',
					render: function(data){
						let var_status = '';
						switch(data){
							case '1': var_status = '<span class="text-success">Activo</span>'; break;
							case '0': var_status = '<span class="text-danger">Anulado</span>'; break;
						}
						return var_status;
					}
				},
			],
			columnDefs:headers, /*dom: botones, buttons:{dom:{container:{tag: 'div',className: 'flexcontent'},buttonLiner:{tag: null}},buttons:[
			'copy','csv','excel','pdf','print']},*/order: [],
		});
	}
});

$('.select').bind('change',function(){
	$.ajax({
		data: { sucursal: $('#sucursal').val(), anio: $('#anio').val() },
		url: base_url + 'dashboard/dash',
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function (){ },
		success: function (data){
			let seriesChart = [], catChart = [];
			console.log(data);
			if(data.cobrar.monto) $('#cobrar').html(data.cobrar.monto);
			else $('#cobrar').html('0.00');
			if(data.pagar.monto) $('#pagar').html(data.pagar.monto);
			else $('#pagar').html('0.00');
			if(data.caja.saldo) $('#caja').html(data.caja.saldo);
			else $('#caja').html('0.00');
			
			$.each(data.articulos,function(i,e){
				catChart.push(e.articulo);
				seriesChart.push(e.cantidad);
			});
			console.log(seriesChart);
			console.log(catChart);
			ApexCharts.exec('barChart', 'updateOptions', {
				xaxis: {
					/*labels: {
					  show: false
					}*/
					categories: catChart,
				}
			}, false, true);
			ApexCharts.exec('barChart', 'updateSeries', [{
				data: seriesChart
			}], true);
			jQuery('.counter').counterUp({
				delay: 5,
				time: 500
			});
		}
	});
});
