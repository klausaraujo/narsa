<?					
					$usuario = json_decode($this->session->userdata('user'));
					$titulo = '';
					if($this->uri->segment(2) === 'reporte8') $titulo = 'Reportes Complementarios';
					
					$tabs = array('articulos','valorizados');
?>
					<div class="col-12 card px-0 my-3">
						<div class="card-body">
							<h4 class=""><?=$titulo?></h4>
							<ul class="nav nav-tabs" id="tabsReportes" role="tablist">
							<?
								$i = 0;
								for($i = 0;$i < count($tabs);$i++){?>
								<li class="nav-item">
									<a class="nav-link <?=$i===0? 'active':'';?>" id="tab<?=$i?>" data-toggle="tab" href="#<?=$tabs[$i]?>" role="tab" 
											aria-controls="<?=$tabs[$i]?>" aria-selected="true"><?=ucfirst($tabs[$i])?></a>
								</li>
							<? } ?>
							</ul>
							<div class="tab-content" id="tabs">
							<?
								$i = 0;
								for($i = 0;$i < count($tabs);$i++){
							?>
								<div class="tab-pane fade <?=$i===0? 'active show':''?>" id="<?=$tabs[$i]?>" role="tabpanel" aria-labelledby="<?=$tabs[$i]?>">
									<input type="hidden" id="hide<?=$tabs[$i]?>" value="<?=$tabs[$i]?>" class="hidden tabhide" />
									<div class="row">
										<div class="col-md-11 mx-auto">
											<div class="row">
												<div class="col-md-3">
													<div class="row">
														<label class="control-label col-md-5 align-self-center mb-0 text-left ">Sucursal:</label>
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
												<!--<div class="col-md-3">
													<div class="row">
														<label class="control-label col-md-4 align-self-center mb-0">Costo:</label>
														<div class="col-md-5">
															<input type="number" class="form-control form-control-sm costo blur" />
														</div>
													</div>
												</div>-->
											</div>
											<div class="row mt-3">
												<div class="col-md-4">
													<div class="row">
														<label class="control-label col-md-4 align-self-center mb-0 text-left">Art&iacute;culo:</label>
														<div class="col-md-8">
															<select class="form-control form-control-sm articulo">
																<option value="">-- Seleccione --</option>
															<? foreach($articulos as $row): ?>
																<option value="<?=$row->idarticulo;?>"><?=$row->articulo;?></option>	
															<? endforeach;	?>
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-3 px-0">
													<a type="button" class="btn btn-narsa align-self-center text-white generar">Generar Reporte</a>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="container-fluid">
										<div class="row"> <!--class="table-responsive" -->
											<!--<a href="#" class="btn btn-danger align-self-center ml-3 exportar" id="pdf" target="_blank" title="Exportar a PDF" >
												<i class="fa fa-file-pdf-o mr-0" aria-hidden="true" style="font-size:1.2em"></i>
											</a>-->
											<div class="col-md-3">
												<a href="#" class="btn btn-success align-self-center ml-1 exportar" id="excel" title="Exportar a EXCEL" >
													<i class="fa fa-file-excel-o mr-0" aria-hidden="true" style="font-size:1.2em"></i>
												</a>
											</div>
											<div class="col-md-3 d-flex ml-auto ocultar">
												<span>Total Kg:</span>&nbsp;&nbsp; 
												<div class="alert alert-success kg" style="padding:0 10px">
												<?
													if($tabs[$i] === 'articulos') echo number_format($tot1,2,'.',',');
													elseif($tabs[$i] === 'valorizados') echo number_format($tot2,2,'.',',');
												?>
												</div>
											</div>
											<div class="col-md-3 d-flex ml-auto ocultar">
												<span>Precio Promedio:</span>&nbsp;&nbsp;
												<div class="alert alert-success prom" style="padding:0 10px">
												<?
													if($tabs[$i] === 'articulos') echo number_format($prom1,2,'.',',');
													elseif($tabs[$i] === 'valorizados') echo number_format($prom2,2,'.',',');
												?>
												</div>
											</div>
											<div class="col-12 mx-auto mt-md-2" style="overflow-x:auto">
												<table id="tabla<?=ucfirst($tabs[$i])?>" class="table table-striped table-hover table-bordered mb-0 mx-auto" style="width:100%"></table>
											</div>
										</div>
									</div>
								</div>
							<? } ?>
							</div>
						</div>
					</div>