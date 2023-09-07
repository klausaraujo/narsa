<!doctype html>
<html lang="es">
    <head>
	<title>Reporte PDF</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            /** Margenes de la pagina en 0 **/
            @page { margin: 0cm 0cm; }
			/** Márgenes reales de cada página en el PDF **/
			body { width:21cm; font-family: Helvetica; font-size: 0.8rem;margin-top:6mm;margin-bottom:6mm; }
			.acciones{ width:18cm; text-align:center }
			.acciones td, .acciones th{border:1px solid #4B4B4B; border-collapse: collapse; font-size: 9px;}
			.acciones b{ font-size: 9px; }
        </style>
    </head>
    <body>
        <!-- Etiqueta principal del pdf -->
        <?
			echo '<table align="center" class="acciones" cellspacing="0" cellpadding="1">';
			$header = array_keys((array)$reporte[0]);
					foreach($header as $row):
						echo '<th bgcolor="#CDCDCD">'.$row.'</th>';
					endforeach;
					foreach($reporte as $row):
						$valores = array_values((array)$row);
						echo '<tr>';
						foreach($valores as $valor):
							echo '<td>'.$valor.'</td>';
						endforeach;
						echo '</tr>';
					endforeach;
			echo '</table>';
		?>
    </body>
</html>