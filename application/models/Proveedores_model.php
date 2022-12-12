<?php
if (! defined('BASEPATH')) exit('No direct script access allowed');

class Proveedores_model extends CI_Model
{    
	public function __construct(){ parent::__construct(); }
    
	public function listaProveedores()
    {
        $this->db->select('pr.*,td.tipo_documento');
        $this->db->from('proveedor pr');
		$this->db->join('tipo_documento td','td.idtipodocumento = pr.idtipodocumento');
		$this->db->where('idproveedor >',1);
		$this->db->order_by('idproveedor', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function listaProveedor($data)
    {
        $this->db->select('pr.*,td.tipo_documento');
        $this->db->from('proveedor pr');
		$this->db->join('tipo_documento td','td.idtipodocumento = pr.idtipodocumento');
		$this->db->where($data);
		$this->db->order_by('idproveedor', 'asc');
		$this->db->limit(1);
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->row() : array();
    }
	public function tipodoc()
	{
		$this->db->select('idtipodocumento,codigo_curl,tipo_documento,longitud');
        $this->db->from('tipo_documento');
		$this->db->order_by('idtipodocumento', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function factor($data){
		$this->db->select('idfactor');
        $this->db->from('factor');
		$this->db->where($data);
		$this->db->order_by('idfactor', 'asc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->row() : array();
	}
	public function registrar($data)
	{
		if ($this->db->insert('proveedor', $data))return true;
        //else return $error['code'];
		else return false;
	}
	public function editar($data,$id)
	{
		$this->db->db_debug = FALSE;
		$this->db->where($id);
		if ($this->db->update('proveedor',$data)) return true;
        else return false;
	}
	public function tipoOperacion($data)
	{
		$this->db->select('idtipooperacion,tipo_operacion');
		$this->db->from('tipo_operacion_proveedor');
		$this->db->where($data);
		$this->db->order_by('idtipooperacion', 'asc');
		$result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function tipoOperacion_caja($data)
	{
		$this->db->select('idtipooperacion');
		$this->db->from('tipo_operacion_caja');
		$this->db->where($data);
		$this->db->order_by('idtipooperacion', 'asc');
		$result = $this->db->get();
		return ($result->num_rows() > 0)? $result->row() : array();
	}
	public function listaArticulos($data)
	{
		$this->db->select('idarticulo,articulo');
		$this->db->from('articulo');
		$this->db->where($data);
		$this->db->order_by('idarticulo', 'asc');
		$result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function regTransaccion($dataTran,$dataOp,$tipo){
		$this->db->trans_begin();
		$this->db->insert('transacciones', $dataTran);
		
		$dataOp['idtransaccion'] = $this->db->insert_id();
		$this->db->insert('movimientos_proveedor', $dataOp);
		
		/* Array para insertar en movimientos caja */
		unset($dataOp['idproveedor']);
		$op = $this->tipoOperacion_caja(['tipo_operacion'=> $this->input->post('tipodetalle'),'activo' => 1]);
		$factor = $this->factor(['destino'=>2,'idtipooperacion'=>$op->idtipooperacion,'activo'=>1]);
		//echo($op->idtipooperacion.'   '.$factor->idfactor);
		$dataOp['idtipooperacion'] = $op->idtipooperacion;
		$dataOp['idfactor'] = $factor->idfactor;
		$this->db->insert('movimientos_caja', $dataOp);
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return false;
		}else{
			$this->db->trans_commit();
			return true;
		}
	}
	public function listaOperaciones($data)
    {
        $this->db->select('mp.*,to.tipo_operacion,su.sucursal,pr.nombre,usr.usuario');
        $this->db->from('movimientos_proveedor mp');
		$this->db->join('tipo_operacion_proveedor to','to.idtipooperacion = mp.idtipooperacion');
		$this->db->join('sucursal su','su.idsucursal = mp.idsucursal');
		$this->db->join('proveedor pr','pr.idproveedor = mp.idproveedor');
		$this->db->join('usuarios usr','usr.idusuario = mp.idusuario_registro');
		$this->db->where($data);
		$this->db->order_by('idmovimiento', 'desc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function listaIngresos($data)
    {
        $this->db->select('ge.*,su.sucursal,pr.nombre');
        $this->db->from('guia_entrada ge');
		$this->db->join('sucursal su','su.idsucursal = ge.idsucursal');
		$this->db->join('proveedor pr','pr.idproveedor = ge.idproveedor');
		$this->db->where($data);
		$this->db->order_by('ge.idguia', 'desc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function listaValorizaciones($data)
    {
        $this->db->select('va.*,su.sucursal,pr.nombre');
        $this->db->from('valorizacion va');
		$this->db->join('sucursal su','su.idsucursal = va.idsucursal');
		$this->db->join('proveedor pr','pr.idproveedor = va.idproveedor');
		$this->db->where($data);
		$this->db->order_by('va.idvalorizacion', 'desc');
        $result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
    }
	public function listaValorizacionDetalle($data)
	{
		$this->db->select('idguia,anio_guia,numero,idarticulo,articulo,cantidad,idsucursal');
        $this->db->from('lista_ingresos_valorizaciones_saldo');
		$this->db->where($data);
		$this->db->order_by('idguia', 'asc');
		$result = $this->db->get();
		return ($result->num_rows() > 0)? $result->result() : array();
	}
	public function ingresarProductos($data){
		$i = 0; $guia = ''; $numero = 1;
		
		$this->db->trans_begin();
		
		foreach($data as $row):
			if($i === 0){
				$this->db->select('MAX(numero) numero');
				$this->db->from('guia_entrada');
				$this->db->where(['idsucursal'=>$row->idsucursal,'anio_guia'=>date('Y')]);
				$result = $this->db->get();
				if($result->num_rows() > 0){
					$result = $result->row();
					$numero = floatval( $result->numero ) + 1;
				} 
				$guia_entrada = ['anio_guia'=>date('Y'),'numero'=>$numero,'fecha'=>date('Y-m-d'),'idsucursal'=>$row->idsucursal,'idproveedor'=>$row->idproveedor,'activo'=>1];
				$this->db->insert('guia_entrada',$guia_entrada);
				$idguia = $this->db->insert_id();
			}
			$rowdet[$i] = ['idguia'=>$idguia,'idarticulo'=>$row->idarticulo,'cantidad'=>$row->cantidad,'activo'=>1];
			$i++;
		endforeach;
		/* Insertar array de valores en la base */
		$this->db->insert_batch('guia_entrada_detalle',$rowdet);
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return false;
		}else{
			$this->db->trans_commit();
			return true;
		}
	}
	public function anulaTransaccion($where,$activo,$data){
		$this->db->trans_begin();
		$this->db->db_debug = FALSE;
		
		$this->db->set($activo,TRUE);
		$this->db->where($where);
		$this->db->update('transacciones');
		
		$this->db->set($data,TRUE);
		$this->db->where($where);
		$this->db->update('movimientos_proveedor');
		
		$this->db->set($data,TRUE);
		$this->db->where($where);
		$this->db->update('movimientos_caja');
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return false;
		}else{
			$this->db->trans_commit();
			return true;
		}
	}
	public function anulaIngreso($where,$data){
		$this->db->trans_begin();
		$this->db->db_debug = FALSE;
		$this->db->set($data,TRUE);
		$this->db->where($where);
		$this->db->update('guia_entrada');
		
		$this->db->set($data,TRUE);
		$this->db->where($where);
		$this->db->update('guia_entrada_detalle');
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return false;
		}else{
			$this->db->trans_commit();
			return true;
		}
	}
	public function anulaValorizacion($where,$data,$idtran){
		$this->db->trans_begin();
		$this->db->db_debug = FALSE;
		$this->db->set($data,TRUE);
		$this->db->where($where);
		$this->db->update('valorizacion');
		
		$this->db->set($data,TRUE);
		$this->db->where($where);
		$this->db->update('valorizacion_detalle');
		
		$this->db->set($data,TRUE);
		$this->db->where($where);
		$this->db->update('guia_entrada_detalle_valorizacion');
		
		$this->db->set($data,TRUE);
		$this->db->where($idtran);
		$this->db->update('transacciones');
		
		$this->db->set($data,TRUE);
		$this->db->where($idtran);
		$this->db->update('movimientos_proveedor');
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return false;
		}else{
			$this->db->trans_commit();
			return true;
		}
	}
	public function traeNumVal($where)
	{
		$this->db->select('MAX(numero) numero');
		$this->db->from('valorizacion');
		$this->db->where($where);
		$result = $this->db->get();
		if($result->num_rows() > 0){
			$result = $result->row();
			return (floatval( $result->numero ) > 0)? floatval( $result->numero ) + 1 : 1;
		}else return 1;
	}
	public function regValorizacion($data,$idusuario)
	{
		$i = 0; $j = 0; $guia = ''; $numero = 1; $art = []; $guiaArray = [];
		
		$this->db->trans_begin();
		
		foreach($data as $row):
			if($i === 0){
				$this->db->select('MAX(numero) numero');
				$this->db->from('valorizacion');
				$this->db->where(['idsucursal'=>$row->idsucursal,'anio_valorizacion'=>date('Y')]);
				$result = $this->db->get();
				if($result->num_rows() > 0){
					$result = $result->row();
					$numero = floatval( $result->numero ) + 1;
				}
			}
			if($row->idguia !== $guia){ $guia = $row->idguia; $guiaArray[$j] = $row->idguia; $j++; }
			$art[$i] = ['idguia' => $row->idguia,'idarticulo' => $row->idarticulo,'monto' => $row->cantidad,'costo'=>$row->costo,'idsucursal'=>$row->idsucursal,'idproveedor'=>$row->idproveedor];
			$i++;
		endforeach;
		
		foreach($guiaArray as $row):
			$mto = 0; $suc = ''; $prov = ''; $valorizDet = []; $valorizGuiaDet = [];
			for($k =0;$k < count($art);$k++){
				if($art[$k]['idguia'] === $row){
					$mto += floatval($art[$k]['monto']) * floatval($art[$k]['costo']);
					$suc = $art[$k]['idsucursal'];
					$prov = $art[$k]['idproveedor'];
					$valorizDet[$k] = ['idguia'=>$row,'idarticulo'=>$art[$k]['idarticulo'],'cantidad'=>$art[$k]['monto'],'costo'=>$art[$k]['costo'],'activo'=>1];
					$valorizGuiaDet[$k] = ['idguia'=>$row,'idarticulo'=>$art[$k]['idarticulo'],'cantidad'=>$art[$k]['monto'],'costo'=>$art[$k]['costo'],'activo'=>1];
				}
			}
			$tranVal = ['fecha'=>date('Y-m-d H:i:s'),'vencimiento'=>date('Y-m-d'),'monto'=>$mto,'activo'=>1];
			$this->db->insert('transacciones',$tranVal);
			$idtran = $this->db->insert_id();
			$tranMovProv = ['idtipooperacion'=>6,'idsucursal'=>$suc,'idproveedor'=>$prov,'idtransaccion'=>$idtran,'monto'=>$mto,'idfactor'=>6,'fecha_vencimiento'=>date('Y-m-d'),
				'fecha_movimiento'=>date('Y-m-d H:i:s'),'idusuario_registro'=>$idusuario,'fecha_registro'=>date('Y-m-d H:i:s'),'activo'=>1];
			$this->db->insert('movimientos_proveedor',$tranMovProv);
			$valoriz = ['anio_valorizacion'=>date('Y'),'numero'=>$numero,'fecha'=>date('Y-m-d H:i:s'),'idsucursal'=>$suc,'idproveedor'=>$prov,'idtransaccion'=>$idtran];
			$this->db->insert('valorizacion',$valoriz);
			$idval = $this->db->insert_id();
			/*$valorizDet[$k]['idvalorizacion'] = $idval;
			$valorizGuiaDet[$k]['idvalorizacion'] = $idval;*/
			foreach($valorizDet as $det):
				$det['idvalorizacion'] = $idval;
				$this->db->insert('valorizacion_detalle',$det);
			endforeach;
			foreach($valorizGuiaDet as $det):
				$det['idvalorizacion'] = $idval;
				$this->db->insert('guia_entrada_detalle_valorizacion',$det);
			endforeach;
		endforeach;
		
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return false;
		}else{
			$this->db->trans_commit();
			return true;
		}
	}
	public function traeTranByIdVal($where)
	{
		$this->db->select('idtransaccion');
		$this->db->from('valorizacion');
		$this->db->where($where);
		$result = $this->db->get();
		if($result->num_rows() > 0){
			$result = $result->row();
			return $result->idtransaccion;
		}else return 0;
	}
}