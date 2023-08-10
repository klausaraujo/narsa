<!doctype html>
<html lang="es">
    <head>
	<title>Comprobante Nro <?=(!empty($tostado))?sprintf("%'05s",$tostado->numero).'-'.$tostado->anio_tostado:'';?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            /** Margenes de la pagina en 0 **/
            @page { margin: 0cm 0cm; }
			/** Márgenes reales de cada página en el PDF **/
			body { width:21cm; font-family: Helvetica; font-size: 0.8rem;margin-top:6.6cm;margin-bottom:1.5cm }
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
			#main2{ position:fixed;top:21.4cm; }
			.firmas{ position:fixed; top:12cm; text-transform:uppercase; width:11cm; }
			.firmas2{ position:fixed; top:26.8cm; text-transform:uppercase; width:11cm; }
        </style>
    </head>
    <body>
        <!-- Defina bloques de encabezado y pie de página antes de su contenido -->
        <header>
			
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
    </body>
</html>