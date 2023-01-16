let tabla = null, tablaOp, tablaReg, tablaIngDetalle, tablaValDetalle, tablaVal, precioVal = 0 ;

function formateaNumero(value) {
  v = parseFloat(value)
  v = v.toFixed(2);
  return new Intl.NumberFormat('es-PE', { style: 'decimal' }).format(v);
}
function formatMoneda(v){
	let n = parseFloat(v).toFixed(2);
	n = (n).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return n;
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
						'<a title="Editar Proveedor" '+((data.activo === '1' || btnEdit)?'href="'+base_url+'proveedores/editar?id='+data.idproveedor+'"':'')+' class="bg-warning '+
							'btnTable '+((data.activo === '0' || !btnEdit)?'disabled':'')+' editar"><i class="fas fa-pen-to-square" aria-hidden="true"></i></a>'+
						'<a title="Movimientos Proveedor" '+((data.activo === '1' || btnMov)?'href="'+base_url+'proveedores/transacciones?id='+data.idproveedor+'&name='+data.nombre+'"':'')+
							'class="bg-success btnTable '+((data.activo === '0' || !btnMov)?'disabled':'')+' acciones"><i class="far fa-house" aria-hidden="true"></i></a>';
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
							case '0': var_status = '<span class="text-danger">Anulado</span>'; break;
						}
						return var_status;
					}
				},
			],
			columnDefs:headers, /*dom: botones, buttons:{dom:{container:{tag: 'div',className: 'flexcontent'},buttonLiner:{tag: null}},buttons:[
			'copy','csv','excel','pdf','print']},*/order: [],
		});
	}else if(segmento2 === 'transacciones'){
		/* Tabla de las Transacciones */
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
							(data.idtipooperacion !== '6')?
							'<a title="Anular Operaci&oacute;n" '+((data.activo === '1' || btnAnulaOp)?'href="'+base_url+'proveedores/transacciones/anular?id='+data.idtransaccion+
								'&op=operaciones"':'')+' class="bg-danger btnTable '+((data.activo === '0' || !btnAnulaOp)?'disabled':'')+' anular" data-anula="operaciones">'+
								'<i class="far fa-trash" aria-hidden="true"></i></a>':
							'<a title="Anular Operaci&oacute;n" '+((data.activo === '1' || btnAnulaOp)?'href="'+base_url+'proveedores/valorizaciones/anular?id='+data.idtransaccion+
								'&op=valorizop"':'')+' class="bg-danger btnTable '+((data.activo === '0' || !btnAnulaOp)?'disabled':'')+' anular" data-anula="operaciones">'+
								'<i class="far fa-trash" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{	data: 'idmovimiento', render: function(data){ return ceros( data, 6 ); }, },{ data: 'tipo_operacion' },{ data: 'sucursal' },{ data: 'nombre' },
				{ 
					data: 'monto',
					className: 'text-left',
					render: function(data,type,row,meta){ return isNaN(data)? '0.00' : formatMoneda(data); }
				},
				{ data: 'intereses', className: 'text-left', render: function(data,type,row,meta){ return isNaN(data)? '0.00' : formatMoneda(data); } },
				{
					data: 'monto_factor_final',
					className: 'text-left',
					render: function(data,type,row,meta){ let number = parseFloat(data); if(number < 0) number *= -1; return isNaN(number)? '0.00' : formatMoneda(number); }
				},
				/*{ data: 'fecha_movimiento', render: function(data){ let fecha = new Date(data), formato = fecha.toLocaleDateString(); return ceros( formato, 10 ); } },
				{ data: 'usuario' },
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
				},*/
			],
			columnDefs:headersOp, order: [],
		});
		/* Tabla de los Ingresos */
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
				/*{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },*/
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
						'<a title="Editar Gu&iacute;a Ingreso" '+((data.activo === '1' || btnEdtGuia || data.anula === '1')?'href="'+base_url+'proveedores/ingresos/editar?id='+data.idguia+'"':'')+
							' class="bg-warning btnTable editarAjax '+((data.activo === '0' || !btnEdtGuia || data.anula === '0')?'disabled':'')+'" data-target="#modalEditIngresos" '+
							'data-toggle="modal"><i class="fas fa-pen-to-square" aria-hidden="true"></i></a>'+
						'<a title="Anular Gu&iacute;a Ingreso" '+((data.activo === '1' || btnAnulGuia || data.anula === '1')?'href="'+base_url+'proveedores/ingresos/anular?id='+data.idguia+
							'&op=ingresos"':'')+' class="bg-danger btnTable '+((data.activo === '0' || !btnAnulGuia || data.anula === '0')?'disabled':'')+' anular" data-anula="ingresos" >'+
							'<i class="far fa-trash" aria-hidden="true"></i></a>'+
						'<a title="Ver Gu&iacute;a Ingreso" '+((data.activo === '1' || btnPdfGuia)?'href="'+base_url+'proveedores/ingresos/guia_ingreso?id='+data.idguia+
							'&op=guiaing"':'')+' class="bg-info btnTable '+((data.activo === '0' || !btnPdfGuia)?'disabled':'')+' ver_guia_pdf" target="_blank" >'+
							'<i class="fas fa-file-pdf" aria-hidden="true"></i></a>'+
						'<a title="Ver Comprobante" '+((data.activo === '1' || btnCompGuia)?'href="'+base_url+'proveedores/ingresos/comprobante?id='+data.idguia+
							'&op=comp"':'')+' class="bg-success btnTable '+((data.activo === '0' || !btnCompGuia)?'disabled':'')+' ver_comp_pdf" target="_blank" >'+
							'<i class="fas fa-receipt" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{ data: 'idguia' },{ data: 'anio_guia' },{ data: 'numero', render: function(data){ return ceros( data, 6 ); }, },
				{ data: 'fecha', render: function(data){ let fecha = new Date(data), formato = fecha.toLocaleDateString(); return formato; } },
				{ data: 'nombre' },{ data: 'sucursal' },
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
			columnDefs: headersIng,/* dom: botones, buttons:{dom:{container:{tag: 'div',className: 'flexcontent'},buttonLiner:{tag: null}},buttons:[
			'copy','csv','excel','pdf','print']},*/order: [],
		});
		/* Tabla Detalle de los Ingresos */
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
				{ data: 'articulo' },
				{
					data: 'cantidad',
					className: 'text-left',
					render: function(data,type,row,meta){ let number = parseFloat(data); number = number.toFixed(2); return isNaN(number)? '0.00' : number.toLocaleString('es-PE'); }
				},
				/*{ data: 'sucursal' },*/
				{
					data: 'humedad',
					className: 'text-left',
					render: function(data,type,row,meta){ let number = parseFloat(data); number = number.toFixed(2); return isNaN(number)? '0.00' : number.toLocaleString('es-PE'); }
				},
				{
					data: 'calidad',
					className: 'text-left',
					render: function(data,type,row,meta){ let number = parseFloat(data); number = number.toFixed(2); return isNaN(number)? '0.00' : number.toLocaleString('es-PE'); }
				},
				{ 
					data: 'cantidad_valorizada',
					className: 'text-left',
					render: function(data,type,row,meta){ let number = parseFloat(data); number = number.toFixed(2); return isNaN(number)? '0.00' : number.toLocaleString('es-PE'); }
				},
				{
					data: 'costo',
					className: 'text-left',
					render: function(data,type,row,meta){ let number = parseFloat(data); number = number.toFixed(2); return isNaN(number)? '0.00' : number.toLocaleString('es-PE'); }
				},
				{
					data: 'importe',
					className: 'text-left',
					render: function(data,type,row,meta){ let number = parseFloat(data); number = number.toFixed(2); return isNaN(number)? '0.00' : number.toLocaleString('es-PE'); }
				},
			],
			columnDefs:[
				{ title: 'Acciones', targets: 0 },{ title: 'Producto', targets: 1 },{ title: 'Cantidad Total KG', targets: 2 },/*{ title: 'Sucursal', targets: 3 },*/
				{ title: 'Humedad (%)', targets: 3 },{ title: 'Calidad (%)', targets: 4 },{ title: 'Cantidad Valorizada KG', targets: 5 },{ title: 'Precio', targets: 6 },
				{ title: 'Importe', targets: 7 }
			],
			dom: '<"row"rt>', order: [],
		});
		/* Tabla Detalle de las Valorizaciones */
		tablaValDetalle = $('#tablaValDetalle').DataTable({
			ajax:{
				url: base_url + 'proveedores/valorizaciones/listaDetalle',
				type: 'POST',
				data: function (d) {
					d.id = id,
					d.suc = $('#sucursalVal').val();
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, language:{ lngDataTable }, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']],
			columns:[
				{ data: 'idarticulo' },{ data: 'idguia' },{ data: 'anio_guia' },{ data: 'numero', render:function(data){ return ceros( data, 6 );} },{ data: 'articulo' },
				{
					data: 'cantidad',
					render: function(data){
						let number = parseFloat(data);
						number = number.toFixed(2);
						return isNaN(number)? 0 : number.toLocaleString('es-PE');
					}
				},
				{
					render: function(data,type,full,meta){
						return '<input type="checkbox"'+ (full.checked ? ' checked' : '') +' />';
					},
					orderable: false,
				},
				{
					render: function(data,type,full,meta){
						return '<input type="text" placeholder="0.00" class="form-control input-sm cantidad moneda" disabled />';
					},
					orderable: false,
				},
				{
					data: 'costo',
					render: function(data,type,full,meta){
						return '<input type="text" placeholder="0.00" id="costo" class="form-control input-sm costo moneda" value="'+data+'" disabled />';
					},
					orderable: false,
				},
				
			],
			columnDefs:[
				{ title: 'ID Articulo', targets: 0, visible: false },{ title: 'ID Gu&iacute;a', targets: 1, visible: false },{ title: 'A&ntilde;o Gu&iacute;a', targets: 2 },
				{ title: 'Nro. Gu&iacute;a', targets: 3 },{ title: 'Art&iacute;culo', targets: 4 },{ title: 'Saldo', targets: 5 },{ title: 'Valorizar', targets: 6 },
				{ title: 'Cantidad', targets: 7 },{ title: 'Costo', targets: 8 },
			],
			dom: '<"row"rt>', order: [],
		});
		/* Tabla de las Valorizaciones */
		tablaVal = $('#tablaValorizaciones').DataTable({
			ajax:{
				url: base_url + 'proveedores/valorizaciones/lista',
				type: 'POST',
				data: function (d) {
					d.id = id
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language:{ lngDataTable },
			columns:[
				/*{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },*/
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
						'<a title="Anular Valorizaciones" '+((data.activo === '1' || btnAnulValor)?'href="'+base_url+'proveedores/valorizaciones/anular?id='+data.idvalorizacion+
							'&op=valorizaciones"':'')+' class="bg-danger btnTable '+((data.activo === '0' || !btnAnulValor)?'disabled':'')+' anular" data-anula="valorizaciones" >'+
							'<i class="far fa-trash" aria-hidden="true"></i></a>'+
						'<a title="Ver Detalle Valorizaci&oacute;n" '+((data.activo === '1' || btnVerValor)?'href="'+base_url+'proveedores/valorizaciones/valoriz_pdf?id='+data.idvalorizacion+
							'&op=valorizdet"':'')+' class="bg-info btnTable '+((data.activo === '0' || !btnVerValor)?'disabled':'')+' ver_valoriz_pdf" target="_blank" >'+
							'<i class="fas fa-file-pdf" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{ data: 'idvalorizacion' },{ data: 'anio_valorizacion' },{ data: 'numero', render: function(data){ return ceros( data, 6 ); }, },
				{ data: 'fecha', render: function(data){ let fecha = new Date(data), formato = fecha.toLocaleDateString(); return formato; } },
				{ data: 'nombre' },{ data: 'sucursal' },
				{ 
					data: 'monto',
					className: 'text-left',
					render: function(data,type,row,meta){
						switch(row.activo){
							case '1': return isNaN(data)? '0.00' : formatMoneda(data); break;
							case '0': return '<span class="text-danger">'+isNaN(data)? '0.00' : formatMoneda(data)+'</span>'; break;
						}
					}
				},
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
			columnDefs: headersVal,/* dom: botones, buttons:{dom:{container:{tag: 'div',className: 'flexcontent'},buttonLiner:{tag: null}},buttons:[
			'copy','csv','excel','pdf','print']},*/order: [],
		});
	}
});

$('#modalIngresos').on('hidden.bs.modal',function(e){
	$('#form_ingresos')[0].reset();
	$('#form_ingresos select').prop('selectedIndex',0);
	$('#cantidadValoriz').attr('disabled','disabled');
	
	$('#formPagoIngreso')[0].reset();
	$('#formPagoIngreso select').prop('selectedIndex',0);
	$('#desembolso').attr('disabled',true);
	$('.pagoValoriz').attr('disabled',true);
	$('#chkPagoValoriz').attr('disabled',true);
	
	tablaIngDetalle.clear().draw();
	$('#sucursalIng').removeAttr('disabled');
	
	precioVal = 0;
	$('body,html').animate({ scrollTop: 0 }, 'fast');
	//setTimeout(function () { if(!$('.mesg').css('display') == 'none' || $('.mesg').css('opacity') == 1) $('.mesg').hide('slow'); }, 3000);
});

$('#modalValorizaciones').on('hidden.bs.modal',function(e){
	$('#form_valorizaciones')[0].reset();
	tablaValDetalle.clear().draw();
	$('#form_valorizaciones select').prop('selectedIndex',0);
	$('body,html').animate({ scrollTop: 0 }, 'fast');
});

$('#form_proveedor').validate({
	errorClass: 'form_error',
	rules: {
		//tipodoc: { required: function () { if ($('.tipodoc').css('display') != 'none') return true; else return false; } },
		doc: { required: function () { if ($('.tipodoc').css('display') != 'none') return true; else return false; }, minlength: 8 },
		//ruc: { required: function () { if ($('.ruc').css('display') != 'none') return true; else return false; }, minlength: 11 },
		nombres: { required: function () { if ($('.nombres').css('display') != 'none') return true; else return false; } },
		//direccion: { required: function () { if ($('.direccion').css('display') != 'none') return true; else return false; } },
		//zona: { required: function () { if ($('.zona').css('display') != 'none') return true; else return false; } },
	},
	messages: {
		//tipodoc: { required : '&nbsp;&nbsp;Campo Requerido' },
		doc: { required : '&nbsp;&nbsp;Documento Requerido', minlength: '&nbsp;&nbsp;Debe ingresar mínimo 8 caracteres' },
		//ruc: { required : '&nbsp;&nbsp;Campo Requerido', minlength: '&nbsp;&nbsp;Debe ingresar mínimo 11 caracteres' },
		nombres: { required : '&nbsp;&nbsp;Campo Requerido' },
		//direccion: { required : '&nbsp;&nbsp;Campo Requerido' },
		//zona: { required : '&nbsp;&nbsp;Campo Requerido' },
	},
	errorPlacement: function(error, element) {
		if(element.attr('name') === 'doc') $('#error-doc').html(error.html());
		if(element.attr('name') === 'nombres') $('#error-razon').html(error.html());
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
		tipoop: { required: function () { if ($('.tipoop').css('display') != 'none') return true; else return false; } },
		sucursal: { required: function () { if ($('.sucursal').css('display') != 'none') return true; else return false; } },
		monto: { required: function () { if ($('.monto').css('display') != 'none') return true; else return false; } },
		interes: { required: function () { if ($('.interes').css('display') != 'none') return true; else return false; } },
	},
	messages: {
		tipoop: { required: '&nbsp;&nbsp;Debe elegir una Transacci&oacute;n' },
		sucursal: { required: '&nbsp;&nbsp;Debe elegir la Sucursal' },
		monto: { required: '&nbsp;&nbsp;Monto Requerido' },
		interes: { required: '&nbsp;&nbsp;Inter&eacute;s Requerido' }
	},
	errorPlacement: function(error, element) {
		if (element.attr('name') == 'monto') {
			$('#monto-error').html(error.html());
		}else error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		event.preventDefault();
		let mayor = false; tipoop = $('#tipoop').val();
		var formData = new FormData(document.getElementById('form_transacciones'));
		formData.set('tipodetalle',$('#tipoop').find(':selected').text());
		//console.log(parseFloat($('#monto').val()));
		if(tipoop === '2'){
			let mto = $('#rescta').val(); mto = mto.replace(/\,/g,'');
			if(parseFloat($('#monto').val()) > parseFloat(mto)){
				alert('No se puede pagar un monto mayor a la deuda'); mayor = true; return false;
			} 
		}
		if(!mayor){
			$.ajax({
				data: new URLSearchParams(formData).toString(),
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
					if(!$('.interesAjax').css('display') == 'none' || $('.interesAjax').css('opacity') == 1) $('.interesAjax').hide();
					$('#form_transacciones')[0].reset();
					$('#form_transacciones button[type=submit]').html('Ejecutar');
					$('#form_transacciones button[type=submit]').removeClass('disabled');
					//console.log(data);
					if (parseInt(data.status) === 200) {
						//$('html, body').animate({ scrollTop: 0 }, 'fast');
						//let op = $('#tipoop :selected').val(), suc = $('#sucursal :selected').val(); mto = $('#monto').val();
						tablaOp.ajax.reload();
					}
					
					$('#rescta').val(formatMoneda(data.edocta));
					$('.resp').html(data.message);
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 1500);
				}
			});
		}
	}
});

$('#form_ingresos').validate({
	errorClass: 'form_error',
	rules: {
		proveedorIng: { required: true },
		sucursalIng: { required: true },
		articuloIng: { required: true },
		cantidadIng: { required: true },
		cantidadValoriz: { required: function(){ if($('#valorizaIng').prop('checked')) return true; else return false; } },
		costoValoriz: { required: function(){ if($('#valorizaIng').prop('checked')) return true; else return false; } },
	},
	messages: {
		proveedorIng: { required: '&nbsp;&nbsp;Campo Proveedor no puede estar Vac&iacute;o' },
		sucursalIng: { required: '&nbsp;&nbsp;Debe elegir la Sucursal' },
		articuloIng: { required: '&nbsp;&nbsp;Debe elegir un Art&iacute;culo' },
		cantidadIng: { required: '&nbsp;&nbsp;Cantidad Requerida' },
		cantidadValoriz: { required: '&nbsp;&nbsp;Cantidad a valorizar' },
		costoValoriz: { required: '&nbsp;&nbsp;Costo requerido' },
	},
	errorPlacement: function(error, element) {
		error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		event.preventDefault();
		let kg = $('#cantidadIng').val(), kgValor = isNaN($('#cantidadValoriz').val())? 0 : parseFloat($('#cantidadValoriz').val());
		let costoValor = isNaN($('#costoValoriz').val())? 0 : parseFloat($('#costoValoriz').val()), importe = (isNaN(kgValor) || isNaN(costoValor))? 0 : kgValor * costoValor;
		
		//console.log(parseFloat(costoValor) + "   " + parseFloat(kgValor));
		if(parseFloat(kgValor) == 0 && $('#valorizaIng').prop('checked') === true){ alert('Debe indicar la cantidad a Valorizar'); return false; }
		if(parseFloat(kg) < parseFloat(kgValor) && $('#valorizaIng').prop('checked') === true){ alert('La cantidad a valorizar no puede ser mayor que el monto'); return false; }
		if(parseFloat(costoValor) == 0 && $('#valorizaIng').prop('checked') === true){ alert('Debe indicar el costo'); return false; }
		
		if($('#valorizaIng').prop('checked') === true){
			precioVal += kgValor * costoValor;
			if($('#chkPagoValoriz').prop('checked')){
				$('#subTotalPago').val(precioVal.toFixed(2));
			}
		}
		
		let valor = false, ids = $('#sucursalIng').val();
		var json = [{ 'idarticulo':$('#articuloIng').val(),'articulo':$('#articuloIng :selected').text(),'cantidad':kg,'idsucursal':$('#sucursalIng').val(),
				'sucursal':$('#sucursalIng :selected').text(),'humedad':$('#humedadIng').val(),'calidad':$('#calidadIng').val(),'cantidad_valorizada':kgValor,
				'costo':$('#costoValoriz').val(),'chk_valorizar':($('#valorizaIng').prop('checked')? 1 : 0),'importe':importe,
		}];
		
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
		if(!valor){
			tablaIngDetalle.rows.add(json).draw();
			if(precioVal > 0){ if($('#chkPagoValoriz').attr('disabled'))$('#chkPagoValoriz').attr('disabled', false); }
		}
		
		$('#form_ingresos')[0].reset();
		$('#cantidadValoriz').attr('disabled','disabled');
		if(ids !== '')
			$('#sucursalIng option[value='+ids+']').attr('selected', true);
		//$('#form_ingresos select').prop('selectedIndex',0);
	}
});


$('body').bind('click','a',function(e){
	let el = e.target, a = $(el).closest('a'), row, anula = a.attr('data-anula');
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
						tablaReg.ajax.reload(); tablaOp.ajax.reload(); tablaVal.ajax.reload();
					}else{
						a.removeClass('disabled');
						a.html('<i class="far fa-trash" aria-hidden="true"></i>');
					}
					$('#rescta').val(formatMoneda(data.edocta));
					$('html, body').animate({ scrollTop: 0 }, 'fast');
					$('.resp').html(data.message);
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
				}
			});
		}
	}else if(a.hasClass('eliminarIngdetalle')){
		if(tablaIngDetalle.row(a).child.isShown()){
			let fila = tablaIngDetalle.row(a).data();
			precioVal -= fila.cantidad_valorizada * fila.costo;
			tablaIngDetalle.row(a).remove().draw();
		}else{
			let fila = tablaIngDetalle.row($(a).parents('tr')).data();
			precioVal -= fila.cantidad_valorizada * fila.costo;
			tablaIngDetalle.row($(a).parents('tr')).remove().draw();
		}
		if(precioVal === 0){
			$('#formPagoIngreso')[0].reset();
			$('#formPagoIngreso select').prop('selectedIndex',0);
			if(!$('#chkPagoValoriz').prop('checked')) $('#chkPagoValoriz').prop('checked', false);
			if(!$('#chkPagoValoriz').attr('disabled')) $('#chkPagoValoriz').attr('disabled', true);
		}else{ if($('#chkPagoValoriz').prop('checked')){ $('#subTotalPago').val(precioVal.toFixed(2)); } }
	}
});

$('#generarIng').bind('click',function(){
	//alert('Generar ingresos');
	//console.log(tablaIngDetalle.rows().data());
	if(tablaIngDetalle.rows().count() > 0){
		let json = [], i = 0;
		
		if($('#chkPagoValoriz').prop('checked') && $('#pagoValoriz').val() === '8' && (isNaN($('#desembolso').val()) || $('#desembolso').val() === '')){
			alert('Debe indicar el monto en el campo desembolso');
			return false;
		}
		if(parseFloat($('#desembolso').val()) > parseFloat($('#subTotalPago').val())){
			alert('El monto a pagar no debe ser mayor que el monto total');
			return false;
		}
		
		tablaIngDetalle.rows().data().each(function(row){
			json[i] = { 'idarticulo':row.idarticulo, 'idsucursal': row.idsucursal, 'cantidad': row.cantidad, 'idproveedor': $('#idproveedor').val(),
						'cantidad_valorizada': row.cantidad_valorizada, 'costo': row.costo, 'chk_valorizar': row.chk_valorizar, 'tipo_op': $('#pagoValoriz').val(),
						'chk_pago': ($('#chkPagoValoriz').prop('checked')? 1 : 0), 'subtotal': $('#subTotalPago').val(), 'desembolso': $('#desembolso').val(),'humedad': row.humedad,
						'calidad': row.calidad,'observacion':$('#obsIng').val(),
					};
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
				//console.log(data);
				$('#generarIng').html('Generar Ingreso');
				$('#generarIng').removeClass('disabled');
				$('#cancelIng').removeClass('disabled');
				precioVal = 0;
				if (parseInt(data.status) === 200){
					$('html, body').animate({ scrollTop: 0 }, 'fast');
					//if(tablaOp.rows().count() > 0)tablaOp.ajax.reload();
					tablaReg.ajax.reload(); tablaOp.ajax.reload(); tablaVal.ajax.reload();
					if(tablaReg.rows().count() === 0) tablaReg.clear().draw(); 
					if(tablaOp.rows().count() === 0) tablaOp.clear().draw();
					if(tablaVal.rows().count() === 0) tablaVal.clear().draw();
					$('#modalIngresos').modal('hide');
					$('#formPagoIngreso')[0].reset();
					$('#formPagoIngreso select').prop('selectedIndex',0);
					$('#desembolso').attr('disabled',true);
					$('.pagoValoriz').attr('disabled',true);
					$('.chkPagoValoriz').attr('disabled',true);
					if(!$('#chkPagoValoriz').prop('checked')) $('#chkPagoValoriz').prop('checked', false);
					if(!$('#chkPagoValoriz').attr('disabled')) $('#chkPagoValoriz').attr('disabled', true);
				}
				$('#rescta').val(formatMoneda(data.edocta));
				$('.resp').html(data.message);
				setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
			}
		});
	}else{ alert('No hay registros en el detalle'); }
});

$('#tablaValDetalle').bind('click','input',function(e){
	let evt = e.target, inputs = $(evt).closest('tr').find('input'), i = 0;
	//console.log(inputs);
	if($(evt).attr('type') === 'checkbox'){
		if($(evt).prop('checked') === true){
			$(evt).closest('tr').find('.moneda').removeAttr('disabled');
		}else
			$(evt).closest('tr').find('.moneda').attr('disabled','disabled');
	}
});
$('#tablaValDetalle').bind('keydown','input',function(e){
	let el = e.target;
	if($(el).attr('type') === 'text'){
		//console.log(el.value);
		return mascara(el,cpf);
	}
});

$('#guardaVal').bind('click',function(){
	let jsonDetalle = [], jsonTransaccion = [], i = 0, j = 0, guia = '', mto = 0, mult = 0, salta = true;
	if(! tablaValDetalle.rows().count() > 0) return false;
	
	$('#tablaValDetalle tbody input[type=checkbox]:checked').each(function(i, e){
		let data = tablaValDetalle.row($(e).parents('tr')).data();
		let inputCant = $(e).closest('tr').find('input.cantidad'), inputCosto = $(e).closest('tr').find('input.costo');
		if(inputCant.val() != '' && parseFloat(inputCant.val()) <= parseFloat(data.cantidad) && inputCosto.val() != ''){
			jsonDetalle[i] = { 'idproveedor':id, 'idsucursal': data.idsucursal, 'idguia': data.idguia, 'idarticulo': data.idarticulo, 'cantidad': inputCant.val(),
				'costo': inputCosto.val() };
			
			//console.log(json[i]);
			i++;
			salta = false;
		}else{
			if(inputCant.val() == ''){ alert('Cantidad requerida'); inputCant.focus() }
			else if(parseFloat(inputCant.val()) > parseFloat(data.cantidad)){ alert('La cantidad a valorizar no puede ser mayor que el saldo'); inputCant.focus(); }
			else if(inputCosto.val() == ''){ alert('El costo es Requerido'); inputCosto.focus(); }
			salta = true;
			return false;
		}
	});
	if(! salta){
		$.ajax({
			data: JSON.stringify(jsonDetalle),
			url: base_url + 'proveedores/valorizaciones/nuevo',
			method: 'POST',
			dataType: 'JSON',
			beforeSend: function () { 
				$('#guardaVal').html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
				$('#guardaVal').addClass('disabled');
				$('#cancelVal').addClass('disabled');
			},
			success: function (data) {
				console.log(data);
				$('#guardaVal').html('Valorizar Producto');
				$('#guardaVal').removeClass('disabled');
				$('#cancelVal').removeClass('disabled');
				if (parseInt(data.status) === 200){
					//if(tablaOp.rows().count() > 0)tablaOp.ajax.reload();
					//tablaReg.ajax.reload();
					tablaVal.ajax.reload();
					tablaReg.ajax.reload();
					tablaOp.ajax.reload();
					$('#modalValorizaciones').modal('hide');
					$('.resp').html(data.msg);
					setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
				}else{ alert(data.msg); }
				
				$('#rescta').val(formatMoneda(data.edocta));
			}
		});
	}
});

$('#sucursalVal').bind('change', function(){
	tablaValDetalle.ajax.reload();
});
$('#modalVal').bind('click', function(){
	tablaValDetalle.ajax.reload();
});
$('.tipoop').bind('change', function(){
	//tablaValDetalle.ajax.reload();
	if($('.tipoop').val() === '1' || $('.tipoop').val() === '7'){
		if($('.interesAjax').css('display') == 'none' || $('.interesAjax').css('opacity') == 0) $('.interesAjax').show();
	}else{
		if(!$('.interesAjax').css('display') == 'none' || $('.interesAjax').css('opacity') == 1) $('.interesAjax').hide();
	}
});
$('#valorizaIng').bind('click',function(e){
	if($(this).prop('checked'))
		$('#cantidadValoriz').attr('disabled',false);
	else $('#cantidadValoriz').attr('disabled',true);
});
$('#chkPagoValoriz').bind('click',function(e){
	if($(this).prop('checked')){
		$('#subTotalPago').val(precioVal.toFixed(2));
		$('.pagoValoriz').attr('disabled',false);
	}else{
		$('#formPagoIngreso')[0].reset();
		$('#formPagoIngreso select').prop('selectedIndex',0);
		$('#desembolso').attr('disabled',true);
		$('.pagoValoriz').attr('disabled',true);
	}
});
$('#pagoValoriz').bind('change',function(e){
	if($(this).val() === '8')
		$('#desembolso').attr('disabled',false);
	else $('#desembolso').attr('disabled',true);
});