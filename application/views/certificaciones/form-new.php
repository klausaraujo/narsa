					<? $usuario = json_decode($this->session->userdata('user')); ?>
					
					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4>Registro Certificado</h4></div>
						</div>
						<div class="iq-card-body">
							<form method="post" id="form_certificado" action="<?=base_url()?>certificado/registrar" class="needs-validation form-horizontal" novalidate="">
								<input type="hidden" name="tiporegistro" value="registrar" />								
								<div class="form-row">
									<div class="col-12 my-1">
										<div class="row">
											<label class="control-label col-md-6 col-lg-2 align-self-center mb-0" for="productor">&nbsp;&nbsp;Productor:</label>
											<div class="col-md-6 col-lg-3">
												<div class="row">
													<select class="form-control productor" name="productor" id="productor" required="">
														<option> -- Seleccione -- </option>
													<? foreach($proveedores as $row): ?>
														<option value="<?=$row->idproveedor;?>" ><?=$row->nombre;?></option>
													<? endforeach;	?>
													</select>
													<div class="invalid-feedback">Debe elegir un tipo de operacion</div>
												</div>
											</div>
											<label class="control-label col-md-6 col-lg-2 align-self-center mb-0 mt-md-3 mt-lg-0" for="sucursalCert">&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;Sucursal:</label>
											<div class="col-md-6 col-lg-3 mt-md-3 mt-lg-0">
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
											<label class="control-label col-md-6 col-lg-2 align-self-center mb-0" for="fecha">&nbsp;&nbsp;Fecha:</label>
											<div class="col-md-6 col-lg-3">
												<div class="row">
													<input type="date" class="form-control fecha" value="<?=date('Y-m-d')?>" name="fecha" id="fecha" required="" />
													<div class="invalid-feedback">Debe elegir la fecha</div>
												</div>
											</div>
											<label class="control-label col-md-6 col-lg-2 align-self-center mb-0 mt-md-3 mt-lg-0" for="sucursalCert">&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;H2O verde (ISO):</label>
											<div class="col-md-6 col-lg-3 mt-md-3 mt-lg-0">
												<div class="row">
													<input type="text" class="form-control h2o" name="h2o" id="h2o" required="" />
													<div class="invalid-feedback">Campo Requerido</div>
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-md-6 col-lg-2 align-self-center mb-0" for="altitud">&nbsp;&nbsp;Altitud:</label>
											<div class="col-md-6 col-lg-3">
												<div class="row">
													<input type="text" class="form-control altitud" name="altitud" id="altitud" required="" />
													<div class="invalid-feedback">Debe indicar la Altitud</div>
												</div>
											</div>
											<label class="control-label col-md-6 col-lg-2 align-self-center mb-0 mt-md-3 mt-lg-0" for="sucursalCert">&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;Proceso:</label>
											<div class="col-md-6 col-lg-3 mt-md-3 mt-lg-0">
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
											<label class="control-label col-md-6 col-lg-2 align-self-center mb-0" for="densidad">&nbsp;&nbsp;Densidad:</label>
											<div class="col-md-6 col-lg-3">
												<div class="row">
													<input type="text" class="form-control densidad" name="densidad" id="densidad" required="" />
													<div class="invalid-feedback">Debe indicar la Densidad</div>
												</div>
											</div>
											<label class="control-label col-md-6 col-lg-2 align-self-center mb-0 mt-md-3 mt-lg-0" for="variedad">&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;Variedad:</label>
											<div class="col-md-6 col-lg-3 mt-md-3 mt-lg-0">
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
					<?php
						$suc = ''; $tipoop = ''; $mto = ''; $fecha = date('Y-m-d'); $obs = '';
					?>