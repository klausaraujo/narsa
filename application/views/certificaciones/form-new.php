					<? $usuario = json_decode($this->session->userdata('user')); ?>
					
					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4>Registro Certificado</h4></div>
						</div>
						<div class="iq-card-body"><!--Anular-->
							<form method="post" id="form_certificado" action="<?=base_url()?>certificaciones/registrar" class="needs-validation" novalidate="">
								<input type="hidden" name="tiporegistro" value="registrar" />
								<input type="hidden" name="idproveedor" id="idproveedor" />
								<div class="form-row">
									<div class="col-12 my-1">
										<div class="row">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="productor">&nbsp;&nbsp;Productor:</label>
											<div class="col-sm-6 col-lg-3">
												<div class="row">
													<input type="text" class="form-control productor col-8" id="productor" name="productor" readonly required="">
													<a type="button" class="btn btn-small btn-narsa align-self-center text-small ml-1 text-white" data-toggle="modal" 
															data-target="#modalProveedores" id="buscar">Buscar</a>
												</div>
											</div>
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="sucursalCert">&nbsp;&nbsp;Sucursal:</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<select class="form-control sucursalCert" name="sucursalCert" id="sucursalCert" required="">
													<? foreach($usuario->sucursales as $row): ?>
														<option value="<?=$row->idsucursal;?>" ><?=$row->sucursal;?></option>
													<? endforeach;	?>
													</select>
													<div class="invalid-feedback">Debe elegir una Sucursal</div>
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="fecha">&nbsp;&nbsp;Fecha:</label>
											<div class="col-sm-6 col-lg-3">
												<div class="row">
													<input type="date" class="form-control fecha" value="<?=date('Y-m-d')?>" name="fecha" id="fecha" required="" />
													<div class="invalid-feedback">Debe elegir la fecha</div>
												</div>
											</div>
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="h2o">&nbsp;&nbsp;H2O verde (ISO):</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<input type="text" class="form-control h2o moneda" name="h2o" id="h2o" required="" />
													<div class="invalid-feedback">Campo Requerido</div>
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="altitud">&nbsp;&nbsp;Altitud:</label>
											<div class="col-sm-6 col-lg-3">
												<div class="row">
													<input type="text" class="form-control altitud moneda" name="altitud" id="altitud" required="" />
													<div class="invalid-feedback">Debe indicar la Altitud</div>
												</div>
											</div>
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="proceso">&nbsp;&nbsp;Proceso:</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<select class="form-control proceso" name="proceso" id="proceso" required="">
													<? foreach($proceso as $row): ?>
														<option value="<?=$row->idproceso;?>" ><?=$row->proceso;?></option>
													<? endforeach;	?>
													</select>
													<div class="invalid-feedback">Debe elegir un Proceso</div>
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="densidad">&nbsp;&nbsp;Densidad:</label>
											<div class="col-sm-6 col-lg-3">
												<div class="row">
													<input type="text" class="form-control densidad moneda" name="densidad" id="densidad" required="" />
													<div class="invalid-feedback">Debe indicar la Densidad</div>
												</div>
											</div>
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="variedad">&nbsp;&nbsp;Variedad:</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<select class="form-control variedad" name="variedad" id="variedad" required="">
													<? foreach($variedad as $row): ?>
														<option value="<?=$row->idvariedad;?>" ><?=$row->variedad;?></option>
													<? endforeach;	?>
													</select>
													<div class="invalid-feedback">Debe elegir la Variedad</div>
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="obs">&nbsp;&nbsp;Observaciones:</label>
											<div class="col-sm-6 col-lg-8">
												<div class="row">
													<input type="text" class="form-control mayusc" name="obs" id="obs" placeholder="Observaciones" />
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="finca">&nbsp;&nbsp;Finca:</label>
											<div class="col-sm-6 col-lg-8">
												<div class="row">
													<input type="text" class="form-control mayusc" name="finca" id="finca" placeholder="Finca" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="container-fluid row"><hr class="col-sm-12"></div>
								<div class="col-12 mx-auto pb-2">
									<button type="submit" class="btn btn-narsa ml-1 mr-4" id="btnEnviar">Guardar Registro</button>
									<button type="reset" class="btn btn-narsa btn-cancelar">Cancelar</button>
								</div>
							</form>
						</div>
					</div>
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
													<thead><tr><th>ID</th><th>Nombre del Productor</th></tr></thead>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>