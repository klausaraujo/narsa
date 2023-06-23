let tablaTos = null;

jQuery(document).ready(function($){
	if(segmento2 == ''){
		tablaServ = $('#tablaTostado').DataTable({
			ajax:{
				url: base_url + 'tostado/lista',
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
					data: null, orderable: false,
					render: function(data){
						let hrefAnular = btnAnular ? 'href=#' : '';//+base_url+'servicios/anular?id='+data.idmovimiento+'&suc='+$('.sucursal').val()+'"';
						let hrefEdit = btnEdit ?  'href=#' : '';//+base_url+'servicios/editar?id='+data.idmovimiento+'&suc='+$('.sucursal').val()+'"' : '';
						let hrefPdf = btnPdf ? 'href=#' : '';//+base_url+'servicios/comprobante?id='+data.idmovimiento+'&suc='+$('.sucursal').val()+'"' : '';
						let btnAccion =
						'<div class="btn-group">'+
							'<a title="Editar Tostado" '+hrefEdit+' class="bg-warning btnTable editar '+(!btnEdit?'disabled':'')+'">'+
								'<i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>'+
							'<a title="Anular Proceso" '+hrefAnular+' class="bg-danger btnTable anular '+(!btnAnular?'disabled':'')+'">'+
								'<i class="fa fa-trash-o" aria-hidden="true"></i></a>'+
							'<a title="Emitir PDF" '+hrefPdf+' class="bg-primary btnTable '+(!btnPdf?'disabled':'')+'" target="_blank">'+
								'<i class="fa fa-file-pdf-o" aria-hidden="true"></i></a>'+
						'</div>';
						return btnAccion;
					}
				},
				{ data: 'idtipooperacion' },{ data: 'idtransaccion', render: function(data){ return ceros(data,6); } },{ data: 'sucursal' },{ data: 'tipo_operacion' },
				{ data: 'fecha_registro' },
			],
			columnDefs:headers,order: [],
		});
	}
});
$('.anio').bind('change', function(){
	tablaTos.ajax.reload();
});
$('.mes').bind('change', function(){
	tablaTos.ajax.reload();
});
$('.sucursal').bind('change', function(){
	tablaTos.ajax.reload();
});