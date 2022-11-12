		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="<?=base_url()?>/public/js/jquery.min.js"></script>
		<script src="<?=base_url()?>/public/js/popper.min.js"></script>
		<script src="<?=base_url()?>/public/js/bootstrap.min.js"></script>
		  <!-- Appear JavaScript -->
		  <!--<script src="js/jquery.appear.js"></script>
		  <!-- Countdown JavaScript -->
		  <!--<script src="js/countdown.min.js"></script>
		<!-- Counterup JavaScript -->
		<script src="<?=base_url()?>/public/js/waypoints.min.js"></script>
		<script src="<?=base_url()?>/public/js/jquery.counterup.min.js"></script>
		<!-- Wow JavaScript -->
		<script src="<?=base_url()?>/public/js/wow.min.js"></script>
		<!-- Apexcharts JavaScript -->
		<script src="<?=base_url()?>/public/js/apexcharts.js"></script>
		  <!-- Slick JavaScript -->
		<script src="<?=base_url()?>/public/js/slick.min.js"></script>
		<!-- Select2 JavaScript -->
		<script src="<?=base_url()?>/public/js/select2.min.js"></script>
		  <!-- Owl Carousel JavaScript -->
		  <!--<script src="js/owl.carousel.min.js"></script>
		<!-- Magnific Popup JavaScript -->
		<script src="<?=base_url()?>/public/js/jquery.magnific-popup.min.js"></script>
		<!-- Smooth Scrollbar JavaScript -->
		<script src="<?=base_url()?>/public/js/smooth-scrollbar.js"></script>
		  <!-- lottie JavaScript -->
		  <!--<script src="js/lottie.js"></script>
		<!-- am core JavaScript -->
		<script src="<?=base_url()?>/public/js/core.js"></script>
		  <!-- am charts JavaScript -->
		  <!--<script src="js/charts.js"></script>
		  <!-- am animated JavaScript -->
		  <!--<script src="js/animated.js"></script>
		  <!-- am kelly JavaScript -->
		  <!--<script src="js/kelly.js"></script>
		  <!-- Flatpicker Js -->
		  <!--<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
		<!-- Chart Custom JavaScript -->
		<script src="<?=base_url()?>/public/js/chart-custom.js"></script>
		<!-- Custom JavaScript -->
		<script src="<?=base_url()?>/public/js/custom.js"></script>
		<script src="<?=base_url()?>/public/datatable/datatables.min.js"></script>
		<script src="<?=base_url()?>public/js/jquery.validate.min.js"></script>
		<script src="<?=base_url()?>/public/js/general.js"></script>
		<script>
			let cols = [], titles = [], botones = '<"row"<"col-sm-12 mt-2 mb-4"B><"col-sm-6 float-left my-2"l><"col-sm-6 float-right my-2"f>rt>ip', btnAccion;
			const base_url = '<?=base_url()?>', segmento = '<?=$this->uri->segment(1)?>';		
			const lngDataTable = {
				'emptyTable': 'Actualmente no hay registros para mostrar',
				'info': 'Mostrando _START_ a _END_ de _TOTAL_ Entradas', 'infoEmpty': 'Mostrando 0 a 0 de 0 Entradas','infoFiltered': '(Filtrado de _MAX_ total entradas)',
				'infoPostFix': '',"thousands": ',', 'lengthMenu': 'Mostrando  _MENU_  Entradas', 'loadingRecords': 'Cargando Registros ...',
				'processing': 'Procesando...', 'search': 'Buscar:', 'zeroRecords': 'No se encontraron resultados',
				'paginate': { 'first': 'Primero', 'last': 'Ultimo', 'next': 'Siguiente', 'previous': 'Anterior' },
			}
			function cabeceras(headersCols){
				let render = [], imagen = [], j = 0;
				cols.push({data:null,className:'no_sort'});j++;
				if(headersCols.length > 0){
					headersCols.forEach(function(col){
						for(const [key, value] of Object.entries(col)){
							let pal = '';
							cols.push({data:key});
							(value !== 'dni')? pal = value.replace(/(^\w{1})|(\s+\w{1})/g, letra => letra.toUpperCase()):pal = value.toUpperCase();
							titles.push({title:pal,targets:j});
							j++;
						}
					});
				}
				render = [
					{
						title: 'Acciones',
						targets: 0,
						orderable: false,
						collapse: false,
						collapsible: false,
						data: null,
						render: function (data, type, row, meta) { return btnAccion; }
					},
					{
						targets: 'no-sort',
						orderable: false,
					},
					{
						targets: 1,
						visible: false,
					}
				];
				titles = render.concat(titles);
			}
			
			function mayus(e){e.value = e.value.toUpperCase();}
		</script>
		<!-- Rutinas Javascript por cada uno de los segmentos -->
		
		<?php if($this->uri->segment(1) === 'proveedores' && $this->uri->segment(2) == ''){ ?>
		<script>
			const headers = [{'idproveedor':'id','idtipodocumento':'documento','numero_documento':'numero','RUC':'ruc','nombre':'nombre','domicilio':'direccion','zona':'zona','activo':'estado'}];
			btnAccion =
			'<button class="btn btn-warning btn-circle btn-sm actionEdit" title="Editar Registro" type="button" style="margin-right:5px;padding:1px;padding-left:3px" >'+
			'<i class="fa fa-pencil-square" aria-hidden="true"></i></button>'+
			'<button class="btn btn-warning btn-circle btn-sm actionComp" title="Complementarios" type="button" style="margin-right:5px;padding:1px;padding-left:3px" >'+
			'<i class="fa fa-home" aria-hidden="true"></i></button>';			
			cabeceras(headers);
			
			const lista = JSON.parse('<?=json_encode($lista)?>');
			
			const tabla = $('#tablaProveedores').DataTable({
				'data':lista, 'bAutoWidth':true, 'bDestroy':true, 'responsive':true, 'select':false, 'lengthMenu':[[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, 'Todas']],
				'columns':cols, 'columnDefs':titles, 'dom': botones, 'buttons':{dom:{container:{tag: 'div',className: 'flexcontent'},buttonLiner:{tag: null}},buttons:[
				'copy','csv','excel','pdf','print']},order: [], language:{ lngDataTable },
			});
		</script>
		<?}?>