	<div class="col-12 card px-0 my-3">
		<div class="card-body">		
			<div class="container-fluid">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="row">
                        <div class="col-md-6 col-lg-3">
                           <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                              <div class="iq-card-body iq-bg-primary rounded">
                                 <div class="d-flex align-items-center justify-content-between">
                                    <div class="rounded-circle iq-card-icon bg-primary"><i class="ri-user-fill"></i></div>
                                    <div class="text-right">
                                       <h4 class="mb-0 counter"><?=empty($activos)? 0 : $activos->cantidad?></h4>
                                       <span>Productores Activos<br>(General)</span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                              <div class="iq-card-body iq-bg-warning rounded">
                                 <div class="d-flex align-items-center justify-content-between">
                                    <div class="rounded-circle iq-card-icon bg-warning"><i class="ri-women-fill"></i></div>
                                    <div class="text-right">
                                       <h4 class="mb-0 counter" id="cobrar"><?=empty($cobrar)? '0.00' : $cobrar->monto?></h4>
                                       <span>Acumulado por Cobrar (En Soles)</span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                              <div class="iq-card-body iq-bg-danger rounded">
                                 <div class="d-flex align-items-center justify-content-between">
                                    <div class="rounded-circle iq-card-icon bg-danger"><i class="ri-group-fill"></i></div>
                                    <div class="text-right">
                                       <h4 class="mb-0 counter" id="pagar"><?=empty($pagar)? '0.00' : $pagar->monto?></h4>
                                       <span>Acumulado por Pagar (En Soles)</span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                              <div class="iq-card-body iq-bg-info rounded">
                                 <div class="d-flex align-items-center justify-content-between">
                                    <div class="rounded-circle iq-card-icon bg-info"><i class="ri-hospital-line"></i></div>
                                    <div class="text-right">
                                       <h4 class="mb-0 counter" id="caja"><?=empty($caja)? '0.00' : $caja->saldo?></h4>
                                       <span>Saldo Efectivo Caja (En Soles)</span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3">
						<select class="form-control form-control-sm select" id="sucursal" name="sucursal">
						<?
							foreach($sucursales as $row):	?>
							<option value="<?=$row->idsucursal;?>" <?=$row->idsucursal==='1'? 'selected' : '';?>><?=$row->sucursal;?></option>
						<?	endforeach;	?>
						</select>
					</div>
					<div class="col-md-3">
						<select class="form-control form-control-sm select" id="anio" name="anio">
						<?
							foreach($anios as $row):	?>
							<option value="<?=$row->anio;?>" <?=$row->anio===date('Y')? 'selected' : '';?>><?=$row->anio;?></option>
						<?	endforeach;	?>
						</select>
					</div>
					<div class="col-md-1 spin1"></div>
				</div>
				<hr class="mb-md-0">
				<div class="row">
					<div class="col-lg-6">
						<div class="iq-card">
							<div class="iq-card-header d-flex justify-content-between p-0 bg-white">
								<div class="iq-header-title">
									<h5 class="card-title text-primary ml-3">Cantidad de Art&iacute;culos (En Kilos)</h5>
								</div>
							</div>
							<div class="iq-card-body p-2">
								<div id="estadisticas"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="iq-card">
							<div class="iq-card-header d-flex justify-content-between">
								<div class="iq-header-title">
									<h5 class="card-title">Valorizados y No Valorizados (En Kilos)</h5>
								</div>
							</div>
							<div class="iq-card-body">
								<div id="valorizados"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row"> <!--class="table-responsive" -->
					<div class="col-12 mx-auto" style="overflow-x:auto">
						<table id="tablaDashboard" class="table table-striped table-hover table-bordered mb-0 mx-auto" style="width:100%"></table>
					</div>
				</div>
			</div>
		</div>
	</div>