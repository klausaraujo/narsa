let tablaClientes, tablaVentas;

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
	}
});