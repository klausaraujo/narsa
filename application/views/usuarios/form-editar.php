					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4>Editar Usuario</h4></div>
						</div>
						<div class="iq-card-body">
							<form method="post" id="form_usuarios" action="<?=base_url()?>usuarios/registrar">
								<input type="hidden" name="tiporegistro" value="editar" />
								<input type="hidden" name="idusuario" value="<?=$usuario->idusuario;?>" />
								<div class="row">
									<div class="col-sm-12 my-1">
										<div class="row">
											<span class="col-sm-3" style="display:flex;align-items:center"><label for="tipodoc">Tipo de Documento:</label></span>
											<select class="form-control col-sm-3 tipodoc" name="tipodoc" id="tipodoc">
												<option value="">--Seleccione--</option>
											<?
													foreach($tipodoc as $row):	?>
														<option value="<?=$row->idtipodocumento;?>" <?=($row->idtipodocumento === $usuario->idtipodocumento)?'selected':'';?>>
															<?=$row->tipo_documento;?></option>
											<?		endforeach;	?>
											</select>
										</div>
									</div>
									<div class="col-sm-12 my-1">
										<div class="row my-1">
											<span class="col-sm-3" style="display:flex;align-items:center"><label for="doc">N&uacute;mero de Documento:</label></span>
											<input type="text" class="form-control col-sm-3 doc" maxlength="9" minlength="8" name="doc" id="doc" autocomplete="off"
												value="<?=$usuario->numero_documento;?>" />&nbsp;&nbsp;
											<button type="button" class="btn btn-info btn_curl"><i class="fa fa-search" aria-hidden="true"></i></button>
										</div>
									</div>
									<div class="col-sm-12 my-1">
										<div class="row my-1">
											<span class="col-sm-3" style="display:flex;align-items:center"><label for="apellidos">Apellidos:</label></span>
											<input type="text" class="form-control col-sm-5 apellidos" name="apellidos" id="apellidos" placeholder="Apellidos"
												value="<?=$usuario->apellidos;?>" />
										</div>
									</div>
									<div class="col-sm-12 my-1">
										<div class="row my-1">
											<span class="col-sm-3" style="display:flex;align-items:center"><label for="nombres">Nombres:</label></span>
											<input type="text" class="form-control col-sm-5 nombres" name="nombres" id="nombres" placeholder="Nombres"
												value="<?=$usuario->nombres;?>" />
										</div>
									</div>
									<div class="col-sm-12 my-1">
										<div class="row my-1">
											<span class="col-sm-3" style="display:flex;align-items:center"><label for="usuario">Usuario:</label></span>
											<input type="text" class="form-control col-sm-5 usuario" name="usuario" id="usuario" placeholder="Usuario" value="<?=$usuario->usuario;?>" />
										</div>
									</div>
									<div class="col-sm-12 my-1">
										<div class="row my-1">
											<span class="col-sm-3" style="display:flex;align-items:center"><label for="perfil">Perfil:</label></span>
											<select class="form-control col-sm-3 perfil" name="perfil" id="perfil">
												<option value="">--Seleccione--</option>
											<?
													foreach($perfil as $row):	?>
														<option value="<?=$row->idperfil;?>" <?=($row->idperfil === $usuario->idperfil)?'selected':'';?>>
															<?=$row->perfil;?></option>
											<?		endforeach;	?>
											</select>
										</div>
									</div>
								</div>
								<div class="row"><hr class="col-sm-11"></div>
								<div class="col-sm-12 mx-auto pb-2">
									<button type="submit" class="btn btn-narsa ml-3 mr-4" id="btnEnviar">Editar registro</button>
									<button type="reset" class="btn btn-narsa btn-cancelar">Cancelar</button>
								</div>
							</form>
						</div>
					</div>
			