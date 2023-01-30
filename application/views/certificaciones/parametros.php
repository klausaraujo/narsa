					<? $usuario = json_decode($this->session->userdata('user')); ?>
					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4><b><?=ucwords(strtolower($proveedor->nombre))?></b> (Certificaciones)</h4></div>
						</div>
						<div class="iq-card-body">
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
									<form method="post" id="form_fisico" action="<?=base_url().$this->uri->segment(1)?>/parametros/fisico">
										<input type="hidden" class="idproveedor" name="idproveedor" value="<?=$proveedor->idproveedor?>" />
										<div class="row container">
											<div class="col-12">
												<div class="form-row">
													
												</div>
											</div>
										</div>
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
						<hr>
						<div class="iq-card-footer mb-3">
							<div class="row">
								<div class="col-md-12">
									<button class="btn btn-narsa btn-cancelar">Volver</button>
								</div>
							</div>
						</div>
					</div>