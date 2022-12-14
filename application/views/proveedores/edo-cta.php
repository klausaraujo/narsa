<!doctype html>
<html lang="es">
    <head>
	<title>Edo. de Cuenta al <?=date('d-m-Y')?></title>
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
                left: 0.5cm; 
                right: 0cm;
                height: 2.3cm;
				width: 100%;
            }
			#footer{font-size: 8px;height: 50px;border-top:0.5px solid #AAA;width:20.5cm;line-height:1em}
			
			/** Reglas del contenido **/
			/* *{ text-transform: uppercase; }*/
			*{ font-size: 14px; }
			.datos{font-size: 10px;}
			.espaciocm{ height:1cm; }
			.espaciomm{ height:7mm; }
			.tablaround{ border-collapse:separate;border-spacing:3; border:solid black 1px; border-radius: 7px; -moz-border-radius: 7px; -webkit-border-radius: 7px;}
			.acciones td{border:1px solid #4B4B4B; border-collapse: collapse}
			.acciones th{border:1px solid #4B4B4B; border-collapse: collapse}
        </style>
    </head>
    <body>
        <!-- Defina bloques de encabezado y pie de página antes de su contenido -->
        <header>
            <!--<img src="<?=base_url()?>public/images/informes/header.png" width="100%" />
			<hr style="border:2px burlywood;border-style:double;width:100%;">-->
        </header>

        <footer>
			<!--<table id="footer" cellspacing="1" style="">
				<tr>
					<td style="padding: 3px;" rowspan="">
						<img src="<?=base_url()?>public/images/informes/footer.png" width="70px" />
					</td>
					<td>
						jefe del coes<br><br>coordinador coes<br><br>
					</td>
					<td colspan="3">
						<span style="font-weight:bold">rosendo leoncio, serna rom&aacute;n</span><br>ministro de educaci&oacute;n<br>
						<span style="font-weight:bold">carlos alberto, malpica coronado</span><br>jefe de la oficina de defensa nacional y de gestion del riesgo de desastres
					</td>
					<td colspan="2">
						odenaged_informa@minedu.gob.pe<br>av. rep&uacute;blica de colombia nº 710 - san isidro<br>tel&eacute;fono	: 615-5854, 615-5800<br>
						anexo	: 26760/26741<br>celular: 989183571 / 989183584
					</td>
					<td colspan="2">registrado por: <br><span style="font-weight:bold">A</span><br>
					actualizado por: <br><span style="font-weight:bold">A</span>
					</td>
				
				</tr>
			</table>-->
        </footer>

        <!-- Etiqueta principal del pdf -->
        <main>
            <table cellspacing="0" cellpadding="1" align="center" style="text-align:center;" width="18cm">
				<tr><td><b>REPORTE DE ESTADO DE CUENTA DE PROVEEDORES</b></td></tr>
				<tr><td><b>ACTUALIZADO AL: <span style="color:blue"><?=date('d/m/Y')?></span></b></td></tr>
				<tr><td class="espaciocm"></td></tr>
			</table>
			<table cellspacing="0" cellpadding="1" align="center" class="datos" width="15cm">
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Tipo Documento</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($lista)?$lista[0]->tipo_documento : '&nbsp;';?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Nro. Documento</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($lista)?$lista[0]->numero_documento : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Nombre/Raz&oacute;n Social</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($lista)?$lista[0]->nombre : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Domicilio</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($lista)?$lista[0]->domicilio : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Zona</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($lista)?$lista[0]->zona : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
			</table>
			<div class="espaciocm"></div>
	<?
		foreach($sucursales as $s):
			$mto = 0; $essucursal = false; $i = 0;
			foreach($lista as $row):
				if($row->idsucursal === $s){
					$fecha = date_format(date_create($row->fecha_movimiento),'d-m-Y'); $mto += floatval($row->monto); $essucursal = true;
					//number_format($numero, 2, ",", ".");
					if($i === 0){
	?>
	
			<table cellspacing="0" cellpadding="1" align="center" style="text-align:center;" width="18cm" class="acciones">
				<tr><th bgcolor="#B5B2B2" colspan="12">DETALLE DE TRANSACCIONES DEL PROVEEDOR</th></tr>
				<tr style="font-weight:bold;" bgcolor="#B5B2B2">
					<td>&Iacute;tem</td><td colspan="2">Sucursal</td><td colspan="4">Tipo Operaci&oacute;n</td><td colspan="2">Fecha</td><td>Nro. Oper.</td><td colspan="2">Monto</td>
				</tr>				
	<?
						$i++;
					}
	?>
				<tr>
					<td><?=$i?></td><td colspan="2"><?=$row->sucursal?></td><td colspan="4"><?=$row->tipo_operacion?></td><td colspan="2"><?=$fecha?></td>
					<td><?=sprintf("%'05s",$row->idtransaccion)?></td><td colspan="2" style="text-align:right"><?=number_format($row->monto, 2, '.', ',')?></td>
				</tr>	
	<?
					$i++;
				}
			endforeach;
			if($essucursal){
	?>
				<tr>
					<td colspan="10" align="right" style="font-weight:bold">TOTAL POR SUCURSAL:&nbsp;</td><td colspan="2" style="font-weight:bold;text-align:right;color:red">
						<?=number_format($mto, 2, '.', ',');?></td>
				</tr>					
			</table>
			<div class="espaciomm"></div>
	<?		
			}
		endforeach;
	?>
        </main>
    </body>
</html>