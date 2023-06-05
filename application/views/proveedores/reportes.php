<?					
					$usuario = json_decode($this->session->userdata('user'));
					$titulo = '';
					if($this->uri->segment(2) === 'reporte1') $titulo = 'Art&iacute;culos Ingresados';
					if($this->uri->segment(2) === 'reporte2') $titulo = 'Art&iacute;culos Valorizados';
					if($this->uri->segment(2) === 'reporte3') $titulo = 'Art&iacute;culos por Valorizar';
					
					
					if($this->uri->segment(2) === 'reporte1' || $this->uri->segment(2) === 'reporte2' || $this->uri->segment(2) === 'reporte3'){ ?>
						<div class="col-12 card px-0 my-3">
							<input type="hidden" id="segmento" value="<?=$this->uri->segment(2)?>" />
							<div class="card-body">
								<h4 class=""><?=$titulo?></h4>
								<hr>
								<div class="row">
									<div class="col-md-11 mx-auto">
										<div class="row">
											<div class="col-md-4">
												<label class="control-label align-self-center mb-0 text-left" for="sucursal">&nbsp;&nbsp;&nbsp;Sucursal:</label>
												<select class="form-control form-control-sm sucursal" name="sucursal" id="sucursal">
												<? foreach($usuario->sucursales as $row): ?>
													<option value="<?=$row->idsucursal;?>"><?=$row->sucursal;?></option>	
												<? endforeach;	?>
												</select>
											</div>
											<div class="col-md-2">
												<label class="control-label align-self-center mb-0 text-left" for="anio">&nbsp;&nbsp;&nbsp;A&ntilde;o:</label>
												<select class="form-control form-control-sm anio" name="anio" id="anio">
												<? foreach($anio as $row): ?>
													<option value="<?=$row->anio?>" <?=date('Y') === $row->anio? 'selected' : '';?> ><?=$row->anio;?></option>	
												<? endforeach;	?>
												</select>
											</div>
											<div class="col-md-4">
												<label class="control-label align-self-center mb-0 text-left" for="articulo">&nbsp;&nbsp;&nbsp;Art&iacute;culo:</label>
												<select class="form-control form-control-sm articulo" name="articulo" id="articulo">
													<option value=""> -- Todos -- </option>	
												<? foreach($articulo as $row): ?>
													<option value="<?=$row->articulo?>" ><?=$row->articulo;?></option>	
												<? endforeach;	?>
												</select>
											</div>
										</div>
										<div class="row mt-3">
											<div class="col-md-2">
												<label class="control-label align-self-center mb-0 text-left" for="productor">&nbsp;&nbsp;&nbsp;Productor:</label>
											</div>
											<div class="col-md-4">
												<input type="text" class="form-control form-control-sm productor" name="productor" id="productor" placeholder="Productor" readonly />
											</div>
											<div class="col-md-2 pr-0">
												<a type="button" class="btn btn-small bg-success align-self-center text-small text-white" data-toggle="modal" 
															data-target="#modalProveedores" id="buscar">Buscar</a>
											</div>
											<div class="col-md-3 px-0">
												<a type="button" class="btn btn-narsa align-self-center text-white" id="generar">Generar Reporte</a>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<!--<div class="container-fluid">-->
									<div class="row"> <!--class="table-responsive" -->
										<div class="col-12 mx-auto" style="overflow-x:auto">
											<table id="tablaReporte1" class="table table-striped table-hover table-bordered mb-0 mx-auto" style="width:100%"></table>
										</div>
									</div>
								</div>
							<!--</div>-->
						</div>
<?					}elseif($this->uri->segment(2) === 'reporte2'){}
?>
					<!-- Modal proveedores -->
					<div class="modal fade" id="modalProveedores" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Elegir Productor</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<div class="row">
											<div class="col-12 mx-auto" style="overflow-x:auto">
												<table id="tablaProveedores" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-0" style="width:100%">
													<thead><tr><th>ID</th><th>Nombre del Productor</th><th>finca</th><th>altitud</th></tr></thead>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>