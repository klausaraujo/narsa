					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4>Registro de Proveedor</h4></div>
						</div>
						<div class="iq-card-body">
						<form method="post" id="form_proveedor" action="<?=base_url()?>proveedores/registrar" class="needs-validation form-horizontal" novalidate="">
							<input type="hidden" name="tiporegistro" value="registrar" />
							<div class="form-row">
								<div class="col-12 my-1">
									<div class="row">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="tipodoc">Tipo de Documento:</label>
										<div class="col-md-6 col-lg-3">
											<div class="row">
												<select class="form-control tipodoc" name="tipodoc" id="tipodoc" required="">
												<?
														foreach($tipodoc as $row):	?>
															<option value="<?=$row->idtipodocumento;?>"><?=$row->tipo_documento;?></option>
												<?		endforeach;	?>
												</select>
												<div class="invalid-feedback">Debe elegir un tipo de documento</div>
											</div>
										</div>
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="doc">N&uacute;mero de Documento:</label>
										<div class="col-md-4 col-lg-2">
											<div class="row">
												<input type="text" class="form-control doc borra num numcurl" maxlength="8" minlength="8" name="doc" id="doc" autocomplete="off"
													placeholder="Nro. Documento" required="" />
												<div class="invalid-feedback" id="error-doc">Documento requerido</div>
											</div>
										</div>
										<div class="col-md-2 col-lg-1 px-0 pl-md-3 pl-lg-4 mt-3 mt-lg-0 align-self-center">
											<button type="button" class="btn btn-info btn-small btn_curl col-12"><i class="fa fa-search" aria-hidden="true"></i></button>
										</div>
										<!--<label class="form_error error_curl col-md-4 my-0"></label>-->
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="ruc">RUC:</label>
										<input type="text" class="form-control col-md-6 col-lg-4 ruc borra num" name="ruc" id="ruc" placeholder="RUC" value="" minlength="11" />
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="nombres">Raz&oacute;n Social:</label>
										<div class="col-md-6 col-lg-4">
											<div class="row">
												<input type="text" class="form-control borra nombres" name="nombres" id="nombres" placeholder="Raz&oacute;n Social" value="" required="" readonly />
												<div class="invalid-feedback" id="error-razon">Debe indicar una Raz&oacute;n social</div>
											</div>
										</div>
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="direccion">Domicilio:</label>
										<div class="col-md-6 col-lg-4">
											<div class="row">
												<input type="text" class="form-control borra direccion" name="direccion" id="direccion" placeholder="Domicilio" value="" onKeyUp="mayus(this)" required="" />
												<div class="invalid-feedback">Campo requerido</div>
											</div>
										</div>
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="celular">Celular:</label>
										<input type="text" class="form-control col-md-6 col-lg-4 borra celular num" name="celular" id="celular" placeholder="N&uacute;mero Celular" value="" />
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="email">Email:</label>
										<div class="col-md-6 col-lg-4">
											<div class="row">
												<input type="email" class="form-control borra correo" name="email" id="email" placeholder="Correo Electr&oacute;nico" value="" />
												<div class="invalid-feedback">La direcci&oacute;n de email debe contener 1 @ y servidor de correo</div>
											</div>
										</div>
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="zona">Zona:</label>
										<div class="col-md-6 col-lg-4">
											<div class="row">
												<input type="text" class="form-control borra zona" name="zona" id="zona" placeholder="Zona" value="" onKeyUp="mayus(this)" required="" />
												<label class="invalid-feedback">Campo requerido</label>
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