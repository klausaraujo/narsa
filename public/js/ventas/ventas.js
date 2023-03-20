let tablaClientes;

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
	}
});