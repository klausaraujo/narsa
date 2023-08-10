					<? $usuario = json_decode($this->session->userdata('user')); ?>
					
					<div class="col-12 iq-card my-3">
						<div class="row iq-card-header d-flex justify-content-between">
							<div class="iq-header-title col-md-7"><h4>Registro Tostado</h4></div>
							<div class="col-md-3">
								<div class="row">
									<label class="control-label col-md-4 align-self-center mb-0" for="sucursalTos">Sucursal:</label>
									<div class="col-md-8">
										<select class="form-control form-control-sm" id="sucursalTos">
											<? foreach($usuario->sucursales as $row): ?>
											<option value="<?=$row->idsucursal;?>" ><?=$row->sucursal;?></option>
											<? endforeach;	?>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="iq-card-body"><!--Anular-->
							<form method="post" id="form_tostado" action="<?=base_url()?>tostado/registrar" class="needs-validation" novalidate="" >
								<input type="hidden" name="tiporegistro" value="registrar" />
								<input type="hidden" name="idproveedor" id="idproveedor" />
								<input type="hidden" name="sucursal" id="sucursal" value="<?=$usuario->sucursales[0]->idsucursal?>" />
								<div class="form-row">
									<div class="col-12 my-1">
										<div class="row">
											<div class="col-md-2 px-0">
												<div class="custom-control custom-radio custom-radio-color-checked custom-control-inline">
													<input type="radio" id="propio" name="propter" class="custom-control-input bg-primary" value="propio" required="" />
													<label class="custom-control-label" for="propio">Propio</label>
												</div>
												<div class="custom-control custom-radio custom-radio-color-checked custom-control-inline">
													<input type="radio" id="tercero" name="propter" class="custom-control-input bg-success" value="tercero" required="" >
													<label class="custom-control-label" for="tercero">Tercero</label>
												</div>
												<div class="row col-12 errores" id="errorcheck"></div>
											</div>
											<div class="col-md-3">
												<a type="button" class="btn btn-small btn-primary mr-3 px-3 resetea" data-toggle="modal" data-target="#modalProveedores" id="buscar">Buscar</a>
												<a type="button" class="btn btn-small btn-narsa text-white px-3 resetea" data-toggle="modal" data-target="#modalRegProveedor" id="btnAgregar">Registrar</a>
											</div>
											<div class="col-md-7">
												<div class="row">
													<div class="col-12 reg text-center"></div>
													<div class="col-md-5">
														<div class="row">
															<label class="control-label col-md-2 align-self-center mb-0" for="doc">Doc.:</label>
															<div class="col-md-10">
																<input type="text" class="form-control form-control-sm" name="docu" id="docu" required="" readonly />
																<div class="invalid-feedback">Campo Requerido</div>
															</div>
														</div>
													</div>
													<div class="col-md-7 pl-md-0">
														<div class="row">
															<label class="control-label col-md-3 align-self-center mb-0" for="productor">Nombre:</label>
															<div class="col-md-9">
																<input type="text" class="form-control form-control-sm" name="productor" id="productor" required="" readonly />
																<div class="invalid-feedback">Campo Requerido</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row mt-4">
											<div class="col-md-3">
												<div class="row">
													<label class="control-label col-md-3 align-self-center mb-0" for="articulo">Art&iacute;culo:</label>
													<div class="col-md-9">
														<select class="form-control form-control-sm" id="articulo" name="articulo" required="" >
															<? foreach($articulos as $row): ?>
																<option value="<?=$row->idarticulo;?>" ><?=$row->articulo;?></option>
															<? endforeach;	?>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="row">
													<label class="control-label col-md-3 align-self-center mb-0 pl-md-0" for="cantidad">Cantidad:</label>
													<div class="col-md-9">
														<input type="text" class="form-control form-control-sm moneda" name="cantidad" id="cantidad" required="" />
														<div class="invalid-feedback">Campo Requerido</div>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="row">
													<label class="control-label col-md-4 align-self-center mb-0 px-md-0" for="fecha">Fecha:</label>
													<div class="col-md-8 px-md-0">
														<input type="date" class="form-control form-control-sm" name="fecha" id="fecha" value="<?=date('Y-m-d')?>" required="" />
														<div class="invalid-feedback">Campo Requerido</div>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="row">
													<label class="control-label col-md-5 align-self-center mb-0" for="densidad">Densidad:</label>
													<div class="col-md-7 px-md-0">
														<input type="text" class="form-control form-control-sm moneda" name="densidad" id="densidad" />
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="row">
													<label class="control-label col-md-5 align-self-center mb-0" for="h2o">H2O:</label>
													<div class="col-md-7">
														<input type="text" class="form-control form-control-sm moneda" name="h2o" id="h2o" />
													</div>
												</div>
											</div>
										</div>
										<div class="row mt-4">
											<div class="col-md-3">
												<div class="row">
													<label class="control-label col-md-4 align-self-center mb-0" for="seleccionado">Seleccionado:</label>
													<div class="col-md-6 pr-md-0">
														<select class="form-control form-control-sm" id="seleccionado" name="seleccionado" required="" >
															<option value="0">NO</option>
															<option value="1">SI</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="row">
													<label class="control-label col-md-4 align-self-center mb-0 px-md-0" for="preciot">Precio Total:</label>
													<div class="col-md-8">
														<input type="text" class="form-control form-control-sm moneda" name="preciot" id="preciot" />
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="row">
													<label class="control-label col-md-4 align-self-center mb-0 px-md-0" for="acuenta">Pago a Cta.:</label>
													<div class="col-md-8">
														<input type="text" class="form-control form-control-sm moneda" name="acuenta" id="acuenta" />
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="row">
													<label class="control-label col-md-4 align-self-center mb-0" for="saldo">Saldo:</label>
													<div class="col-md-8">
														<input type="text" class="form-control form-control-sm moneda" name="saldo" id="saldo" />
													</div>
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-md-2 align-self-center mb-0 mt-md-3">Tipo de Tostado:</label>
											<div class="col-md-2">
												<div class="row">
													<div class="col-md-7 mx-auto"><label class="control-label align-self-center mb-0" for="claro">Claro</label></div>
													<input type="text" class="form-control form-control-sm col-md-10 moneda" name="claro" id="claro" />
												</div>
											</div>
											<div class="col-md-2">
												<div class="row">
													<div class="col-md-7 mx-auto"><label class="control-label align-self-center mb-0" for="medio">Medio</label></div>
													<input type="text" class="form-control form-control-sm col-md-10 moneda" name="medio" id="medio" />
												</div>
											</div>
											<div class="col-md-2">
												<div class="row">
													<div class="col-md-7 mx-auto"><label class="control-label align-self-center mb-0" for="oscuro">Oscuro</label></div>
													<input type="text" class="form-control form-control-sm col-md-10 moneda" name="oscuro" id="oscuro" />
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-md-2 align-self-center mb-0 mt-md-3">Tipo de Molienda:</label>
											<div class="col-md-2">
												<div class="row">
													<div class="col-md-7 mx-auto"><label class="control-label align-self-center mb-0" for="media">Medio</label></div>
													<input type="text" class="form-control form-control-sm col-md-10 moneda" name="media" id="media" />
												</div>
											</div>
											<div class="col-md-2">
												<div class="row">
													<div class="col-md-7 mx-auto"><label class="control-label align-self-center mb-0" for="mediafina">Media Fina</label></div>
													<input type="text" class="form-control form-control-sm col-md-10 moneda" name="mediafina" id="mediafina" />
												</div>
											</div>
											<div class="col-md-2">
												<div class="row">
													<div class="col-md-7 mx-auto"><label class="control-label align-self-center mb-0" for="mediagruesa">Oscuro</label></div>
													<input type="text" class="form-control form-control-sm col-md-10 moneda" name="mediagruesa" id="mediagruesa" />
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-md-2 align-self-center mb-0 mt-md-3">Tipo de Embolsado:</label>
											<div class="col-md-2">
												<div class="row">
													<div class="col-md-7 mx-auto"><label class="control-label align-self-center mb-0" for="peq">250g</label></div>
													<input type="text" class="form-control form-control-sm col-md-10 moneda" name="peq" id="peq" />
												</div>
											</div>
											<div class="col-md-2">
												<div class="row">
													<div class="col-md-7 mx-auto"><label class="control-label align-self-center mb-0" for="med">500g</label></div>
													<input type="text" class="form-control form-control-sm col-md-10 moneda" name="med" id="med" />
												</div>
											</div>
											<div class="col-md-2">
												<div class="row">
													<div class="col-md-7 mx-auto"><label class="control-label align-self-center mb-0" for="gde">1000g</label></div>
													<input type="text" class="form-control form-control-sm col-md-10 moneda" name="gde" id="gde" />
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<label class="control-label col-md-2 align-self-center mb-0">Observaciones:</label>
											<div class="col-md-6">
												<div class="row">
													<input type="text" id="observaciones" name="observaciones" class="form-control form-control-sm" maxlength="1000" placeholder="Observaciones" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="container-fluid row"><hr class="col-sm-12"></div>
								<div class="col-12 mx-auto pb-2">
									<button type="submit" class="btn btn-narsa ml-1 mr-4" id="btnRegistrar">Guardar Registro</button>
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
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="font-size:14px">&times;</span></button>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<div class="row">
											<div class="col-12 mx-auto" style="overflow-x:auto">
												<table id="tablaProveedores" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-0" style="width:100%">
													<thead><tr><th>Item</th><th>Nombre del Productor</th><th>nro doc</th><th>finca</th><th>altitud</th></tr></thead>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal registro de proveedores -->
					<div class="modal fade" id="modalRegProveedor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Registrar Productor</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="font-size:14px">&times;</span></button>
								</div>
								<div class="modal-body">
									<?$this->load->view('proveedores/form-new');?>
								</div>
							</div>
						</div>
					</div>