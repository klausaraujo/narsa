					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4>Editar Proveedor</h4></div>
						</div>
						<div class="iq-card-body">
						<form method="post" id="form_proveedor" action="<?=base_url()?>proveedores/registrar" class="form-horizontal">
							<input type="hidden" name="tiporegistro" value="editar" />
							<input type="hidden" name="idproveedor" value="<?=$proveedor->idproveedor;?>" />
							<div class="form-row">
								<div class="col-sm-12 my-1">
									<div class="row">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="tipodoc">Tipo de Documento:</label>
										<div class="col-md-6 col-lg-3">
											<div class="row">
												<select class="form-control tipodoc" name="tipodoc" id="tipodoc" disabled >
												<?
														foreach($tipodoc as $row):	?>
															<option value="<?=$row->idtipodocumento;?>" <?=($row->idtipodocumento === $proveedor->idtipodocumento)?'selected':'';?>>
																<?=$row->tipo_documento;?></option>
												<?		endforeach;	?>
												</select>
											</div>
										</div>
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="doc">N&uacute;mero de Documento:</label>
										<div class="col-md-4 col-lg-2">
											<div class="row">
												<input type="text" class="form-control doc" name="doc" id="doc"
													autocomplete="off" value="<?=$proveedor->numero_documento;?>" disabled />
											</div>
										<!--<button type="button" class="btn btn-info btn_curl"><i class="fa fa-search" aria-hidden="true"></i></button>-->
										</div>
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="ruc">RUC:</label>
										<input type="text" class="form-control col-md-6 col-lg-4 ruc num" name="ruc" id="ruc" placeholder="RUC" value="<?=$proveedor->RUC;?>" minlength="11" /> 
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="nombres">Raz&oacute;n Social:</label>
										<div class="col-md-6 col-lg-4">
											<div class="row">
												<input type="text" class="form-control nombres" name="nombres" id="nombres" placeholder="Raz&oacute;n Social"
													value="<?=$proveedor->nombre;?>" disabled />
											</div>
										</div>
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="direccion">Domicilio:</label>
										<div class="col-md-6 col-lg-4">
											<div class="row">
												<input type="text" class="form-control direccion" name="direccion" id="direccion" placeholder="Domicilio" 
													value="<?=$proveedor->domicilio;?>" onKeyUp="mayus(this)" />
											</div>
										</div>
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="celular">Celular:</label>
										<input type="text" class="form-control col-md-6 col-lg-4 celular num" name="celular" id="celular" placeholder="N&uacute;mero Celular" 
											value="<?=$proveedor->celular;?>" />
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="email">Email:</label>
										<div class="col-md-6 col-lg-4">
											<div class="row">
												<input type="text" class="form-control celular" name="correo" id="correo" placeholder="Correo Electr&oacute;nico"
													value="<?=$proveedor->correo;?>"/>
											</div>
										</div>
									</div>
									<div class="row mt-3">
										<label class="control-label col-md-6 col-lg-3 align-self-center mb-0" for="zona">Zona:</label>
										<div class="col-md-6 col-lg-4">
											<div class="row">
												<input type="text" class="form-control zona" name="zona" id="zona" placeholder="Zona" value="<?=$proveedor->zona;?>"
													onKeyUp="mayus(this)" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="container-fluid row"><hr class="col-sm-12"></div>
							<div class="col-12 mx-auto pb-2">
								<button type="submit" class="btn btn-narsa ml-1 mr-4" id="btnEnviar">Editar Registro</button>
								<button type="reset" class="btn btn-narsa btn-cancelar">Cancelar</button>
							</div>
						</form>
						</div>
					</div>
			