let tablaCert = null, tablaProv = null, tablaCat = null, tablaCatSelec = null;

jQuery(document).ready(function($){
	if(segmento2 == ''){
		tablaCert = $('#tablaCertificaciones').DataTable({
			ajax:{
				url: base_url + 'certificaciones/lista',
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
						/*let nulable = 1; if(data.idtipooperacion === '7' || data.idtipooperacion === '9' || data.idtipooperacion === '11' || data.idtipooperacion === '12' ||
							data.idtipooperacion === '13') nulable = 1;*///Anular
						let hrefEdit = btnEdit && data.activo ?  'href="'+base_url+'certificaciones/editar?id='+data.idcertificado+'"' : '';
						let hrefParam = btnParam && data.activo ?  'href="'+base_url+'certificaciones/parametros?id='+data.idcertificado+'"' : '';
						let hrefAnular = btnAnular && data.activo ? 'href="'+base_url+'certificaciones/anular?id='+data.idcertificado+'"' : '';
						let hrefPdf = btnPdf && data.activo ?  'href="'+base_url+'certificaciones/comp_pdf?id='+data.idcertificado+'"' : '';
						let btnAccion =
						'<a title="Editar Certificado" '+hrefEdit+' class="bg-warning btnTable editar '+(!btnEdit || !data.activo?'disabled':'')+'">'+
							'<i class="fas fa-pen-to-square" aria-hidden="true"></i></a>'+
						'<a title="Asignar Parámetros" '+hrefParam+' class="bg-success btnTable param '+(!btnParam || !data.activo?'disabled':'')+'">'+
							'<i class="far fa-house" aria-hidden="true"></i></a>'+
						'<a title="Anular Certificado" '+hrefAnular+' class="bg-danger btnTable anular '+(!btnAnular || !data.activo?'disabled':'')+'">'+
							'<i class="far fa-trash" aria-hidden="true"></i></a>'+
						'<a title="Ver Certificado" '+hrefPdf+' class="bg-info btnTable '+(!btnAnular || !data.activo?'disabled':'')+'" target="_blank">'+
							'<i class="fas fa-file-pdf" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{ data: 'idcertificado' },{ data: 'anio_certificado' },{ data: 'numero', render: function(data){ return ceros( data, 6 ); } },{ data: 'nombre' },
				{ data: 'sucursal' },{ data: 'fecha_registro' },
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
					$("#post_list_processing").css("display","none");
				}
			},
			dom: '<"row"<"mx-auto"l><"mx-auto"f>>rtp',
			colReorder: { order: [ 4, 3, 2, 1, 0 ] }, language:{ lngDataTable },
		});
	}else if(segmento2 === 'parametros'){
		tablaCatSelec = $('#tablaCatadores').DataTable({
			processing: true,
			serverSide: true,
			ajax:{
				url: base_url + 'certificaciones/parametros/listacatadores',
				type: 'GET',
				error: function(){
					$("#post_list_processing").css("display","none");
				}
			},
			columns:[
				{ data: 0, visible: false },{ data: 1 },				
				{
					data: 2,
					render: function(data,type,row,meta){
						return row[2] + ' ' + row[3];
					}
				},
				{ data: 3, visible: false }
			],
			dom: '<"row"<"mx-auto"l><"mx-auto"f>>rtp',
			colReorder: { order: [ 4, 3, 2, 1, 0 ] }, language:{ lngDataTable },
		});
		tablaCat = $('#tablaSeleccionCatadores').DataTable({
			data: [],
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language:{ lngDataTable },
			columns:[
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
						'<a title="Remover Catador" href="#" class="bg-danger btnTable remover"><i class="far fa-trash" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{ data: 'idcatador', visible: false },{ data: 'documento' },{ data: 'nombres' },
			],
			columnDefs:[{ title: 'Acciones', targets: 0 },{ title: 'ID', targets: 1 },{ title: 'Documento', targets: 2 },{ title: 'Nombres', targets: 3 }],
			order: [],
		});
		tablaCat.rows.add(catadores).draw();
	}
});
$('.anio').bind('change', function(){
	tablaCert.ajax.reload();
});
$('.mes').bind('change', function(){
	tablaCert.ajax.reload();
});
$('.sucursal').bind('change', function(){
	let suc = $('.sucursal').prop('selectedIndex');
	if(!$('#form_certificaciones').length)tablaCert.ajax.reload();
	
	//if($('#form_caja').length)$('#form_caja')[0].reset();
	/*$.ajax({
		data: {'sucursal': $('.sucursal').val()},
		url: base_url + 'servicios/saldo',
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function (){ },
		success: function (data){
			if($('#form_certificaciones').length){
				$('#form_certificaciones')[0].reset();
				$('.sucursal').prop('selectedIndex',suc);
			}else muestraSaldo(data);
		}
	});*/
});

$('#tablaCertificaciones').bind('click','a',function(e){
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
						tablaCert.ajax.reload();
					}else{
						a.removeClass('disabled');
						a.html('<i class="far fa-trash" aria-hidden="true"></i>');
					}
					
					$('html, body').animate({ scrollTop: 0 }, 'fast');
					$('.resp').html(data.message);
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
				}
			});
		}
		return false;
	}
});

$('#buscar').bind('click',function(e){
	let prod = $('#productor').val();
	$('#idproveedor').val('');
	$('#productor').val('');
	$('#tablaProveedores_processing').css('opacity',0);
	$('input[type="search"]').val(prod); tablaProv.search(prod).draw();
});
$('#modalProveedores').on('hidden.bs.modal',function(e){
	//$('input[type="search"]').val('');
	//tablaProv.ajax.reload();
	//console.log($('input[type="search"]').select());
});
$('#tablaProveedores').on('dblclick','tr',function(){
	let data = tablaProv.row( this ).data();
	$('#idproveedor').val(data[0]);
	$('#productor').val(data[1]);
	$('#modalProveedores').modal('hide');
});
$('#tablaCatadores').on('dblclick','tr',function(){
	let data = tablaCatSelec.row( this ).data(), row = [], esta = false;
	//console.log(data);
	if(tablaCat.rows().count() > 0){
		if(tablaCat.rows().count() < 3){
			tablaCat.rows().data().each(function (value){
				//console.log(value);
				if(value['idcatador'] === data[0]){
					alert('El Catador ya fue agregado al detalle');
					esta = true;
				}
			});
			if(!esta){
				row = [{'idcatador': data[0], 'documento': data[1], 'nombres': data[2]+' '+data[2]}];
				tablaCat.rows.add(row).draw();
			}
		}else{ alert('Deben agregarse máximo 3 Catadores'); }
	}else{
		row = [{'idcatador': data[0], 'documento': data[1], 'nombres': data[2]+' '+data[2]}];
		tablaCat.rows.add(row).draw();
	}
	$('#modalCatadores').modal('hide');
});
$('#tablaSeleccionCatadores').on('click','a', function(){
	if($(this).hasClass('remover')){ tablaCat.row($(this).parents("tr")).remove().draw(); }
});

$('#modalProveedores').on('show.bs.modal',function(e){});
/*
$('form').validate({
	rules: {
		sucursalCert: { required: function () { if ($('.sucursalCert').css('display') != 'none') return true; else return false; } },
	},
	messages: {
		sucursalCert: { required: '' },
	},
	submitHandler: function (form, event) {
		let boton = $(this).find('button');
		$(boton).html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
		$(boton).addClass('disabled');
		return true;
	}
});*/
$('.form').on('submit',function(e){
	e.preventDefault();
	let boton = $(this).find('button'), f = e.target;
	
	$.ajax({
		data: $(f).serialize(),
		url: $(f).attr('action'),
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function () { 
			$(boton).html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
			$(boton).addClass('disabled');
		},
		success: function (data) {
			console.log(data);
			$(boton).html('Guardar Par&aacute;metro');
			$(boton).removeClass('disabled');
			$('html, body').animate({ scrollTop: 0 }, 'fast');
			$('.resp').html(data.message);
			setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
		}
	});
});
$('#guardaCatadores').bind('click', function(){
	let boton = this, json = [], i = 0, id = $('#idcertificado').val();
	
	if(tablaCat.rows().count() > 0){
		tablaCat.rows().data().each(function(value){
			json[i] = {'idcertificado': id, 'idcatador': value['idcatador'], 'activo': 1};
			i++;
		});
	}
	$.ajax({
		data: JSON.stringify(json),
		url: base_url + 'certificaciones/parametros/catadores',
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function () { 
			$(boton).html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
			$(boton).addClass('disabled');
		},
		success: function (data) {
			console.log(data);
			$(boton).html('Guardar Catador');
			$(boton).removeClass('disabled');
			$('html, body').animate({ scrollTop: 0 }, 'fast');
			$('.resp').html(data.message);
			setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
		}
	});
});

$('#malla_gen').on('change', function(){
	$('#malla16').val(''), $('#malla15').val(''), $('#malla14').val(''), $('#mallabase').val(''), $('#grtotmalla').val('');
	$('#mallaporc').val(''), $('#malla15porc').val(''), $('#malla14porc').val(''), $('#mallabaseporc').val(''), $('#portotmalla').val('');
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