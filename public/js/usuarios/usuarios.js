let tablaUser = null;

$(document).ready(function (){
	if(segmento2 == ''){
		tablaUser = $('#tablaUsuarios').DataTable({
			ajax: {
				url: base_url + 'usuarios/lista',
			},
			bAutoWidth:false, bDestroy:true, responsive:true, select:false, lengthMenu:[[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, 'Todas']], language:{ lngDataTable },
			columns:[
				{ data: null, orderable: false, className: 'pl-3', render: function(data){ return ''; } },
				{
					data: null,
					orderable: false,
					render: function(data){
						let btnAccion =
						/* Boton de edicion */
						'<a title="Editar Usuario" '+((data.activo === '1' || btnEditUser)?'href="'+base_url+'usuarios/editar?id='+data.idusuario+'"':'')+
							' class="bg-warning btnTable '+((data.activo === '0' || !btnEditUser)?'disabled':'')+' editar"><i class="fas fa-pen-to-square" aria-hidden="true"></i></a>'+
						/* Boton de Asignar Sucursales */
						'<a title="Asignar Sucursales" '+((data.activo === '1' || btnSucur)?'href="'+base_url+'usuarios/sucursales?id='+data.idusuario+'"':'')+
							' class="bg-narsa btnTable '+((data.activo === '0' || !btnSucur)?'disabled':'')+' sucursales" data-target="#modalSucursales" data-toggle="modal">'+
							'<i class="far fa-building-shield" aria-hidden="true"></i></a>'+
						/* Boton de permisos */
						'<a title="Permisos" '+((data.activo === '1' || btnPermisos)?'href="'+base_url+'usuarios/permisos?id='+data.idusuario+'"':'')+
							' class="bg-secondary btnTable '+((data.activo === '0' || !btnPermisos)?'disabled':'')+' permisos" data-target="#modalPermisos" data-toggle="modal">'+
							'<i class="far fa-cog" aria-hidden="true"></i></a>'+
						/* Boton de Reset Clave */
						'<a title="Resetear Clave" '+((data.activo === '1' || btnClave)?'href="'+base_url+'usuarios/reset?id='+data.idusuario+'&doc='+data.numero_documento+'"':'')+
							' class="bg-info btnTable '+((data.activo === '0' || !btnClave)?'disabled':'')+' resetclave"><i class="far fa-key" aria-hidden="true"></i></a>'+
						/* Boton de activacion */
						'<a title="'+(data.activo === '0'?'Habilitar Usuario':'Deshabilitar Usuario')+'" '+((data.activo === '1' || btnActiva)?'href="'+base_url+'usuarios/habilitar?id='+data.idusuario+
							'&stat='+data.activo+'"':'')+' class="bg-light btnTable '+(data.activo === '1'? 'btnDesactivar':'btnActivar')+' '+(!btnActiva?'disabled':'')+' activar" >'+
							'<i class="far '+(data.activo === '1'? 'fa-unlock-keyhole':'fa-lock')+'" aria-hidden="true"></i></a>';
						return btnAccion;
					}
				},
				{ data: 'idusuario' },
				{ data: 'tipo_documento' },
				{ data: 'numero_documento' },
				{ 
					data: 'avatar',
					createdCell: function(td,cellData,rowData,row,col){
						$(td).addClass('p-1');
					},
					render: function(data){
						return '<img src="'+base_url+'public/images/perfil/'+data+'" style="display:block;margin:auto;width:40px" class="img img-fluid" >';
					}
				},
				{ data: 'apellidos' },
				{ data: 'nombres' },
				{ data: 'usuario' },
				{ 
					data: 'idperfil',
					render: function(data){
						let var_perfil = '';
						switch(data){
							case '1': var_perfil = 'ADMINISTRADOR'; break;
							case '2': var_perfil = 'EST&Aacute;NDAR'; break;
						}
						return var_perfil;
					}
				},
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
			columnDefs:headers,/* dom: botones, buttons:{dom:{container:{tag: 'div',className: 'flexcontent'},buttonLiner:{tag: null}},buttons:[
			'copy','csv','excel','pdf','print']},*/ order: [],
		});
	}
});

$('#modalPermisos').on('hidden.bs.modal',function(e){
	$('#form_permisos')[0].reset();
	$('#form_permisos input:checkbox').prop('checked',false);
	//$(' input[type=checkbox]')
	/*tablaIngDetalle.clear().draw();
	$('#sucursalIng').removeAttr('disabled');
	$('#form_ingresos select').prop('selectedIndex',0);*/
	$(this).find('.nav-tabs a:first').tab('show');
	$('body,html').animate({ scrollTop: 0 }, 'fast');
	//setTimeout(function () { if(!$('.mesg').css('display') == 'none' || $('.mesg').css('opacity') == 1) $('.mesg').hide('slow'); }, 3000);
});
$('#modalSucursales').on('hidden.bs.modal',function(e){
	$('#form_sucursales')[0].reset();
	$('#form_sucursales input:checkbox').prop('checked',false);
	$('body,html').animate({ scrollTop: 0 }, 'fast');
});

$('#tablaUsuarios').bind('click','a',function(e){
	let el = e.target, a = $(el).closest('a'), mensaje = '';
	let data = (tablaUser.row(a).child.isShown())? tablaUser.row(a).data() : tablaUser.row($(el).parents('tr')).data();
	
	if($(a).hasClass('activar')){
		e.preventDefault();
		//console.log(data.activo);
		mensaje = data.activo === '1'? 'Est?? seguro que desea deshabilitar el Usuario?' : 'Est?? seguro que desea habilitar el Usuario?';
		let confirmacion = confirm(mensaje);
		if(confirmacion){
			a.addClass('disabled');
			a.html('<i class="fas fa-spinner fa-pulse fa-1x"></i>');
			$.ajax({
				data: {},
				url: $(a).attr('href'),
				method: 'GET',
				dataType: 'JSON',
				error: function(xhr){ a.removeClass('disabled'); a.html('<i class="far fa-lock" aria-hidden="true"></i>'); },
				beforeSend: function(){},
				success: function(data){
					//console.log(data);
					if(parseInt(data.status) === 200){
						tablaUser.ajax.reload();
						//tablaUser.clear();
						//tablaUser.rows.add(data.lista).draw();
						alert(data.msg);
					}else{
						alert(data.msg);
						a.removeClass('disabled');
						a.html('<i class="far far fa-lock" aria-hidden="true"></i>');
					}
				}
			});
		}
	}else if($(a).hasClass('resetclave')){
		e.preventDefault();
		let confirmacion = confirm('Deseas resetear la clave del usuario?');
		if(confirmacion){
			a.addClass('disabled');
			a.html('<i class="fas fa-spinner fa-pulse fa-1x"></i>');
			$.ajax({
				url: $(a).attr('href'),
				type: 'GET',
				dataType: 'JSON',
				data: {},
				error: function(xhr){ a.removeClass('disabled'); a.html('<i class="far fa-key" aria-hidden="true"></i>'); },
				beforeSend: function(){},
				success: function(data){
					a.removeClass('disabled');
					a.html('<i class="far far fa-key" aria-hidden="true"></i>');
					if(parseInt(data.status) === 200) alert('Se resete?? la clave del usuario exitosamente');
					else alert('No se pudo resetear la clave del usuario');
				}
			});
		}
	}else if($(a).hasClass('permisos')){
		e.preventDefault();
		$.ajax({
			url: $(a).attr('href'),
			type: 'GET',
			dataType: 'JSON',
			data: {},
			error: function(xhr){ /*a.removeClass('disabled'); a.html('<i class="far fa-cog" aria-hidden="true"></i>');*/ },
			//beforeSend: function(){},
			success: function(data){
				//a.removeClass('disabled');
				//a.html('<i class="far far fa-cog" aria-hidden="true"></i>');
				$('#idusuarioPer').val(data.idusuario);
				/*if(parseInt(data.status) === 200) alert('Se resete?? la clave del usuario exitosamente');
				else alert('No se pudo resetear la clave del usuario');*/
				//console.log(data);
				$.each(data.data,function(i,e){
					//console.log(e);
					$('#form_permisos input:checkbox').each(function(){
						if($(this).attr('name') === 'proveedoresPer[]' && e.idpermiso === $(this).val()){
							$(this).prop('checked',true);
						}else if($(this).attr('name') === 'usuariosPer[]' && e.idpermiso === $(this).val()){
							$(this).prop('checked',true);
						}
					});
				});
			}
		});
	}else if($(a).hasClass('sucursales')){
		e.preventDefault();
		$.ajax({
			url: $(a).attr('href'),
			type: 'GET',
			dataType: 'JSON',
			data: {},
			error: function(xhr){ /*a.removeClass('disabled'); a.html('<i class="far fa-cog" aria-hidden="true"></i>');*/ },
			//beforeSend: function(){},
			success: function(data){
				$('#idusuarioSuc').val(data.idusuario);
				//console.log(data);
				$.each(data.data,function(i,e){
					$('#form_sucursales input:checkbox').each(function(){
						if($(this).attr('name') === 'usuariosSuc[]' && e.idsucursal === $(this).val()){
							$(this).prop('checked',true);
						}
					});
				});
			}
		});
	}
});

$('#form_usuarios').validate({
	errorClass: 'form_error',
	rules: {
		tipodoc: { required: function () { if ($('.tipodoc').css('display') != 'none') return true; else return false; } },
		doc: { required: function () { if ($('.doc').css('display') != 'none') return true; else return false; }, minlength: 8, },
		apellidos: { required: function () { if ($('.apellidos').css('display') != 'none') return true; else return false; } },
		nombres: { required: function () { if ($('.nombres').css('display') != 'none') return true; else return false; } },
		usuario: { required: function () { if ($('.usuario').css('display') != 'none') return true; else return false; } },
		perfil: { required: function () { if ($('.perfil').css('display') != 'none') return true; else return false; } },
	},
	messages: {
		tipodoc: { required : '&nbsp;&nbsp;Campo Requerido' },
		doc: { required : '&nbsp;&nbsp;Campo Requerido', minlength: '&nbsp;&nbsp;Debe ingresar m??nimo 8 caracteres' },
		apellidos: { required : '&nbsp;&nbsp;Campo Requerido' },
		nombres: { required : '&nbsp;&nbsp;Campo Requerido' },
		usuario: { required : '&nbsp;&nbsp;Campo Requerido' },
		perfil: { required : '&nbsp;&nbsp;Campo Requerido' },
	},
	errorPlacement: function(error, element) {
		if (element.attr('name') == 'doc'){
			$('.error_curl').html(error.html());
			//error.insertAfter('.btn_curl');
		}else error.insertAfter(element);
	},
	submitHandler: function (form, event) {
		//alert('Enviando');
		$('#formPassword button[type=submit]').html('<span class="spinner-border spinner-border-sm"></span>&nbsp;&nbsp;Cargando...');
		$('#formPassword button[type=submit]').addClass('disabled');
		return true;
	}
});

$('#asignarPer').bind('click', function(e){
	e.preventDefault();
	$.ajax({
		data: $('#form_permisos').serialize(),
		url: base_url + 'usuarios/permisos/asignar',
		method: 'POST',
		dataType: 'JSON',
		error: function(xhr){},
		beforeSend: function(){},
		success: function(data){
			//console.log(data);
			//$('#mdalPermisos').modal('hide');
			$('.resp').html(data.msg);
			setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
		}
	}); 
});

$('#asignarSuc').bind('click', function(e){
	e.preventDefault();
	$.ajax({
		data: $('#form_sucursales').serialize(),
		url: base_url + 'usuarios/sucursales/asignar',
		method: 'POST',
		dataType: 'JSON',
		error: function(xhr){},
		beforeSend: function(){},
		success: function(data){
			//console.log(data);
			//$('#mdalPermisos').modal('hide');
			$('.resp').html(data.msg);
			setTimeout(function () { $('.resp').html('&nbsp;'); }, 2500);
		}
	}); 
});