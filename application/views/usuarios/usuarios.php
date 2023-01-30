						<div class="col-12 card px-0 my-3">
							<div class="card-body">
								<h4 class="">Listado General de Usuarios del Sistema</h4>
								<hr>
								<div class="row justify-content-center">
									<?if($this->session->flashdata('claseMsg')){?><div class="alert <?=$this->session->flashdata('claseMsg')?> py-1 px-5 msg fade show" role="alert">
										<div class="iq-alert-text"><?=$this->session->flashdata('flashMessage')?></div>
									</div><?}?>
									<div class="col-md-12 text-center resp" style="font-size:1.3em">&nbsp;</div>
								</div>
								<div class="container-fluid">
									<div class="row">
										<div class="table-responsive" style="col-12">
										<!--<div class="col-sm-12 mx-auto" style="overflow-x:scroll"><!--align-items-center text-center-->
											<table id="tablaUsuarios" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto"></table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal Permisos -->
						<div class="modal fade" id="modalPermisos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">Asignar Permisos</h4>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<form method="POST" id="form_permisos">
										<input type="hidden" id="idusuarioPer" name="idusuarioPer" value="" />
										<div class="modal-body" style="overflow: hidden;">
											<div class="row col-sm-12">
												<div class="container">
													<div class="row">
														<div class="col-sm-12">
															<ul class="nav nav-tabs" role="tablist">
																<li class="nav-item"><a aria-selected="true" class="nav-link active" role="tab" data-toggle="tab" href="#proveedores">Proveedores</a></li>
																<li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#usuarios">Usuarios</a></li>
																<li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#cajas">Cajas</a></li>
																<li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#certificados">Certificaciones</a></li>
															</ul>
															<div class="tab-content mt-3">
																<div id="proveedores" class="tab-pane fade in active show">
																	<!--<div class="clearfix"></div>-->
																	<div class="row my-2">
																		<h5 class="my-2 ml-3 font-weight-bold">Permisos Acciones Proveedores</h5>
																	  <?php 
																			$i = 1;
																			foreach($permisos as $row):
																				if($row->idmodulo === '1'){
																		?>
																		<div class="custom-control custom-switch col-12 ml-3">
																			<input type="checkbox" class="custom-control-input" name="proveedoresPer[]" value="<?=$row->idpermiso?>" id="checkPermisos<?=$i?>">
																			<label class="custom-control-label" for="checkPermisos<?=$i?>">&nbsp;&nbsp;<?=$row->descripcion?></label>
																		</div>
																		<!--<div class="checkbox checkbox-primary col-12">
																			<input type="checkbox" name="proveedoresPer[]" value="" />
																			<label for="proveedoresPer">&nbsp;&nbsp;</label>
																		</div>-->
																		<?php
																					$i++;
																				}
																			endforeach;?>
																	</div>
																</div>
																<div id="usuarios" class="tab-pane fade in">
																	<div class="row my-2">
																		<h5 class="my-2 ml-3 font-weight-bold">Permisos Acciones Usuarios</h5>
																	  <?php
																			$i = 1;
																			foreach($permisos as $row):
																				if($row->idmodulo === '4'){
																		?>
																		<div class="custom-control custom-switch col-12 ml-3">
																			<input type="checkbox" class="custom-control-input" name="usuariosPer[]" value="<?=$row->idpermiso?>" id="checkAccionesUser<?=$i?>">
																			<label class="custom-control-label" for="checkAccionesUser<?=$i?>">&nbsp;&nbsp;<?=$row->descripcion?></label>
																		</div>
																		<!--<div class="checkbox checkbox-primary col-12">
																			<input type="checkbox" name="usuariosPer[]" value="" />
																			<label for="usuariosPer">&nbsp;&nbsp;</label>
																		</div>-->
																		<?php
																					$i++;
																				}
																			endforeach;?>
																	</div>
																</div>
																<div id="cajas" class="tab-pane fade in">
																	<div class="row my-2">
																		<h5 class="my-2 ml-3 font-weight-bold">Permisos Acciones Cajas</h5>
																	  <?php
																			$i = 1;
																			foreach($permisos as $row):
																				if($row->idmodulo === '2'){
																		?>
																		<div class="custom-control custom-switch col-12 ml-3">
																			<input type="checkbox" class="custom-control-input" name="cajasPer[]" value="<?=$row->idpermiso?>" id="checkAccionesCaja<?=$i?>">
																			<label class="custom-control-label" for="checkAccionesCaja<?=$i?>">&nbsp;&nbsp;<?=$row->descripcion?></label>
																		</div>
																		<!--<div class="checkbox checkbox-primary col-12">
																			<input type="checkbox" name="usuariosPer[]" value="" />
																			<label for="usuariosPer">&nbsp;&nbsp;</label>
																		</div>-->
																		<?php
																					$i++;
																				}
																			endforeach;?>
																	</div>
																</div>
																<div id="certificados" class="tab-pane fade in">
																	<div class="row my-2">
																		<h5 class="my-2 ml-3 font-weight-bold">Permisos Certificaciones</h5>
																	  <?php
																			$i = 1;
																			foreach($permisos as $row):
																				if($row->idmodulo === '3'){
																		?>
																		<div class="custom-control custom-switch col-12 ml-3">
																			<input type="checkbox" class="custom-control-input" name="certPer[]" value="<?=$row->idpermiso?>" id="checkCert<?=$i?>">
																			<label class="custom-control-label" for="checkCert<?=$i?>">&nbsp;&nbsp;<?=$row->descripcion?></label>
																		</div>
																		<!--<div class="checkbox checkbox-primary col-12">
																			<input type="checkbox" name="usuariosPer[]" value="" />
																			<label for="usuariosPer">&nbsp;&nbsp;</label>
																		</div>-->
																		<?php
																					$i++;
																				}
																			endforeach;?>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="row">
												<div class="col-md-12">
													<button class="btn btn-narsa mr-3" data-dismiss="modal" id="cancelPer">Cancelar</button>
													<button type="submit" class="btn btn-narsa" data-dismiss="modal" id="asignarPer">Asignar Permisos</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- Modal Sucursales -->
						<div class="modal fade" id="modalSucursales" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">Asignar Sucursales</h4>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<form method="POST" id="form_sucursales">
										<input type="hidden" id="idusuarioSuc" name="idusuarioSuc" value="" />
										<div class="modal-body" style="overflow: hidden;">
											<div class="row col-sm-12">
												<div class="container">
													<div class="row">
														<div class="col-sm-12">
															<div class="row my-2">
															  <?php
																	$i = 1;
																	foreach($sucursales as $row): ?>
																<div class="custom-control custom-switch col-12 ml-3">
																	<input type="checkbox" class="custom-control-input" name="usuariosSuc[]" value="<?=$row->idsucursal?>" id="checkSucursal<?=$i?>">
																	<label class="custom-control-label" for="checkSucursal<?=$i?>">&nbsp;&nbsp;<?=$row->sucursal?></label>
																</div>
																<!--<div class="checkbox checkbox-primary col-12">
																	<input type="checkbox" name="usuariosSuc[]" value="" />
																	<label for="usuariosSuc">&nbsp;&nbsp;</label>
																</div>-->
																<?php 
																		$i++;
																	endforeach; ?>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="row">
												<div class="col-md-12">
													<button class="btn btn-narsa mr-3" data-dismiss="modal" id="cancelSuc">Cancelar</button>
													<button type="submit" class="btn btn-narsa" data-dismiss="modal" id="asignarSuc">Asignar Sucursales</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>