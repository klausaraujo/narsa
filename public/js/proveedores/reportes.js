var tabla1 = null, tabla2 = null, tabla3 = null, tablaProv = null; tab1 = null; tab2 = null;

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
				/*{ data: 'anio' },{ data: 'tipo_documento' },*/
				{ data: 'nro_op', render: function(data){ return ceros( data, 6 ); } },{ data: 'numero_documento'},{ data: 'productor' },
				{ data: 'guia', render: function(data){ return ceros( data, 6 ); } },{ data: 'fecha' },{ data: 'articulo' },{ data: 'cantidad' },{ data: 'costo' }
			],
			columnDefs:[
				/*{ title: 'A&ntilde;o', targets: 0 },{ title: 'Tipo Doc.', targets: 1 },*/
				{ title: 'Nro.Op.', targets: 0 },{ title: 'Doc.', targets: 1 },{ title: 'Productor', targets: 2 },{ title: 'Nro. Gu&iacute;a', targets: 3 },
				{ title: 'Fecha Gu&iacute;a', targets: 4 },{ title: 'Art&iacute;culo', targets: 5 },{ title: 'Cantidad', targets: 6 },{ title: 'Costo', targets: 7 },
			]/*, dom: botones,
			buttons: {
				dom: { container: { tag: 'div', className: 'flexcontent' }, buttonLiner: { tag: null } },
				buttons: [
					{ extend: 'copy', className: 'rounded-pill' },
					{ extend: 'excel', className: 'rounded-pill' },
					{ extend: 'pdf', className: 'rounded-pill' },
					{ extend: 'print', className: 'rounded-pill' }
				]
			}*/
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
				{ data: 'tipo_documento'},{ data: 'numero_documento'},{ data: 'nombre' },{ data: 'sucursal' },{ data: 'zona' },
				{ data: 'monto' },
			],
			columnDefs:[
				{ title: 'Doc.', targets: 0 },{ title: 'Nro. Doc.', targets: 1 },{ title: 'Productor', targets: 2 },{ title: 'Sucursal', targets: 3 },{ title: 'Zona', targets: 4 },
				{ title: 'Monto', targets: 5 },
			]/*, dom: botones,
			buttons: {
				dom: { container: { tag: 'div', className: 'flexcontent' }, buttonLiner: { tag: null } },
				buttons: [
					{ extend: 'copy', className: 'rounded-pill' },
					{ extend: 'excel', className: 'rounded-pill' },
					{ extend: 'pdf', className: 'rounded-pill' },
					{ extend: 'print', className: 'rounded-pill' }
				]
			}*/
		});
	}else if(segmento2 == 'reporte6' || segmento2 == 'reporte7'){
		tabla3 = $('#tablaReporte3').DataTable({
			ajax:{
				url: base_url + 'proveedores/tblreporte1',
				type: 'POST',
				data: function (d) {
					d.sucursal = $('.sucursal').val();
					d.productor = $('.productor').val();
					d.segmento = $('#segmento').val();
					d.tipoop = $('#tipoop').val();
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language: lngDataTable,order: [],
			columns:[
				{ data: 'nro_op', render: function(data){ return ceros( data, 6 ); } },{ data: 'tipo_operacion'},{ data: 'sucursal' },{ data: 'nombre' },
				{ data: 'monto' },{ data: 'tasa' },{ data: 'fecha' }
			],
			columnDefs:[
				{ title: 'Nro.Op.', targets: 0 },{ title: 'Tipo Op.', targets: 1 },{ title: 'Sucursal', targets: 2 },{ title: 'Productor', targets: 3 },
				{ title: 'Monto', targets: 4 },{ title: 'Tasa', targets: 5 },{ title: 'Fecha Movimiento', targets: 6 },
			]
		});
	}
	if(segmento2 === 'reporte8'){
		tab1 = $('#tablaArticulos').DataTable({
			ajax:{
				url: base_url + 'proveedores/tabs',
				type: 'POST',
				data: function (d) {
					let div = $('#tablaArticulos').parents('.tab-pane');
					d.sucursal = div.find('.sucursal').val();
					d.desde = div.find('.desde').val();
					d.hasta = div.find('.hasta').val();
					d.articulo = div.find('.articulo').val();
					d.costo = div.find('.costo').val();
					d.tab = $('#hidearticulos').val();
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language: lngDataTable,order: [],
			columns:[
				{ data: 'numero', render: function(data){ return ceros( data, 6 ); } },{ data: 'numero_documento'},{ data: 'productor' },
				{ data: 'articulo' },{ data: 'fecha' },{ data: 'cantidad' },{ data: 'costo' }
			],
			columnDefs:[
				{ title: 'Nro. Op.', targets: 0 },{ title: 'Documento', targets: 1 },{ title: 'Productor', targets: 2 },
				{ title: 'Art&iacute;culo', targets: 3 },{ title: 'Fecha', targets: 4 },{ title: 'Cantidad', targets: 5 },{ title: 'Costo', targets: 6 }
			],
		});
		tab2 = $('#tablaValorizados').DataTable({
			ajax:{
				url: base_url + 'proveedores/tabs',
				type: 'POST',
				data: function (d) {
					let div = $('#tablaValorizados').parents('.tab-pane');
					d.sucursal = div.find('.sucursal').val();
					d.desde = div.find('.desde').val();
					d.hasta = div.find('.hasta').val();
					d.tab = $('#hidevalorizados').val();
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language: lngDataTable,order: [],
			columns:[
				{ data: 'numero' },{ data: 'sucursal' },{ data: 'tipo_documento'},{ data: 'numero_documento'},{ data: 'productor' },{ data: 'fecha' },
				{ data: 'cantidad' },{ data: 'costo' }
			],
			columnDefs:[
				{ title: 'Nro. Op.', targets: 0 },{ title: 'Sucursal', targets: 1 },{ title: 'Tipo Doc.', targets: 2 },{ title: 'Documento', targets: 3 },
				{ title: 'Productor', targets: 4 },{ title: 'Fecha', targets: 5 },{ title: 'Cantidad', targets: 6 },{ title: 'Costo', targets: 7 }
			],
		});
	}else{
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
				{ data: 0 },{ data: 1 },{ data: 2, visible: false },{ data: 3, visible: false },{ data: 4, visible: false }
			],
			dom: '<"row"<"mx-auto"l><"mx-auto"f>>rtp',
			colReorder: { order: [ 4, 3, 2, 1, 0 ] }, language: lngDataTable,
		});
	}
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
	if(segmento2 === 'reporte6' || segmento2 === 'reporte7') tabla = tabla3;
	
	btn.html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
	btn.addClass('disabled');
	
	tabla.ajax.reload(function(){
		btn.html('Generar Reporte');
		btn.removeClass('disabled');
	});
});
$('.exportar').bind('click', function(e){
	let data = {}, url = '', cta = 0;
	
	if(segmento2 === 'reporte1' || segmento2 === 'reporte2' || segmento2 === 'reporte3')
		url = 's='+$('#sucursal').val()+'&a='+$('#anio').val()+'&art='+$('#articulo').val()+'&prod='+$('#productor').val()+'&rep='+$('#reportename').val(), cta = 1;
	else if(segmento2 === 'reporte4' || segmento2 === 'reporte5' || segmento2 === 'reporte6' || segmento2 === 'reporte7')
		url = 's='+$('#sucursal').val()+'&prod='+$('#productor').val()+'&rep='+$('#reportename').val(), cta = 1;
	if(segmento2 === 'reporte7') url += '&tipo='+$('#tipoop').val();
	if(segmento2 === 'reporte8'){
		let div = $(this).parents('.tab-pane'), grilla = div.find('.table');
		cta = $("#"+grilla.prop('id')).dataTable().fnSettings().aoData.length;
		url = 'tab='+div.find('.hidden').val()+'&desde='+div.find('.desde').val()+'&hasta='+div.find('.hasta').val()+'&suc='+div.find('.sucursal').val()
				+'&articulo='+div.find('.articulo').val()+'&costo='+div.find('.costo').val();
	}
	if(cta > 0){
		if(this.id === 'pdf')
			$(this).attr('href', base_url + 'proveedores/reportes/pdf?' + url);
		else if(this.id === 'excel')
			$(this).attr('href', base_url + 'proveedores/reportes/excel?' + url);
	}else{
		e.preventDefault();
		alert('No hay registros disponibles para el Informe');
	}
	//$(this).attr('target','_blank');
	/*
	$.ajax({
		data: { data : JSON.stringify(data) },
		url: base_url + 'proveedores/reportes/pdf',
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function (){ },
		success: function (data){
			console.log(data);
		}
	});*/
});

$('.generar').bind('click',function(){
	let div = $(this).parents('.tab-pane'), grilla = div.find('.table'), tab = null, url = base_url;
	$(this).html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
	$(this).addClass('disabled'); let art = '', costo = '';
	if(grilla.prop('id') === 'tablaArticulos') tab = tab1, url += 'proveedores/costos', art = div.find('.articulo').val(), costo = div.find('.costo').val();
	if(grilla.prop('id') === 'tablaValorizados') tab = tab2;
	
	
	$.ajax({
		data:{ sucursal: div.find('.sucursal').val(),desde:div.find('.desde').val(),hasta:div.find('.hasta').val(),articulo:art,costo:costo },
		url: url,
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function (){ },
		success: function (data){
			div.find('.kg').html(data.total);
			div.find('.prom').html(data.promedio);
		}
	});
	
	tab.ajax.reload(()=>{
		$(this).html('Generar Reporte');
		$(this).removeClass('disabled');
	});
});