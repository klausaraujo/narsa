<!doctype html>
<html lang="es">
    <head>
	<title>Comprobante</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            /** Margenes de la pagina en 0 **/
            @page { margin: 0cm 0cm; }
			/** Márgenes reales de cada página en el PDF **/
			body { width:21.7cm; font-family: Helvetica; font-size: 0.8rem;margin-top:2cm;margin-bottom:1.5cm }
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
			/** Reglas del contenido **/
			/* *{ text-transform: uppercase; }*/
			/**{ font-size: 13px; }*/
			/*.espaciocm{ height:1cm; }
			.espaciomm{ height:5mm; }
			.tablaround{ border-collapse:separate;border-spacing:1; border:solid black 1px; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;}*/
			.acciones td{border:1px solid #4B4B4B; border-collapse: collapse; font-size: 11px}
			.acciones th{border:1px solid #4B4B4B; border-collapse: collapse; font-size: 11px}
			.acciones b{font-size: 11px}
			/*table.datos td{ font-size:10px; overflow:hidden;}*/
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
        <!-- Etiqueta principal del pdf -->
        <main style="overflow-y: hidden">
			<table cellspacing="0" cellpadding="1" align="center" style="text-align:center;" width="18cm" class="acciones">
				<tr><th bgcolor="#DDDDDD" colspan="12" style="height:1.4rem;font-weight:bold;font-size:13px">FICHA T&Eacute;CNICA DE AN&Aacute;LISIS F&Iacute;SICO Y SENSORIAL</th></tr>
				<tr style="font-size:10px">
					<td colspan="3"><b>PRODUCTOR</b></td><td colspan="3"><?=$certificado->nombre?></td><td colspan="3"><b>CODIGO</b></td><td colspan="3"></td>
				</tr>
				<tr style="font-size:10px">
					<td colspan="3"><b>FINCA</b></td><td colspan="3"></td><td colspan="3"><b>FECHA</b></td><td colspan="3"><?=date_format(date_create($certificado->fecha),'d-m-Y')?></td>
				</tr>
				<tr style="font-size:10px">
					<td colspan="3"><b>ALTITUD</b></td><td colspan="3"><?=$certificado->altitud?></td><td colspan="3"><b>H2OVERDE</b></td><td colspan="3"><?=$certificado->h2overde?></td>
				</tr>
				<tr style="font-size:10px">
					<td colspan="3"><b>ZONA</b></td><td colspan="3"><?=$certificado->sucursal?></td><td colspan="3"><b>PROCESO</b></td><td colspan="3"><?=$certificado->proceso?></td>
				</tr>
				<tr style="font-size:10px">
					<td colspan="3"><b>VARIEDAD</b></td><td colspan="3"><?=$certificado->variedad?></td><td colspan="3"><b>DENSIDAD</b></td><td colspan="3"><?=$certificado->densidad?></td>
				</tr>
			</table>
        </main>
    </body>
</html>