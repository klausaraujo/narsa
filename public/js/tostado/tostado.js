let tablaTos = null;

jQuery(document).ready(function($){
	if(segmento2 == ''){
		tablaTos = $('#tablaTostado').DataTable({
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
						let hrefAnular = btnAnular ? 'href="#"' : '';//+base_url+'tostado/anular?id='+data.idtostado+'"' : '';
						let hrefEdit = btnEdit ?  'href="'+base_url+'tostado/editar?id='+data.idtostado+'"' : '';
						let hrefPdf = btnPdf ? 'href=#' : '';//+base_url+'servicios/comprobante?id='+data.idmovimiento+'&suc='+$('.sucursal').val()+'"' : '';
						let btnAccion =
						'<div class="btn-group">'+
							'<a title="Editar Tostado" '+hrefEdit+' class="bg-warning btnTable '+(!btnEdit?'disabled':'')+'">'+
								'<i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>'+
							'<a title="Anular Proceso" '+hrefAnular+' class="bg-danger btnTable anular '+(!btnAnular?'disabled':'')+'">'+
								'<i class="fa fa-trash-o" aria-hidden="true"></i></a>'+
							'<a title="Emitir PDF" '+hrefPdf+' class="bg-primary btnTable '+(!btnPdf?'disabled':'')+'" target="_blank">'+
								'<i class="fa fa-file-pdf-o" aria-hidden="true"></i></a>'+
						'</div>';
						return btnAccion;
					}
				},
				{ data: 'idtostado' },{ data: 'numero', render: function(data){ return ceros(data,6); } },{ data: 'fecha_registro' },{ data: 'sucursal' },{ data: 'nombre' },
				{ data: 'articulo' },
				{
					data: 'cantidad', className: 'text-right',
					render: function(data,type,row,meta){
						let number = 0; if(data && typeof parseFloat(data) === 'number' && data != ''){ number = parseFloat(data); } return number.toLocaleString('es-PE', opt);
					}
				},
			],
			columnDefs:headers,order: [],
		});
	}else if(segmento2 === 'nuevo' || segmento2 === 'editar'){
		tablaProv = $('#tablaProveedores').DataTable({
			processing: true,
			serverSide: true,
			ajax:{
				url: base_url + 'certificaciones/proveedores',
				type: 'GET',
				error: function(){
					$("#post_list_processing").css('display','none');
				}
			},
			columns:[
				{ data: 0 },{ data: 1 },{ data: 2, visible: false },{ data: 3, visible: false },
			],
			dom: '<"row"<"mx-auto"l><"mx-auto"f>>rtp',
			colReorder: { order: [ 4, 3, 2, 1, 0 ] }, language: lngDataTable,
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
$('#tablaProveedores').on('dblclick','tr',function(){
	let data = tablaProv.row( this ).data();
	$('#idproveedor').val(data[0]);
	$('#productor').val(data[1]);
	$('#productor1').val(data[1]);
	$('#modalProveedores').modal('hide');
});
$('body').bind('click','a',function(e){
	let el = e.target, a = $(el).closest('a');
	let fila = tablaTos.row($(a).parents('tr')).data();
	
	if(a.hasClass('anular')){
		e.preventDefault();
		let confirmacion = confirm('Está seguro que desea anular la Transacción?');
		
		if(confirmacion){
			a.html('<i class="fa fa-spinner fa-pulse fa-1x"></i>');
			$.ajax({
				data: {},
				url: base_url + 'tostado/anular?id=' + fila.idtostado,
				method: 'GET',
				dataType: 'JSON',
				beforeSend: function () { a.addClass('disabled'); },
				success: function (data) {
					if (parseInt(data.status) === 200){
						tablaTos.ajax.reload();
					}else{
						a.removeClass('disabled');
						a.html('<i class="fa fa-trash" aria-hidden="true"></i>');
					}
					$('html, body').animate({ scrollTop: 0 }, 'fast');
					$('.resp').html(data.message);
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
				}
			});
		}
	}
});