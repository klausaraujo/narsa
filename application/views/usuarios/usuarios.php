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