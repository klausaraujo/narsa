<? $usuario = json_decode($this->session->userdata('user'));?>
					<div class="col-12 iq-card my-3">
						<div class="iq-card-header d-flex justify-content-between">
							<div class="iq-header-title"><h4><b><?=ucwords(strtolower($proveedor->nombre))?></b> (Certificaciones)</h4></div>
						</div>
						<div class="iq-card-body pb-0">
							<!--<div class="row">
								<!-- Nav pills -->
								<div class="nav nav-pills row" id="nav-tab" role="tablist">
									<a class="nav-item nav-link col-lg-3 col-12 col-md-4 text-center active" data-toggle="tab" href="#pill-fisico">Aspecto F&iacute;sico y Tostado</a>
									<a class="nav-item nav-link col-lg-3 col-12 col-md-4 text-center" data-toggle="tab" href="#pill-conteo">Conteo de Defectos</a>
									<a class="nav-item nav-link col-lg-3 col-12 col-md-4 text-center" data-toggle="tab" href="#pill-sensorial">An&aacute;lisis Sensorial</a>
									<a class="nav-item nav-link col-lg-3 col-12 col-md-4 text-center" data-toggle="tab" href="#pill-catadores">Catadores</a>
								</div>
							<!--</div>-->
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane container active" id="pill-fisico">
									<div class="col-md-12 text-center pt-2 resp" style="font-size:1.3em">&nbsp;</div>
								
									<form method="post" id="form_fisico" action="<?=base_url().$this->uri->segment(1)?>/parametros/fisico" class="form">
										<input type="hidden" class="idproveedor" name="idproveedor" value="<?=$proveedor->idproveedor?>"/>
										<input type="hidden" name="idcertificado" value="<?=$idcertificado?>"/>
										<div class="form-row container-fluid mt-1">
											<div class="col-md-4">
												<label class="control-label mb-0" for="color">&nbsp;&nbsp;&nbsp;Color:</label>
												<select class="form-control color" name="color" id="color">
												<? foreach($color as $row): ?>
													<option value="<?=$row->idcolor;?>" <?=(!empty($detalle) && $detalle->idcolor === $row->idcolor) ? 'selected' : '';?> ><?=$row->color;?></option>
												<? endforeach;	?>
												</select>
											</div>
											<div class="col-md-4">
												<label class="control-label mb-0" for="olor">&nbsp;&nbsp;&nbsp;Olor:</label>
												<select class="form-control olor" name="olor" id="olor">
												<? foreach($olor as $row): ?>
													<option value="<?=$row->idolor;?>" <?=(!empty($detalle) && $detalle->idolor === $row->idolor) ? 'selected' : '';?> ><?=$row->olor;?></option>
												<? endforeach;	?>
												</select>
											</div>
										</div>
										<hr>
										<div class="form-row container-fluid">
											<div class="card col-md-9 col-lg-6 mr-lg-4 mb-4 mb-lg-0">
												<div class="card-header text-center">
													<div class="row"><h5 class="car-title col-12 font-weight-bold">An&aacute;lisis F&iacute;sico</h5></div>
													<div class="row mt-2">
														<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Detalle</h6></div>
														<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Peso</h6></div>
														<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">%</h6></div>
													</div>
												</div>
												<ul class="list-group list-group"><!--list-group-flush-->
													<li class="list-group-item">
														<div class="row">
															<p class="col-4 align-self-center mb-0">Caf&eacute; Exportable</p>
															<div class="col-4">
																<input class="form-control form-control-sm mx-2 moneda" type="text" name="pesocafe" id="pesocafe" 
																	value="<?=!empty($detalle)? $detalle->analisis_cafe_exportable_peso : ''?>" />
															</div>
															<div class="col-4">
																<input class="form-control form-control-sm mx-2 moneda" type="text" name="cafeporc" id="cafeporc"
																	value="<?=!empty($detalle)? $detalle->analisis_cafe_exportable_por : ''?>" />
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="row">
															<p class="col-4 align-self-center mb-0">Sub Producto</p>
															<div class="col-4">
																<input class="form-control form-control-sm mx-2 moneda" type="text" name="pesosub" id="pesosub"
																	value="<?=!empty($detalle)? $detalle->analisis_sub_procuto_peso : ''?>" />
															</div>
															<div class="col-4">
																<input class="form-control form-control-sm mx-2 moneda" type="text" name="subporc" id="subporc"
																	value="<?=!empty($detalle)? $detalle->analisis_sub_procuto_por : ''?>" />
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="row">
															<p class="col-4 align-self-center mb-0">Descarte</p>
															<div class="col-4">
																<input class="form-control form-control-sm mx-2 moneda" type="text" name="pesodesc" id="pesodesc" 
																	value="<?=!empty($detalle)? $detalle->analisis_descarte_peso : ''?>" />
															</div>
															<div class="col-4">
																<input class="form-control form-control-sm mx-2 moneda" type="text" name="descporc" id="descporc"
																	value="<?=!empty($detalle)? $detalle->analisis_descarte_por : ''?>" />
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="row">
															<p class="col-4 align-self-center mb-0">C&aacute;scara</p>
															<div class="col-4">
																<input class="form-control form-control-sm mx-2 moneda" type="text" name="pesocasc" id="pesocasc"
																	value="<?=!empty($detalle)? $detalle->analisis_cascara_peso : ''?>" />
															</div>
															<div class="col-4">
																<input class="form-control form-control-sm mx-2 moneda" type="text" name="cascporc" id="cascporc"
																	value="<?=!empty($detalle)? $detalle->analisis_cascara_por : ''?>" />
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="row">
															<p class="col-4 align-self-center mb-0">Total</p>
															<div class="col-4">
																<input class="form-control form-control-sm mx-2" type="text" name="pesototal" id="pesototal" readonly />
															</div>
															<div class="col-4">
																<input class="form-control form-control-sm mx-2" type="text" name="porctotal" id="porctotal" readonly />
															</div>
														</div>
													</li>
												</ul>
											</div>
											<div class="card col-md-9 col-lg-5">
												<div class="card-header text-center">
													<div class="row"><h5 class="car-title col-12 font-weight-bold">Granulometr&iacute;a</h5></div>
													<div class="row mt-2">
														<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Malla</h6></div>
														<div class="col-4"><input type="text" class="form-control form-control-sm moneda" id="grm" name="grm" /></div>
														<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">%</h6></div>
													</div>
												</div>
												<ul class="list-group list-group">
													<li class="list-group-item">
														<div class="row">
															<p class="col-4 align-self-center mb-0">16 al 20</p>
															<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="malla16" id="malla16"
																value="<?=!empty($detalle)? $detalle->granumelometria_malla_1620_nro : ''?>" />
															</div>
															<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="mallaporc" id="mallaporc"
																value="<?=!empty($detalle)? $detalle->granumelometria_malla_1620_por : ''?>" />
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="row">
															<p class="col-4 align-self-center mb-0">15</p>
															<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="malla15" id="malla15"
																value="<?=!empty($detalle)? $detalle->granumelometria_malla_15_nro : ''?>" />
															</div>
															<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="malla15porc" id="malla15porc"
																value="<?=!empty($detalle)? $detalle->granumelometria_malla_15_por : ''?>" />											
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="row">
															<p class="col-4 align-self-center mb-0">14</p>
															<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="malla14" id="malla14"
																value="<?=!empty($detalle)? $detalle->granumelometria_malla_14_nro : ''?>" />
															</div>
															<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="malla14porc" id="malla14porc"
																value="<?=!empty($detalle)? $detalle->granumelometria_malla_14_por : ''?>" />
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="row">
															<p class="col-4 align-self-center mb-0">Base</p>
															<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="mallabase" id="mallabase"
																value="<?=!empty($detalle)? $detalle->granumelometria_malla_base_nro : ''?>" />
															</div>
															<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="mallabaseporc" id="mallabaseporc"
																value="<?=!empty($detalle)? $detalle->granumelometria_malla_base_por : ''?>" />
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="row">
															<p class="col-4 align-self-center mb-0">Total</p>
															<div class="col-4"><input class="form-control form-control-sm mx-2" type="text" name="grtotmalla" id="grtotmalla" readonly /></div>
															<div class="col-4"><input class="form-control form-control-sm mx-2" type="text" name="portotmalla" id="portotmalla" readonly /></div>
														</div>
													</li>
												</ul>
											</div>
										</div>
										<hr>
										<div class="form-row container-fluid mt-3">
											<div class="col-12 mb-3"><h5 style="text-decoration:underline"><b>Categor&iacute;a / Tostado</b></h5></div>
											<div class="col-md-4">
												<label class="control-label mb-0" for="apariencia">&nbsp;&nbsp;&nbsp;Apariencia:</label>
												<select class="form-control apariencia" name="apariencia" id="apariencia">
												<? foreach($apariencia as $row): ?>
													<option value="<?=$row->idapariencia;?>" <?=(!empty($detalle) && $detalle->idapariencia === $row->idapariencia)? 'selected' : '';?> ><?=$row->apariencia;?></option>
												<? endforeach;	?>
												</select>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
											<div class="col-md-4">
												<label class="control-label mb-0" for="quaker">&nbsp;&nbsp;&nbsp;Quaker:</label>
												<select class="form-control quaker" name="quaker" id="quaker">
												<? foreach($quaker as $row): ?>
													<option value="<?=$row->idquaker;?>" <?=(!empty($detalle) && $detalle->idquaker === $row->idquaker)? 'selected' : '';?> ><?=$row->quaker;?></option>
												<? endforeach;	?>
												</select>
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
										</div>
										<hr>
										<div class="form-row container-fluid mb-3">
											<div class="col-12 mb-3"><h5 style="text-decoration:underline"><b>Datos Tostado</b></h5></div>
											<div class="col-md-4 col-lg-3">
												<label class="control-label mb-0" for="tiempoTost">&nbsp;&nbsp;&nbsp;Tiempo de Tostado:</label>
												<input type="text" class="form-control tiempoTost" name="tiempoTost" id="tiempoTost"
													value="<?=!empty($detalle)? $detalle->tostado_tiempo : ''?>" />
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
											<div class="col-md-3">
												<label class="control-label mb-0" for="colorAg">&nbsp;&nbsp;&nbsp;Color(agtron):</label>
												<input type="text" class="form-control colorAg moneda" name="colorAg" id="colorAg"
													value="<?=!empty($detalle)? $detalle->tostado_color_agtron : ''?>" />
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
											</div>
											<div class="col-md-3">
												<label class="control-label mb-0" for="porcPerdida">&nbsp;&nbsp;&nbsp;(%) P&eacute;rdida:</label>
												<input type="text" class="form-control porcPerdida moneda" name="porcPerdida" id="porcPerdida"
													value="<?=!empty($detalle)? $detalle->tostado_perdida : ''?>" />
												<!--<div class="invalid-feedback">Campo Requerido</div>-->
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
									<div class="col-12 text-center pt-2 resp" style="font-size:1.3em">&nbsp;</div>
									
									<form method="post" id="form_conteo" action="<?=base_url().$this->uri->segment(1)?>/parametros/conteo" class="form">
										<input type="hidden" class="idproveedor" name="idproveedor" value="<?=$proveedor->idproveedor?>"/>
										<input type="hidden" name="idcertificado" value="<?=$idcertificado?>"/>
										<div class="row container">
											<div class="col-12">
												<div class="form-row">
													<div class="card col-lg-9 mx-auto mt-1">
														<div class="card-header text-center">
															<div class="row"><h5 class="car-title col-12 font-weight-bold">Defectos Primarios</h5></div>
															<div class="row mt-2">
																<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Defecto</h6></div>
																<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Nro.</h6></div>
																<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Equivalencia</h6></div>
															</div>
														</div>
														<ul class="list-group list-group">
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Negro Completo</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nronegro" id="nronegro"
																		value="<?=!empty($detalle)? $detalle->def_pri_negro_completo_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqnegro" id="eqnegro"
																		value="<?=!empty($detalle)? $detalle->def_pri_negro_completo_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Agrio Completo</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nroagrio" id="nroagrio"
																		value="<?=!empty($detalle)? $detalle->def_pri_agrio_completo_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqagrio" id="eqagrio"
																		value="<?=!empty($detalle)? $detalle->def_pri_agrio_completo_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Cereza Seca</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nrocereza" id="nrocereza"
																		value="<?=!empty($detalle)? $detalle->def_pri_cereza_seca_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqcereza" id="eqcereza"
																		value="<?=!empty($detalle)? $detalle->def_pri_cereza_seca_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Da&ntilde;ado por Hongos</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nrohongos" id="nrohongos"
																		value="<?=!empty($detalle)? $detalle->def_pri_danado_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqhongos" id="eqhongos"
																		value="<?=!empty($detalle)? $detalle->def_pri_danado_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Da&ntilde;o Severo de Insectos</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nroinsec" id="nroinsec"
																		value="<?=!empty($detalle)? $detalle->def_pri_danado_severo_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqinsec" id="eqinsec"
																		value="<?=!empty($detalle)? $detalle->def_pri_danado_severo_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item mb-3">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Materia Extraña</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nroextr" id="nroextr"
																		value="<?=!empty($detalle)? $detalle->def_pri_materia_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqextr" id="eqextr"
																		value="<?=!empty($detalle)? $detalle->def_pri_materia_equi : ''?>" /></div>
																</div>
															</li>
														</ul>
													</div>
												</div>
												<div class="form-row">
													<div class="card col-lg-9 mx-auto mt-1">
														<div class="card-header text-center">
															<div class="row"><h5 class="car-title col-12 font-weight-bold">Defectos Secundarios</h5></div>
															<div class="row mt-2">
																<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Defecto</h6></div>
																<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Nro.</h6></div>
																<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Equivalencia</h6></div>
															</div>
														</div>
														<ul class="list-group list-group">
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Negro Parcial</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nronegrop" id="nronegrop"
																		value="<?=!empty($detalle)? $detalle->def_sec_negro_parcial_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqnegrop" id="eqnegrop"
																		value="<?=!empty($detalle)? $detalle->def_sec_negro_parcial_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Agrio Parcial</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nroagriop" id="nroagriop"
																		value="<?=!empty($detalle)? $detalle->def_sec_agrio_parcial_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqagriop" id="eqagriop"
																		value="<?=!empty($detalle)? $detalle->def_sec_agrio_parcial_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Pergamino</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nroperg" id="nroperg"
																		value="<?=!empty($detalle)? $detalle->def_sec_pergamino_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqperg" id="eqperg"
																		value="<?=!empty($detalle)? $detalle->def_sec_pergamino_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Flotador</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nroflot" id="nroflot"
																		value="<?=!empty($detalle)? $detalle->def_sec_flotador_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqflot" id="eqflot"
																		value="<?=!empty($detalle)? $detalle->def_sec_flotador_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Inmaduro</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nroinmad" id="nroinmad"
																		value="<?=!empty($detalle)? $detalle->def_sec_inmaduro_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqinmad" id="eqinmad"
																		value="<?=!empty($detalle)? $detalle->def_sec_inmaduro_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Averanado</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nroavera" id="nroavera"
																		value="<?=!empty($detalle)? $detalle->def_sec_averanado_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqavera" id="eqavera"
																		value="<?=!empty($detalle)? $detalle->def_sec_averanado_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Concha</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nroconc" id="nroconc"
																		value="<?=!empty($detalle)? $detalle->def_sec_concha_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqconc" id="eqconc"
																		value="<?=!empty($detalle)? $detalle->def_sec_concha_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Quebrado/Cortado/Mordido</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nroqueb" id="nroqueb"
																		value="<?=!empty($detalle)? $detalle->def_sec_quebrado_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqqueb" id="eqqueb"
																		value="<?=!empty($detalle)? $detalle->def_sec_quebrado_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">C&aacute;scara/Pulpa</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nropul" id="nropul"
																		value="<?=!empty($detalle)? $detalle->def_sec_cascara_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqpul" id="eqpul"
																		value="<?=!empty($detalle)? $detalle->def_sec_cascara_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Da&ntilde;o Ligero de Insectos</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="nrolgins" id="nrolgins"
																		value="<?=!empty($detalle)? $detalle->def_sec_insectos_num : ''?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="eqlgins" id="eqlgins"
																		value="<?=!empty($detalle)? $detalle->def_sec_insectos_equi : ''?>" /></div>
																</div>
															</li>
															<li class="list-group-item mb-3">
																<div class="row">
																	<p class="col-8 align-self-center mb-0 text-center">Total</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2" type="text" name="totconteo" id="totconteo" readonly /></div>
																</div>
															</li>
														</ul>
													</div>
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
									<div class="col-md-12 text-center pt-2 resp" style="font-size:1.3em">&nbsp;</div>
								
									<form method="post" id="form_sensorial" action="<?=base_url().$this->uri->segment(1)?>/parametros/sensorial" class="form">
										<input type="hidden" class="idproveedor" name="idproveedor" value="<?=$proveedor->idproveedor?>"/>
										<input type="hidden" name="idcertificado" value="<?=$idcertificado?>"/>
										<div class="row container mt-1">
											<div class="col-12">
												<div class="form-row">
													<div class="card col-lg-10 mx-auto mt-1 mb-3">
														<div class="card-header text-center">
															<div class="row"><h5 class="car-title col-12 font-weight-bold">An&aacute;lisis Sensorial del Caf&eacute;</h5></div>
															<div class="row mt-2">
																<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Atributos</h6></div>
																<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Puntos</h6></div>
																<div class="col-4"><h6 class="car-subtitle font-weight-bold text-muted">Caracter&iacute;sticas</h6></div>
															</div>
														</div>
														<ul class="list-group list-group">
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Fragancia/Aroma</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="fragptos" id="fragptos"
																		value="<?=!empty($detalle)? $detalle->atributos_fragancia_puntos : '';?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 mayusc" type="text" name="fragcaract" id="fragcaract"
																		value="<?=!empty($detalle)? $detalle->atributos_fragancia_caracteristicas : '';?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Sabor</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="sabptos" id="sabptos"
																		value="<?=!empty($detalle)? $detalle->atributos_sabor_puntos : '';?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 mayusc" type="text" name="sabcaract" id="sabcaract"
																		value="<?=!empty($detalle)? $detalle->atributos_sabor_caracteristicas : '';?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Sabor Residual</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="sabreptos" id="sabreptos"
																		value="<?=!empty($detalle)? $detalle->atributos_residual_puntos : '';?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 mayusc" type="text" name="sabrecaract" id="sabrecaract"
																		value="<?=!empty($detalle)? $detalle->atributos_residual_caracteristicas : '';?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Acidez</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="aciptos" id="aciptos"
																		value="<?=!empty($detalle)? $detalle->atributos_acidez_puntos : '';?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 mayusc" type="text" name="acicaract" id="acicaract"
																		value="<?=!empty($detalle)? $detalle->atributos_acidez_caracteristicas : '';?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Cuerpo</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="cuerptos" id="cuerptos"
																		value="<?=!empty($detalle)? $detalle->atributos_cuerpo_puntos : '';?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 mayusc" type="text" name="cuerpocaract" id="cuerpocaract"
																		value="<?=!empty($detalle)? $detalle->atributos_cuerpo_caracteristicas : '';?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Uniformidad</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="uniptos" id="uniptos"
																		value="<?=!empty($detalle)? $detalle->atributos_uniformidad_puntos : '';?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 mayusc" type="text" name="unicaract" id="unicaract"
																		value="<?=!empty($detalle)? $detalle->atributos_uniformidad_caracteristicas : '';?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Balance</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="balptos" id="balptos"
																		value="<?=!empty($detalle)? $detalle->atributos_balance_puntos : '';?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 mayusc" type="text" name="balcaract" id="balcaract"
																		value="<?=!empty($detalle)? $detalle->atributos_balance_caracteristicas : '';?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Taza Limpia</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="tazptos" id="tazptos"
																		value="<?=!empty($detalle)? $detalle->atributos_taza_puntos : '';?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 mayusc" type="text" name="tazcaract" id="tazcaract"
																		value="<?=!empty($detalle)? $detalle->atributos_taza_caracteristicas : '';?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Dulzura</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="dulptos" id="dulptos"
																		value="<?=!empty($detalle)? $detalle->atributos_dulzura_puntos : '';?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 mayusc" type="text" name="dulcaract" id="dulcaract"
																		value="<?=!empty($detalle)? $detalle->atributos_dulzura_caracteristicas : '';?>" /></div>
																</div>
															</li>
															<li class="list-group-item">
																<div class="row">
																	<p class="col-4 align-self-center mb-0">Apreciaci&oacute;n General</p>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 moneda" type="text" name="apreptos" id="apreptos"
																		value="<?=!empty($detalle)? $detalle->atributos_apreciacion_puntos : '';?>" /></div>
																	<div class="col-4"><input class="form-control form-control-sm mx-2 mayusc" type="text" name="aprecaract" id="aprecaract"
																		value="<?=!empty($detalle)? $detalle->atributos_apreciacion_caracteristicas : '';?>" /></div>
																</div>
															</li>
															<li class="list-group-item py-0">
																<div class="row card-header">
																	<p class="col-md-6 col-lg-4 align-self-center mb-0">Puntaje Total</p>
																	<div class="col-md-6 col-lg-4"><input class="form-control form-control-sm mx-2" type="text" id="ptotal" readonly /></div>
																</div>
															</li>
															<li class="list-group-item py-0">
																<div class="row card-header">
																	<p class="col-md-6 col-lg-4 align-self-center mb-0">Puntaje Final SCA</p>
																	<div class="col-md-6 col-lg-4"><input class="form-control form-control-sm mx-2" type="text" id="pfinal" readonly /></div>
																</div>
															</li>
														</ul>
														<!--<div class="row mt-3">
															<label class="control-label col-md-3 align-self-center mb-0" for="productor">&nbsp;&nbsp;Observaciones:</label>
															<input type="text" class="form-control col-md-8 mayusc" name="obs" id="obs" placeholder="Observaciones" />
														</div> Anular-->
													</div>
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
								<div class="tab-pane container fade" id="pill-catadores">
									<div class="col-md-12 text-center pt-4 resp" style="font-size:1.3em">&nbsp;</div>
									<input type="hidden" name="idcertificado" id="idcertificado" value="<?=$idcertificado?>"/>
								
									<!--<form method="post" id="form_sensorial" action="<?=base_url().$this->uri->segment(1)?>/parametros/catadores" class="form">
										<input type="hidden" class="idproveedor" name="idproveedor" value="<?=$proveedor->idproveedor?>"/>
										<input type="hidden" name="idcertificado" value="<?=$idcertificado?>"/>
										<div class="row container mt-1">
											<div class="col-12">
												<div class="form-row">
												</div>
											</div>
										</div>
									</form>-->
									<div class="container mx-auto">
										<div class="row">
											<div class="col-md-11 mt-4 mb-2">
												<!--<label for="btnbuscaIE" class="col-sm-12">&nbsp;</label>-->
												<button type="button" data-toggle="modal" class="btn btn-narsa d-flex ml-auto" id="modalCat" data-target="#modalCatadores">Buscar Catador</button>
											</div>
										</div>
									</div>
									<div class="container-fluid mt-2 mb-3">
										<div class="row">
											<div style="overflow-x:hidden" class="col-12 col-md-8 mx-auto"> <!--class="table-responsive" -->
											<!--<div class="col-sm-12 mx-auto" style="overflow-x:scroll"><!--align-items-center text-center-->
												<table id="tablaSeleccionCatadores" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto"></table>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<div class="row">
											<div class="col-md-12">
												<button class="btn btn-narsa" id="guardaCatadores">Guardar Catador</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr class="mt-0">
						<div class="iq-card-footer mb-3">
							<div class="row">
								<div class="col-md-12">
									<button class="btn btn-narsa btn-cancelar">Volver</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal catadores -->
					<div class="modal fade" id="modalCatadores" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Seleccionar Catador</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								</div>
								<div class="modal-body" style="overflow: hidden;">
									<div class="container-fluid mt-2">
										<div class="row">
											<div style="overflow-x:hidden" class="col-12"> <!--class="table-responsive" -->
											<!--<div class="col-sm-12 mx-auto" style="overflow-x:scroll"><!--align-items-center text-center-->
												<table id="tablaCatadores" class="table table-striped dt-responsive table-bordered display nowrap table-hover mb-0 mx-auto" style="width:100%">
													<thead><tr><th>ID</th><th>Documento</th><th>Nombres del Catador</th><th>nombres</th></tr></thead>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>