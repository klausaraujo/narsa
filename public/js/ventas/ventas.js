let tablaClientes, tablaVentas, tablaSalDetalle, medioPagoOpt = $('#medioPagoVta option');

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
							'<a title="Editar Cliente" '+hrefEditar+' class="bg-warning btnTable editar '+((data.activo === '0' || !btnEdit)?'disabled':'')+' ">'+
								'<i class="fas fa-pen-to-square" aria-hidden="true"></i></a>'+
							'<a title="Ventas Cliente" '+hrefVta+'class="bg-success btnTable '+((data.activo === '0' || !btnVta)?'disabled':'')+' acciones">'+
								'<i class="far fa-house" aria-hidden="true"></i></a>'+
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
		$('#form_pago_venta select').attr('disabled',true);
		$('#form_pago_venta input').attr('disabled',true);
		
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
						let btnAccion =
						'<div class="btn-group">'+
						/*'<a title="Editar Gu&iacute;a Ingreso" '+((data.activo === '1' || btnEdtGuia || data.anula === '1')?'href="'+base_url+'proveedores/ingresos/editar?id='+data.idguia+'"':'')+
							' class="bg-warning btnTable editarAjax '+((data.activo === '0' || !btnEdtGuia || data.anula === '0')?'disabled':'')+'" data-target="#modalEditIngresos" '+
							'data-toggle="modal"><i class="fas fa-pen-to-square" aria-hidden="true"></i></a>'+
						'<a title="Anular Gu&iacute;a Ingreso" '+((data.activo === '1' || btnAnulGuia || data.anula === '1')?'href="'+base_url+'proveedores/ingresos/anular?id='+data.idguia+
							'&op=ingresos"':'')+' class="bg-danger btnTable '+((data.activo === '0' || !btnAnulGuia || data.anula === '0')?'disabled':'')+' anular">'+
							'<i class="far fa-trash" aria-hidden="true"></i></a>'+
						'<a title="Ver Gu&iacute;a Ingreso" '+((data.activo === '1' || btnPdfGuia)?'href="'+base_url+'proveedores/ingresos/guia_ingreso?id='+data.idguia+
							'&op=guiaing"':'')+' class="bg-primary btnTable '+((data.activo === '0' || !btnPdfGuia)?'disabled':'')+' ver_guia_pdf" target="_blank" >'+
							'<i class="fas fa-file-pdf" aria-hidden="true"></i></a>'+
						'<a title="Ver Comprobante" '+((data.activo === '1' || btnCompGuia)?'href="'+base_url+'proveedores/ingresos/comprobante?id='+data.idguia+
							'&op=comp"':'')+' class="bg-success btnTable '+((data.activo === '0' || !btnCompGuia)?'disabled':'')+' ver_comp_pdf" target="_blank" >'+
							'<i class="fas fa-receipt" aria-hidden="true"></i></a>'+*/
						'</div>';
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
						return '<div class="btn-group"><a title="Eliminar Detalle" href="#" class="bg-warning btnTable eliminarSaldetalle">'+
								'<i class="far fa-trash mx-auto" aria-hidden="true"></i></a></div>';
					}
				},
				{ data: 'articulo' },
				{
					data: 'calidad', className: 'text-left',
					render: function(data){
						let number = 0; if(typeof parseFloat(data) === 'number' && data != ''){ number = parseFloat(data); } return number.toLocaleString('es-PE', opt);
					}
				},
				{
					data: 'humedad', className: 'text-left',
					render: function(data){
						let number = 0; if(typeof parseFloat(data) === 'number' && data != ''){ number = parseFloat(data); } return number.toLocaleString('es-PE', opt);
					}
				},
				{
					data: 'tasa', className: 'text-left',
					render: function(data){
						let number = 0; if(typeof parseFloat(data) === 'number' && data != ''){ number = parseFloat(data); } return number.toLocaleString('es-PE', opt);
					}
				},
				{ 
					data: 'cantidad', className: 'text-left',
					render: function(data){
						let number = 0; if(typeof parseFloat(data) === 'number' && data != ''){ number = parseFloat(data); } return number.toLocaleString('es-PE', opt);
					}
				},
				{
					data: 'costo', className: 'text-left',
					render: function(data){
						let number = 0; if(typeof parseFloat(data) === 'number' && data != ''){ number = parseFloat(data); } return number.toLocaleString('es-PE', opt);
					}
				},
			],
			columnDefs:[
				{ title: 'Acciones', targets: 0 },{ title: 'Producto', targets: 1 },{ title: 'Calidad (%)', targets: 2 },{ title: 'Humedad (%)', targets: 3 },
				{ title: 'Tasa', targets: 4 },{ title: 'Cantidad', targets: 5 },{ title: 'Precio', targets: 6 }
				
			],
			dom: '<"row"rt>', order: [],
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
			let obs = $('#obsSal').val(), suc = $('#sucursalSal').prop('selectedIndex'), art = false, formVta = $('#form_salidas').validate(), mto = 0;
			
			if(tablaSalDetalle.rows().count() === 0){
				$('#sucursalSal').attr('disabled','disabled');
				$('#form_pago_venta select').removeAttr('disabled');
				$('#form_pago_venta input').removeAttr('disabled');
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
			
			formVta.resetForm(), $('#form_salidas .error').removeClass('error'), $('#form_salidas .error').removeClass('success');
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
		let json = [], i = 0, formData = new FormData(document.getElementById('form_pago_venta')), strForm = '', check = 0;
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
					$('#generarSal').addClass('disabled');
					$('#cancelSal').addClass('disabled');
				},
				success: function (data) {
					//console.log(data);
					$('#generarSal').html('Generar Venta');
					$('#generarSal').removeClass('disabled');
					$('#cancelSal').removeClass('disabled');
					if(parseInt(data.status) === 200){
						$('#modalVentas').modal('hide');
						$('html, body').animate({ scrollTop: 0 }, 'fast');
						tablaVentas.ajax.reload();
						/* Muestra la guia para imprimir */
						//window.open(base_url + 'proveedores/ingresos/guia_ingreso?id='+data.guia+'&op=comp', '_blank');
						//$('#formPagoIngreso')[0].reset();
						//$('#formPagoIngreso select').prop('selectedIndex',0);
					}
					if(parseInt(data.status) === 100) alert(data.message);
					else{
						$('.resp').html(data.message);
						setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
					}
				}
			});
		}else{ alert('No hay registros en el detalle'); }
	}
});

$('#modalVentas').on('hidden.bs.modal',function(e){
	let formVta = $('#form_salidas').validate(), formPago = $('#form_pago_venta').validate();
	$('#medioPagoVta').html(medioPagoOpt), $('#medioPagoVta').prop('selectedIndex',0);
	formVta.resetForm(), formPago.resetForm();
	$('#form_salidas')[0].reset(), $('#form_pago_venta')[0].reset();
	
	$('#form_salidas select').prop('selectedIndex',0);
	$('#form_pago_venta select').prop('selectedIndex',0);
	$('#form_pago_venta select').attr('disabled',true);
	$('#form_pago_venta input').attr('disabled',true);
	
	tablaSalDetalle.clear().draw();
	$('#sucursalSal').removeAttr('disabled');
	$('#generarSal').html('Generar Venta');
	$('#generarSal').removeClass('disabled');
	$('#cancelSal').removeClass('disabled');
	
	$('body,html').animate({ scrollTop: 0 }, 'fast');
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
			$('#medioPagoVta').html(medioPagoOpt);
			$('#medioPagoVta').prop('selectedIndex',0);
			$('#form_salidas')[0].reset();
			$('#form_pago_venta')[0].reset();
			$('#sucursalSal').prop('selectedIndex',suc);
			$('#obsSal').val(obs);
			$('#sucursalSal').removeAttr('disabled');
			$('#form_pago_venta select').prop('selectedIndex',0);
			$('#form_pago_venta select').attr('disabled',true);
			$('#form_pago_venta input').attr('disabled',true);
			$('#baseImp').val(''), $('#base_imponible').val(''), $('#imp_igv').val(''), $('#igv').val('');
		}else{
			$('#medioPagoVta').html(medioPagoOpt);
			$('#medioPagoVta').prop('selectedIndex',0);
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