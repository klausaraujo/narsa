					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4>Registro de Proveedor</h4></div>
						</div>
						<div class="iq-card-body">
						<form method="post" id="form_proveedor" action="<?=base_url()?>proveedores/registrar">
							<input type="hidden" name="tiporegistro" value="registrar" />
							<div class="row">
								<div class="col-sm-12 my-1">
									<div class="row">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="tipodoc">Tipo de Documento:</label></span>
										<select class="form-control col-sm-3 tipodoc" name="tipodoc" id="tipodoc">
										<?
												foreach($tipodoc as $row):	?>
													<option value="<?=$row->idtipodocumento;?>"><?=$row->tipo_documento;?></option>
										<?		endforeach;	?>
										</select>
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="doc">N&uacute;mero de Documento:</label></span>
										<input type="text" class="form-control col-sm-3 doc num numcurl" maxlength="8" minlength="8" name="doc" id="doc" autocomplete="off" />&nbsp;&nbsp;
										<button type="button" class="btn btn-info btn_curl"><i class="fa fa-search" aria-hidden="true"></i></button>
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="ruc">RUC:</label></span>
										<input type="text" class="form-control col-sm-5 ruc num" name="ruc" id="ruc" placeholder="RUC" value="" minlength="11" />
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="nombres">Raz&oacute;n Social:</label></span>
										<input type="text" class="form-control col-sm-5 nombres" name="nombres" id="nombres" placeholder="Raz&oacute;n Social" value="" readonly />
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="direccion">Domicilio:</label></span>
										<input type="text" class="form-control col-sm-5 direccion" name="direccion" id="direccion" placeholder="Domicilio" value="" onKeyUp="mayus(this)" />
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="celular">Celular:</label></span>
										<input type="text" class="form-control col-sm-5 celular num" name="celular" id="celular" placeholder="N&uacute;mero Celular" value="" />
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="correo">Correo:</label></span>
										<input type="text" class="form-control col-sm-5 celular" name="correo" id="correo" placeholder="Correo Electr&oacute;nico" value="" />
									</div>
								</div>
								<div class="col-sm-12 my-1">
									<div class="row my-1">
										<span class="col-sm-3" style="display:flex;align-items:center"><label for="zona">Zona:</label></span>
										<input type="text" class="form-control col-sm-5 zona" name="zona" id="zona" placeholder="Zona" value="" onKeyUp="mayus(this)" />
									</div>
								</div>
							</div>
							<div class="row"><hr class="col-sm-11"></div>
							<div class="col-sm-12 mx-auto pb-2">
								<button type="submit" class="btn btn-narsa ml-1 mr-4" id="btnEnviar">Guardar Registro</button>
								<button type="reset" class="btn btn-narsa btn-cancelar">Cancelar</button>
							</div>
						</form>
						</div>
					</div>