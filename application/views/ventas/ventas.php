					<? $usuario = json_decode($this->session->userdata('user')); ?>
					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4><b><?=ucwords(strtolower($this->input->get('name')))?></b> (Ventas)</h4></div>
						</div>
						<div class="iq-card-body">
							<!--<div class="row">-->
								<!-- Nav pills -->
								<div class="nav nav-pills row" id="nav-tab" role="tablist">
									<a class="nav-item nav-link col-lg-3 col-12 col-md-4 text-center active" data-toggle="tab" href="#pill-salidas">Gesti&oacute;n de Ventas</a>
								</div>
							<!--</div>-->
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active mx-auto" id="pill-salidas">
									<div class="row container mx-auto">
										<div class="col-md-11 mt-4">
											<button type="button" data-toggle="modal" class="btn btn-narsa d-flex ml-auto" id="modalVtas" data-target="#modalVentas">Nueva Venta</button>
										</div>
									</div>
									<div class="col-md-12 text-center pt-2 resp" style="font-size:1.3em">&nbsp;</div>
									<div class="container-fluid my-2">
										<div class="row">
											<div class="col-12 mx-auto" style="overflow-x:auto">
												<table id="tablaVentas" class="table table-striped table-hover table-bordered mb-0 mx-auto" style="width:100%"></table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			
					<div class="modal fade" id="modalVentas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-ing" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Salida de Productos</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="modal-body" style="overflow: hidden;">
									<form method="post" id="form_salidas">
										<div class="row">
											<div class="col-md-11 mx-auto">
												<div class="row mt-2">
													<div class="col-md-2 centraVert"><label for="clienteSalida" class="col-12">Cliente:</label></div>
													<div class="col-md-4">
														<input type="text" class="form-control col-12" value="<?=ucwords(strtolower($this->input->get('name')))?>"
															name="clienteSalida" id="clienteSalida" readonly />
													</div>
													<div class="col-md-2 centraVert"><label for="sucursalSal" class="col-12">Sucursal:</label></div>
													<div class="col-md-4">
														<select class="form-control col-12" name="sucursalSal" id="sucursalSal">
													<?
														foreach($usuario->sucursales as $row):	?>
															<option value="<?=$row->idsucursal;?>"><?=$row->sucursal;?></option>
													<?	endforeach;	?>
														</select>
													</div>
												</div>
												<div class="row my-4">
													<div class="col-md-2 centraVert"><label for="obsSal" class="col-12">Observaciones:</label></div>
													<div class="col-md-10">
														<input type="text" class="form-control mayusc" name="obsSal" id="obsSal" autocomplete="off" placeholder="Observaciones" />
													</div>
												</div>
												<div class="row my-4">
													<div class="col-md-2 centraVert"><label for="articulo" class="col-12">Producto:</label></div>
													<div class="col-md-4">
														<select class="form-control col-12" name="articuloSal" id="articuloSal">
															<option value="">--Seleccione--</option>
														<?
														foreach($articulos as $row):	?>
															<option value="<?=$row->idarticulo;?>"><?=$row->articulo;?></option>
														<?	endforeach;	?>
														</select>
													</div>
													<div class="col-md-3 centraVert"><label for="cantidadSal" class="col-md-9 pull-right">Cantidad KG:</label></div>
													<div class="col-md-3">
														<input type="text" class="form-control moneda" name="cantidadSal" id="cantidadSal" autocomplete="off" placeholder="0.00" />
													</div>
												</div>
												<div class="row my-4">
													<div class="col-md-2 centraVert pr-0"><label for="humedadSal" class="col-12">Humedad (%):</label></div>
													<div class="col-md-4">
														<input type="text" class="form-control col-md-9 moneda" name="humedadSal" id="humedadSal" autocomplete="off" placeholder="0.00" />
													</div>
													<div class="col-md-3 centraVert"><label for="calidadSal" class="col-12">Calidad RDTO(%):</label></div>
													<div class="col-md-3">
														<input type="text" class="form-control moneda" name="calidadSal" id="calidadSal" autocomplete="off" placeholder="0.00" />
													</div>
												</div>
												<div class="row my-4">
													<div class="col-md-2 centraVert pr-0"><label for="tasaSal" class="col-12">Tasa (Pts.):</label></div>
													<div class="col-md-4">
														<input type="text" class="form-control col-md-9 moneda" name="tasaSal" id="tasaSal" autocomplete="off" placeholder="0.00" />
													</div>
												</div>
												
												<div class="row my-4">
													<div class="col-md-2 centraVert">
														<div class="custom-control custom-switch col-12 pr-0">
															<input type="checkbox" class="custom-control-input" name="valorizaIng" id="valorizaIng">
															<label class="custom-control-label" for="valorizaIng">Valorizar</label>
														</div>
													</div>
													<div class="col-md-2 centraVert"><label for="cantidadValoriz" class="col-12">Cantidad:</label></div>
													<div class="col-md-3">
														<input type="text" class="form-control col-12 moneda" name="cantidadValoriz" id="cantidadValoriz" autocomplete="off" placeholder="0.00" disabled />
													</div>
													<div class="col-md-2 centraVert"><label for="costoValoriz" class="col-12">Costo:</label></div>
													<div class="col-md-3">
														<input type="text" class="form-control col-12 moneda" name="costoValoriz" id="costoValoriz" placeholder="0.00" autocomplete="off" />
													</div>
												</div>
												<div class="row mt-2">
													<div class="col-md-2">
														<input type="submit" class="btn btn-narsa d-flex ml-auto col-12 justify-content-center" id="btnAgregarIngDetalle" value="Agregar"/>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="container-fluid">
									<div class="row mx-2">
										<div class="col-12" style="overflow-x:auto">
											<table id="tablaSalDetalle" class="table table-striped table-hover table-bordered mb-0 mx-auto" style="width:100%"></table>
										</div>
									</div>
								</div>
								<div class="modal-body">
									<form id="formPagoSalida">
										<div class="row">
											<div class="col-md-11 mx-auto">
												<div class="row my-4">
													<div class="col-md-3 centraVert">
														<div class="custom-control custom-switch col-12 pr-0">
															<input type="checkbox" class="custom-control-input" name="chkPagoValoriz" id="chkPagoValoriz" disabled >
															<label class="custom-control-label" for="chkPagoValoriz">Generar Pago</label>
														</div>
													</div>
													<div class="col-md-2 centraVert"><label for="pagoValoriz" class="col-12">Cantidad:</label></div>
													<div class="col-md-4">
														<select class="form-control col-md-12 pagoValoriz" name="pagoValoriz" id="pagoValoriz" disabled >
															<option value="2">Pago Total</option>
															<option value="8">Pago Parcial</option>
														</select>
													</div>
												</div>
												<div class="row my-4">
													<div class="col-md-2 centraVert"><label for="subTotalPago" class="col-12">Sub-Total:</label></div>
													<div class="col-md-2">
														<input type="text" class="form-control col-12" name="subTotalPago" id="subTotalPago"
															placeholder="0.00" autocomplete="off" readonly />
													</div>
													<div class="col-md-2 centraVert"><label for="desembolso" class="col-12">Desembolso:</label></div>
													<div class="col-md-3">
														<input type="text" class="form-control col-12 moneda" name="desembolso" id="desembolso" 
															placeholder="0.00" autocomplete="off" disabled />
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
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