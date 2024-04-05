<!doctype html>
<html lang="es">
    <head>
	<title><?=$title?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            /** Margenes de la pagina en 0 **/
            @page { margin: 0cm 0cm; }
			/** Márgenes reales de cada página en el PDF **/
			body { width:<?=$body?>; font-family: Helvetica; font-size: 0.8rem;margin-top:6mm;margin-bottom:6mm; }
			.acciones{ width:<?=$tamano?>; text-align:center }
			.acciones td, .acciones th{border:1px solid #4B4B4B; border-collapse: collapse; font-size: <?=$font?>;}
			.acciones b{ font-size: <?=$font?>; }
        </style>
    </head>
    <body>
        <!-- Etiqueta principal del pdf -->
		Reporte General Caf&eacute;
        <?
			//var_dump($reporte[0]);
			//echo count($reporte).'<br>';
			$header = null;
			echo '<table align="center" class="acciones" cellspacing="0" cellpadding="1">';
			
			if(count($reporte)){
				$header = array_keys((array)$reporte[0]);
				echo '<tr>';
				foreach($header as $key):
					if($key !== 'idsucursal' && $key !== 'idproveedor'){
						echo '<th bgcolor="#CDCDCD">'.$key.'</th>';
					}
				endforeach;
				echo '</tr>';
				foreach($reporte as $row):
					//$valores = array_values((array)$row);
					echo '<tr>';
					foreach($row as $key=>$valor):
						if($key !== 'idsucursal' && $key !== 'idproveedor')
							echo '<td>'.$valor.'</td>';
					endforeach;
					echo '</tr>';
				endforeach;
			}
			echo '</table>';
		?>
    </body>
</html>