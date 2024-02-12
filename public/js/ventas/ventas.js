let tablaClientes, tablaVentas, tablaSalDetalle, medioPagoOpt = $('#medioPagoVta option'), tablareporte = null;

$(document).ready(function (){
	if(segmento2 == ''){
		tabla = $('#tablaClientes').DataTable({
			ajax:{
				url: base_url + 'ventas/listaClientes',
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language: lngDataTable,
			columns:[
				/*{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },*/
				{
					data: null,
					orderable: false,
					render: function(data){
						let hrefEditar = (data.activo === '1' || btnEdit)?'href="'+base_url+'ventas/cliente/editar?id='+data.idcliente+'"':'';
						let hrefVta = (data.activo === '1' || btnVta)?'href="'+base_url+'ventas/ventascliente?id='+data.idcliente+'&name='+data.nombre+'"':'';
						let btnAccion =
						'<div class="btn-group">'+
							'<a title="Editar Cliente" '+hrefEditar+' class="bg-warning btnTable '+((data.activo === '0' || !btnEdit)?'disabled':'')+' ">'+
								'<i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>'+
							'<a title="Ventas Cliente" '+hrefVta+'class="bg-success btnTable '+((data.activo === '0' || !btnVta)?'disabled':'')+' acciones">'+
								'<i class="fa fa-home" aria-hidden="true"></i></a>'+
						'</div>';
						return btnAccion;
					}
				},
				{ data: 'idcliente' },{ data: 'tipo_documento' },{ data: 'numero_documento' },{ data: 'RUC' },{ data: 'nombre' },{ data: 'domicilio' },{ data: 'zona' },
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
	}else if(segmento2 === 'ventascliente'){
		/* Deshabilitar los campos del pago de las ventas */
		/*$('#form_pago_venta select').attr('disabled',true);
		$('#form_pago_venta input').attr('disabled',true);*/
		
		/* Tabla principal del modulo de operaciones con ventas */
		tablaVentas = $('#tablaVentas').DataTable({
			ajax:{
				url: base_url + 'ventas/salidas/lista',
				type: 'POST',
				data: function (d) {
					d.id = id
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']], language: lngDataTable,
			columns:[
				/*{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },*/
				{
					data: null,
					orderable: false,
					render: function(data){
						let liq = data.liquidado === '1'? true : false;
						let hrefEditar = (data.activo === '1' && btnEdit && !liq)?
							'href="'+base_url+'ventas/ventascliente/editar?id='+data.idtransaccion+'" data-target="#modalVentas" data-toggle="modal" ' : '';
						let hrefAnular = (data.activo === '1' && btnAnular && !liq)?'href="'+base_url+'ventas/ventascliente/anular?id='+data.idtransaccion+'"':'';
						/*let hrefPdf = (data.activo === '1' || btnGuia)?'href="'+base_url+'ventas/ventascliente/pdf?id='+data.idtransaccion+'&op=pdf"':'';*/
						let hrefPago = (data.activo === '1' && btnPago && !liq)? ' data-target="#modalPagoVentas" data-toggle="modal"':'';
						let hrefComp = (data.activo === '1' && btnComp)?'href="'+base_url+'ventas/ventascliente/pdf?id='+data.idtransaccion+'&op=comp"':'';
						let btnAccion =
						'<div class="btn-group">'+
							'<a title="Editar Venta" '+hrefEditar+' class="bg-warning btnTable editar '+((data.activo === '0' || !btnEdit || liq)?'disabled':'')+'">'+
								'<i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>'+
							'<a title="Anular Gu&iacute;a Salida" '+hrefAnular+' class="bg-danger btnTable anular '+((data.activo === '0' || !btnAnular || liq)?'disabled':'')+'">'+
								'<i class="fa fa-trash-o" aria-hidden="true"></i></a>'+
							/*'<a title="Ver Gu&iacute;a" '+hrefPdf+' class="bg-primary btnTable '+((data.activo === '0' || !btnGuia)?'disabled':'')+
								'" target="_blank"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a>'+*/
							'<a title="Pagar Cr&eacute;dito" '+hrefPago+' class="bg-primary btnTable pago '+((data.activo === '0' || !btnPago || liq)?'disabled':'')+
								'" target="_blank"><i style="font-size:12px" class="fa fa-credit-card-alt mt-1" aria-hidden="true"></i></a>'+
							'<a title="Ver Comprobante" '+hrefComp+' class="bg-success btnTable '+((data.activo === '0' || !btnComp)?'disabled':'')+
								'" target="_blank"><i class="fa fa-file-o" aria-hidden="true"></i></a>'+
						'</div>';
						return btnAccion;
					}
				},
				{ data: 'idmovimiento' }, { data: 'idtransaccion', render: function(data){ return ceros( data, 6 ); }, },{ data: 'tipo_operacion' },
				{ data: 'medio_pago' },{ data: 'sucursal' },{ data: 'nombre' },{ data: 'fecha' },
				{
					data: 'monto', className: 'text-right',
					render: function(data){
						let number = 0; if(data && typeof parseFloat(data) === 'number' && data != '') number = parseFloat(data); return number.toLocaleString('es-PE', opt);
					}
				},
				{
					data: 'activo',
					render: function(data,type,row){
						let var_status = '';
						
						switch(data){
							case '1': var_status = row.liquidado==='1'?'<span class="text-primary">Liquidado</span>':'<span class="text-success">Activo</span>'; break;
							case '0': var_status = '<span class="text-danger">Anulado</span>'; break;
						}
						return var_status;
					}
				},
			],
			columnDefs: headersSal,/* dom: botones, buttons:{dom:{container:{tag: 'div',className: 'flexcontent'},buttonLiner:{tag: null}},buttons:[
			'copy','csv','excel','pdf','print']},*/order: [],
		});
		/* Tabla del detalle de Salidas */
		tablaSalDetalle = $('#tablaSalDetalle').DataTable({
			data: [],
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, language: lngDataTable, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']],
			columns:[
				{
					data: null, orderable: false,
					render: function(data){
						return '<div class="btn-group"><a title="Eliminar Detalle" href="#" class="bg-danger btnTable eliminarSaldetalle">'+
								'<i class="fa fa-trash-o mx-auto" aria-hidden="true"></i></a></div>';
					}
				},
				{ data: 'articulo' },
				{
					data: 'calidad', className: 'text-left',
					render: function(data){
						let number = 0; if(data && typeof parseFloat(data) === 'number' && data != '') number = parseFloat(data); return number.toLocaleString('es-PE', opt);
					}
				},
				{
					data: 'humedad', className: 'text-left',
					render: function(data){
						let number = 0; if(data && typeof parseFloat(data) === 'number' && data != '') number = parseFloat(data); return number.toLocaleString('es-PE', opt);
					}
				},
				{
					data: 'tasa', className: 'text-left',
					render: function(data){
						let number = 0; if(data && typeof parseFloat(data) === 'number' && data != '') number = parseFloat(data); return number.toLocaleString('es-PE', opt);
					}
				},
				{ 
					data: 'cantidad', className: 'text-left',
					render: function(data){
						let number = 0; if(data && typeof parseFloat(data) === 'number' && data != '') number = parseFloat(data); return number.toLocaleString('es-PE', opt);
					}
				},
				{
					data: 'costo', className: 'text-left',
					render: function(data){
						let number = 0; if(data && typeof parseFloat(data) === 'number' && data != '') number = parseFloat(data); return number.toLocaleString('es-PE', opt);
					}
				},
			],
			columnDefs:[
				{ title: 'Acciones', targets: 0 },{ title: 'Producto', targets: 1 },{ title: 'Calidad (%)', targets: 2 },{ title: 'Humedad (%)', targets: 3 },
				{ title: 'Tasa', targets: 4 },{ title: 'Cantidad', targets: 5 },{ title: 'Precio', targets: 6 }
				
			],
			dom: '<"row"rt>', order: [],
		});
	}else if(segmento2 === 'reporteventas'){
		tablareporte = $('#tablareportesventas').DataTable({
			ajax:{
				url: base_url + 'ventas/listareporte',
				type: 'POST',
				data: function (d) {
					d.sucursal = $('.sucursal').val();
					d.desde = $('.desde').val();
					d.hasta = $('.hasta').val();
				}
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[10, 25, 50, 100, -1], [10, 25, 50, 100, 'Todas']],
			language: lngDataTable,order: [],
			columns:[
				{ data: 'idtransaccion', render: function(data){ return ceros( data, 6 ); } },{ data: 'tipo_operacion' },{ data: 'medio_pago' },
				{ data: 'numero_documento' },{ data: 'nombre' },{ data: 'fecha' },
				{ data: 'monto',className: 'text-right',render:function(data){ let number = parseFloat(data); return number.toLocaleString('es-PE', opt); } },
				{
					data: 'activo',
					render: function(data,type,row){
						let var_status = '';
						
						switch(data){
							case '1': var_status = row.liquidado === '1'?
									'<span class="text-primary">Liquidado</span>':'<span class="text-success">Activo</span>'; break;
							case '0': var_status = '<span class="text-danger">Anulado</span>'; break;
						}
						return var_status;
					}
				},
			],
			columnDefs:[
				{ title: 'Nro. Op.', targets: 0 },{ title: 'Tipo Op.', targets: 1 },{ title: 'Medio Pago', targets: 2 },{ title: 'Documento', targets: 3 },
				{ title: 'Cliente', targets: 4 },{ title: 'Fecha', targets: 5 },{ title: 'Monto', targets: 6 },{ title: 'Status', targets: 7 }
			],
		});
	}
});

$('#form_salidas').validate({
	errorClass: 'form_error',
	validClass: 'success',
	rules: {
		clienteSalida: { required: true },
		sucursalSal: { required: true },
		articuloSal: { required: true },
		//calidadSal: { required: true },
		//humedadSal: { required: function(){ if($('#valorizaIng').prop('checked')) return true; else return false; } },
		//humedadSal: { required: true },
		//tasaSal: { required: true },
		cantidadSal: { required: true },
		costoSal: { required: true },
	},
	messages: {
		clienteSalida: { required: '&nbsp;&nbsp;Campo Cliente no puede estar Vac&iacute;o' },
		sucursalSal: { required: '&nbsp;&nbsp;Debe elegir la Sucursal' },
		articuloSal: { required: '&nbsp;&nbsp;Debe elegir un Art&iacute;culo' },
		cantidadSal: { required: '&nbsp;&nbsp;Cantidad Requerida' },
		costoSal: { required: '&nbsp;&nbsp;Costo requerido' },
	},
	errorPlacement: function(error, element) {
		error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		event.preventDefault();
		if(parseInt($('#cantidadSal').val()) > 0 && parseInt($('#costoSal').val()) > 0){
			let obs = $('#obsSal').val(), suc = $('#sucursalSal').prop('selectedIndex'), art = false, mto = 0;
			
			if(tablaSalDetalle.rows().count() === 0){
				$('#sucursalSal').attr('disabled','disabled');
				//$('#form_pago_venta select').removeAttr('disabled');
				//$('#form_pago_venta input').removeAttr('disabled');
			}else{
				tablaSalDetalle.rows().data().each(function (value){
					if(value['idarticulo'] == $('#articuloSal').val())
						art = true;
				});
			}
			if(!art){
				var json = [{ 
						'articulo':$('#articuloSal :selected').text(),'calidad':$('#calidadSal').val(),'humedad':$('#humedadSal').val(),'tasa':$('#tasaSal').val(),
						'cantidad':$('#cantidadSal').val(),'costo':$('#costoSal').val(),'idarticulo':$('#articuloSal').val(),'idsucursal':$('#sucursalSal').val()
				}];
				tablaSalDetalle.rows.add(json).draw();
			}
			
			$('#form_salidas .form_error').removeClass('form_error'), $('#form_salidas .success').removeClass('success');
			$('#form_salidas')[0].reset();
			$('#sucursalSal').prop('selectedIndex',suc);
			$('#obsSal').val(obs);

			tablaSalDetalle.rows().data().each(function (value){
				mto += parseFloat(value['cantidad']) * parseFloat(value['costo']);
			});
			
			/* Mostrar la base imponible, el IGV y el monto total de la venta */
			if($('#checkigv').prop('checked')){
				if(mto > 0){
					let base = parseFloat(mto) / 1.18, imp = parseFloat(mto) - base; $('#igv').val(formatMoneda(imp)), $('#baseImp').val(formatMoneda(base));
					$('#totalvta').val(formatMoneda(mto)), $('#base_imponible').val(base), $('#imp_igv').val(imp), $('#total_vta').val(mto);
				}else{
					$('#base_imponible').val(0), $('#imp_igv').val(0), $('#totalvta').val(formatMoneda(0)), $('#baseImp').val(formatMoneda(0)), $('#igv').val(formatMoneda(0));
					$('#total_vta').val(0);
				}
			}else{
				$('#igv').val(''), $('#imp_igv').val(0), $('#total_vta').val(''), $('#base_imponible').val(mto), $('#baseImp').val(formatMoneda(mto));
				$('#totalvta').val(formatMoneda(mto)), $('#total_vta').val(mto);
			}
		}else{
			alert('La cantidad y el costo deben ser mayores a 0')
		}
	}
});
/* Formulario de pago */
$('#form_pago_venta').validate({
	errorClass: 'form_error',
	validClass: 'success',
	rules: {
		tipoPagoVta: { required: true },
		medioPagoVta: { required: true },
		tipoComp: { required: true },
		baseImp: { required: true },
		totalvta: { required: true },
	},
	messages: {
		tipoPagoVta: { required: '&nbsp;&nbsp;Debe seleccionar un tipo de pago' },
		medioPagoVta: { required: '&nbsp;&nbsp;Debe seleccionar un medio de pago' },
		tipoComp: { required: '&nbsp;&nbsp;Tipo de Comprobante Requerido' },
		baseImp: { required: '&nbsp;&nbsp;El campo base imponible no puede estar vacío' },
		totalvta: { required: '&nbsp;&nbsp;El campo total no puede estar vacío' },
	},
	errorPlacement: function(error, element) {
		error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		event.preventDefault();
		//console.log(tablaSalDetalle.rows().data());
		let json = [], i = 0, formData = new FormData(document.getElementById('form_pago_venta')), strForm = '', check = 0, venta = null;
		if($('#checkigv').prop('checked')) check = 1;
		
		formData.set('idcliente',id), formData.set('idsucursal', $('#sucursalSal').val()), formData.set('obs', $('#obsSal').val()), formData.set('check', check);
		strForm = JSON.stringify(Object.fromEntries(formData));
		/*objForm = objForm.replace('{','[{').replace('}','}]');*/
		
		tablaSalDetalle.rows().data().each(function(row){ json[i] = row; i++; });
		
		if(tablaSalDetalle.rows().count() > 0){
			$.ajax({
				data:{ data: JSON.stringify(json), pago: strForm },
				url: base_url + 'ventas/ventascliente/nuevo',
				method: 'POST',
				dataType: 'JSON',
				beforeSend: function () { 
					$('#generarSal').html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
					$('#generarSal').addClass('disabled'), $('#cancelSal').addClass('disabled');
				},
				success: function (data) {
					//console.log(data);
					$('#generarSal').html('Generar Venta'), $('#generarSal').removeClass('disabled'), $('#cancelSal').removeClass('disabled');
					if(parseInt(data.status) === 200){
						$('#modalVentas').modal('hide');
						$('html, body').animate({ scrollTop: 0 }, 'fast');
						tablaVentas.ajax.reload();
						/* Muestra la guia para imprimir */
						if(data.idtrans !== '0') window.open(base_url + 'ventas/ventascliente/pdf?id='+data.idtrans+'&op=comp', '_blank');
						//$('#formPagoIngreso')[0].reset();
						//$('#formPagoIngreso select').prop('selectedIndex',0);
					}
					if(parseInt(data.status) === 100) alert(data.message);
					else{
						$('.resp').html(data.message);
						setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
					}
					//console.log(data);
				}
			});
		}else{ alert('No hay registros en el detalle'); }
	}
});

$('#modalVentas').on('hidden.bs.modal',function(e){
	let resForm1 = $('#form_salidas').validate(), resForm2 = $('#form_pago_venta').validate();
	
	/* Devuelve el select a sus opciones principales */
	$('#medioPagoVta').html(medioPagoOpt), $('#medioPagoVta').prop('selectedIndex',0);
	/* Resetear formularios y validaciones */
	$('#form_salidas')[0].reset(), $('#form_pago_venta')[0].reset(), resForm1.resetForm(), resForm2.resetForm();
	$('#form_salidas .form_error').removeClass('form_error'), $('#form_salidas .success').removeClass('success');
	$('#form_pago_venta .form_error').removeClass('form_error'), $('#form_pago_venta .success').removeClass('success');
	
	$('#form_salidas select').prop('selectedIndex',0);
	$('#form_pago_venta select').prop('selectedIndex',0);
	/*$('#form_pago_venta select').attr('disabled',true);
	$('#form_pago_venta input').attr('disabled',true);*/
	
	tablaSalDetalle.clear().draw();
	$('#sucursalSal').removeAttr('disabled');
	$('#generarSal').html('Generar Venta');
	$('#generarSal').removeClass('disabled');
	$('#cancelSal').removeClass('disabled');
	$('#generarSal').html('Generar Venta');
	
	$('body,html').animate({ scrollTop: 0 }, 'fast');
});
$('#modalPagoVentas').on('hidden.bs.modal',function(e){
	$(this).find('.mediopagocredito').prop('selectedIndex',0);
	$(this).find('.montocredito').val('');
	$(this).find('.observaciones').val('');
});

$('#sucursalSal').on('change',function(){
	$('.detalleSal select').prop('selectedIndex',0);
	$('.detalleSal input').val('');
});
$('#articuloSal').on('change',function(){
	$('.prod').val('');
});

$('body').bind('click','a',function(e){
	let el = e.target, a = $(el).closest('a');
	if(a.hasClass('eliminarSaldetalle')){
		let fila = tablaSalDetalle.row($(a).parents('tr')).data(), mto = 0;
		tablaSalDetalle.row($(a).parents('tr')).remove().draw();
		if(tablaSalDetalle.rows().count() === 0){
			let obs = $('#obsSal').val(), suc = $('#sucursalSal').prop('selectedIndex');
			//$('#medioPagoVta').html(medioPagoOpt);
			//$('#medioPagoVta').prop('selectedIndex',0);
			//$('#form_salidas')[0].reset();
			//$('#form_pago_venta')[0].reset();
			//$('#sucursalSal').prop('selectedIndex',suc);
			$('#obsSal').val(obs);
			$('#sucursalSal').removeAttr('disabled');
			/*$('#form_pago_venta select').prop('selectedIndex',0);
			$('#form_pago_venta select').attr('disabled',true);
			$('#form_pago_venta input').attr('disabled',true);*/
			$('#baseImp').val(''), $('#base_imponible').val(''), $('#imp_igv').val(''), $('#igv').val(''),  $('#totalvta').val(''), $('#total_vta').val('');
		}else{
			//$('#medioPagoVta').html(medioPagoOpt);
			//$('#medioPagoVta').prop('selectedIndex',0);
			tablaSalDetalle.rows().data().each(function(value){
				mto += parseFloat(value['cantidad']) * parseFloat(value['costo']);
			});
			
			/* Mostrar la base imponible, el IGV y el monto total de la venta */
			if($('#checkigv').prop('checked')){
				if(mto > 0){
					let base = parseFloat(mto) / 1.18, imp = parseFloat(mto) - base; $('#igv').val(formatMoneda(imp)), $('#baseImp').val(formatMoneda(base));
					$('#totalvta').val(formatMoneda(mto)), $('#base_imponible').val(base), $('#imp_igv').val(imp), $('#total_vta').val(mto);
				}else{
					$('#base_imponible').val(0), $('#imp_igv').val(0), $('#totalvta').val(formatMoneda(0)), $('#baseImp').val(formatMoneda(0)), $('#igv').val(formatMoneda(0));
					$('#total_vta').val(0);
				}
			}else{
				$('#igv').val(''), $('#imp_igv').val(0), $('#total_vta').val(''), $('#base_imponible').val(mto), $('#baseImp').val(formatMoneda(mto));
				$('#totalvta').val(formatMoneda(mto)), $('#total_vta').val(mto);
			}
		}
	}else if(a.hasClass('editar')){
		$('#tipo_registro').val('editar');
		$.ajax({
			data: {},
			url: a.attr('href'),
			method: 'GET',
			dataType: 'JSON',
			beforeSend: function (){},
			success: function (data) {
				/*console.log(data);
				console.log(data.data.idtipooperacion);
				/*$('#form_pago_venta select').removeAttr('disabled');
				$('#form_pago_venta input').removeAttr('disabled');*/
				
				$('#obsSal').val(data.data.observaciones);				
				if(data.data.idtipooperacion === '2'){ $('#medioPagoVta').html('<option value="1">[N/A]</option>'); }
				
				$('#serie').val(data.data.serie_comprobante);
				$('#num').val(data.data.numero_comprobante);
				$('#baseImp').val(formatMoneda(data.data.base_imponible));
				
				$('#igv').val(formatMoneda(data.data.impuesto_igv));
				$('#totalvta').val(formatMoneda(data.data.monto));
				$('#base_imponible').val(data.data.base_imponible);
				$('#imp_igv').val(data.data.impuesto_igv);
				$('#total_vta').val(data.data.monto);
				
				if(parseFloat(data.data.impuesto_igv) > 0) $('#checkigv').prop('checked',true);
				
				$('#sucursalSal option[value='+data.data.idsucursal+']').prop('selected', true);
				$('#tipoPagoVta option[value='+data.data.idtipooperacion+']').prop('selected', true);
				$('#medioPagoVta option[value='+data.data.idmediopago+']').prop('selected', true);
				$('#tipoComp option[value='+data.data.tipo_comprobante+']').prop('selected', true);
				
				tablaSalDetalle.rows.add(data.articulos).draw();
				$('#guia_vta').val(data.data.idguia);
				$('#idtrans').val(data.data.idtransaccion);
				$('#idusuario').val(data.data.idusuario_registro);
				$('#fecha_reg').val(data.data.fecha_registro);
				$('#fecha_mov').val(data.data.fecha_movimiento);
				$('#status').val(data.data.activo);
				$('#generarSal').html('Editar Venta');
			}
		});
	}else if(a.hasClass('anular')){
		e.preventDefault();
		
		let confirmacion = confirm('Está seguro que desea anular la Venta?');
		if(confirmacion){
			a.html('<i class="fas fa-spinner fa-pulse fa-1x"></i>');
			$.ajax({
				data: {},
				url: a.attr('href'),
				method: 'GET',
				dataType: 'JSON',
				beforeSend: function () { a.addClass('disabled'); },
				success: function (data) {
					//console.log(data);
					if (parseInt(data.status) === 200){
						tablaVentas.ajax.reload();
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
	}else if(a.hasClass('pago')){
		let fila = tablaVentas.row($(a).parents('tr')).data(), mto = parseFloat(fila.monto);
		$('.idtransaccion').val(fila.idtransaccion), $('.montocredito').val(mto.toLocaleString('es-PE', opt)), $('.mtocredito').val(mto);
	}
});
/* Cambios en el tipo de venta */
$('#tipoPagoVta').bind('change', function(){
	let index = $(this).prop('selectedIndex');
	if($(this).prop('selectedIndex') === 1){
		$('#medioPagoVta').html('<option value="1">[N/A]</option>');
		//$('#medioPagoVta').attr('disabled', true);
	}else{
		$('#medioPagoVta').html(medioPagoOpt);
		$('#medioPagoVta').prop('selectedIndex',0);
		//$('#medioPagoVta').removeAttr('disabled');
	}
});
/* Check del IGV */
$('#checkigv').bind('click',function(e){
	let mto = 0;
	
	tablaSalDetalle.rows().data().each(function(value){
		mto += parseFloat(value['cantidad']) * parseFloat(value['costo']);
	});
	
	/* Mostrar la base imponible, el IGV y el monto total de la venta */
	if($('#checkigv').prop('checked')){
		if(mto > 0){
			let base = parseFloat(mto) / 1.18, imp = parseFloat(mto) - base; $('#igv').val(formatMoneda(imp)), $('#baseImp').val(formatMoneda(base));
			$('#totalvta').val(formatMoneda(mto)), $('#base_imponible').val(base), $('#imp_igv').val(imp), $('#total_vta').val(mto);
		}else{
			$('#base_imponible').val(0), $('#imp_igv').val(0), $('#totalvta').val(formatMoneda(0)), $('#baseImp').val(formatMoneda(0)), $('#igv').val(formatMoneda(0));
			$('#total_vta').val(0);
		}
	}else{
		$('#igv').val(''), $('#imp_igv').val(0), $('#total_vta').val(''), $('#base_imponible').val(mto), $('#baseImp').val(formatMoneda(mto));
		$('#totalvta').val(formatMoneda(mto)), $('#total_vta').val(mto);
	}
});
$('#form_cliente').validate({
	errorClass: 'form_error',
	validClass: 'success',
	rules: {
		tipodoc: { required: function (){ if ($('#tipodoc').css('display') != 'none') return true; else return false; } },
	},
	messages: {
		tipodoc: { required: '&nbsp;&nbsp;Tipo documento requerido' },
		doc: { required: '' }, ruc: { required: '' }, doc: { required: '' }, nombres: { required: '' }, direccion: { required: '' },
		dep: { required: '' }, pro: { required: '' }, dis: { required: '' }, zona: { required: '' },
	},
	errorPlacement: function(error, element) {
		if (element.attr('name') == 'tipodoc') error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		$('#btnEnviar').html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
		$('#btnEnviar').addClass('disabled');
		$('.btn-cancelar').addClass('disabled');
		form.submit();
	}
});

$('#modalVtas').on('click',function(){ $('#tipo_registro').val('registrar'); });

$('#generarpagocredito').bind('click',function(){
	let boton = $(this), mod = boton.closest('.modal-body'), mp = mod.find('.mediopagocredito').val(), mto = mod.find('.mtocredito').val();
	let id = mod.find('.idtransaccion').val(), obs = mod.find('.observaciones').val();
	boton.html('<i class="fa fa-spinner fa-pulse fa-1x"></i>');
	
	$.ajax({
		data: { idtransaccion:id, medio:mp, monto:mto, obs:obs },
		url: base_url + 'ventas/ventascliente/pago',
		method: 'POST',
		dataType: 'JSON',
		beforeSend: function () { boton.addClass('disabled'); },
		success: function (data) {
			console.log(data);
			boton.html('Pagar');
			boton.removeClass('disabled');
			$('#modalPagoVentas').modal('hide');
			if (parseInt(data.status) === 200) tablaVentas.ajax.reload();
			
			//$('html, body').animate({ scrollTop: 0 }, 'fast');
			$('.resp').html(data.message);
			setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
		}
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
	//let div = $(this).parents('.tab-pane'), grilla = div.find('.table'), tab = null, url = base_url+'proveedores/costos', art = '', costo = '', pane = '';
	$(this).html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
	$(this).addClass('disabled');
	
	tablareporte.ajax.reload(()=>{
		$(this).html('Generar Reporte');
		$(this).removeClass('disabled');
	});
});