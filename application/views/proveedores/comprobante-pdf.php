<!doctype html>
<html lang="es">
    <head>
	<title>Comprobante Nro <?=(!empty($guia))?sprintf("%'05s",$guia[0]->numero).'-'.$guia[0]->anio_guia:'';?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            /** Margenes de la pagina en 0 **/
            @page { margin: 0cm 0cm; }
			/** Márgenes reales de cada página en el PDF **/
			body { width:21.7cm; font-family: Helvetica; font-size: 0.8rem;margin-top:2.3cm;margin-bottom:2.6cm }
			/** Reglas del encabezado **/
            header {
                position: fixed;
                top: 0cm;
                left: 0cm;
                right: 0cm;
				width: 100%;
            }

            /** Reglas del pie de página **/
            footer {
                position: fixed; 
                bottom: 0cm; 
                left: 0cm; 
                right: 0cm;
                height: 1.3cm;
				width: 100%;
            }
			#footer{font-size: 8px;height: 1.3cm;border-top:0.5px solid #AAA;width:20.5cm;line-height:1em}
			
			/** Reglas del contenido **/
			/* *{ text-transform: uppercase; }*/
			*{ font-size: 9px; }
			.datos{font-size: 9px;}
			.espaciocm{ height:1cm; }
			.espaciomm{ height:7mm; }
			.tablaround{ border-collapse:separate;border-spacing:3; border:solid black 1px; border-radius: 7px; -moz-border-radius: 7px; -webkit-border-radius: 7px;}
			.acciones td{border:1px solid #4B4B4B; border-collapse: collapse}
			.acciones th{border:1px solid #4B4B4B; border-collapse: collapse}
			table.datos td{ font-size:9px; overflow:hidden;}
        </style>
    </head>
    <body>
        <!-- Defina bloques de encabezado y pie de página antes de su contenido -->
        <header>
            
			<table id="header" style="width:100%;solid #0000ff;background-color:#BEBEBE" cellspacing="1" >
				<tr>
					<td style="aling:center;color:#600000;text-align:center;" >
						<span style="font-size:15;font-weight:bold;"> NEGOCIACIONES AGROINDUSTRIAL AREVALO S.A. - NARSA </span>
					</td>
				</tr>
				<tr>
					<td style="aling:center;color:#600000;text-align:center;font-weight:bold" >
					<span style="font-size:10;font-weight:bold;">Sistema Integrado de Gestión Financiera y Administrativa Versión 3.0 </td>
				</tr>
				
			</table>
        </header>

        <footer>
			<table id="footer" style="width:100%;solid #0000ff;background-color:#BEBEBE"  >
				<tr>
					<td style="aling:center;color:#600000;text-align:center;" >
						<span style="display:flex;font-size:10;font-weight:bold;padding-top:3mm"> Copyright © 2022 - NARSA S.A. </span>
					</td>
				</tr>
				<tr>
					<td style="aling:center;color:#600000;text-align:center;font-weight:bold" >
					<span style="font-size:10;font-weight:bold;">Usuario: <? if($usuario = json_decode($this->session->userdata('user'))); echo $usuario->usuario;?></td>
				</tr>
				
			</table>
        </footer>

        <!-- Etiqueta principal del pdf -->
        <main>
            <table cellspacing="0" cellpadding="1" align="center" style="text-align:center;" width="18cm">
				<tr><td><b>COMPROBANTE DE INGRESO DE PRODUCTOS</b></td></tr>
				<tr><td>
					<b>GU&Iacute;A DE INGRESO NRO  <span style="color:blue"><? if(!empty($guia)) echo sprintf("%'05s",$guia[0]->numero).'-'.$guia[0]->anio_guia; ?></span></b>
				</td></tr>
			</table>
			<div class="espaciomm"></div>
			<table cellspacing="0" cellpadding="1" align="center" class="datos" width="15cm">
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Fecha Emisi&oacute;n Gu&iacute;a:</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($guia)? date_format(date_create($guia[0]->fecha),'d-m-Y') : '&nbsp;';?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Sucursal:</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($guia)?$guia[0]->sucursal : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Tipo Documento</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($datos)?$datos->tipo_documento : '&nbsp;';?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Nro. Documento</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($datos)?$datos->numero_documento : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Celular</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($datos)?$datos->celular : '&nbsp;';?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Correo Electr&oacute;nico</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($datos)?$datos->correo : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Nombre/Raz&oacute;n Social</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($datos)?$datos->nombre : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Domicilio</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($datos)?$datos->domicilio : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Zona</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($datos)?$datos->zona : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
			</table>
			<div class="espaciocm"></div>
			<table cellspacing="0" cellpadding="1" align="center" style="text-align:center;" width="18cm" class="acciones">
				<tr><th bgcolor="#B5B2B2" colspan="12">DETALLE DE PRODUCTOS INGRESADOS</th></tr>
				<tr style="font-weight:bold;" bgcolor="#B5B2B2">
					<td>&Iacute;tem</td><td colspan="2">Cod. Art&iacute;culo</td><td colspan="3">Producto</td><td>Humedad</td><td>Calidad</td>
					<td>Cantidad Total</td><td>Cantidad Valorizada</td><td>Precio</td><td>Importe</td>
				</tr>
	<?
			$i = 1; $total = 0;
			foreach($guia as $row):
				$total += $row->cantidad_valorizada * $row->costo;
				$importe = $row->cantidad_valorizada * $row->costo;
	?>
				<tr>
					<td><?=$i?></td><td colspan="2"><?=sprintf("%'06s",$row->idarticulo)?></td><td colspan="3" style="text-align:left">&nbsp;<?=$row->articulo?></td>
					<td style="text-align:right">&nbsp;<?=number_format($row->humedad,2,'.',',')?>%</td>
					<td style="text-align:right">&nbsp;<?=number_format($row->calidad,2,'.',',')?>%</td>
					<td style="text-align:right"><?=number_format($row->cantidad,2,'.',',')?></td><td style="text-align:right">
					<?=/*is_numeric($row->cantidad_valorizada)? */number_format($row->cantidad_valorizada,2,'.',',')/* : 0.00;*/?></td>
					<td style="text-align:right"><?=number_format($row->costo,2,'.',',');?></td><td style="text-align:right"><?=number_format($importe,2,'.',',');?></td>
				</tr>
	<?
				$i++;
			endforeach;
	?>
				<tr>
					<td colspan="10" align="right" style="font-weight:bold">TOTAL:&nbsp;</td>
					<td colspan="2" style="font-weight:bold;text-align:right"><?=number_format($total,2,'.',',');?></td>
				</tr>
			</table>
			<div style="height:3mm"></div>
			<table cellspacing="0" cellpadding="1" align="center" style="text-align:center;" width="18cm" class="acciones">
				<tr style="text-align:left;font-weight:bold;"><td>&nbsp;OBSERVACIONES</td></tr>
				<tr style="text-align:left"><td>&nbsp;<?if($guia[0]->observaciones) echo $guia[0]->observaciones; else echo '&nbsp;';?></td></tr>
			</table>
			
			<!--<div class="espaciocm"></div>
			<table cellspacing="0" cellpadding="1" align="center" style="text-align:center;" width="18cm" class="acciones">
				<tr><th bgcolor="#B5B2B2" colspan="12">DETALLE DE PRODUCTOS VALORIZADOS</th></tr>
				<tr style="font-weight:bold;" bgcolor="#B5B2B2">
					<td>&Iacute;tem</td><td colspan="2">N&uacute;mero Gu&iacute;a</td><td colspan="3">Art&iacute;culo Valorizado</td><td colspan="2">Saldo</td>
					<td>Cantidad</td><td>Costo</td><td colspan="2">Importe</td>
				</tr>
	<?
			$i = 1;
			foreach($valoriz as $row):
	?>
				<tr>
					<td><?=$i?></td><td colspan="2"><?=sprintf("%'05s",$row->numero_guia).'-'.$row->anio_valorizacion?></td><td colspan="3" style="text-align:left">&nbsp;<?=$row->articulo?></td>
					<td colspan="2" style="text-align:right"><?=number_format($row->saldo,2,'.',',')?></td><td style="text-align:right"><?=number_format($row->cantidad,2,'.',',')?></td>
					<td style="text-align:right"><?=number_format($row->costo,2,'.',',')?></td><td colspan="2" style="text-align:right"><?=number_format($row->importe,2,'.',',')?></td>
				</tr>
	<?
				$i++;
			endforeach;
	?>
			</table>
			<div class="espaciocm"></div>
			<table cellspacing="0" cellpadding="1" align="center" style="text-align:center;" width="18cm" class="acciones">
				<tr><th bgcolor="#B5B2B2" colspan="12">DETALLE DE TRANSACCIONES DEL PROVEEDOR</th></tr>
				<tr style="font-weight:bold;" bgcolor="#B5B2B2">
					<td>&Iacute;tem</td><td colspan="2">Sucursal</td><td colspan="4">Tipo Operaci&oacute;n</td><td colspan="2">Fecha</td><td>Nro. Oper.</td><td colspan="2">Monto</td>
				</tr>
	<?
			$i = 1; $mto = 0;
			foreach($edocta as $row):
				$fecha = date_format(date_create($row->fecha_movimiento),'d-m-Y'); $mto += floatval($row->monto_factor_final);
				$mtofinal = floatval($row->monto_factor_final) < 0? floatval($row->monto_factor_final) * -1 : $row->monto_factor_final;
	?>
				<tr>
					<td><?=$i?></td><td colspan="2"><?=$row->sucursal?></td><td colspan="4"><?=$row->tipo_operacion?></td><td colspan="2"><?=$fecha?></td>
					<td><?=sprintf("%'05s",$row->idtransaccion)?></td>
					<td colspan="2" style="text-align:right"><?=number_format($mtofinal, 2, '.', ',')?></td>
				</tr>
	<?
				$i++;
			endforeach;
	?>
				<tr>
					<td colspan="10" align="right" style="font-weight:bold">TOTAL DE LA SUCURSAL:&nbsp;</td>
					<td colspan="2" style="font-weight:bold;text-align:right">
						<?
							$formatmto = number_format($mto, 2, '.', ',');
							if($mto == 0){
								echo '<span style="color:green;">'.$formatmto.'</span>';
							}elseif($mto > 0){
								echo '<span style="color:blue;">'.$formatmto.'</span>';
							}elseif($mto < 0){
								echo '<span style="color:red;">'.$formatmto.'</span>';
							}
						?>
					</td>
				</tr>
			</table>-->
        </main>
    </body>
</html>