					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4>Registro de Proveedor</h4></div>
						</div>
						<div class="iq-card-body">
						<form method="post" id="form_proveedor" action="<?=base_url()?>proveedores/registrar">
							<input type="hidden" name="tiporegistro" value="registrar" />
							<div class="row">
								<div class="col-md-12 my-1">
									<div class="row">
										<label class="control-label col-lg-3 align-self-center mb-0" for="tipodoc">Tipo de Documento:</label>
										<select class="form-control col-md-3 tipodoc" name="tipodoc" id="tipodoc">
										<?
												foreach($tipodoc as $row):	?>
													<option value="<?=$row->idtipodocumento;?>"><?=$row->tipo_documento;?></option>
										<?		endforeach;	?>
										</select>
									</div>
									<div class="row my-1">
										<label class="control-label col-lg-3 align-self-center mb-0" for="doc">N&uacute;mero de Documento:</label>
										<input type="text" class="form-control col-md-2 doc borra num numcurl" maxlength="8" minlength="8" name="doc" id="doc" autocomplete="off"
												placeholder="Nro. Documento" />&nbsp;&nbsp;&nbsp;
										<div class="col-md-1 align-self-center">
											<button type="button" class="btn btn-info btn-small btn_curl col-12"><i class="fa fa-search" aria-hidden="true"></i></button>
										</div>
										<label class="form_error error_curl col-md-4 my-0"></label>
									</div>
									<div class="row my-1">
										<label class="control-label col-lg-3 align-self-center mb-0" for="ruc">RUC:</label>
										<input type="text" class="form-control col-md-4 ruc borra num" name="ruc" id="ruc" placeholder="RUC" value="" minlength="11" />
									</div>
									<div class="row my-1">
										<label class="control-label col-lg-3 align-self-center mb-0" for="nombres">Raz&oacute;n Social:</label>
										<input type="text" class="form-control col-md-4 borra nombres" name="nombres" id="nombres" placeholder="Raz&oacute;n Social" value="" readonly />
									</div>
									<div class="row my-1">
										<label class="control-label col-lg-3 align-self-center mb-0" for="direccion">Domicilio:</label>
										<input type="text" class="form-control col-md-4 borra direccion" name="direccion" id="direccion" placeholder="Domicilio" value="" onKeyUp="mayus(this)" />
									</div>
									<div class="row my-1">
										<label class="control-label col-lg-3 align-self-center mb-0" for="celular">Celular:</label>
										<input type="text" class="form-control col-md-4 borra celular num" name="celular" id="celular" placeholder="N&uacute;mero Celular" value="" />
									</div>
									<div class="row my-1">
										<label class="control-label col-lg-3 align-self-center mb-0" for="correo">Email:</label>
										<input type="text" class="form-control col-md-4 borra correo" name="correo" id="correo" placeholder="Correo Electr&oacute;nico" value="" />
									</div>
									<div class="row my-1">
										<label class="control-label col-lg-3 align-self-center mb-0" for="zona">Zona:</label>
										<input type="text" class="form-control col-md-4 borra zona" name="zona" id="zona" placeholder="Zona" value="" onKeyUp="mayus(this)" />
									</div>
								</div>
							</div>
							<div class="row"><hr class="col-sm-11"></div>
							<div class="col-12 mx-auto pb-2">
								<button type="submit" class="btn btn-narsa ml-1 mr-4" id="btnEnviar">Guardar Registro</button>
								<button type="reset" class="btn btn-narsa btn-cancelar">Cancelar</button>
							</div>
						</form>
						</div>
					</div>