<html>
    <head>
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
			
			/** Reglas del contenido **/
			#contenido{width:18cm;}
			#footer{font-size: 8px;height: 50px;border-top:0.5px solid #AAA;width:20.5cm;line-height:1em}
			table .acciones{border:2px solid burlywood; border-collapse: collapse}
			.acciones td{border:2px solid burlywood; border-collapse: collapse}
			table .fotos{width:16cm;margin-bottom:20px}
			.galeria{margin:auto;width:304px;}
			* { text-transform: uppercase; }
        </style>
    </head>
    <body>
        <!-- Defina bloques de encabezado y pie de página antes de su contenido -->
        <header>
            <img src="<?=base_url()?>public/images/informes/header.png" width="100%" />
			<hr style="border:2px burlywood;border-style:double;width:100%;">
        </header>

        <footer>
			<table id="footer" cellspacing="1" style="">
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
			</table>
        </footer>

        <!-- Etiqueta principal del pdf -->
        <main>
            <table id="contenido" cellspacing="0" cellpadding="1" align="center" style="text-align:center;">
				<tr><td colspan="12" ><b>A</b></td></tr>
				<tr><td colspan="12" ><b>A</b></td></tr>
				<tr><td colspan="12" ><b>A</b></td></tr>
				<tr><td colspan="12" >&nbsp;</td></tr>
				<!--<tr><td width="30pt" style="text-align:left">I.</td><td style="text-align:left" colspan="11"><b>hechos</b></td></tr>-->
				<tr>
					<td width="30pt">A</td>
					<td style="text-align:justify" colspan="11">A</td></tr>
				<tr><td colspan="12" >&nbsp;</td></tr>
				<!--<tr><td width="30pt" style="text-align:left">II.</td><td style="text-align:left" colspan="11"><b>ubicaci&oacute;n del evento</b></td></tr>-->
				<!--<tr style="color:black">
					<td width="30pt" colspan="2">
					</td><td bgcolor="#DAF7A6" colspan="3"><b>regi&oacute;n</b></td>
					<td bgcolor="#DAF7A6" colspan="3"><b>provincia</b></td>
					<td bgcolor="#DAF7A6" colspan="3"><b>distrito</b></td>
					<td width="30pt"></td>
				</tr>
				<tr style="color:black">
					<td width="30pt" colspan="2"></td>
					<td bgcolor=lightblue colspan="3"></td>
					<td bgcolor=lightblue colspan="3"></td>
					<td bgcolor=lightblue colspan="3"></td>
					<td width="30pt"></td>
				</tr>-->
				<tr><td colspan="12" >&nbsp;</td></tr>
				<tr>
					<td width="30pt" style="text-align:center"></td>
					<td style="text-align:center;font-weight: bold;" colspan="11">A</td>
				</tr>
				
				<tr>
					<td width="30pt" colspan="2"></td>
					<td colspan="8" style="text-align:center;">
						<!--<img src="" style="width:600px;height:250px;border:3px burlywood;border-style:solid;border-radius:15px" />-->
					</td>
				</tr>
				<tr><td colspan="12" >&nbsp;</td></tr>
			</table>
        </main>
    </body>
</html>