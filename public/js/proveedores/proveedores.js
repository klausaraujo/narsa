let tabla = null, tablaOp, tabla2;

$(document).ready(function (){
	if(segmento2 == ''){
		tabla = $('#tablaProveedores').DataTable({
			ajax:{
				url: base_url + 'proveedores/lista',
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, 'Todas']], language:{ lngDataTable },
			columns:[
				{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
						'<a title="Editar Proveedor" href="'+base_url+'proveedores/editar?id='+data.idproveedor+'" class="bg-warning btnTable editar">'+
							'<i class="far fa-pencil" aria-hidden="true"></i></a>'+
						'<a title="Transacciones" href="'+base_url+'proveedores/transacciones?id='+data.idproveedor+'&name='+data.nombre+'" class="bg-success btnTable acciones">'+
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
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, 'Todas']], language:{ lngDataTable },
			columns:[
				{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
							'<a title="Anular Transacci&oacute;n" '+(data.activo === '1'?'href="'+base_url+segmento+'/'+segmento2+'/anular?id='+data.idtransaccion+
							'&op=operaciones"':'')+' class="bg-warning btnTable '+(data.activo === '0'?'disabled':'')+' anular"><i class="far fa-trash" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{ data: 'idmovimiento' },{ data: 'tipo_operacion' },{ data: 'sucursal' },{ data: 'nombre' },
				{ 
					data: 'monto',
					className: 'text-left',
					render: function(data){
						let number = parseFloat(data);
						return number.toLocaleString('es-VE');
					}
				},
				{ data: 'fecha_registro', render: function(data){ let fecha = new Date(data); return fecha.toLocaleDateString(); } },
				{ data: 'fecha_movimiento', render: function(data){ let fecha = new Date(data); return fecha.toLocaleDateString(); } },
				{ data: 'fecha_vencimiento', render: function(data){ let fecha = new Date(data); return fecha.toLocaleDateString(); } },
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
	}
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


$('body').bind('click','a',function(e){
	let el = e.target, a = $(el).closest('a');
	if(a.hasClass('anular')){
		e.preventDefault();
		let row = (tablaOp.row(a).child.isShown())? tablaOp.row(a).data() : tablaOp.row($(el).parents('tr')).data();
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
					//console.log(data);
					if (parseInt(data.status) === 200){
						$('.resp').html(data.message);
						tablaOp.ajax.reload();
						setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
					}else{
						a.removeClass('disabled');
						a.html('<i class="far fa-trash" aria-hidden="true"></i>');
						$('.resp').html(data.message);
						setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
					}
				}
			});
		}
	}
});

$('#form_valorizaciones').validate({
	errorClass: 'form_error',
});