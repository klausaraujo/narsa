						<div class="col-12 card px-0 my-3">
							<div class="card-body">
								<h4 class="">Listado General de Usuarios del Sistema</h4>
								<hr>
								<div class="row justify-content-center py-2">
								<?if($this->session->flashdata('claseMsg')){?><div class="col-sm-5 border border-<?=$this->session->flashdata('claseMsg'); ?> rounded alert alert-dismissible fade show py-0 
											text-center msg text-<?=$this->session->flashdata('claseMsg'); ?>" role="alert">
										<strong class="mx-auto text-center"><?=$this->session->flashdata('flashSuccess'); ?></strong>
										<button type="button" class="close py-0" data-dismiss="alert" aria-label="Close">
											<span aria-hidden="true" class="text-<?=$this->session->flashdata('claseMsg'); ?>">&times;</span>
										</button>
									</div><?}?>
									<div class="col-md-12 text-center resp" style="font-size:1.3em">&nbsp;</div>
								</div>
								<div class="container-fluid">
									<div class="row">
										<div class="table-responsive" style="overflow-x:scroll">
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
															</ul>
															<div class="tab-content mt-3">
																<div id="proveedores" class="tab-pane fade in active show">
																	<!--<div class="clearfix"></div>-->
																	<div class="row my-2">
																		<h5 class="my-2 ml-3 font-weight-bold">Permisos Acciones Proveedores</h5>
																	  <?php foreach($permisos as $row):
																				if($row->idmodulo === '1'){
																		?>
																		<div class="checkbox checkbox-primary col-12">
																			<input type="checkbox" name="proveedoresPer[]" value="<?=$row->idpermiso?>" />
																			<label for="proveedoresPer">&nbsp;&nbsp;<?=$row->descripcion?></label>
																		</div>
																		<?php
																				}
																			endforeach;?>
																	</div>
																</div>
																<div id="usuarios" class="tab-pane fade in">
																	<div class="row my-2">
																		<h5 class="my-2 ml-3 font-weight-bold">Permisos Acciones Usuarios</h5>
																	  <?php foreach($permisos as $row):
																				if($row->idmodulo === '4'){
																		?>
																		<div class="checkbox checkbox-primary col-12">
																			<input type="checkbox" name="usuariosPer[]" value="<?=$row->idpermiso?>" />
																			<label for="usuariosPer">&nbsp;&nbsp;<?=$row->descripcion?></label>
																		</div>
																		<?php
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