<!doctype html>
<html lang="es">
    <head>
	<title>Transaccion Nro. <?=sprintf("%'05s",$movimiento->idtransaccion)?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            /** Margenes de la pagina en 0 **/
            @page { margin: 0cm 0cm; }
			/** Márgenes reales de cada página en el PDF **/
			body { width:21cm; font-family: Helvetica; font-size: 0.8rem;margin-top:6.1cm;margin-bottom:1.5cm }
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
			table.footer{font-size: 8px;height: 1.3cm;border-top:0.5px solid #AAA;width:20.5cm;line-height:1em}
			
			.header2 {
                position: fixed;
                top: 148mm;
                left: 0cm;
                right: 0cm;
				width: 100%;
            }

            /** Reglas del pie de página **/
            .footer2 {
                position: fixed; 
                bottom: 148mm; 
                left: 0cm; 
                right: 0cm;
                height: 1.3cm;
				width: 100%;
            }
			
			/** Reglas del contenido **/
			/* *{ text-transform: uppercase; }*/
			*{ font-size: 13px; }
			.tablaround{ border-collapse:separate;border-spacing:1; border:solid black 1px; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;}
			.acciones{ width:18cm; text-align:center; }
			.acciones td, .acciones th{border:1px solid #4B4B4B; border-collapse: collapse; font-size: 10px;}
			.acciones b{ font-size: 10px; }
			table.datos td{ font-size:10px; overflow:hidden;}
			#main2{ position:fixed;top:20.9cm; left:1.5cm }
			.firmas{ position:fixed; top:12cm; text-transform:uppercase; width:11cm; }
			.firmas2{ position:fixed; top:26.8cm; text-transform:uppercase; width:11cm; }
        </style>
    </head>
    <body>
        <!-- Defina bloques de encabezado y pie de página antes de su contenido -->
        <header>
			<table style="width:100%;solid #0000ff;background-color:#BEBEBE" cellspacing="1" >
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
			<table cellspacing="0" cellpadding="1" align="center" style="text-align:center;margin-top:3mm" width="18cm">
				<tr><td><b>REPORTE DE TRANSACCI&Oacute;N DEL PROVEEDOR</b></td></tr>
			</table>
			<table cellspacing="0" cellpadding="1" align="center" class="datos" width="15cm" style="text-align:center;margin-top:3mm">
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Tipo Documento</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->tipo_documento) > 0?$movimiento->tipo_documento:'&nbsp;';?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Nro. Documento</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->numero_documento) > 0?$movimiento->numero_documento:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Celular</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->celular) > 0?$movimiento->celular:'&nbsp;';?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Correo Electr&oacute;nico</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->correo) > 0?$movimiento->correo:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Nombre/Raz&oacute;n Social</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->nombre) > 0?$movimiento->nombre:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Domicilio</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->domicilio) > 0?$movimiento->domicilio:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Zona</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->zona) > 0?$movimiento->zona:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Observaciones</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->observaciones) > 0?$movimiento->observaciones:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
			</table>
        </header>

        <footer>
			<table class="footer" style="width:100%;solid #0000ff;background-color:#BEBEBE"  >
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
		
		<div class="header2">
			<table style="width:100%;solid #0000ff;background-color:#BEBEBE" cellspacing="1" >
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
			<table cellspacing="0" cellpadding="1" align="center" style="text-align:center;margin-top:3mm" width="18cm">
				<tr><td><b>REPORTE DE TRANSACCI&Oacute;N DEL PROVEEDOR</b></td></tr>
			</table>
			<table cellspacing="0" cellpadding="1" align="center" class="datos" width="15cm" style="text-align:center;margin-top:3mm">
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Tipo Documento</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->tipo_documento) > 0?$movimiento->tipo_documento:'&nbsp;';?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Nro. Documento</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->numero_documento) > 0?$movimiento->numero_documento:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Celular</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->celular) > 0?$movimiento->celular:'&nbsp;';?></td></tr></table>
					</td>
					<td colspan="1" style="width:1.5cm"></td>
					<td colspan="3" style="text-align:left;font-weight:bold;">Correo Electr&oacute;nico</td>
					<td colspan="2" style="text-align:left;width:3cm">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->correo) > 0?$movimiento->correo:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Nombre/Raz&oacute;n Social</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->nombre) > 0?$movimiento->nombre:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Domicilio</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->domicilio) > 0?$movimiento->domicilio:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Zona</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->zona) > 0?$movimiento->zona:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:left;font-weight:bold;">Observaciones</td>
					<td colspan="9" style="text-align:left;">
						<table class="tablaround" style="width:100%"><tr><td><?=strlen($movimiento->observaciones) > 0?$movimiento->observaciones:'&nbsp;';?></td></tr></table>
					</td>
				</tr>
			</table>
		</div>
		<div class="footer2">
			<table class="footer" style="width:100%;solid #0000ff;background-color:#BEBEBE"  >
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
		</div>

        <!-- Etiqueta principal del pdf -->
        <main style="overflow-y:hidden">
			<table cellspacing="0" cellpadding="1" align="center" class="acciones">
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
			<!-- Firmas -->
			<table align="center" class="firmas">
				<tr>
					<td style="border-top:1px solid #4B4B4B;font-size:9px;text-align:center;width:4cm">vºbº NARSA</td><td style="width:2cm">&nbsp;</td>
					<td style="border-top:1px solid #4B4B4B;font-size:9px;text-align:center;width:4cm"><?=$movimiento->nombre?></td>
				</tr>
				<tr>
					<td>&nbsp;</td><td style="width:2cm"></td>
					<td style="font-size:9px;text-align:center;width:4cm"><?=$movimiento->tipo_documento.': '.$movimiento->numero_documento?></td>
				</tr>
			</table>
		</main>
		<main id="main2">
			<table cellspacing="0" cellpadding="1" align="center" class="acciones">
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
			<!-- Firmas -->
			<table align="center" class="firmas2">
				<tr>
					<td style="border-top:1px solid #4B4B4B;font-size:9px;text-align:center;width:4cm">vºbº NARSA</td><td style="width:2cm">&nbsp;</td>
					<td style="border-top:1px solid #4B4B4B;font-size:9px;text-align:center;width:4cm"><?=$movimiento->nombre?></td>
				</tr>
				<tr>
					<td>&nbsp;</td><td style="width:2cm"></td>
					<td style="font-size:9px;text-align:center;width:4cm"><?=$movimiento->tipo_documento.': '.$movimiento->numero_documento?></td>
				</tr>
			</table>
		</main>
    </body>
</html>