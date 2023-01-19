let tablaServ = null;
jQuery(document).ready(function($){
	tablaServ = $('#tablaServicios').DataTable({
		ajax:{
			url: base_url + 'servicios/lista',
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
					let btnAccion =
					'<a title="Editar Operacion" href="#" class="bg-warning '+
						'btnTable editar"><i class="fas fa-pen-to-square" aria-hidden="true"></i></a>'+
					'<a title="Anular Operaci&oacute;n" href="#" '+
						'class="bg-danger btnTable acciones"><i class="far fa-trash" aria-hidden="true"></i></a>';
					return btnAccion;
				}
			},
			{ data: 'idtipooperacion' },{ data: 'tipo_operacion' },{ data: 'sucursal' },{ data: 'tipo_operacion' },
			{ data: 'monto', className: 'text-left', render: function(data,type,row,meta){ return isNaN(data)? '0.00' : formatMoneda(data); } },
			{ data: 'fecha_registro' },
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
});
$('.anio').bind('change', function(){
	tablaServ.ajax.reload();
});
$('.mes').bind('change', function(){
	tablaServ.ajax.reload();
});
$('.sucursal').bind('change', function(){
	tablaServ.ajax.reload();
});