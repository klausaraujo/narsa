					<? $usuario = json_decode($this->session->userdata('user')); ?>
					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4><b><?=ucwords(strtolower($this->input->get('name')))?></b> (Transacciones Financieras)</h4></div>
						</div>
						<div class="iq-card-body">
							<div class="row">
								<!-- Nav pills -->
								<div class="nav nav-pills" id="nav-tab" role="tablist">
									<a class="nav-item nav-link active" data-toggle="tab" href="#pill-operaciones">Registro de Operaciones</a>
									<a class="nav-item nav-link" data-toggle="tab" href="#pill-ingresos">Ingreso de Productos</a>
									<a class="nav-item nav-link" data-toggle="tab" href="#pill-valorizaciones">Valorizaci&oacute;n de Productos</a>
								</div>
							</div>
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active mx-auto" id="pill-operaciones">
									<form method="post" id="form_transacciones" action="<?=base_url().$this->uri->segment(1).'/';?>transacciones/operaciones">
										<input type="hidden" name="idproveedor" id="idproveedor" value="<?=$this->input->get('id')?>"/>
										<div class="row container mx-auto">
											<div class="col-10 mx-auto">
												<div class="row">
													<div class="col-sm-6 mt-4">
														<div class="row">
															<span class="col-12" style="display:flex;align-items:center"><label for="tipoop">Tipo de Operaci&oacute;n:</label></span>
														</div>
														<div class="row">
															<!--1,2,3,5,6,8-->
															<select class="form-control col-sm-11 tipoop" name="tipoop" id="tipoop">
																<option value="">--Seleccione--</option>
														<?
														foreach($tipo_op as $row):
														?>
																<option value="<?=$row->idtipooperacion;?>"><?=$row->tipo_operacion;?></option>	
														<?
														endforeach;	?>
															</select>
														</div>
													</div>
													<div class="col-sm-6 mt-4">
														<div class="row">
															<span class="col-12" style="display:flex;align-items:center"><label for="sucursal">Sucursal:</label></span>
														</div>
														<div class="row">
															<select class="form-control col-sm-9 sucursal" name="sucursal" id="sucursal">
														<?
														foreach($usuario->sucursales as $row):	?>
																<option value="<?=$row->idsucursal;?>"><?=$row->sucursal;?></option>
													<?	endforeach;	?>
															</select>
														</div>
													</div>
													<div class="col-sm-6 mt-4">
														<div class="row">
															<span class="col-12" style="display:flex;align-items:center"><label for="fechavenc">Fecha de Vencimiento:</label></span>
														</div>
														<div class="row">
															<input type="date" class="form-control col-sm-9 fechavenc" value="<?=date('Y-m-d')?>" name="fechavenc" id="fechavenc" />
														</div>
													</div>
													<div class="col-sm-6 mt-4">
														<div class="row">
															<span class="col-12" style="display:flex;align-items:center"><label for="monto">Monto Operaci&oacute;n:</label></span>
														</div>
														<div class="row">
															<input type="text" class="form-control col-sm-7 monto" name="monto" id="monto" autocomplete="off" />
															<div class="col-sm-5 ml-auto" style="display:flex;align-items:center">
																<button type="submit" class="btn btn-narsa">Ejecutar</button>
															</div>
															<label id="monto-error" class="form_error" for="monto"></label>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
									<div class="col-md-12 text-center pt-3 resp" style="font-size:1.3em">&nbsp;</div>
									<div class="container-fluid my-2">
										<div class="row">
											<div class="col-12"><a class="btn btn-narsa my-3" href="<?=base_url()?>proveedores/transacciones/informe" target="_blank">Estado de Cuenta</a></div>
											<div class="table-responsive" style="overflow-x:scroll">
											<!--<div class="col-sm-12 mx-auto" style="overflow-x:scroll"><!--align-items-center text-center-->
												<table id="tablaOp" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto"></table>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane container fade" id="pill-ingresos">
									<div class="row container mx-auto">
										<div class="col-10 mx-auto">
											<div class="row">
												<div class="col-md-12 mt-4">
													<!--<label for="btnbuscaIE" class="col-sm-12">&nbsp;</label>-->
													<button type="button" data-toggle="modal" class="btn btn-narsa d-flex ml-auto" id="modalIng" data-target="#modalIngresos">Nuevo Ingreso</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-12 text-center pt-2 resp" style="font-size:1.3em">&nbsp;</div>
									<div class="container-fluid my-2">
										<div class="row">
											<div class="table-responsive" style="overflow-x:scroll">
											<!--<div class="col-sm-12 mx-auto" style="overflow-x:scroll"><!--align-items-center text-center-->
												<table id="tablaIngresos" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto"></table>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane container fade" id="pill-valorizaciones">
									<div class="row container mx-auto">
										<div class="col-10 mx-auto">
											<div class="row">
												<div class="col-md-12 mt-4">
													<!--<label for="btnbuscaIE" class="col-sm-12">&nbsp;</label>-->
													<button type="button" data-toggle="modal" class="btn btn-narsa d-flex ml-auto" id="modalVal" data-target="#modalValorizaciones">Nueva Valorizaci&oacute;n</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-12 text-center pt-2 resp" style="font-size:1.3em">&nbsp;</div>
									<div class="container-fluid my-2">
										<div class="row">
											<div class="table-responsive" style="overflow-x:scroll">
											<!--<div class="col-sm-12 mx-auto" style="overflow-x:scroll"><!--align-items-center text-center-->
												<table id="tablaValorizaciones" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto"></table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			
					<div class="modal fade" id="modalIngresos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Ingreso de Productos</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="modal-body" style="overflow: hidden;">
									<form method="post" id="form_ingresos">
										<div class="row mt-2 mb-4">
											<div class="col-md-11 mx-auto">
												<div class="row">
													<div class="col-md-2"><label for="proveedorIng" class="col-12">Proveedor:</label></div>
													<div class="col-md-4 pb-3">
														<input type="text" class="form-control col-12" value="<?=ucwords(strtolower($this->input->get('name')))?>"
															name="proveedorIng" id="proveedorIng" readonly />
													</div>
													<div class="col-md-2 align-items-center"><label for="sucursalIng" class="col-12">Sucursal:</label></div>
													<div class="col-md-4">
														<select class="form-control col-12 sucursalIng" name="sucursalIng" id="sucursalIng">
													<?
														foreach($usuario->sucursales as $row):	?>
															<option value="<?=$row->idsucursal;?>"><?=$row->sucursal;?></option>
													<?	endforeach;	?>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row my-4">
											<div class="col-md-11 mx-auto">
												<div class="row">
													<div class="col-md-2"><label for="articulo" class="col-12">Producto:</label></div>
													<div class="col-md-3">
														<select class="form-control col-12 articuloIng" name="articuloIng" id="articuloIng">
															<option value="">--Seleccione--</option>
														<?
														foreach($articulos as $row):	?>
															<option value="<?=$row->idarticulo;?>"><?=$row->articulo;?></option>
														<?	endforeach;	?>
														</select>
													</div>
													<div class="col-md-2"><label for="cantidadIng" class="col-12">Cantidad KG:</label></div>
													<div class="col-md-3">
														<input type="text" class="form-control col-12 cantidadIng" name="cantidadIng" id="cantidadIng" autocomplete="off" />
														<label id="errCant" class="form_error" for="cantidadIng"></label>
													</div>
													<div class="col-md-2">
														<input type="submit" class="btn btn-narsa d-flex ml-auto col-lg-12 justify-content-center" id="btnAgregarIngDetalle" value="Agregar"/>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="container-fluid my-2">
									<div class="row">
										<div class="table-responsive">
											<table id="tablaIngDetalle" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto px-0 col-md-9"></table>
										</div>
									</div>
								</div>
								<!--<div class="clearfix"></div>-->
								<div class="modal-footer">
									<div class="row">
										<div class="col-md-12">
											<button class="btn btn-narsa mr-3" data-dismiss="modal" id="cancelIng">Cancelar Operaci&oacute;n</button>
											<button class="btn btn-narsa" id="generarIng">Generar Ingreso</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="modal fade" id="modalValorizaciones" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Valorizaci&oacute;n de Productos</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="modal-body" style="overflow: hidden;">
									<form method="post" id="form_valorizaciones">
										<div class="row mt-2 mb-4">
											<div class="col-md-11 mx-auto">
												<div class="row">
													<div class="col-md-2"><label for="proveedorVal" class="col-12">Proveedor:</label></div>
													<div class="col-md-4 pb-3">
														<input type="text" class="form-control col-12" name="proveedorVal" value="<?=ucwords(strtolower($this->input->get('name')))?>" readonly />
													</div>
													<div class="col-md-2 align-items-center"><label for="sucursalVal" class="col-12">Sucursal:</label></div>
													<div class="col-md-4">
														<select class="form-control col-12 sucursalVal" name="sucursalVal" id="sucursalVal">
													<?
														foreach($usuario->sucursales as $row):	?>
															<option value="<?=$row->idsucursal;?>"><?=$row->sucursal;?></option>
													<?	endforeach;	?>
														</select>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="container-fluid my-2">
									<div class="row">
										<div class="table-responsive">
											<table id="tablaValDetalle" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto px-0 col-11"></table>
										</div>
									</div>
								</div>
								<!--<div class="clearfix"></div>-->
								<div class="modal-footer">
									<div class="row">
										<div class="col-md-12">
											<button class="btn btn-narsa mr-3" data-dismiss="modal" id="cancelVal">Cancelar</button>
											<button class="btn btn-narsa" id="guardaVal">Guardar Valorizaci&oacute;n</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- Modal de Edicion -->
					<div class="modal fade" id="modalEditIngresos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Edici&oacute;n de Productos</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="modal-body" style="overflow: hidden;">
									<form method="post" id="form_editar_ingresos">
										<div class="row mt-2 mb-4">
											<div class="col-md-11 mx-auto">
												<div class="row">
													<div class="col-md-2"><label for="proveedorIng" class="col-12">Proveedor:</label></div>
													<div class="col-md-4 pb-3">
														<input type="text" class="form-control col-12" value="<?=ucwords(strtolower($this->input->get('name')))?>"
															name="proveedorIng" id="proveedorIng" readonly />
													</div>
													<div class="col-md-2 align-items-center"><label for="sucursal" class="col-12">Sucursal:</label></div>
													<div class="col-md-4">
														<select class="form-control col-12 sucursalIng" name="sucursalIng" id="sucursalIng">
													<?
														foreach($usuario->sucursales as $row):	?>
															<option value="<?=$row->idsucursal;?>"><?=$row->sucursal;?></option>
													<?	endforeach;	?>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row my-4">
											<div class="col-md-11 mx-auto">
												<div class="row">
													<div class="col-md-2"><label for="articulo" class="col-12">Producto:</label></div>
													<div class="col-md-3">
														<select class="form-control col-12 articuloIng" name="articuloIng" id="articuloIng">
															<option value="">--Seleccione--</option>
														<?
														foreach($articulos as $row):	?>
															<option value="<?=$row->idarticulo;?>"><?=$row->articulo;?></option>
														<?	endforeach;	?>
														</select>
													</div>
													<div class="col-md-2"><label for="cantidadIng" class="col-12">Cantidad KG:</label></div>
													<div class="col-md-3">
														<input type="text" class="form-control col-12 cantidadIng" name="cantidadIng" id="cantidadIng" autocomplete="off" />
														<label id="errCant" class="form_error" for="cantidadIng"></label>
													</div>
													<div class="col-md-2">
														<input type="submit" class="btn btn-narsa d-flex ml-auto col-lg-12 justify-content-center" id="btnEditarAgGuia" value="Agregar"/>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="container-fluid my-2">
									<div class="row">
										<div class="table-responsive">
											<table id="tablaIngEditarDetalle" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto px-0 col-md-9"></table>
										</div>
									</div>
								</div>
								<!--<div class="clearfix"></div>-->
								<div class="modal-footer">
									<div class="row">
										<div class="col-md-12">
											<button class="btn btn-narsa mr-3" data-dismiss="modal" id="cancelIng">Cancelar Operaci&oacute;n</button>
											<button class="btn btn-narsa" id="editarIng">Generar Ingreso</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>