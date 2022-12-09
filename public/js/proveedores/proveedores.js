let tabla = null, tablaOp, tablaReg, tablaIngDetalle;

function ceros( number, width ){
	width -= number.toString().length;
	if ( width > 0 ){
		return new Array( width + (/\./.test( number ) ? 2 : 1) ).join( '0' ) + number;
	}
	return number + ""; // siempre devuelve tipo cadena
}

$(document).ready(function (){
	if(segmento2 == ''){
		tabla = $('#tablaProveedores').DataTable({
			ajax:{
				url: base_url + 'proveedores/lista',
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language:{ lngDataTable },
			columns:[
				{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
						'<a title="Editar Proveedor" href="'+base_url+'proveedores/editar?id='+data.idproveedor+'" class="bg-warning btnTable editar">'+
							'<i class="fas fa-pen-to-square" aria-hidden="true"></i></a>'+
						'<a title="Movimientos Proveedor" href="'+base_url+'proveedores/transacciones?id='+data.idproveedor+'&name='+data.nombre+'" class="bg-success btnTable acciones">'+
							'<i class="far fa-house" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{ data: 'idproveedor' },{ data: 'tipo_documento' },{ data: 'numero_documento' },{ data: 'RUC' },{ data: 'nombre' },{ data: 'domicilio' },{ data: 'zona' },
				{
					data: 'activo',
					render: function(data){
						let var_status = '';
						switch(data){
							case '1': var_status = '<span class="text-success">Activo</span>'; break;
							case '0': var_status = '<span class="text-danger">Inactivo</span>'; break;
						}
						return var_status;
					}
				},
			],
			columnDefs:headers, dom: botones, buttons:{dom:{container:{tag: 'div',className: 'flexcontent'},buttonLiner:{tag: null}},buttons:[
			'copy','csv','excel','pdf','print']},order: [],
		});
	}else if(segmento2 === 'transacciones'){
		tablaOp = $('#tablaOp').DataTable({
			ajax:{
				url: base_url + 'proveedores/transacciones/lista',
				type: 'POST',
				data: function (d) {
					d.id = id
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language:{ lngDataTable },
			columns:[
				{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
							'<a title="Anular Transacci&oacute;n" '+(data.activo === '1'?'href="'+base_url+'proveedores/transacciones/anular?id='+data.idtransaccion+
							'&op=operaciones"':'')+' class="bg-danger btnTable '+(data.activo === '0'?'disabled':'')+' anular" data-anula="operaciones">'+
							'<i class="far fa-trash" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{	data: 'idmovimiento', render: function(data){ return ceros( data, 6 ); }, },{ data: 'tipo_operacion' },{ data: 'sucursal' },{ data: 'nombre' },
				{ 
					data: 'monto',
					className: 'text-left',
					render: function(data,type,row,meta){
						let number = parseFloat(data);
						switch(row.activo){
							case '1': return number.toLocaleString('es-PE'); break;
							case '0': return '<span class="text-danger">'+number.toLocaleString('es-VE')+'</span>'; break;
						}
					}
				},
				{ data: 'fecha_registro', render: function(data){ let fecha = new Date(data), formato = fecha.toLocaleDateString(); return ceros( formato, 10 ); } },
				{ data: 'usuario' },
				{
					data: 'activo',
					render: function(data){
						let var_status = '';
						switch(data){
							case '1': var_status = '<span class="text-success">Activo</span>'; break;
							case '0': var_status = '<span class="text-danger">Inactivo</span>'; break;
						}
						return var_status;
					}
				},
			],
			columnDefs:headersOp, order: [],
		});
		tablaReg = $('#tablaIngresos').DataTable({
			ajax:{
				url: base_url + 'proveedores/ingresos/lista',
				type: 'POST',
				data: function (d) {
					d.id = id
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language:{ lngDataTable },
			columns:[
				{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
						'<a title="Editar Ingreso" '+(data.activo === '1'?'href="'+base_url+'proveedores/ingresos/editar?id='+data.idguia+'"':'')+' class="bg-warning '+
							'btnTable editarAjax '+(data.activo === '0'?'disabled':'')+'" data-target="#modalEditIngresos" data-toggle="modal"><i class="fas '+
							'fa-pen-to-square" aria-hidden="true"></i></a>'+
						'<a title="Anular Ingreso" '+(data.activo === '1'?'href="'+base_url+'proveedores/transacciones/anular?id='+data.idguia+
							'&op=ingresos"':'')+' class="bg-danger btnTable '+(data.activo === '0'?'disabled':'')+' anular" data-anula="ingresos" >'+
							'<i class="far fa-trash" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{ data: 'idguia' },{ data: 'anio_guia' },{ data: 'numero', render: function(data){ return ceros( data, 6 ); }, },
				{ data: 'fecha', render: function(data){ let fecha = new Date(data), formato = fecha.toLocaleDateString(); return ceros( formato, 10 ); } },
				{ data: 'nombre' },{ data: 'sucursal' },
				{
					data: 'activo',
					render: function(data){
						let var_status = '';
						switch(data){
							case '1': var_status = '<span class="text-success">Activo</span>'; break;
							case '0': var_status = '<span class="text-danger">Inactivo</span>'; break;
						}
						return var_status;
					}
				},
			],
			columnDefs: headersIng, dom: botones, buttons:{dom:{container:{tag: 'div',className: 'flexcontent'},buttonLiner:{tag: null}},buttons:[
			'copy','csv','excel','pdf','print']},order: [],
		});
		tablaIngDetalle = $('#tablaIngDetalle').DataTable({
			data: [],
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, language:{ lngDataTable }, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']],
			columns:[
				{
					data: null,
					orderable: false,
					render: function(data){
						return '<a title="Eliminar Detalle" href="#" class="bg-warning btnTable eliminarIngdetalle"><i class="far fa-trash mx-auto" aria-hidden="true"></i></a>';
					}
				},
				{ data: 'articulo' },{ data: 'cantidad' },{ data: 'sucursal' },
				
			],
			columnDefs:[
				{ title: 'Acciones', targets: 0 },{ title: 'Producto', targets: 1 },{ title: 'Cantidad', targets: 2 },{ title: 'Sucursal', targets: 3 }
			],
			dom: '<"row"rt>', order: [],
		});
	}
});

$('#modalIngresos').on('hidden.bs.modal',function(e){
	$('#form_ingresos')[0].reset();
	tablaIngDetalle.clear().draw();
	$('#sucursalIng').removeAttr('disabled');
	$('#form_ingresos select').prop('selectedIndex',0);
	$('body,html').animate({ scrollTop: 0 }, 'fast');
	//setTimeout(function () { if(!$('.mesg').css('display') == 'none' || $('.mesg').css('opacity') == 1) $('.mesg').hide('slow'); }, 3000);
});

$('#form_proveedor').validate({
	errorClass: 'form_error',
	rules: {
		tipodoc: { required: function () { if ($('.tipodoc').css('display') != 'none') return true; else return false; } },
		doc: { required: function () { if ($('.doc').css('display') != 'none') return true; else return false; }, minlength: 8 },
		/*ruc: { required: function () { if ($('.ruc').css('display') != 'none') return true; else return false; }, minlength: 11 },*/
		nombres: { required: function () { if ($('.nombres').css('display') != 'none') return true; else return false; } },
		direccion: { required: function () { if ($('.direccion').css('display') != 'none') return true; else return false; } },
		zona: { required: function () { if ($('.zona').css('display') != 'none') return true; else return false; } },
	},
	messages: {
		tipodoc: { required : '&nbsp;&nbsp;Campo Requerido' },
		doc: { required : '&nbsp;&nbsp;Campo Requerido', minlength: '&nbsp;&nbsp;Debe ingresar mínimo 8 caracteres' },
		/*ruc: { required : '&nbsp;&nbsp;Campo Requerido', minlength: '&nbsp;&nbsp;Debe ingresar mínimo 11 caracteres' },*/
		nombres: { required : '&nbsp;&nbsp;Campo Requerido' },
		direccion: { required : '&nbsp;&nbsp;Campo Requerido' },
		zona: { required : '&nbsp;&nbsp;Campo Requerido' },
	},
	errorPlacement: function(error, element) {
		if (element.attr('name') == 'doc') {
			error.insertAfter('.btn_curl');
		}else error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		//alert('Enviando');
		$('#form_proveedor button[type=submit]').html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
		$('#form_proveedor button[type=submit]').addClass('disabled');
		btnCancelar.addClass('disabled');
		return true;
	}
});

$('#form_transacciones').validate({
	errorClass: 'form_error',
	rules: {
		tipoop: { required: true },
		sucursal: { required: true },
		monto: { required: true }
	},
	messages: {
		tipoop: { required: '&nbsp;&nbsp;Debe elegir una Transacci&oacute;n' },
		sucursal: { required: '&nbsp;&nbsp;Debe elegir la Sucursal' },
		monto: { required: '&nbsp;&nbsp;Monto Requerido' }
	},
	errorPlacement: function(error, element) {
		if (element.attr('name') == 'monto') {
			$('#monto-error').html(error.html());
		}else error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		event.preventDefault();
		$.ajax({
			data: $('#form_transacciones').serialize(),
			url: base_url + segmento + '/transacciones/operaciones',
			method: 'POST',
			dataType: 'JSON',
			beforeSend: function () {
				//$('.resp').html('<i class="fas fa-spinner fa-pulse fa-2x"></i>');
				$('#form_transacciones button[type=submit]').html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
				$('#form_transacciones button[type=submit]').addClass('disabled');
			},
			success: function (data) {
				//$('.resp').html('');
				$('#form_transacciones')[0].reset();
				$('#form_transacciones button[type=submit]').html('Ejecutar');
				$('#form_transacciones button[type=submit]').removeClass('disabled');
				//console.log(data);
				if (parseInt(data.status) === 200) {
					//$('html, body').animate({ scrollTop: 0 }, 'fast');
					//let op = $('#tipoop :selected').val(), suc = $('#sucursal :selected').val(); mto = $('#monto').val();
					tablaOp.ajax.reload();
					$('.resp').html(data.message);
					//tablaOp.rows.add(data.lista).draw();
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 1500);
					console.log(data);
				}else {
					$('.resp').html(data.message);
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 1500);
				}
			}
		});
	}
});

$('#form_ingresos').validate({
	errorClass: 'form_error',
	rules: {
		proveedorIng: { required: true },
		sucursalIng: { required: true },
		articuloIng: { required: true },
		cantidadIng: { required: true },
		guiaIng: { required: true },
	},
	messages: {
		proveedorIng: { required: '&nbsp;&nbsp;Campo Proveedor no puede estar Vac&iacute;o' },
		sucursalIng: { required: '&nbsp;&nbsp;Debe elegir la Sucursal' },
		articuloIng: { required: '&nbsp;&nbsp;Debe elegir un Art&iacute;culo' },
		cantidadIng: { required: '&nbsp;&nbsp;Monto Requerido' },
		guiaIng: { required: '&nbsp;&nbsp;Gu&iacute;a Requerida' },
	},
	errorPlacement: function(error, element) {
		error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		event.preventDefault();
		let valor = false, ids = $('#sucursalIng').val();
		var json = [{'idarticulo':$('#articuloIng').val(),'articulo':$('#articuloIng :selected').text(),'cantidad':$('#cantidadIng').val(),
				'idsucursal':$('#sucursalIng').val(),'sucursal':$('#sucursalIng :selected').text(),}];
		if(tablaIngDetalle.rows().count() === 0){
			$('#sucursalIng').attr('disabled','disabled');
			ids = $('#sucursalIng').val();
			//$('#sucursalIng option[value='+$('#articuloIng').val()+']').attr('selected', true);
		}else{
			tablaIngDetalle.rows().data().each(function (value){
				if(value['idarticulo'] == $('#articuloIng').val())
					valor = true;
			});
		}
		if(!valor) tablaIngDetalle.rows.add(json).draw();
		
		$('#form_ingresos')[0].reset();
		if(ids !== '')
			$('#sucursalIng option[value='+ids+']').attr('selected', true);
		//$('#form_ingresos select').prop('selectedIndex',0);
	}
});


$('body').bind('click','a',function(e){
	let el = e.target, a = $(el).closest('a'), row, anula = a.attr('data-anula');
	if(a.hasClass('anular')){
		e.preventDefault();
		if(anula === 'operaciones'){
			row = (tablaOp.row(a).child.isShown())? tablaOp.row(a).data() : tablaOp.row($(el).parents('tr')).data();;
		}else if(anula === 'ingresos'){
			row = (tablaReg.row(a).child.isShown())? tablaReg.row(a).data() : tablaReg.row($(el).parents('tr')).data();;
		}
		
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
						$('html, body').animate({ scrollTop: 0 }, 'fast');
						if(anula === 'operaciones') tablaOp.ajax.reload();
						else if(anula === 'ingresos') tablaReg.ajax.reload();
					}else{
						a.removeClass('disabled');
						a.html('<i class="far fa-trash" aria-hidden="true"></i>');
					}
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
					$('.resp').html(data.message);
				}
			});
		}
	}else if(a.hasClass('eliminarIngdetalle')){
		//alert('Eliminar');
		if(tablaIngDetalle.row(a).child.isShown()) tableDanio.row(a).remove().draw();
		else tablaIngDetalle.row($(a).parents("tr")).remove().draw();
	}else if(a.hasClass('eliminarIngdetalle')){
		e.preventDefault();
	}
});

$('#generarIng').bind('click',function(){
	//alert('Generar ingresos');
	//console.log(tablaIngDetalle.rows().data());
	if(tablaIngDetalle.rows().count() > 0){
		let json = [], i = 0;
		tablaIngDetalle.rows().data().each(function(row){
			json[i] = { 'idarticulo':row.idarticulo, 'idsucursal': row.idsucursal, 'cantidad': row.cantidad, 'idproveedor': $('#idproveedor').val() };
			i++;
		});
		//console.log(tablaIngDetalle.rows());
		$.ajax({
			data: JSON.stringify(json),
			url: base_url + 'proveedores/ingresos/nuevo',
			method: 'POST',
			dataType: 'JSON',
			beforeSend: function () { 
				$('#generarIng').html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
				$('#generarIng').addClass('disabled');
				$('#cancelIng').addClass('disabled');
			},
			success: function (data) {
				console.log(data);
				$('#generarIng').html('Generar Ingreso');
				$('#generarIng').removeClass('disabled');
				$('#cancelIng').removeClass('disabled');
				if (parseInt(data.status) === 200){
					$('html, body').animate({ scrollTop: 0 }, 'fast');
					//if(tablaOp.rows().count() > 0)tablaOp.ajax.reload();
					tablaReg.ajax.reload();
					$('#modalIngresos').modal('hide');	
				}
				$('.resp').html(data.message);
				setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
			}
		});
	}else{ alert('No hay registros en el detalle'); }
});

$('#form_valorizaciones').validate({
	errorClass: 'form_error',
});