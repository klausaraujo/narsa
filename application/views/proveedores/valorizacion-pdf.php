<!doctype html>
<html lang="es">
    <head>
	<title>Valorizaci&oacute;n Nro <?=(!empty($lista))?sprintf("%'05s",$lista[0]->numero).'-'.$lista[0]->anio_valorizacion:'';?></title>
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
				<tr><td><b>REPORTE DE VALORIZACI&Oacute;N DE PRODUCTOS POR PROVEEDOR</b></td></tr>
				<tr><td class="espaciomm"></td></tr>
				<tr><td>
					<b>VALORIZACI&Oacute;N NRO 
						<span style="color:blue"><? if(!empty($lista)) echo sprintf("%'05s",$lista[0]->numero).'-'.$lista[0]->anio_valorizacion; ?></span>
					</b></td></tr>
				<tr><td class="espaciocm"></td></tr>
			</table>
			<table cellspacing="0" cellpadding="1" align="center" class="datos" width="15cm">
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">N&uacute;mero Operaci&oacute;n:</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><? if(!empty($lista)) echo sprintf("%'07s",$lista[0]->idtransaccion);?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Fecha Operaci&oacute;n:</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?php if(!empty($lista)) echo date_format(date_create($lista[0]->fecha),'d-m-Y'); ?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Fecha Valorizaci&oacute;n:</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?php if(!empty($lista)) echo date_format(date_create($lista[0]->fecha),'d-m-Y'); ?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Sucursal:</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=!empty($lista)?$lista[0]->sucursal : '&nbsp;';?></td></tr></table>
					</td>
				</tr>
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
			<table cellspacing="0" cellpadding="1" align="center" style="text-align:center;" width="18cm" class="acciones">
				<tr><th bgcolor="#B5B2B2" colspan="12">DETALLE DE PRODUCTOS VALORIZADOS</th></tr>
				<tr style="font-weight:bold;" bgcolor="#B5B2B2">
					<td>&Iacute;tem</td><td colspan="2">N&uacute;mero Gu&iacute;a</td><td colspan="3">Art&iacute;culo Valorizado</td><td colspan="2">Saldo</td>
					<td>Cantidad</td><td>Costo</td><td colspan="2">Importe</td>
				</tr>
	<?
			$i = 1;
			foreach($lista as $row):
	?>
				<tr>
					<td><?=$i?></td><td colspan="2"><?=sprintf("%'05s",$row->numero).'-'.$row->anio_valorizacion?></td><td colspan="3" style="text-align:left">&nbsp;<?=$row->articulo?></td>
					<td colspan="2" style="text-align:right"><?=number_format($row->saldo,2,'.',',')?></td><td style="text-align:right"><?=number_format($row->cantidad,2,'.',',')?></td>
					<td style="text-align:right"><?=number_format($row->costo,2,'.',',')?></td><td colspan="2" style="text-align:right"><?=number_format($row->importe,2,'.',',')?></td>
				</tr>
	<?
				$i++;
			endforeach;
	?>
			</table>
        </main>
    </body>
</html>