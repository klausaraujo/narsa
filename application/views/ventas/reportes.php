					<?
						$usuario = json_decode($this->session->userdata('user'));
						$titulo = 'Reporte de Ventas';
					?>
					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4><?=$titulo?></h4></div>
						</div>
						<div class="iq-card-body">
							<div class="row">
								<div class="col-md-3">
									<div class="row">
										<label class="control-label col-md-5 align-self-center mb-0 text-left">Sucursal:</label>
										<div class="col-md-7">
											<select class="form-control form-control-sm sucursal">
											<? foreach($usuario->sucursales as $row): ?>
												<option value="<?=$row->idsucursal;?>"><?=$row->sucursal;?></option>	
											<? endforeach;	?>
											</select>
										</div>
									</div>
								</div>									
								<div class="col-md-3">
									<div class="row">
										<label class="control-label col-md-4 align-self-center mb-0">Desde:</label>
										<div class="col-md-8">
											<input class="form-control form-control-sm desde" type="date" 
													max="<?=date('Y-m-d')?>" value="<?=date('Y-m-d')?>" />
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row">
										<label class="control-label col-md-4 align-self-center mb-0">Hasta:</label>
										<div class="col-md-8">
											<input class="form-control form-control-sm hasta" type="date" 
													max="<?=date('Y-m-d')?>" value="<?=date('Y-m-d')?>" />
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-3">
									<div class="row">
										<label class="control-label col-md-5 align-self-center mb-0 text-left">Tipo Op.:</label>
										<div class="col-md-7">
											<select class="form-control form-control-sm tipoop">
												<option value=""> -- Seleccione -- </option>
											<? foreach($tipo as $row): ?>
												<option value="<?=$row->idtipooperacion;?>"><?=$row->tipo_operacion;?></option>	
											<? endforeach;	?>
											</select>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="row">
										<label class="control-label col-md-5 align-self-center mb-0 text-left">Medio de Pago:</label>
										<div class="col-md-7">
											<select class="form-control form-control-sm mediopago">
												<option value=""> -- Seleccione -- </option>
											<? foreach($medio as $row): ?>
												<option value="<?=$row->idmediopago;?>"><?=$row->medio_pago;?></option>	
											<? endforeach;	?>
											</select>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row">
										<label class="control-label col-md-4 align-self-center mb-0 text-left">Status:</label>
										<div class="col-md-8">
											<select class="form-control form-control-sm status">
												<option value=""> -- Seleccione -- </option>
												<option value="0">Pendiente</option>
												<option value="1">Liquidado</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-md-2 px-0">
									<a type="button" class="btn btn-narsa align-self-center text-white generar">Generar Reporte</a>
								</div>
							</div>
							<hr>
							<div class="col-12">
								<div class="col-md-3">
									<a href="#" class="btn btn-success align-self-center ml-1 exportar" id="excel" title="Exportar a EXCEL" >
										<i class="fa fa-file-excel-o mr-0" aria-hidden="true" style="font-size:1.2em"></i>
									</a>
								</div>
							</div>
							<div class="col-12 mx-auto mt-md-2" style="overflow-x:auto">
								<table id="tablareportesventas" class="table table-striped table-hover table-bordered mb-0 mx-auto" style="width:100%"></table>
							</div>
						</div>
					</div>