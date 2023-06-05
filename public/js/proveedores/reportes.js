var tabla1 = null, table2 = null, tablaProv = null;

jQuery(document).ready(function($){
	$('html, body').animate({ scrollTop: 0 }, 'fast');
	
	if(segmento2 == 'reporte1' || segmento2 == 'reporte2' || segmento2 == 'reporte3'){
		tabla1 = $('#tablaReporte1').DataTable({
			ajax:{
				url: base_url + 'proveedores/tblreporte1',
				type: 'POST',
				data: function (d) {
					d.sucursal = $('.sucursal').val();
					d.anio = $('.anio').val();
					d.articulo = $('.articulo').val();
					d.productor = $('.productor').val();
					d.segmento = $('#segmento').val();
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language: lngDataTable,order: [],
			columns:[
				{ data: 'anio' },{ data: 'tipo_documento' },{ data: 'numero_documento'},{ data: 'productor' },{ data: 'guia', render: function(data){ return ceros( data, 6 ); } },
				{ data: 'fechaguia' },{ data: 'articulo' },{ data: 'cantidad' },{ data: 'costo' }
			],
			columnDefs:[
				{ title: 'A&ntilde;o', targets: 0 },{ title: 'Tipo Doc.', targets: 1 },{ title: 'Nro. Doc.', targets: 2 },{ title: 'Productor', targets: 3 },
				{ title: 'Nro. Gu&iacute;a', targets: 4 },{ title: 'Fecha', targets: 5 },{ title: 'Art&iacute;culo', targets: 6 },{ title: 'Cantidad', targets: 7 },
				{ title: 'Costo', targets: 8 },
			], dom: botones,
			buttons: {
				dom: { container: { tag: 'div', className: 'flexcontent' }, buttonLiner: { tag: null } },
				buttons: [
					{ extend: 'copy', className: 'rounded-pill' },
					{ extend: 'excel', className: 'rounded-pill' },
					{ extend: 'pdf', className: 'rounded-pill' },
					{ extend: 'print', className: 'rounded-pill' }
				]
			}
		});
	}else if(segmento2 == 'reporte4' || segmento2 == 'reporte5'){
		tabla2 = $('#tablaReporte2').DataTable({
			ajax:{
				url: base_url + 'proveedores/tblreporte1',
				type: 'POST',
				data: function (d) {
					d.sucursal = $('.sucursal').val();
					d.productor = $('.productor').val();
					d.segmento = $('#segmento').val();
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language: lngDataTable, order: [],
			columns:[
				{ data: 'tipo_documento' },{ data: 'numero_documento'},{ data: 'nombre' },{ data: 'zona' },{ data: 'celular' },{ data: 'monto' },
			],
			columnDefs:[
				{ title: 'Tipo Doc.', targets: 0 },{ title: 'Nro. Doc.', targets: 1 },{ title: 'Productor', targets: 3 },{ title: 'Zona', targets: 3 },
				{ title: 'Celular', targets: 4 },{ title: 'Monto', targets: 5 },
			], dom: botones,
			buttons: {
				dom: { container: { tag: 'div', className: 'flexcontent' }, buttonLiner: { tag: null } },
				buttons: [
					{ extend: 'copy', className: 'rounded-pill' },
					{ extend: 'excel', className: 'rounded-pill' },
					{ extend: 'pdf', className: 'rounded-pill' },
					{ extend: 'print', className: 'rounded-pill' }
				]
			}
		});
	}
	
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
});

$('#buscar').bind('click',function(e){
	let prod = $('#productor').val();
	$('#productor').val('');
	$('#tablaProveedores_processing').css('opacity',0);
	$('input[type="search"]').val(prod); tablaProv.search(prod).draw();
});
$('#tablaProveedores').on('dblclick','tr',function(){
	let data = tablaProv.row( this ).data();
	$('#productor').val(data[1]);
	$('#modalProveedores').modal('hide');
});
$('#generar').bind('click',function(e){
	let btn = $(this), tabla =null;
	if(segmento2 === 'reporte1' || segmento2 ==='reporte2' || segmento2 ==='reporte3') tabla = tabla1;
	if(segmento2 === 'reporte4' || segmento2 ==='reporte5') tabla = tabla2;
	
	btn.html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
	btn.addClass('disabled');
	
	tabla.ajax.reload(function(){
		btn.html('Generar Reporte');
		btn.removeClass('disabled');
	});
});