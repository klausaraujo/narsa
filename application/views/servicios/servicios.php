						<? $usuario = json_decode($this->session->userdata('user')); ?>
						<div class="col-12 card px-0 my-3">
							<div class="card-body">
								<h4 class="">Listado General de Movimientos de Caja</h4>
								<hr>
								<div class="row justify-content-center py-2">
									<?if($this->session->flashdata('claseMsg')){?><div class="alert <?=$this->session->flashdata('claseMsg')?> py-1 px-5 msg fade show" role="alert">
										<div class="iq-alert-text"><?=$this->session->flashdata('flashMessage')?></div>
									</div><?}?>
								</div>
								<div class="row">
									<div class="col-md-10 mx-auto">
										<div class="row">
											<label class="control-label col-md-1 align-self-center mb-0 text-right" for="anio">A&ntilde;o:</label>
											<div class="col-md-2">
												<select class="form-control form-control-sm anio" name="anio" id="anio">
												<? foreach($anio as $row): ?>
													<option value="<?=$row->anio?>" <?=date('Y') === $row->anio? 'selected' : '';?> ><?=$row->anio;?></option>	
												<? endforeach;	?>
												</select>
											</div>
											<label class="control-label col-md-2 align-self-center mb-0 text-center" for="mes">Mes:</label>
											<div class="col-md-2">
												<select class="form-control form-control-sm mes" name="mes" id="mes">
												<? foreach($mes as $row): ?>
													<option value="<?=$row->idmes;?>" <?=date('n') === $row->idmes? 'selected' : '';?> ><?=$row->mes;?></option>
												<? endforeach;	?>
												</select>
											</div>
											<label class="control-label col-md-2 align-self-center mb-0 text-center" for="sucursal">Sucursal:</label>
											<div class="col-md-2 px-0">
												<select class="form-control form-control-sm sucursal" name="sucursal" id="sucursal">
												<? foreach($usuario->sucursales as $row): ?>
													<option value="<?=$row->idsucursal;?>"><?=$row->sucursal;?></option>	
												<? endforeach;	?>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="container-fluid mt-4">
									<div class="row">
										<div style="overflow-x:hidden" class="col-12"> <!--class="table-responsive" -->
										<!--<div class="col-sm-12 mx-auto" style="overflow-x:scroll"><!--align-items-center text-center-->
											<table id="tablaServicios" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto"></table>
										</div>
									</div>
								</div>
							</div>
						</div>