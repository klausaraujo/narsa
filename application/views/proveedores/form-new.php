					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4>Registro de Proveedor</h4></div>
						</div>
						<div class="iq-card-body">
							<div class="row">
								<div class="col-sm-12 my-1">
									<div class="row">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="tipodoc">Tipo de Documento:</label></span>
										<select class="form-control col-sm-3 tipodoc" name="tipodoc" id="tipodoc">
											<option value="">--Seleccione--</option>
										<?
												foreach($tipodoc as $row):	?>
													<option data-long="<?=$row->longitud;?>" value="<?=$row->codigo_curl;?>"><?=$row->tipo_documento;?></option>
										<?		endforeach;	?>
										</select>
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="doc">N&uacute;mero de Documento:</label></span>
										<input type="text" class="form-control col-sm-3 doc" maxlength="14" minlength="8" name="doc" id="doc" autocomplete="off">&nbsp;&nbsp;
										<button type="button" class="btn btn-info btn_curl"><i class="fa fa-search" aria-hidden="true"></i></button>
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="nombres">Raz&oacute;n Social:</label></span>
										<input type="text" class="form-control col-sm-5 nombres" name="nombres" id="nombres" placeholder="Raz&oacute;n Social" value="" />
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="direccion">Domicilio:</label></span>
										<input type="text" class="form-control col-sm-5 direccion" name="direccion" id="direccion" placeholder="Domicilio" value="" />
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="zona">Zona:</label></span>
										<input type="text" class="form-control col-sm-5" name="zona" id="zona" placeholder="Zona" value="" />
									</div>
								</div>
							</div>
							<div class="row"><hr class="col-sm-11"></div>
							<div class="col-sm-12"><h5 id="cargando" class="succes"></h5></div>
							<div class="col-sm-12"><h5 id="message" class="succes"></h5></div>
							<div class="col-sm-12 mx-auto pb-2">
								<button type="submit" class="btn btn-narsa mx-3" id="btnEnviar">Guardar registro</button>
								<button class="btn btn-narsa" id="btnCancelar" name="btnCancelar">Cancelar</button>
							</div>
						</div>
					</div>
			