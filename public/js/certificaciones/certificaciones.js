let tablaCert = null, tablaProv = null;

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
							data.idtipooperacion === '13') nulable = 1;*/
						let hrefEdit = btnEdit && data.activo ?  'href="'+base_url+'certificaciones/editar?id='+data.idcertificado+'"' : '';
						let hrefParam = btnParam && data.activo ?  'href="'+base_url+'certificaciones/parametros?id='+data.idcertificado+'"' : '';
						let hrefAnular = btnAnular && data.activo ? 'href="'+base_url+'servicios/anular?id='+data.idcertificado+'"' : '';
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
	}else if(segmento2 === 'nuevo'){
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
			//$(boton).addClass('disabled');
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