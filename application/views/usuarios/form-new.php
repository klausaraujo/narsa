					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4>Registro de Usuarios</h4></div>
						</div>
						<div class="iq-card-body">
							<form method="post" id="form_usuarios" action="<?=base_url()?>usuarios/registrar">
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
											<label class="control-label col-lg-3 align-self-center mb-0" for="doc">N&uacute;mero de Documento:</label>
											<input type="text" class="form-control col-md-2 doc borra num numcurl" maxlength="8" minlength="8" name="doc" id="doc" autocomplete="off"
												placeholder="Nro. Documento" />&nbsp;&nbsp;&nbsp;
											<div class="col-md-1 centraVert">
												<button type="button" class="btn btn-info btn-small btn_curl col-12"><i class="fa fa-search" aria-hidden="true"></i></button>
											</div>
										</div>
									</div>
									<div class="col-sm-12 my-1">
										<div class="row my-1">
											<span class="col-sm-3" style="display:flex;align-items:center"><label for="apellidos">Apellidos:</label></span>
											<input type="text" class="form-control col-sm-5 borra apellidos" name="apellidos" id="apellidos" placeholder="Apellidos" readonly />
										</div>
									</div>
									<div class="col-sm-12 my-1">
										<div class="row my-1">
											<span class="col-sm-3" style="display:flex;align-items:center"><label for="nombres">Nombres:</label></span>
											<input type="text" class="form-control col-sm-5 borra nombres" name="nombres" id="nombres" placeholder="Nombres" value="" readonly />
										</div>
									</div>
									<div class="col-sm-12 my-1">
										<div class="row my-1">
											<span class="col-sm-3" style="display:flex;align-items:center"><label for="usuario">Usuario:</label></span>
											<input type="text" class="form-control col-sm-5 borra usuario" name="usuario" id="usuario" placeholder="Usuario" value="" readonly />
										</div>
									</div>
									<div class="col-sm-12 my-1">
										<div class="row my-1">
											<span class="col-sm-3" style="display:flex;align-items:center"><label for="perfil">Perfil:</label></span>
											<select class="form-control col-sm-3 perfil" name="perfil" id="perfil">
											<?
												foreach($perfil as $row):	?>
													<option value="<?=$row->idperfil;?>" <?if($row->idperfil === '2')echo 'selected';?> ><?=$row->perfil;?></option>
											<?	endforeach;	?>
											</select>
										</div>
									</div>
								</div>
								<div class="row"><hr class="col-sm-11"></div>
								<div class="col-sm-12 mx-auto pb-2">
									<button type="submit" class="btn btn-narsa ml-3 mr-4" id="btnEnviar">Guardar registro</button>
									<button type="reset" class="btn btn-narsa btn-cancelar">Cancelar</button>
								</div>
							</form>
						</div>
					</div>
			