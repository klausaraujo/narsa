<?					
					$usuario = json_decode($this->session->userdata('user'));
					if($this->uri->segment(2) === 'reporte1'){ ?>
						<div class="col-12 card px-0 my-3">
							<div class="card-body">
								<h4 class="">Reporte1</h4>
								<hr>
								<div class="row">
									<div class="col-md-11 mx-auto">
										<div class="row">
											<div class="col-md-3">
												<label class="control-label align-self-center mb-0 text-left" for="sucursal">&nbsp;&nbsp;&nbsp;Sucursal:</label>
												<select class="form-control form-control-sm sucursal" name="sucursal" id="sucursal">
												<? foreach($usuario->sucursales as $row): ?>
													<option value="<?=$row->idsucursal;?>"><?=$row->sucursal;?></option>	
												<? endforeach;	?>
												</select>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<!--<div class="container-fluid">-->
									<div class="row"> <!--class="table-responsive" -->
										<div class="col-12 mx-auto" style="overflow-x:auto">
											<table id="tablaReporte1" class="table table-striped table-hover table-bordered mb-0 mx-auto" style="width:100%"></table>
										</div>
									</div>
								</div>
							<!--</div>-->
						</div>
<?					}elseif($this->uri->segment(2) === 'reporte2'){}
?>