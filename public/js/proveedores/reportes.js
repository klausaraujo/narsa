var tabla1 = null;

jQuery(document).ready(function($){
	$('html, body').animate({ scrollTop: 0 }, 'fast');
	
	if(segmento2 == 'reporte1'){
		tabla1 = $('#tablaReporte1').DataTable({
			ajax:{
				url: base_url + 'proveedores/tblreporte1',
				type: 'POST',
				data: function (d) {
					d.sucursal = $('.sucursal').val();
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language: lngDataTable,
			columns:[
				{ data: 'idproveedor' },{ data: 'fecha' },{ data: 'numero', render: function(data){ return ceros( data, 6 ); } },{ data: 'sucursal' },
				{ data: 'proveedor' }
			],
			columnDefs:[
				{ title: 'ID', targets: 0 },{ title: 'Fecha', targets: 1 },{ title: 'Numero', targets: 2 },{ title: 'Sucursal', targets: 3 },{ title: 'Proveedor', targets: 4 },
			],order: [],
		});
	}
});