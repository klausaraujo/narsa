					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4><b><?=ucwords(strtolower($this->input->get('name')))?></b> (Transacciones Financieras)</h4></div>
						</div>
						<div class="iq-card-body">
							<div class="row">
								<!-- Nav pills -->
								<div class="nav nav-pills" id="nav-tab" role="tablist">
									<a class="nav-item nav-link active" data-toggle="tab" href="#pill-ingresos">Ingresos de Caf&eacute;</a>
									<a class="nav-item nav-link" data-toggle="tab" href="#pill-valorizaciones">Valorizaciones</a>
								</div>
							</div>
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane container active" id="pill-ingresos">
									<div class="row"><h5 class="col-12 my-3">Ingresos</h5></div>
									<form method="post" id="form_ingresos">
										
									</form>
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
							</div>
						</div>
					</div>