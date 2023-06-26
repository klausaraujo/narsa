					<? $usuario = json_decode($this->session->userdata('user')); ?>
					
					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4>Registro Tostado</h4></div>
						</div>
						<div class="iq-card-body"><!--Anular-->
							<form method="post" id="form_tostado" action="<?=base_url()?>tostado/registrar" class="needs-validation" novalidate="" >
								<input type="hidden" name="tiporegistro" value="registrar" />
								<input type="hidden" name="idproveedor" id="idproveedor" />
								<div class="form-row">
									<div class="col-12 my-1">
										<div class="row">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="productor">&nbsp;&nbsp;Productor:</label>
											<div class="col-sm-6 col-lg-3">
												<div class="row">
													<input type="text" class="form-control productor col-8" id="productor1" name="productor1"readonly />
													<input type="text" class="form-control productor col-8 d-none" id="productor" name="productor" required="" />
													<a type="button" class="btn btn-small btn-narsa align-self-center text-small ml-1 text-white" data-toggle="modal" 
															data-target="#modalProveedores" id="buscar">Buscar</a>
													<div class="invalid-feedback">Debe elegir un Productor</div>
												</div>
											</div>
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="sucursalTos">&nbsp;&nbsp;Sucursal:</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<select class="form-control" name="sucursalTos" id="sucursalTos" required="">
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
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="articulo">&nbsp;&nbsp;Art&iacute;culo:</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<select class="form-control" name="articulo" id="articulo" required="">
													<? foreach($articulos as $row): ?>
														<option value="<?=$row->idarticulo;?>" ><?=$row->articulo;?></option>
													<? endforeach;	?>
													</select>
													<div class="invalid-feedback">Campo Requerido</div>
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="cantidad">&nbsp;&nbsp;Cantidad:</label>
											<div class="col-sm-6 col-lg-3">
												<div class="row">
													<input type="text" class="form-control moneda" name="cantidad" id="cantidad" required="" />
													<div class="invalid-feedback">Cantidad Requerida</div>
												</div>
											</div>
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="cascara">&nbsp;&nbsp;C&aacute;scara:</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<input type="text" class="form-control moneda" name="cascara" id="cascara" />
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="malla15">&nbsp;&nbsp;Malla #15:</label>
											<div class="col-sm-6 col-lg-3">
												<div class="row">
													<input type="text" class="form-control moneda" name="malla15" id="malla15" />
												</div>
											</div>
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="malla14">&nbsp;&nbsp;Malla #14:</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<input type="text" class="form-control moneda" name="malla14" id="malla14" />
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="descarte">&nbsp;&nbsp;Descarte:</label>
											<div class="col-sm-6 col-lg-3">
												<div class="row">
													<input type="text" class="form-control moneda" name="descarte" id="descarte" />
												</div>
											</div>
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="eliminacion">&nbsp;&nbsp;Eliminaci&oacute;n:</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<input type="text" class="form-control moneda" name="eliminacion" id="eliminacion" />
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="seleccion">&nbsp;&nbsp;Selecci&oacute;n:</label>
											<div class="col-sm-6 col-lg-3">
												<div class="row">
													<select class="form-control" name="seleccion" id="seleccion">
														<option value="1" >Exportacion</option>
														<option value="2" >Segunda</option>
													</select>
												</div>
											</div>
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="tostado">&nbsp;&nbsp;Tostado:</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<select class="form-control" name="tostado" id="tostado">
														<option value="1" >Claro</option>
														<option value="2" >Medio</option>
														<option value="3" >Oscuro</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="molido">&nbsp;&nbsp;Molido:</label>
											<div class="col-sm-6 col-lg-3">
												<div class="row">
													<select class="form-control" name="molido" id="molido">
														<option value="1" >Fino</option>
														<option value="2" >Medio</option>
														<option value="3" >Grueso</option>
													</select>
												</div>
											</div>
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0 mt-sm-3 mt-lg-0 ml-lg-3" for="envasado">&nbsp;&nbsp;Envasado:</label>
											<div class="col-sm-6 col-lg-3 mt-sm-3 mt-lg-0">
												<div class="row">
													<select class="form-control" name="envasado" id="envasado">
														<option value="1" >1 Kg.</option>
														<option value="2" >500 Gr.</option>
														<option value="3" >250 Gr.</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-sm-6 col-lg-2 align-self-center mb-0" for="obs">&nbsp;&nbsp;Observaciones:</label>
											<div class="col-sm-6 col-lg-8">
												<div class="row">
													<input type="text" class="form-control mayusc" name="obs" id="obs" placeholder="Observaciones" autocomplete="off" />
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
													<thead><tr><th>ID</th><th>Nombre del Productor</th><th>finca</th><th>altitud</th></tr></thead>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>