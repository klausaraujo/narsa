					<? $usuario = json_decode($this->session->userdata('user')); ?>
					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4><b><?=ucwords(strtolower($this->input->get('name')))?></b> (Transacciones Financieras)</h4></div>
						</div>
						<div class="iq-card-body">
							<div class="row">
								<!-- Nav pills -->
								<div class="nav nav-pills" id="nav-tab" role="tablist">
									<a class="nav-item nav-link active" data-toggle="tab" href="#pill-ingresos">Registro de Operaciones</a>
									<a class="nav-item nav-link" data-toggle="tab" href="#pill-valorizaciones">Valorizaciones</a>
									<a class="nav-item nav-link" data-toggle="tab" href="#pill-3">Tab 3</a>
								</div>
							</div>
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane container active" id="pill-ingresos">
									<form method="post" id="form_ingresos" action="<?=base_url().$this->uri->segment(1).'/';?>transacciones/registrar">
										<input type="hidden" name="idproveedor" id="idproveedor" value="<?=$this->input->get('id')?>"/>
										<div class="row">
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
																<option value="">--Seleccione--</option>
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
															<input type="date" class="form-control col-sm-9 fechavenc" value="2031-01-01" name="fechavenc" id="fechavenc" />
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
											<div class="table-responsive" style="overflow-x:scroll">
											<!--<div class="col-sm-12 mx-auto" style="overflow-x:scroll"><!--align-items-center text-center-->
												<table id="tablaOp" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto"></table>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane container fade" id="pill-valorizaciones">
									<div class="row"><h5 class="col-12 my-3">Valorizaciones</h5></div>
									<form method="post" id="form_valorizaciones">
										
									</form>
									<div class="container-fluid my-2">
										<div class="row">
											<div class="table-responsive" style="overflow-x:scroll">
											<!--<div class="col-sm-12 mx-auto" style="overflow-x:scroll"><!--align-items-center text-center-->
												<table id="tablaValorizaciones" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto"></table>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane container fade" id="pill-3">Tab 3</div>
							</div>
						</div>
					</div>