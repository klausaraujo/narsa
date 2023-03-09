<!doctype html>
<html lang="es">
    <head>
	<title>Transaccion Nro. <?=sprintf("%'05s",$movimiento->idtransaccion)?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            /** Margenes de la pagina en 0 **/
            @page { margin: 0cm 0cm; }
			/** Márgenes reales de cada página en el PDF **/
			body { width:21.7cm; font-family: Helvetica; font-size: 0.8rem;margin-top:2cm;margin-bottom:2.6cm }
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
			*{ font-size: 13px; }
			.espaciocm{ height:1cm; }
			.espaciomm{ height:6mm; }
			.tablaround{ border-collapse:separate;border-spacing:3; border:solid black 1px; border-radius: 7px; -moz-border-radius: 7px; -webkit-border-radius: 7px;}
			.acciones td{border:1px solid #4B4B4B; border-collapse: collapse; font-size: 12px;}
			.acciones th{border:1px solid #4B4B4B; border-collapse: collapse; font-size: 12px;}
			table.datos td{ font-size:0.87em; overflow:hidden;}
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
				<tr><td><b>REPORTE DE TRANSACCI&Oacute;N DEL PROVEEDOR</b></td></tr>
			</table>
			<div class="espaciomm"></div>
			<table cellspacing="0" cellpadding="1" align="center" class="datos" width="15cm">
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Tipo Documento</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=$movimiento->tipo_documento?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Nro. Documento</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=$movimiento->numero_documento?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Celular</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=$movimiento->celular?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Correo Electr&oacute;nico</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=$movimiento->correo?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Nombre/Raz&oacute;n Social</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=$movimiento->nombre?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Domicilio</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=$movimiento->domicilio?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Zona</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=$movimiento->zona?></td></tr></table>
					</td>
				</tr>
			</table>
			<div class="espaciocm"></div>
			<table cellspacing="0" cellpadding="1" align="center" style="text-align:center;" width="18cm" class="acciones">
				<tr><th bgcolor="#B5B2B2" colspan="12">DETALLE DE TRANSACCI&Oacute;N DEL PROVEEDOR</th></tr>
				<tr style="font-weight:bold;" bgcolor="#B5B2B2">
					<td>&Iacute;tem</td><td colspan="2">Sucursal</td><td colspan="4">Tipo Operaci&oacute;n</td><td colspan="2">Fecha</td><td>Nro. Oper.</td><td>Monto</td><td>Tasa</td>
				</tr>				
				<tr>
					<td>1</td><td colspan="2"><?=$movimiento->sucursal?></td><td colspan="4"><?=$movimiento->tipo_operacion?></td>
					<td colspan="2"><?=date_format(date_create($movimiento->fecha_movimiento),'d-m-Y')?></td>
					<td><?=sprintf("%'05s",$movimiento->idtransaccion)?></td><td><?=number_format(floatval($movimiento->monto_factor_final),2,'.',',')?></td>
					<td><?=number_format(floatval($movimiento->tasa),2,'.',',')?></td>
				</tr>
			</table>
		</main>
    </body>
</html>