					<? $usuario = json_decode($this->session->userdata('user')); ?>
					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4><b><?=ucwords(strtolower($proveedor->nombre))?></b> (Certificaciones)</h4></div>
						</div>
						<div class="iq-card-body pb-0">
							<!--<div class="row">
								<!-- Nav pills -->
								<div class="nav nav-pills row" id="nav-tab" role="tablist">
									<a class="nav-item nav-link col-lg-3 col-12 col-md-4 text-center active" data-toggle="tab" href="#pill-fisico">Aspecto F&iacute;sico y Tostado</a>
									<a class="nav-item nav-link col-lg-3 col-12 col-md-4 text-center" data-toggle="tab" href="#pill-conteo">Conteo de Defectos</a>
									<a class="nav-item nav-link col-lg-3 col-12 col-md-4 text-center" data-toggle="tab" href="#pill-sensorial">An&aacute;lisis Sensorial</a>
								</div>
							<!--</div>-->
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane container active" id="pill-fisico">
									<form method="post" id="form_fisico" action="<?=base_url().$this->uri->segment(1)?>/parametros/fisico" class="needs-validation" novalidate>
										<input type="hidden" class="idproveedor" name="idproveedor" value="<?=$proveedor->idproveedor?>" />
										<div class="form-row container-fluid mt-3">
											<div class="col-md-3">
												<label class="control-label mb-0" for="color">&nbsp;&nbsp;&nbsp;Color:</label>
												<select class="form-control color" name="color" id="color">
												<? foreach($color as $row): ?>
													<option value="<?=$row->idcolor;?>" ><?=$row->color;?></option>
												<? endforeach;	?>
												</select>
												<div class="invalid-feedback">Debe elegir un color</div>
											</div>
											<div class="col-md-3">
												<label class="control-label mb-0" for="olor">&nbsp;&nbsp;&nbsp;Olor:</label>
												<select class="form-control olor" name="olor" id="olor">
												<? foreach($olor as $row): ?>
													<option value="<?=$row->idolor;?>" ><?=$row->olor;?></option>
												<? endforeach;	?>
												</select>
												<div class="invalid-feedback">Debe elegir un olor</div>
											</div>
										</div>
										<hr>
										<div class="form-row container-fluid">
											<label class="control-label align-self-center mb-0 col-md-3 mr-md-2" for="olor"><b>&nbsp;&nbsp;Caf&eacute; Exportable:</b></label>
											<div class="col-md-3">
												<label class="control-label mb-0" for="pesocafe">&nbsp;&nbsp;&nbsp;Peso:</label>
												<input type="text" class="form-control pesoCafe moneda" name="pesoCafe" id="pesoCafe"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
											<div class="col-md-3">
												<label class="control-label mb-0" for="porccafe">&nbsp;&nbsp;&nbsp;(%):</label>
												<input type="text" class="form-control porccafe moneda" name="porccafe" id="porccafe"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
										</div>
										<div class="form-row container-fluid">
											<label class="control-label align-self-center mb-0 col-md-3 mr-md-2" for="pesoProd"><b>&nbsp;&nbsp;Sub Producto:</b></label>
											<div class="col-md-3">
												<label class="control-label mb-0" for="pesoProd">&nbsp;&nbsp;&nbsp;Peso:</label>
												<input type="text" class="form-control pesoProd moneda" name="pesoProd" id="pesoProd"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
											<div class="col-md-3">
												<label class="control-label mb-0" for="porcProd">&nbsp;&nbsp;&nbsp;(%):</label>
												<input type="text" class="form-control porcProd moneda" name="porcProd" id="porcProd"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
										</div>
										<div class="form-row container-fluid">
											<label class="control-label align-self-center mb-0 col-md-3 mr-md-2" for="pesoDesc"><b>&nbsp;&nbsp;Descarte:</b></label>
											<div class="col-md-3">
												<label class="control-label mb-0" for="pesoDesc">&nbsp;&nbsp;&nbsp;Peso:</label>
												<input type="text" class="form-control pesoDesc moneda" name="pesoDesc" id="pesoDesc"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
											<div class="col-md-3">
												<label class="control-label mb-0" for="porcDesc">&nbsp;&nbsp;&nbsp;(%):</label>
												<input type="text" class="form-control porcDesc moneda" name="porcDesc" id="porcDesc"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
										</div>
										<div class="form-row container-fluid">
											<label class="control-label align-self-center mb-0 col-md-3 mr-md-2" for="pesoCas"><b>&nbsp;&nbsp;C&aacute;scara:</b></label>
											<div class="col-md-3">
												<label class="control-label mb-0" for="pesoCas">&nbsp;&nbsp;&nbsp;Peso:</label>
												<input type="text" class="form-control pesoCas moneda" name="pesoCas" id="pesoCas"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
											<div class="col-md-3">
												<label class="control-label mb-0" for="porcCas">&nbsp;&nbsp;&nbsp;(%):</label>
												<input type="text" class="form-control porcCas moneda" name="porcCas" id="porcCas"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
										</div>
										<hr>
										<div class="form-row container-fluid mt-3">
											<div class="col-md-3">
												<label class="control-label mb-0" for="apariencia">&nbsp;&nbsp;&nbsp;Apariencia:</label>
												<select class="form-control apariencia" name="apariencia" id="apariencia">
												<? foreach($apariencia as $row): ?>
													<option value="<?=$row->idapariencia;?>" ><?=$row->apariencia;?></option>
												<? endforeach;	?>
												</select>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
											<div class="col-md-3">
												<label class="control-label mb-0" for="quaker">&nbsp;&nbsp;&nbsp;Quaker:</label>
												<select class="form-control quaker" name="quaker" id="quaker">
												<? foreach($quaker as $row): ?>
													<option value="<?=$row->idquaker;?>" ><?=$row->quaker;?></option>
												<? endforeach;	?>
												</select>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
										</div>
										<hr>
										<div class="form-row container-fluid">
											<div class="col-md-3">
												<label class="control-label mb-0" for="tiempoTost">&nbsp;&nbsp;&nbsp;Tiempo de Tostado:</label>
												<input type="text" class="form-control tiempoTost" name="tiempoTost" id="tiempoTost"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
											<div class="col-md-3">
												<label class="control-label mb-0" for="colorAg">&nbsp;&nbsp;&nbsp;Color(agtron):</label>
												<input type="text" class="form-control colorAg moneda" name="colorAg" id="colorAg"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
											<div class="col-md-3">
												<label class="control-label mb-0" for="porcPerdida">&nbsp;&nbsp;&nbsp;(%) P&eacute;rdida:</label>
												<input type="text" class="form-control porcPerdida moneda" name="porcPerdida" id="porcPerdida"/>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
										</div>
										<div class="col-md-12 text-center pt-2 resp" style="font-size:1.3em">&nbsp;</div>
										<div class="modal-footer">
											<div class="row">
												<div class="col-md-12">
													<button class="btn btn-narsa" id="guardafisico">Guardar Par&aacute;metro</button>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane container fade" id="pill-conteo">
									<form method="post" id="form_conteo" action="<?=base_url().$this->uri->segment(1)?>/parametros/conteo">
										<input type="hidden" class="idproveedor" name="idproveedor" value="<?=$proveedor->idproveedor?>" />
										<div class="row container">
											<div class="col-12">
												<div class="form-row">
													
												</div>
											</div>
										</div>
										<div class="col-md-12 text-center pt-2 resp" style="font-size:1.3em">&nbsp;</div>
										<div class="modal-footer">
											<div class="row">
												<div class="col-md-12">
													<button class="btn btn-narsa" id="guardaConteo">Guardar Par&aacute;metro</button>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane container fade" id="pill-sensorial">
									<form method="post" id="form_sensorial" action="<?=base_url().$this->uri->segment(1)?>/parametros/sensorial">
										<input type="hidden" class="idproveedor" name="idproveedor" value="<?=$proveedor->idproveedor?>" />
										<div class="row container">
											<div class="col-12">
												<div class="form-row">
													
												</div>
											</div>
										</div>
										<div class="col-md-12 text-center pt-2 resp" style="font-size:1.3em">&nbsp;</div>
										<div class="modal-footer">
											<div class="row">
												<div class="col-md-12">
													<button class="btn btn-narsa" id="guardaSensorial">Guardar Par&aacute;metro</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<hr class="mt-0">
						<div class="iq-card-footer mb-3">
							<div class="row">
								<div class="col-md-12">
									<button class="btn btn-narsa btn-cancelar">Volver</button>
								</div>
							</div>
						</div>
					</div>