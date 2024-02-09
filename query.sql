DROP TABLE IF EXISTS anio;
DROP TABLE IF EXISTS mes;
DROP TABLE IF EXISTS permisos_opcion;
DROP TABLE IF EXISTS permisos_menu_detalle;
DROP TABLE IF EXISTS permisos_menu;
DROP TABLE IF EXISTS menu_detalle;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS permiso;
DROP TABLE IF EXISTS modulo_rol;
DROP TABLE IF EXISTS modulo;
DROP TABLE IF EXISTS movimientos_caja;
DROP TABLE IF EXISTS movimientos_proveedor;
DROP TABLE IF EXISTS tipo_operacion_caja;
DROP TABLE IF EXISTS tipo_operacion_proveedor;
DROP TABLE IF EXISTS guia_entrada_detalle;
DROP TABLE IF EXISTS guia_entrada_detalle_valorizacion;
DROP TABLE IF EXISTS valorizacion_detalle;
DROP TABLE IF EXISTS valorizacion;
DROP TABLE IF EXISTS guia_entrada;
DROP TABLE IF EXISTS usuarios_sucursal;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS perfil;
DROP TABLE IF EXISTS ubigeo;
DROP TABLE IF EXISTS certificado_catador;
DROP TABLE IF EXISTS catador;
DROP TABLE IF EXISTS certificado_detalle;
DROP TABLE IF EXISTS quaker;
DROP TABLE IF EXISTS apariencia;
DROP TABLE IF EXISTS color;
DROP TABLE IF EXISTS olor;
DROP TABLE IF EXISTS certificado;
DROP TABLE IF EXISTS proveedor;
DROP TABLE IF EXISTS tipo_documento;
DROP TABLE IF EXISTS proceso;
DROP TABLE IF EXISTS variedad;
DROP VIEW IF EXISTS lista_movimientos_proveedor;
DROP VIEW IF EXISTS lista_ingresos_proveedores;
DROP VIEW IF EXISTS lista_ingresos_valorizaciones_pre;
DROP VIEW IF EXISTS lista_ingresos_valorizaciones_saldo;
DROP VIEW IF EXISTS lista_valorizaciones_proveedores;
DROP VIEW IF EXISTS lista_ubigeo;
DROP VIEW IF EXISTS lista_movimientos_caja;
DROP VIEW IF EXISTS saldos_caja;
DROP TABLE IF EXISTS guia_salida_detalle;
DROP TABLE IF EXISTS guia_salida;
DROP TABLE IF EXISTS movimientos_cliente;
DROP TABLE IF EXISTS tipo_operacion_cliente;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS factor;
DROP TABLE IF EXISTS transacciones;
DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS sucursal;
DROP TABLE IF EXISTS medio_pago;
DROP TABLE IF EXISTS tostado;

CREATE TABLE ubigeo(
	idubigeo smallint(4) NOT NULL AUTO_INCREMENT,
	ubigeo varchar(6),
	departamento varchar(50),
	provincia varchar(50),
	distrito varchar(50),
	latitud varchar(50),
	longitud varchar(50),
	cod_dep varchar(2),
	cod_pro varchar(2),
	cod_dis varchar(2),
	activo Char(1) DEFAULT '1',
	PRIMARY KEY (idubigeo)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;
	
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010101','AMAZONAS','CHACHAPOYAS','CHACHAPOYAS','-6.2294','-77.8714','01','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010102','AMAZONAS','CHACHAPOYAS','ASUNCION','-6.0317','-77.7122','01','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010103','AMAZONAS','CHACHAPOYAS','BALSAS','-6.8375','-78.0214','01','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010104','AMAZONAS','CHACHAPOYAS','CHETO','-6.2558','-77.7003','01','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010105','AMAZONAS','CHACHAPOYAS','CHILIQUIN','-6.0778','-77.7392','01','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010106','AMAZONAS','CHACHAPOYAS','CHUQUIBAMBA','-6.9333','-77.8575','01','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010107','AMAZONAS','CHACHAPOYAS','GRANADA','-6.0997','-77.6344','01','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010108','AMAZONAS','CHACHAPOYAS','HUANCAS','-6.1747','-77.8686','01','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010109','AMAZONAS','CHACHAPOYAS','LA JALCA','-6.4825','-77.8192','01','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010110','AMAZONAS','CHACHAPOYAS','LEIMEBAMBA','-6.6636','-77.8006','01','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010111','AMAZONAS','CHACHAPOYAS','LEVANTO','-6.3086','-77.8994','01','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010112','AMAZONAS','CHACHAPOYAS','MAGDALENA','-6.3736','-77.9017','01','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010113','AMAZONAS','CHACHAPOYAS','MARISCAL CASTILLA','-6.5939','-77.8053','01','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010114','AMAZONAS','CHACHAPOYAS','MOLINOPAMPA','-6.2056','-77.6683','01','01','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010115','AMAZONAS','CHACHAPOYAS','MONTEVIDEO','-6.6133','-77.8025','01','01','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010116','AMAZONAS','CHACHAPOYAS','OLLEROS','-6.0239','-77.6761','01','01','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010117','AMAZONAS','CHACHAPOYAS','QUINJALCA','-6.085','-77.66','01','01','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010118','AMAZONAS','CHACHAPOYAS','SAN FRANCISCO DE DAGUAS','-6.2333','-77.7392','01','01','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010119','AMAZONAS','CHACHAPOYAS','SAN ISIDRO DE MAINO','-6.3533','-77.8439','01','01','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010120','AMAZONAS','CHACHAPOYAS','SOLOCO','-6.2619','-77.7453','01','01','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010121','AMAZONAS','CHACHAPOYAS','SONCHE','-6.2183','-77.7753','01','01','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010201','AMAZONAS','BAGUA','BAGUA','-5.6389','-78.5319','01','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010202','AMAZONAS','BAGUA','ARAMANGO','-5.4156','-78.4361','01','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010203','AMAZONAS','BAGUA','COPALLIN','-5.6733','-78.4228','01','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010204','AMAZONAS','BAGUA','EL PARCO','-5.6247','-78.4764','01','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010205','AMAZONAS','BAGUA','IMAZA','-5.16','-78.2903','01','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010206','AMAZONAS','BAGUA','LA PECA','-5.6092','-78.4344','01','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010301','AMAZONAS','BONGARA','JUMBILLA','-5.9006','-77.7958','01','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010302','AMAZONAS','BONGARA','CHISQUILLA','-5.9003','-77.7839','01','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010303','AMAZONAS','BONGARA','CHURUJA','-6.0192','-77.9517','01','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010304','AMAZONAS','BONGARA','COROSHA','-5.8294','-77.84','01','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010305','AMAZONAS','BONGARA','CUISPES','-5.9236','-77.9392','01','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010306','AMAZONAS','BONGARA','FLORIDA','-5.8336','-77.9714','01','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010307','AMAZONAS','BONGARA','JAZAN','-5.9419','-77.9806','01','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010308','AMAZONAS','BONGARA','RECTA','-5.9194','-77.7861','01','03','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010309','AMAZONAS','BONGARA','SAN CARLOS','-5.9636','-77.9447','01','03','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010310','AMAZONAS','BONGARA','SHIPASBAMBA','-5.8744','-78.0692','01','03','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010311','AMAZONAS','BONGARA','VALERA','-6.0425','-77.9139','01','03','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010312','AMAZONAS','BONGARA','YAMBRASBAMBA','-5.6908','-77.9772','01','03','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010401','AMAZONAS','CONDORCANQUI','NIEVA','-4.5947','-77.8672','01','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010402','AMAZONAS','CONDORCANQUI','EL CENEPA','-4.4503','-78.1592','01','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010403','AMAZONAS','CONDORCANQUI','RIO SANTIAGO','-4.0106','-77.7658','01','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010501','AMAZONAS','LUYA','LAMUD','-6.1308','-77.9503','01','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010502','AMAZONAS','LUYA','CAMPORREDONDO','-6.2136','-78.3186','01','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010503','AMAZONAS','LUYA','COCABAMBA','-6.6297','-78.0303','01','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010504','AMAZONAS','LUYA','COLCAMAR','-6.3175','-78.0019','01','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010505','AMAZONAS','LUYA','CONILA','-6.1592','-78.1419','01','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010506','AMAZONAS','LUYA','INGUILPATA','-6.2428','-77.9561','01','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010507','AMAZONAS','LUYA','LONGUITA','-6.4147','-77.9681','01','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010508','AMAZONAS','LUYA','LONYA CHICO','-6.2328','-77.9564','01','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010509','AMAZONAS','LUYA','LUYA','-6.165','-77.9469','01','05','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010510','AMAZONAS','LUYA','LUYA VIEJO','-6.1275','-78.0847','01','05','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010511','AMAZONAS','LUYA','MARIA','-6.4517','-77.9733','01','05','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010512','AMAZONAS','LUYA','OCALLI','-6.2347','-78.2667','01','05','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010513','AMAZONAS','LUYA','OCUMAL','-6.3061','-78.2294','01','05','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010514','AMAZONAS','LUYA','PISUQUIA','-6.5114','-78.0747','01','05','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010515','AMAZONAS','LUYA','PROVIDENCIA','-6.3108','-78.2503','01','05','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010516','AMAZONAS','LUYA','SAN CRISTOBAL','-6.0997','-77.9525','01','05','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010517','AMAZONAS','LUYA','SAN FRANCISCO DEL YESO','-6.5861','-77.8469','01','05','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010518','AMAZONAS','LUYA','SAN JERONIMO','-6.0344','-77.9669','01','05','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010519','AMAZONAS','LUYA','SAN JUAN DE LOPECANCHA','-6.4572','-77.8969','01','05','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010520','AMAZONAS','LUYA','SANTA CATALINA','-6.1117','-78.0633','01','05','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010521','AMAZONAS','LUYA','SANTO TOMAS','-6.5617','-77.8739','01','05','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010522','AMAZONAS','LUYA','TINGO','-6.3761','-77.9056','01','05','22');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010523','AMAZONAS','LUYA','TRITA','-6.1519','-77.9806','01','05','23');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010601','AMAZONAS','RODRIGUEZ DE MENDOZA','SAN NICOLAS','-6.3956','-77.4831','01','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010602','AMAZONAS','RODRIGUEZ DE MENDOZA','CHIRIMOTO','-6.5283','-77.4869','01','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010603','AMAZONAS','RODRIGUEZ DE MENDOZA','COCHAMAL','-6.3933','-77.5889','01','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010604','AMAZONAS','RODRIGUEZ DE MENDOZA','HUAMBO','-6.4275','-77.5369','01','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010605','AMAZONAS','RODRIGUEZ DE MENDOZA','LIMABAMBA','-6.5025','-77.5097','01','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010606','AMAZONAS','RODRIGUEZ DE MENDOZA','LONGAR','-6.3853','-77.5461','01','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010607','AMAZONAS','RODRIGUEZ DE MENDOZA','MARISCAL BENAVIDES','-6.3697','-77.5003','01','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010608','AMAZONAS','RODRIGUEZ DE MENDOZA','MILPUC','-6.4983','-77.4358','01','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010609','AMAZONAS','RODRIGUEZ DE MENDOZA','OMIA','-6.4686','-77.3947','01','06','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010610','AMAZONAS','RODRIGUEZ DE MENDOZA','SANTA ROSA','-6.4542','-77.4539','01','06','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010611','AMAZONAS','RODRIGUEZ DE MENDOZA','TOTORA','-6.4914','-77.4711','01','06','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010612','AMAZONAS','RODRIGUEZ DE MENDOZA','VISTA ALEGRE','-6.1514','-77.3019','01','06','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010701','AMAZONAS','UTCUBAMBA','BAGUA GRANDE','-5.7558','-78.4428','01','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010702','AMAZONAS','UTCUBAMBA','CAJARURO','-5.7364','-78.4267','01','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010703','AMAZONAS','UTCUBAMBA','CUMBA','-5.9317','-78.6653','01','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010704','AMAZONAS','UTCUBAMBA','EL MILAGRO','-5.6367','-78.5578','01','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010705','AMAZONAS','UTCUBAMBA','JAMALCA','-5.9158','-78.2203','01','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010706','AMAZONAS','UTCUBAMBA','LONYA GRANDE','-6.0956','-78.4219','01','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('010707','AMAZONAS','UTCUBAMBA','YAMON','-6.0525','-78.5322','01','07','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020101','ANCASH','HUARAZ','HUARAZ','-9.5272','-77.5333','02','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020102','ANCASH','HUARAZ','COCHABAMBA','-9.4939','-77.8619','02','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020103','ANCASH','HUARAZ','COLCABAMBA','-9.5956','-77.8108','02','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020104','ANCASH','HUARAZ','HUANCHAY','-9.7236','-77.8197','02','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020105','ANCASH','HUARAZ','INDEPENDENCIA','-9.5189','-77.5344','02','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020106','ANCASH','HUARAZ','JANGAS','-9.4014','-77.5767','02','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020107','ANCASH','HUARAZ','LA LIBERTAD','-9.6333','-77.7442','02','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020108','ANCASH','HUARAZ','OLLEROS','-9.6664','-77.4661','02','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020109','ANCASH','HUARAZ','PAMPAS','-9.6556','-77.8272','02','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020110','ANCASH','HUARAZ','PARIACOTO','-9.5622','-77.8931','02','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020111','ANCASH','HUARAZ','PIRA','-9.5814','-77.7075','02','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020112','ANCASH','HUARAZ','TARICA','-9.3919','-77.5769','02','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020201','ANCASH','AIJA','AIJA','-9.7819','-77.6114','02','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020202','ANCASH','AIJA','CORIS','-9.8211','-77.7225','02','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020203','ANCASH','AIJA','HUACLLAN','-9.7975','-77.6747','02','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020204','ANCASH','AIJA','LA MERCED','-9.7361','-77.6189','02','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020205','ANCASH','AIJA','SUCCHA','-9.8242','-77.6497','02','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020301','ANCASH','ANTONIO RAYMONDI','LLAMELLIN','-9.1006','-77.0183','02','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020302','ANCASH','ANTONIO RAYMONDI','ACZO','-9.1525','-76.9903','02','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020303','ANCASH','ANTONIO RAYMONDI','CHACCHO','-9.0586','-77.0594','02','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020304','ANCASH','ANTONIO RAYMONDI','CHINGAS','-9.12','-76.9947','02','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020305','ANCASH','ANTONIO RAYMONDI','MIRGAS','-9.0792','-77.0933','02','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020306','ANCASH','ANTONIO RAYMONDI','SAN JUAN DE RONTOY','-9.1803','-77.0044','02','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020401','ANCASH','ASUNCION','CHACAS','-9.1622','-77.3694','02','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020402','ANCASH','ASUNCION','ACOCHACA','-9.1139','-77.3697','02','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020501','ANCASH','BOLOGNESI','CHIQUIAN','-10.1517','-77.1586','02','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020502','ANCASH','BOLOGNESI','ABELARDO PARDO LEZAMETA','-10.2992','-77.1508','02','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020503','ANCASH','BOLOGNESI','ANTONIO RAYMONDI','-10.1575','-77.4703','02','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020504','ANCASH','BOLOGNESI','AQUIA','-10.0742','-77.1464','02','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020505','ANCASH','BOLOGNESI','CAJACAY','-10.1564','-77.4419','02','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020506','ANCASH','BOLOGNESI','CANIS','-10.3381','-77.1711','02','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020507','ANCASH','BOLOGNESI','COLQUIOC','-10.3117','-77.6156','02','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020508','ANCASH','BOLOGNESI','HUALLANCA','-9.8994','-76.9444','02','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020509','ANCASH','BOLOGNESI','HUASTA','-10.1225','-77.1458','02','05','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020510','ANCASH','BOLOGNESI','HUAYLLACAYAN','-10.2436','-77.4342','02','05','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020511','ANCASH','BOLOGNESI','LA PRIMAVERA','-10.3344','-77.1253','02','05','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020512','ANCASH','BOLOGNESI','MANGAS','-10.3694','-77.1039','02','05','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020513','ANCASH','BOLOGNESI','PACLLON','-10.2333','-77.0722','02','05','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020514','ANCASH','BOLOGNESI','SAN MIGUEL DE CORPANQUI','-10.285','-77.2','02','05','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020515','ANCASH','BOLOGNESI','TICLLOS','-10.2522','-77.1911','02','05','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020601','ANCASH','CARHUAZ','CARHUAZ','-9.2806','-77.6469','02','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020602','ANCASH','CARHUAZ','ACOPAMPA','-9.2942','-77.6225','02','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020603','ANCASH','CARHUAZ','AMASHCA','-9.2392','-77.6464','02','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020604','ANCASH','CARHUAZ','ANTA','-9.3569','-77.5978','02','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020605','ANCASH','CARHUAZ','ATAQUERO','-9.2625','-77.6914','02','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020606','ANCASH','CARHUAZ','MARCARA','-9.3211','-77.6033','02','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020607','ANCASH','CARHUAZ','PARIAHUANCA','-9.3642','-77.5828','02','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020608','ANCASH','CARHUAZ','SAN MIGUEL DE ACO','-9.3678','-77.5644','02','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020609','ANCASH','CARHUAZ','SHILLA','-9.2306','-77.6256','02','06','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020610','ANCASH','CARHUAZ','TINCO','-9.2711','-77.6819','02','06','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020611','ANCASH','CARHUAZ','YUNGAR','-9.3778','-77.5931','02','06','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020701','ANCASH','CARLOS FERMIN FITZCA','SAN LUIS','-9.0933','-77.3331','02','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020702','ANCASH','CARLOS FERMIN FITZCA','SAN NICOLAS','-8.9767','-77.1842','02','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020703','ANCASH','CARLOS FERMIN FITZCA','YAUYA','-8.9875','-77.2894','02','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020801','ANCASH','CASMA','CASMA','-9.475','-78.3036','02','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020802','ANCASH','CASMA','BUENA VISTA ALTA','-9.4289','-78.2047','02','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020803','ANCASH','CASMA','COMANDANTE NOEL','-9.4622','-78.3831','02','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020804','ANCASH','CASMA','YAUTAN','-9.5097','-77.9956','02','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020901','ANCASH','CORONGO','CORONGO','-8.5683','-77.8967','02','09','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020902','ANCASH','CORONGO','ACO','-8.5228','-77.8769','02','09','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020903','ANCASH','CORONGO','BAMBAS','-8.6022','-77.9925','02','09','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020904','ANCASH','CORONGO','CUSCA','-8.5106','-77.8631','02','09','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020905','ANCASH','CORONGO','LA PAMPA','-8.6619','-77.9011','02','09','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020906','ANCASH','CORONGO','YANAC','-8.6178','-77.8636','02','09','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('020907','ANCASH','CORONGO','YUPAN','-8.615','-77.9661','02','09','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021001','ANCASH','HUARI','HUARI','-9.3478','-77.1725','02','10','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021002','ANCASH','HUARI','ANRA','-9.2347','-76.9253','02','10','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021003','ANCASH','HUARI','CAJAY','-9.3253','-77.1569','02','10','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021004','ANCASH','HUARI','CHAVIN DE HUANTAR','-9.5869','-77.1772','02','10','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021005','ANCASH','HUARI','HUACACHI','-9.3164','-76.9356','02','10','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021006','ANCASH','HUARI','HUACCHIS','-9.2','-76.7875','02','10','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021007','ANCASH','HUARI','HUACHIS','-9.4097','-77.1003','02','10','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021008','ANCASH','HUARI','HUANTAR','-9.4517','-77.175','02','10','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021009','ANCASH','HUARI','MASIN','-9.3653','-77.0958','02','10','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021010','ANCASH','HUARI','PAUCAS','-9.1522','-76.8983','02','10','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021011','ANCASH','HUARI','PONTO','-9.325','-77.0047','02','10','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021012','ANCASH','HUARI','RAHUAPAMPA','-9.3592','-77.0772','02','10','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021013','ANCASH','HUARI','RAPAYAN','-9.2053','-76.7611','02','10','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021014','ANCASH','HUARI','SAN MARCOS','-9.525','-77.1575','02','10','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021015','ANCASH','HUARI','SAN PEDRO DE CHANA','-9.4025','-77.0117','02','10','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021016','ANCASH','HUARI','UCO','-9.1886','-76.9269','02','10','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021101','ANCASH','HUARMEY','HUARMEY','-10.0697','-78.1517','02','11','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021102','ANCASH','HUARMEY','COCHAPETI','-9.9872','-77.6467','02','11','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021103','ANCASH','HUARMEY','CULEBRAS','-9.9486','-78.2247','02','11','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021104','ANCASH','HUARMEY','HUAYAN','-9.8761','-77.7081','02','11','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021105','ANCASH','HUARMEY','MALVAS','-9.9294','-77.6581','02','11','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021201','ANCASH','HUAYLAS','CARAZ','-9.0472','-77.8108','02','12','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021202','ANCASH','HUAYLAS','HUALLANCA','-8.8194','-77.8653','02','12','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021203','ANCASH','HUAYLAS','HUATA','-9.0167','-77.8625','02','12','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021204','ANCASH','HUAYLAS','HUAYLAS','-8.8694','-77.8925','02','12','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021205','ANCASH','HUAYLAS','MATO','-8.9617','-77.8456','02','12','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021206','ANCASH','HUAYLAS','PAMPAROMAS','-9.0731','-77.9819','02','12','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021207','ANCASH','HUAYLAS','PUEBLO LIBRE','-9.1117','-77.8025','02','12','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021208','ANCASH','HUAYLAS','SANTA CRUZ','-8.9486','-77.815','02','12','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021209','ANCASH','HUAYLAS','SANTO TORIBIO','-8.8644','-77.915','02','12','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021210','ANCASH','HUAYLAS','YURACMARCA','-8.7364','-77.9036','02','12','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021301','ANCASH','MARISCAL LUZURIAGA','PISCOBAMBA','-8.8611','-77.3567','02','13','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021302','ANCASH','MARISCAL LUZURIAGA','CASCA','-8.8553','-77.3919','02','13','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021303','ANCASH','MARISCAL LUZURIAGA','ELEAZAR GUZMAN BARRON','-8.8997','-77.2419','02','13','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021304','ANCASH','MARISCAL LUZURIAGA','FIDEL OLIVAS ESCUDERO','-8.8067','-77.2806','02','13','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021305','ANCASH','MARISCAL LUZURIAGA','LLAMA','-8.9142','-77.2994','02','13','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021306','ANCASH','MARISCAL LUZURIAGA','LLUMPA','-8.9467','-77.3669','02','13','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021307','ANCASH','MARISCAL LUZURIAGA','LUCMA','-8.9194','-77.4097','02','13','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021308','ANCASH','MARISCAL LUZURIAGA','MUSGA','-8.9061','-77.3372','02','13','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021401','ANCASH','OCROS','OCROS','-10.4058','-77.3958','02','14','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021402','ANCASH','OCROS','ACAS','-10.4592','-77.3283','02','14','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021403','ANCASH','OCROS','CAJAMARQUILLA','-10.355','-77.1997','02','14','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021404','ANCASH','OCROS','CARHUAPAMPA','-10.4969','-77.2428','02','14','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021405','ANCASH','OCROS','COCHAS','-10.535','-77.4236','02','14','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021406','ANCASH','OCROS','CONGAS','-10.3361','-77.4419','02','14','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021407','ANCASH','OCROS','LLIPA','-10.3808','-77.2067','02','14','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021408','ANCASH','OCROS','SAN CRISTOBAL DE RAJAN','-10.3858','-77.2192','02','14','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021409','ANCASH','OCROS','SAN PEDRO','-10.3706','-77.4875','02','14','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021410','ANCASH','OCROS','SANTIAGO DE CHILCAS','-10.4381','-77.3669','02','14','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021501','ANCASH','PALLASCA','CABANA','-8.3928','-78.0089','02','15','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021502','ANCASH','PALLASCA','BOLOGNESI','-8.3517','-78.0506','02','15','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021503','ANCASH','PALLASCA','CONCHUCOS','-8.2658','-77.8483','02','15','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021504','ANCASH','PALLASCA','HUACASCHUQUE','-8.3061','-78.0031','02','15','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021505','ANCASH','PALLASCA','HUANDOVAL','-8.3272','-77.9728','02','15','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021506','ANCASH','PALLASCA','LACABAMBA','-8.2583','-77.8958','02','15','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021507','ANCASH','PALLASCA','LLAPO','-8.5111','-78.0397','02','15','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021508','ANCASH','PALLASCA','PALLASCA','-8.2494','-77.9972','02','15','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021509','ANCASH','PALLASCA','PAMPAS','-8.1925','-77.8931','02','15','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021510','ANCASH','PALLASCA','SANTA ROSA','-8.5239','-78.065','02','15','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021511','ANCASH','PALLASCA','TAUCA','-8.4717','-78.0347','02','15','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021601','ANCASH','POMABAMBA','POMABAMBA','-8.8147','-77.4592','02','16','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021602','ANCASH','POMABAMBA','HUAYLLAN','-8.8547','-77.4336','02','16','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021603','ANCASH','POMABAMBA','PAROBAMBA','-8.6886','-77.4294','02','16','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021604','ANCASH','POMABAMBA','QUINUABAMBA','-8.6944','-77.3978','02','16','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021701','ANCASH','RECUAY','RECUAY','-9.7214','-77.455','02','17','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021702','ANCASH','RECUAY','CATAC','-9.8017','-77.4303','02','17','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021703','ANCASH','RECUAY','COTAPARACO','-9.9931','-77.5878','02','17','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021704','ANCASH','RECUAY','HUAYLLAPAMPA','-10.055','-77.535','02','17','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021705','ANCASH','RECUAY','LLACLLIN','-10.07','-77.6222','02','17','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021706','ANCASH','RECUAY','MARCA','-10.0878','-77.4747','02','17','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021707','ANCASH','RECUAY','PAMPAS CHICO','-10.1147','-77.3981','02','17','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021708','ANCASH','RECUAY','PARARIN','-10.0497','-77.6533','02','17','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021709','ANCASH','RECUAY','TAPACOCHA','-10.0097','-77.5681','02','17','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021710','ANCASH','RECUAY','TICAPAMPA','-9.7578','-77.4444','02','17','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021801','ANCASH','SANTA','CHIMBOTE','-9.0758','-78.5842','02','18','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021802','ANCASH','SANTA','CACERES DEL PERU','-9.0131','-78.1403','02','18','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021803','ANCASH','SANTA','COISHCO','-9.0239','-78.6181','02','18','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021804','ANCASH','SANTA','MACATE','-8.7603','-78.0603','02','18','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021805','ANCASH','SANTA','MORO','-9.1378','-78.1844','02','18','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021806','ANCASH','SANTA','NEPEÑA','-9.1731','-78.3597','02','18','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021807','ANCASH','SANTA','SAMANCO','-8.9878','-78.6161','02','18','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021808','ANCASH','SANTA','SANTA','-9.1156','-78.5314','02','18','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021809','ANCASH','SANTA','NUEVO CHIMBOTE','-9.2606','-78.4994','02','18','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021901','ANCASH','SIHUAS','SIHUAS','-8.5556','-77.6344','02','19','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021902','ANCASH','SIHUAS','ACOBAMBA','-8.3264','-77.585','02','19','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021903','ANCASH','SIHUAS','ALFONSO UGARTE','-8.455','-77.4292','02','19','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021904','ANCASH','SIHUAS','CASHAPAMPA','-8.5617','-77.6558','02','19','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021905','ANCASH','SIHUAS','CHINGALPO','-8.3394','-77.5992','02','19','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021906','ANCASH','SIHUAS','HUAYLLABAMBA','-8.535','-77.5689','02','19','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021907','ANCASH','SIHUAS','QUICHES','-8.3944','-77.4933','02','19','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021908','ANCASH','SIHUAS','RAGASH','-8.5308','-77.6692','02','19','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021909','ANCASH','SIHUAS','SAN JUAN','-8.6461','-77.5808','02','19','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('021910','ANCASH','SIHUAS','SICSIBAMBA','-8.6236','-77.5367','02','19','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('022001','ANCASH','YUNGAY','YUNGAY','-9.1375','-77.7475','02','20','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('022002','ANCASH','YUNGAY','CASCAPARA','-9.2261','-77.7197','02','20','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('022003','ANCASH','YUNGAY','MANCOS','-9.1911','-77.7164','02','20','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('022004','ANCASH','YUNGAY','MATACOTO','-9.1775','-77.7494','02','20','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('022005','ANCASH','YUNGAY','QUILLO','-9.3297','-78.0431','02','20','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('022006','ANCASH','YUNGAY','RANRAHIRCA','-9.1725','-77.725','02','20','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('022007','ANCASH','YUNGAY','SHUPLUY','-9.2183','-77.6975','02','20','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('022008','ANCASH','YUNGAY','YANAMA','-9.0222','-77.4744','02','20','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030101','APURIMAC','ABANCAY','ABANCAY','-13.6367','-72.8792','03','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030102','APURIMAC','ABANCAY','CHACOCHE','-13.9417','-72.9897','03','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030103','APURIMAC','ABANCAY','CIRCA','-13.8778','-72.8736','03','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030104','APURIMAC','ABANCAY','CURAHUASI','-13.5417','-72.6953','03','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030105','APURIMAC','ABANCAY','HUANIPACA','-13.4917','-72.9397','03','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030106','APURIMAC','ABANCAY','LAMBRAMA','-13.8706','-72.7728','03','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030107','APURIMAC','ABANCAY','PICHIRHUA','-13.8606','-73.0736','03','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030108','APURIMAC','ABANCAY','SAN PEDRO DE CACHORA','-13.5144','-72.8161','03','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030109','APURIMAC','ABANCAY','TAMBURCO','-13.6211','-72.8725','03','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030201','APURIMAC','ANDAHUAYLAS','ANDAHUAYLAS','-13.6561','-73.3847','03','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030202','APURIMAC','ANDAHUAYLAS','ANDARAPA','-13.5264','-73.3681','03','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030203','APURIMAC','ANDAHUAYLAS','CHIARA','-13.8681','-73.6681','03','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030204','APURIMAC','ANDAHUAYLAS','HUANCARAMA','-13.6467','-73.0856','03','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030205','APURIMAC','ANDAHUAYLAS','HUANCARAY','-13.7578','-73.5275','03','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030206','APURIMAC','ANDAHUAYLAS','HUAYANA','-14.0503','-73.6097','03','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030207','APURIMAC','ANDAHUAYLAS','KISHUARA','-13.6914','-73.1214','03','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030208','APURIMAC','ANDAHUAYLAS','PACOBAMBA','-13.6167','-73.0872','03','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030209','APURIMAC','ANDAHUAYLAS','PACUCHA','-13.6089','-73.3442','03','02','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030210','APURIMAC','ANDAHUAYLAS','PAMPACHIRI','-14.1861','-73.5436','03','02','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030211','APURIMAC','ANDAHUAYLAS','POMACOCHA','-14.085','-73.5911','03','02','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030212','APURIMAC','ANDAHUAYLAS','SAN ANTONIO DE CACHI','-13.7733','-73.6036','03','02','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030213','APURIMAC','ANDAHUAYLAS','SAN JERONIMO','-13.6506','-73.3656','03','02','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030214','APURIMAC','ANDAHUAYLAS','SAN MIGUEL DE CHACCRAMPA','-13.9594','-73.6086','03','02','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030215','APURIMAC','ANDAHUAYLAS','SANTA MARIA DE CHICMO','-13.6578','-73.4931','03','02','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030216','APURIMAC','ANDAHUAYLAS','TALAVERA','-13.6536','-73.4278','03','02','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030217','APURIMAC','ANDAHUAYLAS','TUMAY HUARACA','-14.0539','-73.5689','03','02','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030218','APURIMAC','ANDAHUAYLAS','TURPO','-13.7856','-73.4728','03','02','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030219','APURIMAC','ANDAHUAYLAS','KAQUIABAMBA','-13.5369','-73.2878','03','02','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030220','APURIMAC','ANDAHUAYLAS','JOSÉ MARÍA ARGUEDAS','-13.7336','-73.3503','03','02','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030301','APURIMAC','ANTABAMBA','ANTABAMBA','-14.3653','-72.8778','03','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030302','APURIMAC','ANTABAMBA','EL ORO','-14.2092','-73.0583','03','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030303','APURIMAC','ANTABAMBA','HUAQUIRCA','-14.3369','-72.8936','03','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030304','APURIMAC','ANTABAMBA','JUAN ESPINOZA MEDRANO','-14.4286','-72.9147','03','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030305','APURIMAC','ANTABAMBA','OROPESA','-14.2628','-72.5639','03','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030306','APURIMAC','ANTABAMBA','PACHACONAS','-14.2244','-73.0147','03','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030307','APURIMAC','ANTABAMBA','SABAINO','-14.3122','-72.9442','03','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030401','APURIMAC','AYMARAES','CHALHUANCA','-14.295','-73.2431','03','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030402','APURIMAC','AYMARAES','CAPAYA','-14.1181','-73.3217','03','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030403','APURIMAC','AYMARAES','CARAYBAMBA','-14.3783','-73.1608','03','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030404','APURIMAC','AYMARAES','CHAPIMARCA','-13.9747','-73.0644','03','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030405','APURIMAC','AYMARAES','COLCABAMBA','-14.005','-73.2519','03','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030406','APURIMAC','AYMARAES','COTARUSE','-14.4164','-73.2053','03','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030407','APURIMAC','AYMARAES','HUAYLLO','-14.1331','-73.2686','03','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030408','APURIMAC','AYMARAES','JUSTO APU SAHUARAURA','-14.1489','-73.1758','03','04','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030409','APURIMAC','AYMARAES','LUCRE','-13.9506','-73.2253','03','04','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030410','APURIMAC','AYMARAES','POCOHUANCA','-14.22','-73.0881','03','04','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030411','APURIMAC','AYMARAES','SAN JUAN DE CHACÑA','-13.9239','-73.1828','03','04','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030412','APURIMAC','AYMARAES','SAÑAYCA','-14.2036','-73.3461','03','04','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030413','APURIMAC','AYMARAES','SORAYA','-14.1656','-73.3139','03','04','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030414','APURIMAC','AYMARAES','TAPAIRIHUA','-14.1408','-73.1431','03','04','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030415','APURIMAC','AYMARAES','TINTAY','-13.9592','-73.1867','03','04','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030416','APURIMAC','AYMARAES','TORAYA','-14.0522','-73.2958','03','04','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030417','APURIMAC','AYMARAES','YANACA','-14.225','-73.1589','03','04','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030501','APURIMAC','COTABAMBAS','TAMBOBAMBA','-13.945','-72.1769','03','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030502','APURIMAC','COTABAMBAS','COTABAMBAS','-13.7458','-72.3567','03','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030503','APURIMAC','COTABAMBAS','COYLLURQUI','-13.8367','-72.4339','03','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030504','APURIMAC','COTABAMBAS','HAQUIRA','-14.2153','-72.1903','03','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030505','APURIMAC','COTABAMBAS','MARA','-14.0864','-72.1025','03','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030506','APURIMAC','COTABAMBAS','CHALLHUAHUACHO','-14.1192','-72.2486','03','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030601','APURIMAC','CHINCHEROS','CHINCHEROS','-13.5175','-73.7222','03','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030602','APURIMAC','CHINCHEROS','ANCO_HUALLO','-13.5328','-73.6769','03','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030603','APURIMAC','CHINCHEROS','COCHARCAS','-13.61','-73.7408','03','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030604','APURIMAC','CHINCHEROS','HUACCANA','-13.3872','-73.69','03','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030605','APURIMAC','CHINCHEROS','OCOBAMBA','-13.4828','-73.5617','03','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030606','APURIMAC','CHINCHEROS','ONGOY','-13.4031','-73.6697','03','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030607','APURIMAC','CHINCHEROS','URANMARCA','-13.6728','-73.6686','03','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030608','APURIMAC','CHINCHEROS','RANRACANCHA','-13.5322','-73.6056','03','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030609','APURIMAC','CHINCHEROS','ROCCHACC','-13.44','-73.5997','03','06','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030610','APURIMAC','CHINCHEROS','EL PORVENIR','-13.3975','-73.595','03','06','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030611','APURIMAC','CHINCHEROS','LOS CHANKAS','-13.4353','-73.8219','03','06','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030701','APURIMAC','GRAU','CHUQUIBAMBILLA','-14.1042','-72.7086','03','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030702','APURIMAC','GRAU','CURPAHUASI','-14.0631','-72.6714','03','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030703','APURIMAC','GRAU','GAMARRA','-13.8728','-72.5122','03','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030704','APURIMAC','GRAU','HUAYLLATI','-13.9283','-72.4847','03','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030705','APURIMAC','GRAU','MAMARA','-14.2275','-72.5906','03','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030706','APURIMAC','GRAU','MICAELA BASTIDAS','-14.115','-72.6136','03','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030707','APURIMAC','GRAU','PATAYPAMPA','-14.1775','-72.6706','03','07','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030708','APURIMAC','GRAU','PROGRESO','-14.0742','-72.4744','03','07','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030709','APURIMAC','GRAU','SAN ANTONIO','-14.1689','-72.6233','03','07','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030710','APURIMAC','GRAU','SANTA ROSA','-14.1408','-72.6586','03','07','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030711','APURIMAC','GRAU','TURPAY','-14.2283','-72.6253','03','07','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030712','APURIMAC','GRAU','VILCABAMBA','-14.0758','-72.625','03','07','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030713','APURIMAC','GRAU','VIRUNDO','-14.2506','-72.6811','03','07','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('030714','APURIMAC','GRAU','CURASCO','-14.0606','-72.5672','03','07','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040101','AREQUIPA','AREQUIPA','AREQUIPA','-16.4008','-71.5378','04','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040102','AREQUIPA','AREQUIPA','ALTO SELVA ALEGRE','-16.3706','-71.5272','04','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040103','AREQUIPA','AREQUIPA','CAYMA','-16.3881','-71.5492','04','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040104','AREQUIPA','AREQUIPA','CERRO COLORADO','-16.375','-71.5611','04','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040105','AREQUIPA','AREQUIPA','CHARACATO','-16.4706','-71.4897','04','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040106','AREQUIPA','AREQUIPA','CHIGUATA','-16.4025','-71.3939','04','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040107','AREQUIPA','AREQUIPA','JACOBO HUNTER','-16.4467','-71.5556','04','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040108','AREQUIPA','AREQUIPA','LA JOYA','-16.4239','-71.8206','04','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040109','AREQUIPA','AREQUIPA','MARIANO MELGAR','-16.4058','-71.5117','04','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040110','AREQUIPA','AREQUIPA','MIRAFLORES','-16.395','-71.5211','04','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040111','AREQUIPA','AREQUIPA','MOLLEBAYA','-16.4883','-71.4686','04','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040112','AREQUIPA','AREQUIPA','PAUCARPATA','-16.4233','-71.5083','04','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040113','AREQUIPA','AREQUIPA','POCSI','-16.5172','-71.3925','04','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040114','AREQUIPA','AREQUIPA','POLOBAYA','-16.5606','-71.3747','04','01','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040115','AREQUIPA','AREQUIPA','QUEQUEÑA','-16.5586','-71.4544','04','01','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040116','AREQUIPA','AREQUIPA','SABANDIA','-16.4561','-71.495','04','01','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040117','AREQUIPA','AREQUIPA','SACHACA','-16.4286','-71.5678','04','01','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040118','AREQUIPA','AREQUIPA','SAN JUAN DE SIGUAS','-16.3461','-72.1314','04','01','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040119','AREQUIPA','AREQUIPA','SAN JUAN DE TARUCANI','-16.1839','-71.0656','04','01','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040120','AREQUIPA','AREQUIPA','SANTA ISABEL DE SIGUAS','-16.3197','-72.1028','04','01','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040121','AREQUIPA','AREQUIPA','SANTA RITA DE SIGUAS','-16.4928','-72.0944','04','01','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040122','AREQUIPA','AREQUIPA','SOCABAYA','-16.4522','-71.5308','04','01','22');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040123','AREQUIPA','AREQUIPA','TIABAYA','-16.4489','-71.5908','04','01','23');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040124','AREQUIPA','AREQUIPA','UCHUMAYO','-16.425','-71.6722','04','01','24');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040125','AREQUIPA','AREQUIPA','VITOR','-16.4658','-71.9389','04','01','25');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040126','AREQUIPA','AREQUIPA','YANAHUARA','-16.395','-71.5539','04','01','26');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040127','AREQUIPA','AREQUIPA','YARABAMBA','-16.5481','-71.4775','04','01','27');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040128','AREQUIPA','AREQUIPA','YURA','-16.245','-71.6931','04','01','28');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040129','AREQUIPA','AREQUIPA','JOSE LUIS BUSTAMANTE Y RIVERO','-16.4344','-71.5175','04','01','29');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040201','AREQUIPA','CAMANA','CAMANA','-16.6236','-72.7114','04','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040202','AREQUIPA','CAMANA','JOSE MARIA QUIMPER','-16.6031','-72.7275','04','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040203','AREQUIPA','CAMANA','MARIANO NICOLAS VALCARCEL','-16.0303','-73.1625','04','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040204','AREQUIPA','CAMANA','MARISCAL CACERES','-16.6183','-72.7361','04','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040205','AREQUIPA','CAMANA','NICOLAS DE PIEROLA','-16.5717','-72.7147','04','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040206','AREQUIPA','CAMANA','OCOÑA','-16.4328','-73.1081','04','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040207','AREQUIPA','CAMANA','QUILCA','-16.7164','-72.4275','04','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040208','AREQUIPA','CAMANA','SAMUEL PASTOR','-16.615','-72.6989','04','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040301','AREQUIPA','CARAVELI','CARAVELI','-15.7728','-73.3681','04','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040302','AREQUIPA','CARAVELI','ACARI','-15.4325','-74.6172','04','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040303','AREQUIPA','CARAVELI','ATICO','-16.2089','-73.6258','04','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040304','AREQUIPA','CARAVELI','ATIQUIPA','-15.7956','-74.3658','04','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040305','AREQUIPA','CARAVELI','BELLA UNION','-15.4519','-74.6622','04','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040306','AREQUIPA','CARAVELI','CAHUACHO','-15.5042','-73.4817','04','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040307','AREQUIPA','CARAVELI','CHALA','-15.8667','-74.2472','04','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040308','AREQUIPA','CARAVELI','CHAPARRA','-15.8058','-73.9672','04','03','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040309','AREQUIPA','CARAVELI','HUANUHUANU','-15.6592','-74.0936','04','03','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040310','AREQUIPA','CARAVELI','JAQUI','-15.4753','-74.4414','04','03','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040311','AREQUIPA','CARAVELI','LOMAS','-15.5719','-74.8533','04','03','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040312','AREQUIPA','CARAVELI','QUICACHA','-15.6253','-73.7978','04','03','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040313','AREQUIPA','CARAVELI','YAUCA','-15.6606','-74.5269','04','03','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040401','AREQUIPA','CASTILLA','APLAO','-16.0761','-72.4925','04','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040402','AREQUIPA','CASTILLA','ANDAGUA','-15.4975','-72.355','04','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040403','AREQUIPA','CASTILLA','AYO','-15.6836','-72.2744','04','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040404','AREQUIPA','CASTILLA','CHACHAS','-15.5017','-72.2719','04','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040405','AREQUIPA','CASTILLA','CHILCAYMARCA','-15.2867','-72.3794','04','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040406','AREQUIPA','CASTILLA','CHOCO','-15.5761','-72.1331','04','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040407','AREQUIPA','CASTILLA','HUANCARQUI','-16.0969','-72.4722','04','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040408','AREQUIPA','CASTILLA','MACHAGUAY','-15.6486','-72.5056','04','04','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040409','AREQUIPA','CASTILLA','ORCOPAMPA','-15.2661','-72.3431','04','04','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040410','AREQUIPA','CASTILLA','PAMPACOLCA','-15.7131','-72.5728','04','04','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040411','AREQUIPA','CASTILLA','TIPAN','-15.7272','-72.5053','04','04','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040412','AREQUIPA','CASTILLA','UÑON','-15.7275','-72.4317','04','04','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040413','AREQUIPA','CASTILLA','URACA','-16.2231','-72.4733','04','04','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040414','AREQUIPA','CASTILLA','VIRACO','-15.6547','-72.5247','04','04','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040501','AREQUIPA','CAYLLOMA','CHIVAY','-15.64','-71.6033','04','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040502','AREQUIPA','CAYLLOMA','ACHOMA','-15.6611','-71.7017','04','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040503','AREQUIPA','CAYLLOMA','CABANACONDE','-15.6214','-71.9797','04','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040504','AREQUIPA','CAYLLOMA','CALLALLI','-15.5067','-71.4483','04','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040505','AREQUIPA','CAYLLOMA','CAYLLOMA','-15.1872','-71.7725','04','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040506','AREQUIPA','CAYLLOMA','COPORAQUE','-15.6275','-71.6483','04','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040507','AREQUIPA','CAYLLOMA','HUAMBO','-15.7297','-72.1072','04','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040508','AREQUIPA','CAYLLOMA','HUANCA','-16.0311','-71.8736','04','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040509','AREQUIPA','CAYLLOMA','ICHUPAMPA','-15.6503','-71.6892','04','05','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040510','AREQUIPA','CAYLLOMA','LARI','-15.6217','-71.7692','04','05','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040511','AREQUIPA','CAYLLOMA','LLUTA','-16.0156','-72.0161','04','05','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040512','AREQUIPA','CAYLLOMA','MACA','-15.6417','-71.7711','04','05','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040513','AREQUIPA','CAYLLOMA','MADRIGAL','-15.6086','-71.8103','04','05','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040514','AREQUIPA','CAYLLOMA','SAN ANTONIO DE CHUCA','-15.8403','-71.0903','04','05','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040515','AREQUIPA','CAYLLOMA','SIBAYO','-15.4858','-71.4586','04','05','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040516','AREQUIPA','CAYLLOMA','TAPAY','-15.5789','-71.9414','04','05','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040517','AREQUIPA','CAYLLOMA','TISCO','-15.3469','-71.4492','04','05','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040518','AREQUIPA','CAYLLOMA','TUTI','-15.5325','-71.5511','04','05','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040519','AREQUIPA','CAYLLOMA','YANQUE','-15.65','-71.6614','04','05','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040520','AREQUIPA','CAYLLOMA','MAJES','-16.3586','-72.1908','04','05','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040601','AREQUIPA','CONDESUYOS','CHUQUIBAMBA','-15.8397','-72.6542','04','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040602','AREQUIPA','CONDESUYOS','ANDARAY','-15.7961','-72.8597','04','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040603','AREQUIPA','CONDESUYOS','CAYARANI','-14.6731','-72.0231','04','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040604','AREQUIPA','CONDESUYOS','CHICHAS','-15.5469','-72.9183','04','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040605','AREQUIPA','CONDESUYOS','IRAY','-15.8564','-72.625','04','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040606','AREQUIPA','CONDESUYOS','RIO GRANDE','-15.9411','-73.1308','04','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040607','AREQUIPA','CONDESUYOS','SALAMANCA','-15.5042','-72.8333','04','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040608','AREQUIPA','CONDESUYOS','YANAQUIHUA','-15.7747','-72.8758','04','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040701','AREQUIPA','ISLAY','MOLLENDO','-17.025','-72.0181','04','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040702','AREQUIPA','ISLAY','COCACHACRA','-17.0942','-71.7711','04','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040703','AREQUIPA','ISLAY','DEAN VALDIVIA','-17.145','-71.8239','04','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040704','AREQUIPA','ISLAY','ISLAY','-17','-72.1017','04','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040705','AREQUIPA','ISLAY','MEJIA','-17.1028','-71.9086','04','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040706','AREQUIPA','ISLAY','PUNTA DE BOMBON','-17.1728','-71.7928','04','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040801','AREQUIPA','LA UNION','COTAHUASI','-15.2111','-72.8911','04','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040802','AREQUIPA','LA UNION','ALCA','-15.1342','-72.7647','04','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040803','AREQUIPA','LA UNION','CHARCANA','-15.2411','-73.0697','04','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040804','AREQUIPA','LA UNION','HUAYNACOTAS','-15.1744','-72.8514','04','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040805','AREQUIPA','LA UNION','PAMPAMARCA','-15.185','-72.9072','04','08','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040806','AREQUIPA','LA UNION','PUYCA','-15.0589','-72.6908','04','08','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040807','AREQUIPA','LA UNION','QUECHUALLA','-15.2758','-73.0233','04','08','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040808','AREQUIPA','LA UNION','SAYLA','-15.3211','-73.2214','04','08','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040809','AREQUIPA','LA UNION','TAURIA','-15.3553','-73.2319','04','08','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040810','AREQUIPA','LA UNION','TOMEPAMPA','-15.1728','-72.8297','04','08','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('040811','AREQUIPA','LA UNION','TORO','-15.2642','-72.9275','04','08','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050101','AYACUCHO','HUAMANGA','AYACUCHO','-13.1542','-74.2228','05','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050102','AYACUCHO','HUAMANGA','ACOCRO','-13.2183','-74.0411','05','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050103','AYACUCHO','HUAMANGA','ACOS VINCHOS','-13.1125','-74.1017','05','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050104','AYACUCHO','HUAMANGA','CARMEN ALTO','-13.1722','-74.2242','05','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050105','AYACUCHO','HUAMANGA','CHIARA','-13.2733','-74.2053','05','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050106','AYACUCHO','HUAMANGA','OCROS','-13.3917','-73.9164','05','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050107','AYACUCHO','HUAMANGA','PACAYCASA','-13.0564','-74.2142','05','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050108','AYACUCHO','HUAMANGA','QUINUA','-13.0497','-74.1397','05','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050109','AYACUCHO','HUAMANGA','SAN JOSE DE TICLLAS','-13.1328','-74.3331','05','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050110','AYACUCHO','HUAMANGA','SAN JUAN BAUTISTA','-13.1658','-74.2222','05','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050111','AYACUCHO','HUAMANGA','SANTIAGO DE PISCHA','-13.085','-74.3911','05','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050112','AYACUCHO','HUAMANGA','SOCOS','-13.215','-74.2894','05','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050113','AYACUCHO','HUAMANGA','TAMBILLO','-13.1922','-74.1097','05','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050114','AYACUCHO','HUAMANGA','VINCHOS','-13.2417','-74.3536','05','01','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050115','AYACUCHO','HUAMANGA','JESUS NAZARENO','-13.1531','-74.2114','05','01','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050116','AYACUCHO','HUAMANGA','ANDRÉS AVELINO CÁCERES DORREGARAY','-13.1617','-74.2106','05','01','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050201','AYACUCHO','CANGALLO','CANGALLO','-13.6281','-74.1442','05','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050202','AYACUCHO','CANGALLO','CHUSCHI','-13.5831','-74.3536','05','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050203','AYACUCHO','CANGALLO','LOS MOROCHUCOS','-13.5572','-74.1947','05','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050204','AYACUCHO','CANGALLO','MARIA PARADO DE BELLIDO','-13.6039','-74.2347','05','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050205','AYACUCHO','CANGALLO','PARAS','-13.5517','-74.6272','05','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050206','AYACUCHO','CANGALLO','TOTOS','-13.5681','-74.5242','05','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050301','AYACUCHO','HUANCA SANCOS','SANCOS','-13.9192','-74.3339','05','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050302','AYACUCHO','HUANCA SANCOS','CARAPO','-13.8375','-74.3147','05','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050303','AYACUCHO','HUANCA SANCOS','SACSAMARCA','-13.9464','-74.315','05','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050304','AYACUCHO','HUANCA SANCOS','SANTIAGO DE LUCANAMARCA','-13.8433','-74.3722','05','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050401','AYACUCHO','HUANTA','HUANTA','-12.9386','-74.2486','05','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050402','AYACUCHO','HUANTA','AYAHUANCO','-12.5981','-74.3231','05','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050403','AYACUCHO','HUANTA','HUAMANGUILLA','-13.0108','-74.1731','05','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050404','AYACUCHO','HUANTA','IGUAIN','-12.9919','-74.2083','05','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050405','AYACUCHO','HUANTA','LURICOCHA','-12.8981','-74.2711','05','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050406','AYACUCHO','HUANTA','SANTILLANA','-12.7656','-74.2528','05','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050407','AYACUCHO','HUANTA','SIVIA','-12.5119','-73.8578','05','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050408','AYACUCHO','HUANTA','LLOCHEGUA','-12.4114','-73.9097','05','04','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050409','AYACUCHO','HUANTA','CANAYRE','-12.2822','-74.0228','05','04','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050410','AYACUCHO','HUANTA','UCHURACCAY','-12.7622','-74.1464','05','04','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050411','AYACUCHO','HUANTA','PUCACOLPA','-15.255','-73.4136','05','04','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050412','AYACUCHO','HUANTA','CHACA','-12.7836','-74.2069','05','04','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050501','AYACUCHO','LA MAR','SAN MIGUEL','-13.0117','-73.9789','05','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050502','AYACUCHO','LA MAR','ANCO','-13.0592','-73.7072','05','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050503','AYACUCHO','LA MAR','AYNA','-12.6244','-73.79','05','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050504','AYACUCHO','LA MAR','CHILCAS','-13.1722','-73.9083','05','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050505','AYACUCHO','LA MAR','CHUNGUI','-13.2222','-73.6242','05','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050506','AYACUCHO','LA MAR','LUIS CARRANZA','-13.2283','-73.8925','05','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050507','AYACUCHO','LA MAR','SANTA ROSA','-12.6894','-73.735','05','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050508','AYACUCHO','LA MAR','TAMBO','-12.9506','-74.0233','05','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050509','AYACUCHO','LA MAR','SAMUGARI','-12.7908','-73.6414','05','05','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050510','AYACUCHO','LA MAR','ANCHIHUAY','-12.8633','-73.5817','05','05','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050511','AYACUCHO','LA MAR','ORONCCOY','-13.3808','-73.4358','05','05','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050601','AYACUCHO','LUCANAS','PUQUIO','-14.6914','-74.1283','05','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050602','AYACUCHO','LUCANAS','AUCARA','-14.2681','-73.9703','05','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050603','AYACUCHO','LUCANAS','CABANA','-14.2897','-73.9667','05','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050604','AYACUCHO','LUCANAS','CARMEN SALCEDO','-14.3875','-73.9625','05','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050605','AYACUCHO','LUCANAS','CHAVIÑA','-14.9778','-73.8364','05','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050606','AYACUCHO','LUCANAS','CHIPAO','-14.3661','-73.8786','05','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050607','AYACUCHO','LUCANAS','HUAC-HUAS','-14.1308','-74.9419','05','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050608','AYACUCHO','LUCANAS','LARAMATE','-14.2858','-74.8425','05','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050609','AYACUCHO','LUCANAS','LEONCIO PRADO','-14.7278','-74.67','05','06','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050610','AYACUCHO','LUCANAS','LLAUTA','-14.2439','-74.9192','05','06','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050611','AYACUCHO','LUCANAS','LUCANAS','-14.6222','-74.2328','05','06','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050612','AYACUCHO','LUCANAS','OCAÑA','-14.3983','-74.8219','05','06','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050613','AYACUCHO','LUCANAS','OTOCA','-14.4894','-74.6892','05','06','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050614','AYACUCHO','LUCANAS','SAISA','-14.9383','-74.4183','05','06','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050615','AYACUCHO','LUCANAS','SAN CRISTOBAL','-14.7425','-74.2217','05','06','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050616','AYACUCHO','LUCANAS','SAN JUAN','-14.66','-74.2011','05','06','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050617','AYACUCHO','LUCANAS','SAN PEDRO','-14.7708','-74.0972','05','06','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050618','AYACUCHO','LUCANAS','SAN PEDRO DE PALCO','-14.4139','-74.65','05','06','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050619','AYACUCHO','LUCANAS','SANCOS','-15.0619','-73.9511','05','06','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050620','AYACUCHO','LUCANAS','SANTA ANA DE HUAYCAHUACHO','-14.2281','-73.955','05','06','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050621','AYACUCHO','LUCANAS','SANTA LUCIA','-14.9786','-74.5233','05','06','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050701','AYACUCHO','PARINACOCHAS','CORACORA','-15.0161','-73.7819','05','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050702','AYACUCHO','PARINACOCHAS','CHUMPI','-15.0944','-73.7478','05','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050703','AYACUCHO','PARINACOCHAS','CORONEL CASTAÑEDA','-14.81','-73.2886','05','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050704','AYACUCHO','PARINACOCHAS','PACAPAUSA','-14.9492','-73.3678','05','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050705','AYACUCHO','PARINACOCHAS','PULLO','-15.2092','-73.8294','05','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050706','AYACUCHO','PARINACOCHAS','PUYUSCA','-15.2492','-73.5703','05','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050707','AYACUCHO','PARINACOCHAS','SAN FRANCISCO DE RAVACAYCO','-14.9975','-73.3556','05','07','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050708','AYACUCHO','PARINACOCHAS','UPAHUACHO','-14.9075','-73.3972','05','07','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050801','AYACUCHO','PAUCAR DEL SARA SARA','PAUSA','-15.2806','-73.3433','05','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050802','AYACUCHO','PAUCAR DEL SARA SARA','COLTA','-15.1631','-73.2939','05','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050803','AYACUCHO','PAUCAR DEL SARA SARA','CORCULLA','-15.2617','-73.2','05','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050804','AYACUCHO','PAUCAR DEL SARA SARA','LAMPA','-15.1847','-73.3472','05','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050805','AYACUCHO','PAUCAR DEL SARA SARA','MARCABAMBA','-15.1492','-73.3436','05','08','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050806','AYACUCHO','PAUCAR DEL SARA SARA','OYOLO','-15.1797','-73.1881','05','08','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050807','AYACUCHO','PAUCAR DEL SARA SARA','PARARCA','-15.2169','-73.4653','05','08','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050808','AYACUCHO','PAUCAR DEL SARA SARA','SAN JAVIER DE ALPABAMBA','-15.0539','-73.3103','05','08','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050809','AYACUCHO','PAUCAR DEL SARA SARA','SAN JOSE DE USHUA','-15.2242','-73.2258','05','08','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050810','AYACUCHO','PAUCAR DEL SARA SARA','SARA SARA','-15.2458','-73.4514','05','08','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050901','AYACUCHO','SUCRE','QUEROBAMBA','-14.0136','-73.8408','05','09','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050902','AYACUCHO','SUCRE','BELEN','-13.8094','-73.7578','05','09','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050903','AYACUCHO','SUCRE','CHALCOS','-13.8478','-73.7533','05','09','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050904','AYACUCHO','SUCRE','CHILCAYOC','-13.8825','-73.7275','05','09','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050905','AYACUCHO','SUCRE','HUACAÑA','-14.1728','-73.8864','05','09','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050906','AYACUCHO','SUCRE','MORCOLLA','-14.1097','-73.8736','05','09','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050907','AYACUCHO','SUCRE','PAICO','-14.0386','-73.6433','05','09','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050908','AYACUCHO','SUCRE','SAN PEDRO DE LARCAY','-14.1697','-73.5758','05','09','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050909','AYACUCHO','SUCRE','SAN SALVADOR DE QUIJE','-13.9703','-73.7314','05','09','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050910','AYACUCHO','SUCRE','SANTIAGO DE PAUCARAY','-14.0444','-73.6372','05','09','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('050911','AYACUCHO','SUCRE','SORAS','-14.1153','-73.6056','05','09','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051001','AYACUCHO','VICTOR FAJARDO','HUANCAPI','-13.7528','-74.0669','05','10','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051002','AYACUCHO','VICTOR FAJARDO','ALCAMENCA','-13.6578','-74.1467','05','10','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051003','AYACUCHO','VICTOR FAJARDO','APONGO','-14.0147','-73.9342','05','10','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051004','AYACUCHO','VICTOR FAJARDO','ASQUIPATA','-14.0536','-73.9094','05','10','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051005','AYACUCHO','VICTOR FAJARDO','CANARIA','-13.9231','-73.9053','05','10','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051006','AYACUCHO','VICTOR FAJARDO','CAYARA','-13.7953','-73.9906','05','10','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051007','AYACUCHO','VICTOR FAJARDO','COLCA','-13.7125','-74.0342','05','10','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051008','AYACUCHO','VICTOR FAJARDO','HUAMANQUIQUIA','-13.7283','-74.2731','05','10','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051009','AYACUCHO','VICTOR FAJARDO','HUANCARAYLLA','-13.7175','-74.1028','05','10','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051010','AYACUCHO','VICTOR FAJARDO','HUAYA','-13.8492','-73.9536','05','10','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051011','AYACUCHO','VICTOR FAJARDO','SARHUA','-13.6714','-74.3208','05','10','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051012','AYACUCHO','VICTOR FAJARDO','VILCANCHOS','-13.6122','-74.5339','05','10','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051101','AYACUCHO','VILCAS HUAMAN','VILCAS HUAMAN','-13.6533','-73.9528','05','11','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051102','AYACUCHO','VILCAS HUAMAN','ACCOMARCA','-13.8003','-73.9033','05','11','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051103','AYACUCHO','VILCAS HUAMAN','CARHUANCA','-13.7425','-73.7892','05','11','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051104','AYACUCHO','VILCAS HUAMAN','CONCEPCION','-13.5322','-73.875','05','11','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051105','AYACUCHO','VILCAS HUAMAN','HUAMBALPA','-13.7494','-73.9339','05','11','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051106','AYACUCHO','VILCAS HUAMAN','INDEPENDENCIA','-13.8581','-73.8878','05','11','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051107','AYACUCHO','VILCAS HUAMAN','SAURAMA','-13.695','-73.7622','05','11','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('051108','AYACUCHO','VILCAS HUAMAN','VISCHONGO','-13.5881','-73.9983','05','11','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060101','CAJAMARCA','CAJAMARCA','CAJAMARCA','-7.1564','-78.5153','06','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060102','CAJAMARCA','CAJAMARCA','ASUNCION','-7.3233','-78.5203','06','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060103','CAJAMARCA','CAJAMARCA','CHETILLA','-7.1461','-78.6714','06','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060104','CAJAMARCA','CAJAMARCA','COSPAN','-7.4264','-78.5433','06','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060105','CAJAMARCA','CAJAMARCA','ENCAÑADA','-7.0864','-78.3447','06','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060106','CAJAMARCA','CAJAMARCA','JESUS','-7.2456','-78.3778','06','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060107','CAJAMARCA','CAJAMARCA','LLACANORA','-7.1928','-78.4269','06','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060108','CAJAMARCA','CAJAMARCA','LOS BAÑOS DEL INCA','-7.1617','-78.4633','06','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060109','CAJAMARCA','CAJAMARCA','MAGDALENA','-7.2508','-78.6564','06','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060110','CAJAMARCA','CAJAMARCA','MATARA','-7.2564','-78.2636','06','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060111','CAJAMARCA','CAJAMARCA','NAMORA','-7.2017','-78.3247','06','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060112','CAJAMARCA','CAJAMARCA','SAN JUAN','-7.2903','-78.4992','06','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060201','CAJAMARCA','CAJABAMBA','CAJABAMBA','-7.6222','-78.0472','06','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060202','CAJAMARCA','CAJABAMBA','CACHACHI','-7.4494','-78.2703','06','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060203','CAJAMARCA','CAJABAMBA','CONDEBAMBA','-7.5736','-78.07','06','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060204','CAJAMARCA','CAJABAMBA','SITACOCHA','-7.5211','-77.9714','06','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060301','CAJAMARCA','CELENDIN','CELENDIN','-6.8681','-78.1489','06','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060302','CAJAMARCA','CELENDIN','CHUMUCH','-6.6033','-78.2033','06','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060303','CAJAMARCA','CELENDIN','CORTEGANA','-6.4906','-78.3036','06','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060304','CAJAMARCA','CELENDIN','HUASMIN','-6.8386','-78.2431','06','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060305','CAJAMARCA','CELENDIN','JORGE CHAVEZ','-6.9414','-78.0914','06','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060306','CAJAMARCA','CELENDIN','JOSE GALVEZ','-6.9253','-78.1328','06','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060307','CAJAMARCA','CELENDIN','MIGUEL IGLESIAS','-6.6439','-78.2381','06','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060308','CAJAMARCA','CELENDIN','OXAMARCA','-7.0397','-78.0725','06','03','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060309','CAJAMARCA','CELENDIN','SOROCHUCO','-6.9103','-78.2553','06','03','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060310','CAJAMARCA','CELENDIN','SUCRE','-6.9408','-78.1369','06','03','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060311','CAJAMARCA','CELENDIN','UTCO','-6.8964','-78.0639','06','03','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060312','CAJAMARCA','CELENDIN','LA LIBERTAD DE PALLAN','-6.7269','-78.2908','06','03','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060401','CAJAMARCA','CHOTA','CHOTA','-6.5631','-78.6508','06','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060402','CAJAMARCA','CHOTA','ANGUIA','-6.3422','-78.605','06','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060403','CAJAMARCA','CHOTA','CHADIN','-6.4731','-78.4197','06','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060404','CAJAMARCA','CHOTA','CHIGUIRIP','-6.4286','-78.7192','06','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060405','CAJAMARCA','CHOTA','CHIMBAN','-6.2567','-78.4786','06','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060406','CAJAMARCA','CHOTA','CHOROPAMPA','-6.4372','-78.3503','06','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060407','CAJAMARCA','CHOTA','COCHABAMBA','-6.4731','-78.8878','06','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060408','CAJAMARCA','CHOTA','CONCHAN','-6.4444','-78.6572','06','04','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060409','CAJAMARCA','CHOTA','HUAMBOS','-6.4522','-78.9639','06','04','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060410','CAJAMARCA','CHOTA','LAJAS','-6.5617','-78.7389','06','04','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060411','CAJAMARCA','CHOTA','LLAMA','-6.5144','-79.1197','06','04','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060412','CAJAMARCA','CHOTA','MIRACOSTA','-6.4053','-79.2831','06','04','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060413','CAJAMARCA','CHOTA','PACCHA','-6.5022','-78.4211','06','04','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060414','CAJAMARCA','CHOTA','PION','-6.1783','-78.4817','06','04','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060415','CAJAMARCA','CHOTA','QUEROCOTO','-6.3586','-79.0356','06','04','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060416','CAJAMARCA','CHOTA','SAN JUAN DE LICUPIS','-6.4244','-79.2414','06','04','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060417','CAJAMARCA','CHOTA','TACABAMBA','-6.3931','-78.6125','06','04','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060418','CAJAMARCA','CHOTA','TOCMOCHE','-6.4125','-79.3606','06','04','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060419','CAJAMARCA','CHOTA','CHALAMARCA','-6.4889','-78.4689','06','04','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060501','CAJAMARCA','CONTUMAZA','CONTUMAZA','-7.3653','-78.8064','06','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060502','CAJAMARCA','CONTUMAZA','CHILETE','-7.2222','-78.8406','06','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060503','CAJAMARCA','CONTUMAZA','CUPISNIQUE','-7.3492','-79.0297','06','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060504','CAJAMARCA','CONTUMAZA','GUZMANGO','-7.3842','-78.8981','06','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060505','CAJAMARCA','CONTUMAZA','SAN BENITO','-7.4247','-78.9292','06','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060506','CAJAMARCA','CONTUMAZA','SANTA CRUZ DE TOLED','-7.3436','-78.8403','06','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060507','CAJAMARCA','CONTUMAZA','TANTARICA','-7.3006','-78.9353','06','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060508','CAJAMARCA','CONTUMAZA','YONAN','-7.2536','-79.13','06','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060601','CAJAMARCA','CUTERVO','CUTERVO','-6.3794','-78.8206','06','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060602','CAJAMARCA','CUTERVO','CALLAYUC','-6.1764','-78.9047','06','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060603','CAJAMARCA','CUTERVO','CHOROS','-5.9008','-78.6967','06','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060604','CAJAMARCA','CUTERVO','CUJILLO','-6.1072','-78.5725','06','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060605','CAJAMARCA','CUTERVO','LA RAMADA','-6.2172','-78.5547','06','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060606','CAJAMARCA','CUTERVO','PIMPINGOS','-6.0622','-78.7575','06','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060607','CAJAMARCA','CUTERVO','QUEROCOTILLO','-6.2747','-79.0369','06','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060608','CAJAMARCA','CUTERVO','SAN ANDRES DE CUTERVO','-6.2364','-78.7111','06','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060609','CAJAMARCA','CUTERVO','SAN JUAN DE CUTERVO','-6.1747','-78.6011','06','06','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060610','CAJAMARCA','CUTERVO','SAN LUIS DE LUCMA','-6.2956','-78.6056','06','06','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060611','CAJAMARCA','CUTERVO','SANTA CRUZ','-6.0964','-78.8547','06','06','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060612','CAJAMARCA','CUTERVO','SANTO DOMINGO DE LA CAPILLA','-6.245','-78.8578','06','06','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060613','CAJAMARCA','CUTERVO','SANTO TOMAS','-6.1544','-78.6908','06','06','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060614','CAJAMARCA','CUTERVO','SOCOTA','-6.3158','-78.7014','06','06','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060615','CAJAMARCA','CUTERVO','TORIBIO CASANOVA','-6.0069','-78.6997','06','06','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060701','CAJAMARCA','HUALGAYOC','BAMBAMARCA','-6.6786','-78.5242','06','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060702','CAJAMARCA','HUALGAYOC','CHUGUR','-6.6711','-78.7397','06','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060703','CAJAMARCA','HUALGAYOC','HUALGAYOC','-6.7656','-78.6119','06','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060801','CAJAMARCA','JAEN','JAEN','-5.7106','-78.8117','06','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060802','CAJAMARCA','JAEN','BELLAVISTA','-5.6664','-78.6786','06','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060803','CAJAMARCA','JAEN','CHONTALI','-5.6458','-79.0878','06','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060804','CAJAMARCA','JAEN','COLASAY','-5.9786','-79.0689','06','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060805','CAJAMARCA','JAEN','HUABAL','-5.6133','-78.9122','06','08','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060806','CAJAMARCA','JAEN','LAS PIRIAS','-5.6269','-78.8533','06','08','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060807','CAJAMARCA','JAEN','POMAHUACA','-5.9322','-79.2289','06','08','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060808','CAJAMARCA','JAEN','PUCARA','-6.0414','-79.1283','06','08','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060809','CAJAMARCA','JAEN','SALLIQUE','-5.6569','-79.315','06','08','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060810','CAJAMARCA','JAEN','SAN FELIPE','-5.7697','-79.3136','06','08','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060811','CAJAMARCA','JAEN','SAN JOSE DEL ALTO','-5.3908','-79.0539','06','08','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060812','CAJAMARCA','JAEN','SANTA ROSA','-5.4358','-78.5644','06','08','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060901','CAJAMARCA','SAN IGNACIO','SAN IGNACIO','-5.1403','-79.0003','06','09','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060902','CAJAMARCA','SAN IGNACIO','CHIRINOS','-5.3028','-78.8983','06','09','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060903','CAJAMARCA','SAN IGNACIO','HUARANGO','-5.2706','-78.7753','06','09','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060904','CAJAMARCA','SAN IGNACIO','LA COIPA','-5.3933','-78.9044','06','09','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060905','CAJAMARCA','SAN IGNACIO','NAMBALLE','-5.0089','-79.0856','06','09','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060906','CAJAMARCA','SAN IGNACIO','SAN JOSE DE LOURDES','-5.1025','-78.9139','06','09','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('060907','CAJAMARCA','SAN IGNACIO','TABACONAS','-5.3164','-79.2833','06','09','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061001','CAJAMARCA','SAN MARCOS','PEDRO GALVEZ','-7.3361','-78.1728','06','10','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061002','CAJAMARCA','SAN MARCOS','CHANCAY','-7.3858','-78.1264','06','10','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061003','CAJAMARCA','SAN MARCOS','EDUARDO VILLANUEVA','-7.4636','-78.1297','06','10','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061004','CAJAMARCA','SAN MARCOS','GREGORIO PITA','-7.2725','-78.1594','06','10','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061005','CAJAMARCA','SAN MARCOS','ICHOCAN','-7.3669','-78.1283','06','10','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061006','CAJAMARCA','SAN MARCOS','JOSE MANUEL QUIROZ','-7.3472','-78.0467','06','10','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061007','CAJAMARCA','SAN MARCOS','JOSE SABOGAL','-7.2833','-78.0167','06','10','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061101','CAJAMARCA','SAN MIGUEL','SAN MIGUEL','-6.9997','-78.8536','06','11','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061102','CAJAMARCA','SAN MIGUEL','BOLIVAR','-6.9772','-79.1789','06','11','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061103','CAJAMARCA','SAN MIGUEL','CALQUIS','-6.9797','-78.8522','06','11','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061104','CAJAMARCA','SAN MIGUEL','CATILLUC','-6.7994','-78.7906','06','11','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061105','CAJAMARCA','SAN MIGUEL','EL PRADO','-7.0339','-79.0111','06','11','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061106','CAJAMARCA','SAN MIGUEL','LA FLORIDA','-6.8683','-79.1231','06','11','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061107','CAJAMARCA','SAN MIGUEL','LLAPA','-6.9786','-78.8072','06','11','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061108','CAJAMARCA','SAN MIGUEL','NANCHOC','-6.9583','-79.2419','06','11','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061109','CAJAMARCA','SAN MIGUEL','NIEPOS','-6.9272','-79.1283','06','11','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061110','CAJAMARCA','SAN MIGUEL','SAN GREGORIO','-7.0575','-79.0956','06','11','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061111','CAJAMARCA','SAN MIGUEL','SAN SILVESTRE DE COCHAN','-6.9778','-78.775','06','11','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061112','CAJAMARCA','SAN MIGUEL','TONGOD','-6.7631','-78.8236','06','11','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061113','CAJAMARCA','SAN MIGUEL','UNION AGUA BLANCA','-7.0447','-79.06','06','11','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061201','CAJAMARCA','SAN PABLO','SAN PABLO','-7.1181','-78.8231','06','12','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061202','CAJAMARCA','SAN PABLO','SAN BERNARDINO','-7.1681','-78.8311','06','12','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061203','CAJAMARCA','SAN PABLO','SAN LUIS','-7.1583','-78.87','06','12','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061204','CAJAMARCA','SAN PABLO','TUMBADEN','-7.0203','-78.7403','06','12','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061301','CAJAMARCA','SANTA CRUZ','SANTA CRUZ','-6.6267','-78.9464','06','13','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061302','CAJAMARCA','SANTA CRUZ','ANDABAMBA','-6.6628','-78.8194','06','13','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061303','CAJAMARCA','SANTA CRUZ','CATACHE','-6.6753','-79.0325','06','13','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061304','CAJAMARCA','SANTA CRUZ','CHANCAYBAÑOS','-6.5764','-78.8681','06','13','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061305','CAJAMARCA','SANTA CRUZ','LA ESPERANZA','-6.5931','-78.895','06','13','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061306','CAJAMARCA','SANTA CRUZ','NINABAMBA','-6.6497','-78.7894','06','13','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061307','CAJAMARCA','SANTA CRUZ','PULAN','-6.7397','-78.9231','06','13','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061308','CAJAMARCA','SANTA CRUZ','SAUCEPAMPA','-6.6928','-78.9183','06','13','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061309','CAJAMARCA','SANTA CRUZ','SEXI','-6.5636','-79.0514','06','13','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061310','CAJAMARCA','SANTA CRUZ','UTICYACU','-6.6064','-78.7972','06','13','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('061311','CAJAMARCA','SANTA CRUZ','YAUYUCAN','-6.6783','-78.82','06','13','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('070101','CALLAO','CALLAO','CALLAO','-12.0603','-77.1492','07','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('070102','CALLAO','CALLAO','BELLAVISTA','-12.0625','-77.1317','07','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('070103','CALLAO','CALLAO','CARMEN DE LA LEGUA','-12.0461','-77.0969','07','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('070104','CALLAO','CALLAO','LA PERLA','-12.0711','-77.1211','07','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('070105','CALLAO','CALLAO','LA PUNTA','-12.0717','-77.1692','07','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('070106','CALLAO','CALLAO','VENTANILLA','-11.8989','-77.1422','07','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('070107','CALLAO','CALLAO','MI PERU','-11.855','-77.125','07','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080101','CUSCO','CUSCO','CUSCO','-13.5153','-71.98','08','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080102','CUSCO','CUSCO','CCORCA','-13.5842','-72.0594','08','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080103','CUSCO','CUSCO','POROY','-13.4969','-72.0425','08','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080104','CUSCO','CUSCO','SAN JERONIMO','-13.5439','-71.8872','08','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080105','CUSCO','CUSCO','SAN SEBASTIAN','-13.5311','-71.9333','08','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080106','CUSCO','CUSCO','SANTIAGO','-13.5272','-71.9842','08','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080107','CUSCO','CUSCO','SAYLLA','-13.5703','-71.8264','08','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080108','CUSCO','CUSCO','WANCHAQ','-13.5253','-71.9656','08','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080201','CUSCO','ACOMAYO','ACOMAYO','-13.9189','-71.685','08','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080202','CUSCO','ACOMAYO','ACOPIA','-14.0581','-71.4931','08','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080203','CUSCO','ACOMAYO','ACOS','-13.9506','-71.7383','08','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080204','CUSCO','ACOMAYO','MOSOC LLACTA','-14.1203','-71.4733','08','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080205','CUSCO','ACOMAYO','POMACANCHI','-14.035','-71.5714','08','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080206','CUSCO','ACOMAYO','RONDOCAN','-13.7786','-71.7822','08','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080207','CUSCO','ACOMAYO','SANGARARA','-13.9475','-71.6031','08','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080301','CUSCO','ANTA','ANTA','-13.4636','-72.1469','08','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080302','CUSCO','ANTA','ANCAHUASI','-13.4575','-72.2944','08','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080303','CUSCO','ANTA','CACHIMAYO','-13.4775','-72.0728','08','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080304','CUSCO','ANTA','CHINCHAYPUJIO','-13.6294','-72.2339','08','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080305','CUSCO','ANTA','HUAROCONDO','-13.4131','-72.2086','08','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080306','CUSCO','ANTA','LIMATAMBO','-13.4808','-72.4458','08','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080307','CUSCO','ANTA','MOLLEPATA','-13.5078','-72.5353','08','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080308','CUSCO','ANTA','PUCYURA','-13.4803','-72.1119','08','03','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080309','CUSCO','ANTA','ZURITE','-13.4556','-72.2558','08','03','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080401','CUSCO','CALCA','CALCA','-13.3231','-71.9578','08','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080402','CUSCO','CALCA','COYA','-13.3867','-71.9011','08','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080403','CUSCO','CALCA','LAMAY','-13.3642','-71.9228','08','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080404','CUSCO','CALCA','LARES','-13.1058','-72.0472','08','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080405','CUSCO','CALCA','PISAC','-13.4217','-71.85','08','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080406','CUSCO','CALCA','SAN SALVADOR','-13.4936','-71.78','08','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080407','CUSCO','CALCA','TARAY','-13.4278','-71.8689','08','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080408','CUSCO','CALCA','YANATILE','-12.7008','-72.2322','08','04','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080501','CUSCO','CANAS','YANAOCA','-14.22','-71.4317','08','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080502','CUSCO','CANAS','CHECCA','-14.4733','-71.3964','08','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080503','CUSCO','CANAS','KUNTURKANKI','-14.5331','-71.3064','08','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080504','CUSCO','CANAS','LANGUI','-14.4317','-71.2744','08','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080505','CUSCO','CANAS','LAYO','-14.4942','-71.1556','08','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080506','CUSCO','CANAS','PAMPAMARCA','-14.1453','-71.4603','08','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080507','CUSCO','CANAS','QUEHUE','-14.38','-71.455','08','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080508','CUSCO','CANAS','TUPAC AMARU','-14.165','-71.4794','08','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080601','CUSCO','CANCHIS','SICUANI','-14.2711','-71.2289','08','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080602','CUSCO','CANCHIS','CHECACUPE','-14.0267','-71.4533','08','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080603','CUSCO','CANCHIS','COMBAPATA','-14.1008','-71.4308','08','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080604','CUSCO','CANCHIS','MARANGANI','-14.3564','-71.1683','08','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080605','CUSCO','CANCHIS','PITUMARCA','-13.9778','-71.4147','08','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080606','CUSCO','CANCHIS','SAN PABLO','-14.2033','-71.3178','08','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080607','CUSCO','CANCHIS','SAN PEDRO','-14.1867','-71.3422','08','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080608','CUSCO','CANCHIS','TINTA','-14.1447','-71.4067','08','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080701','CUSCO','CHUMBIVILCAS','SANTO TOMAS','-14.4503','-72.0833','08','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080702','CUSCO','CHUMBIVILCAS','CAPACMARCA','-14.0078','-72.0008','08','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080703','CUSCO','CHUMBIVILCAS','CHAMACA','-14.3028','-71.855','08','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080704','CUSCO','CHUMBIVILCAS','COLQUEMARCA','-14.2839','-72.0411','08','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080705','CUSCO','CHUMBIVILCAS','LIVITACA','-14.3131','-71.6892','08','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080706','CUSCO','CHUMBIVILCAS','LLUSCO','-14.3383','-72.1144','08','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080707','CUSCO','CHUMBIVILCAS','QUIÑOTA','-14.3114','-72.1389','08','07','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080708','CUSCO','CHUMBIVILCAS','VELILLE','-14.5106','-71.8864','08','07','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080801','CUSCO','ESPINAR','ESPINAR','-14.7931','-71.4133','08','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080802','CUSCO','ESPINAR','CONDOROMA','-15.3075','-71.1319','08','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080803','CUSCO','ESPINAR','COPORAQUE','-14.7972','-71.5311','08','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080804','CUSCO','ESPINAR','OCORURO','-15.0522','-71.1292','08','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080805','CUSCO','ESPINAR','PALLPATA','-14.8894','-71.2103','08','08','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080806','CUSCO','ESPINAR','PICHIGUA','-14.6786','-71.41','08','08','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080807','CUSCO','ESPINAR','SUYCKUTAMBO','-15.0025','-71.6397','08','08','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080808','CUSCO','ESPINAR','ALTO PICHIGUA','-14.7789','-71.2542','08','08','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080901','CUSCO','LA CONVENCION','SANTA ANA','-12.865','-72.6936','08','09','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080902','CUSCO','LA CONVENCION','ECHARATE','-12.7675','-72.5936','08','09','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080903','CUSCO','LA CONVENCION','HUAYOPATA','-13.0075','-72.5569','08','09','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080904','CUSCO','LA CONVENCION','MARANURA','-12.9619','-72.6653','08','09','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080905','CUSCO','LA CONVENCION','OCOBAMBA','-12.8706','-72.4489','08','09','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080906','CUSCO','LA CONVENCION','QUELLOUNO','-12.6325','-72.5517','08','09','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080907','CUSCO','LA CONVENCION','KIMBIRI','-12.6097','-73.7811','08','09','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080908','CUSCO','LA CONVENCION','SANTA TERESA','-13.1297','-72.5986','08','09','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080909','CUSCO','LA CONVENCION','VILCABAMBA','-13.0514','-72.9436','08','09','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080910','CUSCO','LA CONVENCION','PICHARI','-12.5158','-73.8269','08','09','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080911','CUSCO','LA CONVENCION','INKAWASI','-13.00354','-72.51822','08','09','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080912','CUSCO','LA CONVENCION','VILLA VIRGEN','-13.0031','-73.5167','08','09','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080913','CUSCO','LA CONVENCION','VILLA KINTIARINA','-12.9186','-73.5306','08','09','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('080914','CUSCO','LA CONVENCION','MEGANTONI','-11.8047','-72.8594','08','09','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081001','CUSCO','PARURO','PARURO','-13.7617','-71.8478','08','10','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081002','CUSCO','PARURO','ACCHA','-13.9681','-71.8322','08','10','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081003','CUSCO','PARURO','CCAPI','-13.8533','-72.0803','08','10','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081004','CUSCO','PARURO','COLCHA','-13.8511','-71.8028','08','10','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081005','CUSCO','PARURO','HUANOQUITE','-13.6828','-72.0147','08','10','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081006','CUSCO','PARURO','OMACHA','-14.0706','-71.7386','08','10','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081007','CUSCO','PARURO','PACCARITAMBO','-13.7558','-71.9564','08','10','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081008','CUSCO','PARURO','PILLPINTO','-13.9531','-71.7619','08','10','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081009','CUSCO','PARURO','YAURISQUE','-13.6639','-71.9214','08','10','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081101','CUSCO','PAUCARTAMBO','PAUCARTAMBO','-13.3189','-71.5997','08','11','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081102','CUSCO','PAUCARTAMBO','CAICAY','-13.5969','-71.6961','08','11','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081103','CUSCO','PAUCARTAMBO','CHALLABAMBA','-13.2114','-71.6531','08','11','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081104','CUSCO','PAUCARTAMBO','COLQUEPATA','-13.3594','-71.6731','08','11','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081105','CUSCO','PAUCARTAMBO','HUANCARANI','-13.5033','-71.6539','08','11','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081106','CUSCO','PAUCARTAMBO','KOSÑIPATA','-13.0025','-71.4225','08','11','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081201','CUSCO','QUISPICANCHI','URCOS','-13.6883','-71.6258','08','12','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081202','CUSCO','QUISPICANCHI','ANDAHUAYLILLAS','-13.6733','-71.6767','08','12','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081203','CUSCO','QUISPICANCHI','CAMANTI','-13.1936','-70.7478','08','12','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081204','CUSCO','QUISPICANCHI','CCARHUAYO','-13.5947','-71.3994','08','12','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081205','CUSCO','QUISPICANCHI','CCATCA','-13.6053','-71.5619','08','12','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081206','CUSCO','QUISPICANCHI','CUSIPATA','-13.9083','-71.5','08','12','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081207','CUSCO','QUISPICANCHI','HUARO','-13.6903','-71.6406','08','12','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081208','CUSCO','QUISPICANCHI','LUCRE','-13.6356','-71.7378','08','12','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081209','CUSCO','QUISPICANCHI','MARCAPATA','-13.515','-70.9458','08','12','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081210','CUSCO','QUISPICANCHI','OCONGATE','-13.6286','-71.3864','08','12','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081211','CUSCO','QUISPICANCHI','OROPESA','-13.5958','-71.7642','08','12','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081212','CUSCO','QUISPICANCHI','QUIQUIJANA','-13.8222','-71.5317','08','12','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081301','CUSCO','URUBAMBA','URUBAMBA','-13.3061','-72.1161','08','13','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081302','CUSCO','URUBAMBA','CHINCHERO','-13.3933','-72.0472','08','13','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081303','CUSCO','URUBAMBA','HUAYLLABAMBA','-13.3386','-72.0644','08','13','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081304','CUSCO','URUBAMBA','MACHUPICCHU','-13.1533','-72.5242','08','13','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081305','CUSCO','URUBAMBA','MARAS','-13.3367','-72.1572','08','13','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081306','CUSCO','URUBAMBA','OLLANTAYTAMBO','-13.2581','-72.2631','08','13','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('081307','CUSCO','URUBAMBA','YUCAY','-13.3194','-72.0861','08','13','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090101','HUANCAVELICA','HUANCAVELICA','HUANCAVELICA','-12.7869','-74.9756','09','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090102','HUANCAVELICA','HUANCAVELICA','ACOBAMBILLA','-12.6675','-75.3239','09','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090103','HUANCAVELICA','HUANCAVELICA','ACORIA','-12.6433','-74.8664','09','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090104','HUANCAVELICA','HUANCAVELICA','CONAYCA','-12.5194','-75.0078','09','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090105','HUANCAVELICA','HUANCAVELICA','CUENCA','-12.4344','-75.0394','09','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090106','HUANCAVELICA','HUANCAVELICA','HUACHOCOLPA','-13.0319','-74.9497','09','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090107','HUANCAVELICA','HUANCAVELICA','HUAYLLAHUARA','-12.4072','-75.1797','09','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090108','HUANCAVELICA','HUANCAVELICA','IZCUCHACA','-12.5011','-74.9961','09','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090109','HUANCAVELICA','HUANCAVELICA','LARIA','-12.5611','-75.0372','09','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090110','HUANCAVELICA','HUANCAVELICA','MANTA','-12.6217','-75.2122','09','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090111','HUANCAVELICA','HUANCAVELICA','MARISCAL CACERES','-12.5356','-74.9336','09','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090112','HUANCAVELICA','HUANCAVELICA','MOYA','-12.4231','-75.1539','09','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090113','HUANCAVELICA','HUANCAVELICA','NUEVO OCCORO','-12.595','-75.02','09','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090114','HUANCAVELICA','HUANCAVELICA','PALCA','-12.6589','-74.9833','09','01','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090115','HUANCAVELICA','HUANCAVELICA','PILCHACA','-12.4019','-75.0839','09','01','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090116','HUANCAVELICA','HUANCAVELICA','VILCA','-12.4786','-75.1867','09','01','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090117','HUANCAVELICA','HUANCAVELICA','YAULI','-12.7731','-74.8506','09','01','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090118','HUANCAVELICA','HUANCAVELICA','ASCENSION','-12.7842','-74.9806','09','01','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090119','HUANCAVELICA','HUANCAVELICA','HUANDO','-12.5653','-74.9469','09','01','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090201','HUANCAVELICA','ACOBAMBA','ACOBAMBA','-12.8406','-74.5692','09','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090202','HUANCAVELICA','ACOBAMBA','ANDABAMBA','-12.6953','-74.6242','09','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090203','HUANCAVELICA','ACOBAMBA','ANTA','-12.8139','-74.6364','09','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090204','HUANCAVELICA','ACOBAMBA','CAJA','-12.9183','-74.465','09','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090205','HUANCAVELICA','ACOBAMBA','MARCAS','-12.8894','-74.3994','09','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090206','HUANCAVELICA','ACOBAMBA','PAUCARA','-12.7303','-74.6694','09','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090207','HUANCAVELICA','ACOBAMBA','POMACOCHA','-12.8733','-74.5306','09','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090208','HUANCAVELICA','ACOBAMBA','ROSARIO','-12.7214','-74.5811','09','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090301','HUANCAVELICA','ANGARAES','LIRCAY','-12.9842','-74.7203','09','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090302','HUANCAVELICA','ANGARAES','ANCHONGA','-12.9122','-74.6922','09','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090303','HUANCAVELICA','ANGARAES','CALLANMARCA','-12.8678','-74.6228','09','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090304','HUANCAVELICA','ANGARAES','CCOCHACCASA','-12.9311','-74.7697','09','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090305','HUANCAVELICA','ANGARAES','CHINCHO','-12.9783','-74.3689','09','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090306','HUANCAVELICA','ANGARAES','CONGALLA','-12.9564','-74.4928','09','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090307','HUANCAVELICA','ANGARAES','HUANCA-HUANCA','-12.9172','-74.6106','09','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090308','HUANCAVELICA','ANGARAES','HUAYLLAY GRANDE','-12.9417','-74.7011','09','03','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090309','HUANCAVELICA','ANGARAES','JULCAMARCA','-13.015','-74.4453','09','03','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090310','HUANCAVELICA','ANGARAES','SAN ANTONIO DE ANTAPARCO','-13.0775','-74.4119','09','03','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090311','HUANCAVELICA','ANGARAES','SANTO TOMAS DE PATA','-13.1136','-74.4233','09','03','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090312','HUANCAVELICA','ANGARAES','SECCLLA','-13.0533','-74.4833','09','03','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090401','HUANCAVELICA','CASTROVIRREYNA','CASTROVIRREYNA','-13.2825','-75.3175','09','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090402','HUANCAVELICA','CASTROVIRREYNA','ARMA','-13.1256','-75.5419','09','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090403','HUANCAVELICA','CASTROVIRREYNA','AURAHUA','-13.035','-75.5708','09','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090404','HUANCAVELICA','CASTROVIRREYNA','CAPILLAS','-13.2931','-75.5425','09','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090405','HUANCAVELICA','CASTROVIRREYNA','CHUPAMARCA','-13.0383','-75.6097','09','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090406','HUANCAVELICA','CASTROVIRREYNA','COCAS','-13.2758','-75.3733','09','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090407','HUANCAVELICA','CASTROVIRREYNA','HUACHOS','-13.22','-75.5328','09','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090408','HUANCAVELICA','CASTROVIRREYNA','HUAMATAMBO','-13.0961','-75.6806','09','04','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090409','HUANCAVELICA','CASTROVIRREYNA','MOLLEPAMPA','-13.31','-75.4092','09','04','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090410','HUANCAVELICA','CASTROVIRREYNA','SAN JUAN','-13.2039','-75.6342','09','04','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090411','HUANCAVELICA','CASTROVIRREYNA','SANTA ANA','-13.0719','-75.1403','09','04','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090412','HUANCAVELICA','CASTROVIRREYNA','TANTARA','-13.0756','-75.6475','09','04','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090413','HUANCAVELICA','CASTROVIRREYNA','TICRAPO','-13.3844','-75.4319','09','04','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090501','HUANCAVELICA','CHURCAMPA','CHURCAMPA','-12.7403','-74.3869','09','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090502','HUANCAVELICA','CHURCAMPA','ANCO','-12.6864','-74.5872','09','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090503','HUANCAVELICA','CHURCAMPA','CHINCHIHUASI','-12.5172','-74.5458','09','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090504','HUANCAVELICA','CHURCAMPA','EL CARMEN','-12.7347','-74.4792','09','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090505','HUANCAVELICA','CHURCAMPA','LA MERCED','-12.79','-74.3633','09','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090506','HUANCAVELICA','CHURCAMPA','LOCROJA','-12.7389','-74.4419','09','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090507','HUANCAVELICA','CHURCAMPA','PAUCARBAMBA','-12.5542','-74.5314','09','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090508','HUANCAVELICA','CHURCAMPA','SAN MIGUEL DE MAYOCC','-12.805','-74.3922','09','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090509','HUANCAVELICA','CHURCAMPA','SAN PEDRO DE CORIS','-12.5786','-74.4103','09','05','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090510','HUANCAVELICA','CHURCAMPA','PACHAMARCA','-12.5161','-74.5261','09','05','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090511','HUANCAVELICA','CHURCAMPA','COSME','-12.5731','-74.6581','09','05','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090601','HUANCAVELICA','HUAYTARA','HUAYTARA','-13.605','-75.3525','09','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090602','HUANCAVELICA','HUAYTARA','AYAVI','-13.7031','-75.3539','09','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090603','HUANCAVELICA','HUAYTARA','CORDOVA','-14.04','-75.1833','09','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090604','HUANCAVELICA','HUAYTARA','HUAYACUNDO ARMA','-13.5339','-75.3111','09','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090605','HUANCAVELICA','HUAYTARA','LARAMARCA','-13.9494','-75.0375','09','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090606','HUANCAVELICA','HUAYTARA','OCOYO','-14.0086','-75.0225','09','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090607','HUANCAVELICA','HUAYTARA','PILPICHACA','-13.3278','-75.0017','09','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090608','HUANCAVELICA','HUAYTARA','QUERCO','-13.9803','-74.9764','09','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090609','HUANCAVELICA','HUAYTARA','QUITO-ARMA','-13.5289','-75.3294','09','06','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090610','HUANCAVELICA','HUAYTARA','SAN ANTONIO DE CUSICANCHA','-13.5003','-75.2944','09','06','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090611','HUANCAVELICA','HUAYTARA','SAN FRANCISCO DE SANGAYAICO','-13.7956','-75.25','09','06','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090612','HUANCAVELICA','HUAYTARA','SAN ISIDRO','-13.9569','-75.24','09','06','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090613','HUANCAVELICA','HUAYTARA','SANTIAGO DE CHOCORVOS','-13.8272','-75.2578','09','06','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090614','HUANCAVELICA','HUAYTARA','SANTIAGO DE QUIRAHUARA','-14.0547','-74.9783','09','06','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090615','HUANCAVELICA','HUAYTARA','SANTO DOMINGO DE CAPILLAS','-13.7356','-75.245','09','06','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090616','HUANCAVELICA','HUAYTARA','TAMBO','-13.6894','-75.2758','09','06','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090701','HUANCAVELICA','TAYACAJA','PAMPAS','-12.3956','-74.8672','09','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090702','HUANCAVELICA','TAYACAJA','ACOSTAMBO','-12.3653','-75.0572','09','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090703','HUANCAVELICA','TAYACAJA','ACRAQUIA','-12.4097','-74.9031','09','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090704','HUANCAVELICA','TAYACAJA','AHUAYCHA','-12.4081','-74.8919','09','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090705','HUANCAVELICA','TAYACAJA','COLCABAMBA','-12.4114','-74.6814','09','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090706','HUANCAVELICA','TAYACAJA','DANIEL HERNANDEZ','-12.3936','-74.8625','09','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090707','HUANCAVELICA','TAYACAJA','HUACHOCOLPA','-12.0486','-74.5953','09','07','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090709','HUANCAVELICA','TAYACAJA','HUARIBAMBA','-12.2794','-74.9406','09','07','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090710','HUANCAVELICA','TAYACAJA','ÑAHUIMPUQUIO','-12.3322','-75.0708','09','07','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090711','HUANCAVELICA','TAYACAJA','PAZOS','-12.2589','-75.07','09','07','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090713','HUANCAVELICA','TAYACAJA','QUISHUAR','-12.2408','-74.7792','09','07','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090714','HUANCAVELICA','TAYACAJA','SALCABAMBA','-12.2011','-74.7825','09','07','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090715','HUANCAVELICA','TAYACAJA','SALCAHUASI','-12.1031','-74.7508','09','07','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090716','HUANCAVELICA','TAYACAJA','SAN MARCOS DE ROCCHAC','-12.0939','-74.8656','09','07','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090717','HUANCAVELICA','TAYACAJA','SURCUBAMBA','-12.1169','-74.63','09','07','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090718','HUANCAVELICA','TAYACAJA','TINTAY PUNCU','-12.1531','-74.5456','09','07','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090719','HUANCAVELICA','TAYACAJA','QUICHUAS','-12.4681','-74.7847','09','07','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090720','HUANCAVELICA','TAYACAJA','ANDAYMARCA','-12.3147','-74.6364','09','07','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090721','HUANCAVELICA','TAYACAJA','ROBLE','-12.2169','-74.49','09','07','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090722','HUANCAVELICA','TAYACAJA','PICHOS','-12.2347','-74.9444','09','07','22');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('090723','HUANCAVELICA','TAYACAJA','SANTIAGO DE TÚCUMA','-12.3122','-74.9169','09','07','23');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100101','HUANUCO','HUANUCO','HUANUCO','-9.9269','-76.2403','10','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100102','HUANUCO','HUANUCO','AMARILIS','-9.9456','-76.2417','10','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100103','HUANUCO','HUANUCO','CHINCHAO','-9.8019','-76.0689','10','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100104','HUANUCO','HUANUCO','CHURUBAMBA','-9.8258','-76.1375','10','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100105','HUANUCO','HUANUCO','MARGOS','-10.0061','-76.5214','10','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100106','HUANUCO','HUANUCO','QUISQUI','-9.9231','-76.3561','10','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100107','HUANUCO','HUANUCO','SAN FRANCISCO DE CAYRAN','-9.9822','-76.2847','10','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100108','HUANUCO','HUANUCO','SAN PEDRO DE CHAULAN','-10.0581','-76.4822','10','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100109','HUANUCO','HUANUCO','SANTA MARIA DEL VALLE','-9.8628','-76.1703','10','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100110','HUANUCO','HUANUCO','YARUMAYO','-10.0022','-76.4683','10','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100111','HUANUCO','HUANUCO','PILLCO MARCA','-9.9578','-76.2492','10','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100112','HUANUCO','HUANUCO','YACUS','-9.9858','-76.5044','10','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100113','HUANUCO','HUANUCO','SAN PABLO DE PILLAO','-9.7894','-75.9986','10','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100201','HUANUCO','AMBO','AMBO','-10.1294','-76.2047','10','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100202','HUANUCO','AMBO','CAYNA','-10.2717','-76.3872','10','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100203','HUANUCO','AMBO','COLPAS','-10.2672','-76.4144','10','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100204','HUANUCO','AMBO','CONCHAMARCA','-10.0367','-76.2156','10','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100205','HUANUCO','AMBO','HUACAR','-10.1614','-76.2356','10','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100206','HUANUCO','AMBO','SAN FRANCISCO','-10.3419','-76.2914','10','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100207','HUANUCO','AMBO','SAN RAFAEL','-10.3403','-76.1828','10','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100208','HUANUCO','AMBO','TOMAY KICHWA','-10.0789','-76.2131','10','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100301','HUANUCO','DOS DE MAYO','LA UNION','-9.8278','-76.8003','10','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100307','HUANUCO','DOS DE MAYO','CHUQUIS','-9.6775','-76.7033','10','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100311','HUANUCO','DOS DE MAYO','MARIAS','-9.6061','-76.705','10','03','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100313','HUANUCO','DOS DE MAYO','PACHAS','-9.7061','-76.7722','10','03','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100316','HUANUCO','DOS DE MAYO','QUIVILLA','-9.5967','-76.7253','10','03','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100317','HUANUCO','DOS DE MAYO','RIPAN','-9.8261','-76.8033','10','03','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100321','HUANUCO','DOS DE MAYO','SHUNQUI','-9.7311','-76.7833','10','03','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100322','HUANUCO','DOS DE MAYO','SILLAPATA','-9.7581','-76.7742','10','03','22');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100323','HUANUCO','DOS DE MAYO','YANAS','-9.7144','-76.7489','10','03','23');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100401','HUANUCO','HUACAYBAMBA','HUACAYBAMBA','-9.0372','-76.9519','10','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100402','HUANUCO','HUACAYBAMBA','CANCHABAMBA','-8.8836','-77.1228','10','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100403','HUANUCO','HUACAYBAMBA','COCHABAMBA','-9.0922','-76.835','10','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100404','HUANUCO','HUACAYBAMBA','PINRA','-8.9239','-77.0125','10','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100501','HUANUCO','HUAMALIES','LLATA','-9.5506','-76.8156','10','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100502','HUANUCO','HUAMALIES','ARANCAY','-9.1708','-76.7483','10','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100503','HUANUCO','HUAMALIES','CHAVIN DE PARIARCA','-9.4231','-76.7692','10','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100504','HUANUCO','HUAMALIES','JACAS GRANDE','-9.5397','-76.7358','10','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100505','HUANUCO','HUAMALIES','JIRCAN','-9.2472','-76.7161','10','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100506','HUANUCO','HUAMALIES','MIRAFLORES','-9.4928','-76.8189','10','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100507','HUANUCO','HUAMALIES','MONZON','-9.2842','-76.3978','10','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100508','HUANUCO','HUAMALIES','PUNCHAO','-9.4614','-76.8192','10','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100509','HUANUCO','HUAMALIES','PUÑOS','-9.5','-76.885','10','05','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100510','HUANUCO','HUAMALIES','SINGA','-9.3881','-76.8125','10','05','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100511','HUANUCO','HUAMALIES','TANTAMAYO','-9.3928','-76.7183','10','05','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100601','HUANUCO','LEONCIO PRADO','RUPA-RUPA','-9.2944','-75.9969','10','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100602','HUANUCO','LEONCIO PRADO','DANIEL ALOMIAS ROBLES','-9.1839','-75.9406','10','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100603','HUANUCO','LEONCIO PRADO','HERMILIO VALDIZAN','-9.1525','-75.8261','10','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100604','HUANUCO','LEONCIO PRADO','JOSE CRESPO Y CASTILLO','-8.9319','-76.1147','10','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100605','HUANUCO','LEONCIO PRADO','LUYANDO','-9.2469','-75.9919','10','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100606','HUANUCO','LEONCIO PRADO','MARIANO DAMASO BERAUN','-9.4164','-75.9661','10','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100607','HUANUCO','LEONCIO PRADO','PUCAYACU','-8.7492','-76.1253','10','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100608','HUANUCO','LEONCIO PRADO','CASTILLO GRANDE','-9.2792','-76.0117','10','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100609','HUANUCO','LEONCIO PRADO','PUEBLO NUEVO','-9.0089','-76.0714','10','06','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100610','HUANUCO','LEONCIO PRADO','SANTO DOMINGO DE ANDA','-9.0089','-76.0714','10','06','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100701','HUANUCO','MARAÑON','HUACRACHUCO','-8.6044','-77.1489','10','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100702','HUANUCO','MARAÑON','CHOLON','-8.6594','-76.8481','10','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100703','HUANUCO','MARAÑON','SAN BUENAVENTURA','-8.7681','-77.1867','10','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100704','HUANUCO','MARAÑON','LA MORADA','-8.7933','-76.2497','10','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100705','HUANUCO','MARAÑON','SANTA ROSA DE ALTO YANAJANCA','-8.6364','-76.3439','10','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100801','HUANUCO','PACHITEA','PANAO','-9.8956','-75.9769','10','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100802','HUANUCO','PACHITEA','CHAGLLA','-9.8281','-75.9064','10','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100803','HUANUCO','PACHITEA','MOLINO','-9.9119','-76.0175','10','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100804','HUANUCO','PACHITEA','UMARI','-9.8614','-76.0422','10','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100901','HUANUCO','PUERTO INCA','PUERTO INCA','-9.3775','-74.9733','10','09','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100902','HUANUCO','PUERTO INCA','CODO DEL POZUZO','-9.6758','-75.4533','10','09','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100903','HUANUCO','PUERTO INCA','HONORIA','-8.7694','-74.7089','10','09','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100904','HUANUCO','PUERTO INCA','TOURNAVISTA','-8.9289','-74.7053','10','09','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('100905','HUANUCO','PUERTO INCA','YUYAPICHIS','-9.6297','-74.9744','10','09','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101001','HUANUCO','LAURICOCHA','JESUS','-10.0803','-76.6303','10','10','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101002','HUANUCO','LAURICOCHA','BAÑOS','-10.0769','-76.7356','10','10','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101003','HUANUCO','LAURICOCHA','JIVIA','-10.0236','-76.6811','10','10','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101004','HUANUCO','LAURICOCHA','QUEROPALCA','-10.1811','-76.8042','10','10','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101005','HUANUCO','LAURICOCHA','RONDOS','-9.9836','-76.6889','10','10','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101006','HUANUCO','LAURICOCHA','SAN FRANCISCO DE ASIS','-9.9772','-76.6758','10','10','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101007','HUANUCO','LAURICOCHA','SAN MIGUEL DE CAURI','-10.1431','-76.625','10','10','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101101','HUANUCO','YAROWILCA','CHAVINILLO','-9.8447','-76.6236','10','11','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101102','HUANUCO','YAROWILCA','CAHUAC','-9.8494','-76.6319','10','11','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101103','HUANUCO','YAROWILCA','CHACABAMBA','-9.9014','-76.6097','10','11','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101104','HUANUCO','YAROWILCA','APARICIO POMARES','-9.7486','-76.6478','10','11','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101105','HUANUCO','YAROWILCA','JACAS CHICO','-9.8872','-76.5017','10','11','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101106','HUANUCO','YAROWILCA','OBAS','-9.7953','-76.6658','10','11','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101107','HUANUCO','YAROWILCA','PAMPAMARCA','-9.7061','-76.7028','10','11','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('101108','HUANUCO','YAROWILCA','CHORAS','-9.9108','-76.6036','10','11','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110101','ICA','ICA','ICA','-14.0678','-75.7319','11','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110102','ICA','ICA','LA TINGUIÑA','-14.035','-75.7092','11','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110103','ICA','ICA','LOS AQUIJES','-14.0978','-75.6911','11','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110104','ICA','ICA','OCUCAJE','-14.3433','-75.6608','11','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110105','ICA','ICA','PACHACUTEC','-14.1528','-75.6925','11','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110106','ICA','ICA','PARCONA','-14.0453','-75.7058','11','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110107','ICA','ICA','PUEBLO NUEVO','-14.1275','-75.7031','11','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110108','ICA','ICA','SALAS','-13.9861','-75.7733','11','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110109','ICA','ICA','SAN JOSE DE LOS MOLINOS','-13.9283','-75.6669','11','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110110','ICA','ICA','SAN JUAN BAUTISTA','-14.0114','-75.7372','11','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110111','ICA','ICA','SANTIAGO','-14.1922','-75.7142','11','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110112','ICA','ICA','SUBTANJALLA','-14.0194','-75.7597','11','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110113','ICA','ICA','TATE','-14.1528','-75.7092','11','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110114','ICA','ICA','YAUCA DEL ROSARIO','-14.1014','-75.4783','11','01','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110201','ICA','CHINCHA','CHINCHA ALTA','-13.42','-76.1356','11','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110202','ICA','CHINCHA','ALTO LARAN','-13.4444','-76.1067','11','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110203','ICA','CHINCHA','CHAVIN','-13.0789','-75.9119','11','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110204','ICA','CHINCHA','CHINCHA BAJA','-13.4597','-76.1647','11','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110205','ICA','CHINCHA','EL CARMEN','-13.5019','-76.0536','11','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110206','ICA','CHINCHA','GROCIO PRADO','-13.3986','-76.1592','11','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110207','ICA','CHINCHA','PUEBLO NUEVO','-13.4019','-76.1269','11','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110208','ICA','CHINCHA','SAN JUAN DE YANAC','-13.2108','-75.7861','11','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110209','ICA','CHINCHA','SAN PEDRO DE HUACARPANA','-13.0492','-75.6483','11','02','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110210','ICA','CHINCHA','SUNAMPE','-13.4269','-76.1647','11','02','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110211','ICA','CHINCHA','TAMBO DE MORA','-13.4592','-76.1839','11','02','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110301','ICA','NAZCA','NAZCA','-14.8328','-74.9361','11','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110302','ICA','NAZCA','CHANGUILLO','-14.6653','-75.2253','11','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110303','ICA','NAZCA','EL INGENIO','-14.6464','-75.06','11','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110304','ICA','NAZCA','MARCONA','-15.3619','-75.1681','11','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110305','ICA','NAZCA','VISTA ALEGRE','-14.8453','-74.9469','11','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110401','ICA','PALPA','PALPA','-14.5339','-75.1839','11','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110402','ICA','PALPA','LLIPATA','-14.5636','-75.2078','11','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110403','ICA','PALPA','RIO GRANDE','-14.5194','-75.2006','11','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110404','ICA','PALPA','SANTA CRUZ','-14.4914','-75.2639','11','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110405','ICA','PALPA','TIBILLO','-14.0931','-75.1728','11','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110501','ICA','PISCO','PISCO','-13.7086','-76.2075','11','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110502','ICA','PISCO','HUANCANO','-13.5992','-75.6203','11','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110503','ICA','PISCO','HUMAY','-13.7222','-75.885','11','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110504','ICA','PISCO','INDEPENDENCIA','-13.6939','-76.0256','11','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110505','ICA','PISCO','PARACAS','-13.8428','-76.2503','11','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110506','ICA','PISCO','SAN ANDRES','-13.7311','-76.2211','11','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110507','ICA','PISCO','SAN CLEMENTE','-13.6839','-76.1592','11','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('110508','ICA','PISCO','TUPAC AMARU INCA','-13.7119','-76.1492','11','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120101','JUNIN','HUANCAYO','HUANCAYO','-12.0703','-75.2139','12','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120104','JUNIN','HUANCAYO','CARHUACALLANGA','-12.3544','-75.2033','12','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120105','JUNIN','HUANCAYO','CHACAPAMPA','-12.3444','-75.2472','12','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120106','JUNIN','HUANCAYO','CHICCHE','-12.2961','-75.2964','12','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120107','JUNIN','HUANCAYO','CHILCA','-12.0817','-75.2028','12','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120108','JUNIN','HUANCAYO','CHONGOS ALTO','-12.3128','-75.2925','12','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120111','JUNIN','HUANCAYO','CHUPURO','-12.1561','-75.245','12','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120112','JUNIN','HUANCAYO','COLCA','-12.3169','-75.2258','12','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120113','JUNIN','HUANCAYO','CULLHUAS','-12.2233','-75.1747','12','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120114','JUNIN','HUANCAYO','EL TAMBO','-12.055','-75.2206','12','01','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120116','JUNIN','HUANCAYO','HUACRAPUQUIO','-12.1725','-75.2236','12','01','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120117','JUNIN','HUANCAYO','HUALHUAS','-11.9692','-75.2536','12','01','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120119','JUNIN','HUANCAYO','HUANCAN','-12.1064','-75.2186','12','01','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120120','JUNIN','HUANCAYO','HUASICANCHA','-12.3331','-75.2844','12','01','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120121','JUNIN','HUANCAYO','HUAYUCACHI','-12.1367','-75.2247','12','01','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120122','JUNIN','HUANCAYO','INGENIO','-11.8903','-75.2686','12','01','22');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120124','JUNIN','HUANCAYO','PARIAHUANCA','-11.9792','-74.8967','12','01','24');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120125','JUNIN','HUANCAYO','PILCOMAYO','-12.0497','-75.2528','12','01','25');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120126','JUNIN','HUANCAYO','PUCARA','-12.1719','-75.1475','12','01','26');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120127','JUNIN','HUANCAYO','QUICHUAY','-11.8875','-75.2872','12','01','27');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120128','JUNIN','HUANCAYO','QUILCAS','-11.9383','-75.2611','12','01','28');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120129','JUNIN','HUANCAYO','SAN AGUSTIN','-11.9914','-75.2481','12','01','29');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120130','JUNIN','HUANCAYO','SAN JERONIMO DE TUNAN','-11.9483','-75.2856','12','01','30');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120132','JUNIN','HUANCAYO','SAÑO','-11.955','-75.2606','12','01','32');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120133','JUNIN','HUANCAYO','SAPALLANGA','-12.1403','-75.1597','12','01','33');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120134','JUNIN','HUANCAYO','SICAYA','-12.0125','-75.2833','12','01','34');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120135','JUNIN','HUANCAYO','SANTO DOMINGO DE ACOBAMBA','-11.7689','-74.7953','12','01','35');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120136','JUNIN','HUANCAYO','VIQUES','-12.1603','-75.2342','12','01','36');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120201','JUNIN','CONCEPCION','CONCEPCION','-11.9181','-75.3161','12','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120202','JUNIN','CONCEPCION','ACO','-11.9594','-75.3636','12','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120203','JUNIN','CONCEPCION','ANDAMARCA','-11.7319','-74.8058','12','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120204','JUNIN','CONCEPCION','CHAMBARA','-12.0286','-75.3783','12','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120205','JUNIN','CONCEPCION','COCHAS','-11.6597','-75.1033','12','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120206','JUNIN','CONCEPCION','COMAS','-11.7183','-75.0839','12','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120207','JUNIN','CONCEPCION','HEROINAS TOLEDO','-11.8353','-75.2911','12','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120208','JUNIN','CONCEPCION','MANZANARES','-12.0217','-75.3489','12','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120209','JUNIN','CONCEPCION','MARISCAL CASTILLA','-11.6158','-75.0942','12','02','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120210','JUNIN','CONCEPCION','MATAHUASI','-11.8917','-75.3539','12','02','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120211','JUNIN','CONCEPCION','MITO','-11.9375','-75.3417','12','02','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120212','JUNIN','CONCEPCION','NUEVE DE JULIO','-11.9019','-75.3217','12','02','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120213','JUNIN','CONCEPCION','ORCOTUNA','-11.9681','-75.3131','12','02','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120214','JUNIN','CONCEPCION','SAN JOSE DE QUERO','-12.0856','-75.5383','12','02','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120215','JUNIN','CONCEPCION','SANTA ROSA DE OCOPA','-11.8769','-75.2944','12','02','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120301','JUNIN','CHANCHAMAYO','CHANCHAMAYO','-11.0558','-75.3292','12','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120302','JUNIN','CHANCHAMAYO','PERENE','-10.9522','-75.2244','12','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120303','JUNIN','CHANCHAMAYO','PICHANAQUI','-10.9303','-74.8728','12','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120304','JUNIN','CHANCHAMAYO','SAN LUIS DE SHUARO','-10.8894','-75.2911','12','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120305','JUNIN','CHANCHAMAYO','SAN RAMON','-11.1214','-75.3528','12','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120306','JUNIN','CHANCHAMAYO','VITOC','-11.2083','-75.3372','12','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120401','JUNIN','JAUJA','JAUJA','-11.7761','-75.4992','12','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120402','JUNIN','JAUJA','ACOLLA','-11.7317','-75.5489','12','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120403','JUNIN','JAUJA','APATA','-11.8558','-75.3569','12','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120404','JUNIN','JAUJA','ATAURA','-11.8022','-75.4411','12','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120405','JUNIN','JAUJA','CANCHAYLLO','-11.8011','-75.72','12','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120406','JUNIN','JAUJA','CURICACA','-11.7842','-75.6781','12','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120407','JUNIN','JAUJA','EL MANTARO','-11.8222','-75.3942','12','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120408','JUNIN','JAUJA','HUAMALI','-11.8083','-75.4269','12','04','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120409','JUNIN','JAUJA','HUARIPAMPA','-11.8086','-75.4739','12','04','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120410','JUNIN','JAUJA','HUERTAS','-11.7686','-75.4769','12','04','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120411','JUNIN','JAUJA','JANJAILLO','-11.7658','-75.6275','12','04','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120412','JUNIN','JAUJA','JULCAN','-11.7608','-75.4392','12','04','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120413','JUNIN','JAUJA','LEONOR ORDOÑEZ','-11.8633','-75.4169','12','04','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120414','JUNIN','JAUJA','LLOCLLAPAMPA','-11.8189','-75.6261','12','04','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120415','JUNIN','JAUJA','MARCO','-11.7419','-75.5639','12','04','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120416','JUNIN','JAUJA','MASMA','-11.7867','-75.4289','12','04','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120417','JUNIN','JAUJA','MASMA CHICCHE','-11.7864','-75.38','12','04','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120418','JUNIN','JAUJA','MOLINOS','-11.7378','-75.4467','12','04','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120419','JUNIN','JAUJA','MONOBAMBA','-11.3606','-75.3278','12','04','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120420','JUNIN','JAUJA','MUQUI','-11.8342','-75.4369','12','04','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120421','JUNIN','JAUJA','MUQUIYAUYO','-11.8147','-75.4581','12','04','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120422','JUNIN','JAUJA','PACA','-11.7117','-75.5189','12','04','22');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120423','JUNIN','JAUJA','PACCHA','-11.8553','-75.5111','12','04','23');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120424','JUNIN','JAUJA','PANCAN','-11.7503','-75.4883','12','04','24');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120425','JUNIN','JAUJA','PARCO','-11.8022','-75.5469','12','04','25');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120426','JUNIN','JAUJA','POMACANCHA','-11.7381','-75.6264','12','04','26');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120427','JUNIN','JAUJA','RICRAN','-11.5411','-75.5289','12','04','27');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120428','JUNIN','JAUJA','SAN LORENZO','-11.8472','-75.3842','12','04','28');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120429','JUNIN','JAUJA','SAN PEDRO DE CHUNAN','-11.7247','-75.4894','12','04','29');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120430','JUNIN','JAUJA','SAUSA','-11.7939','-75.4872','12','04','30');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120431','JUNIN','JAUJA','SINCOS','-11.8917','-75.3903','12','04','31');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120432','JUNIN','JAUJA','TUNAN MARCA','-11.7269','-75.5731','12','04','32');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120433','JUNIN','JAUJA','YAULI','-11.7117','-75.4725','12','04','33');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120434','JUNIN','JAUJA','YAUYOS','-11.7822','-75.4989','12','04','34');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120501','JUNIN','JUNIN','JUNIN','-11.1597','-75.9956','12','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120502','JUNIN','JUNIN','CARHUAMAYO','-10.9233','-76.0569','12','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120503','JUNIN','JUNIN','ONDORES','-11.0878','-76.1486','12','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120504','JUNIN','JUNIN','ULCUMAYO','-10.9689','-75.8778','12','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120601','JUNIN','SATIPO','SATIPO','-11.2531','-74.6372','12','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120602','JUNIN','SATIPO','COVIRIALI','-11.2906','-74.6283','12','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120603','JUNIN','SATIPO','LLAYLLA','-11.3808','-74.5906','12','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120604','JUNIN','SATIPO','MAZAMARI','-11.4056','-74.7519','12','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120605','JUNIN','SATIPO','PAMPA HERMOSA','-11.4056','-74.7519','12','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120606','JUNIN','SATIPO','PANGOA','-11.2086','-74.6597','12','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120607','JUNIN','SATIPO','RIO NEGRO','-11.1469','-74.31','12','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120608','JUNIN','SATIPO','RIO TAMBO','-11.2531','-74.6372','12','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120609','JUNIN','SATIPO','VIZCATÁN DEL ENE','-12.2153','-74.0158','12','06','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120701','JUNIN','TARMA','TARMA','-11.4206','-75.6908','12','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120702','JUNIN','TARMA','ACOBAMBA','-11.3528','-75.6592','12','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120703','JUNIN','TARMA','HUARICOLCA','-11.5089','-75.6514','12','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120704','JUNIN','TARMA','HUASAHUASI','-11.2667','-75.6522','12','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120705','JUNIN','TARMA','LA UNION','-11.3756','-75.7547','12','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120706','JUNIN','TARMA','PALCA','-11.3469','-75.5681','12','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120707','JUNIN','TARMA','PALCAMAYO','-11.2956','-75.7731','12','07','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120708','JUNIN','TARMA','SAN PEDRO DE CAJAS','-11.2503','-75.8647','12','07','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120709','JUNIN','TARMA','TAPO','-11.3903','-75.5636','12','07','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120801','JUNIN','YAULI','LA OROYA','-11.5206','-75.9014','12','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120802','JUNIN','YAULI','CHACAPALPA','-11.7328','-75.7556','12','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120803','JUNIN','YAULI','HUAY-HUAY','-11.7219','-75.9042','12','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120804','JUNIN','YAULI','MARCAPOMACOCHA','-11.4056','-76.3364','12','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120805','JUNIN','YAULI','MOROCOCHA','-11.5972','-76.14','12','08','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120806','JUNIN','YAULI','PACCHA','-11.4794','-75.9669','12','08','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120807','JUNIN','YAULI','SANTA BARBARA DE CARHUACAYAN','-11.2008','-76.2883','12','08','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120808','JUNIN','YAULI','SANTA ROSA DE SACCO','-11.5617','-75.95','12','08','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120809','JUNIN','YAULI','SUITUCANCHA','-11.7875','-75.9358','12','08','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120810','JUNIN','YAULI','YAULI','-11.6672','-76.0883','12','08','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120901','JUNIN','CHUPACA','CHUPACA','-12.0625','-75.2897','12','09','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120902','JUNIN','CHUPACA','AHUAC','-12.0789','-75.3197','12','09','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120903','JUNIN','CHUPACA','CHONGOS BAJO','-12.1361','-75.2681','12','09','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120904','JUNIN','CHUPACA','HUACHAC','-12.0225','-75.3436','12','09','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120905','JUNIN','CHUPACA','HUAMANCACA CHICO','-12.0797','-75.245','12','09','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120906','JUNIN','CHUPACA','SAN JUAN DE YSCOS','-12.1014','-75.2922','12','09','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120907','JUNIN','CHUPACA','SAN JUAN DE JARPA','-12.1239','-75.44','12','09','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120908','JUNIN','CHUPACA','TRES DE DICIEMBRE','-12.1108','-75.2547','12','09','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('120909','JUNIN','CHUPACA','YANACANCHA','-12.2008','-75.3864','12','09','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130101','LA LIBERTAD','TRUJILLO','TRUJILLO','-8.1094','-79.0333','13','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130102','LA LIBERTAD','TRUJILLO','EL PORVENIR','-8.0819','-79.0025','13','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130103','LA LIBERTAD','TRUJILLO','FLORENCIA DE MORA','-8.0808','-79.0236','13','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130104','LA LIBERTAD','TRUJILLO','HUANCHACO','-8.0814','-79.1214','13','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130105','LA LIBERTAD','TRUJILLO','LA ESPERANZA','-8.0781','-79.0453','13','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130106','LA LIBERTAD','TRUJILLO','LAREDO','-8.0911','-78.9611','13','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130107','LA LIBERTAD','TRUJILLO','MOCHE','-8.1722','-79.0111','13','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130108','LA LIBERTAD','TRUJILLO','POROTO','-8.0114','-78.7697','13','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130109','LA LIBERTAD','TRUJILLO','SALAVERRY','-8.2231','-78.9781','13','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130110','LA LIBERTAD','TRUJILLO','SIMBAL','-7.9767','-78.8147','13','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130111','LA LIBERTAD','TRUJILLO','VICTOR LARCO HERRERA','-8.1439','-79.0558','13','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130201','LA LIBERTAD','ASCOPE','ASCOPE','-7.7131','-79.1156','13','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130202','LA LIBERTAD','ASCOPE','CHICAMA','-7.8442','-79.1461','13','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130203','LA LIBERTAD','ASCOPE','CHOCOPE','-7.7914','-79.2225','13','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130204','LA LIBERTAD','ASCOPE','MAGDALENA DE CAO','-7.8767','-79.2947','13','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130205','LA LIBERTAD','ASCOPE','PAIJAN','-7.7319','-79.3019','13','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130206','LA LIBERTAD','ASCOPE','RAZURI','-7.7025','-79.4406','13','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130207','LA LIBERTAD','ASCOPE','SANTIAGO DE CAO','-7.9608','-79.2392','13','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130208','LA LIBERTAD','ASCOPE','CASA GRANDE','-7.7442','-79.1869','13','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130301','LA LIBERTAD','BOLIVAR','BOLIVAR','-7.1547','-77.7044','13','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130302','LA LIBERTAD','BOLIVAR','BAMBAMARCA','-7.4414','-77.6947','13','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130303','LA LIBERTAD','BOLIVAR','CONDORMARCA','-7.5556','-77.5981','13','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130304','LA LIBERTAD','BOLIVAR','LONGOTEA','-7.0428','-77.8744','13','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130305','LA LIBERTAD','BOLIVAR','UCHUMARCA','-7.0481','-77.8078','13','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130306','LA LIBERTAD','BOLIVAR','UCUNCHA','-7.1656','-77.8617','13','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130401','LA LIBERTAD','CHEPEN','CHEPEN','-7.2267','-79.4292','13','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130402','LA LIBERTAD','CHEPEN','PACANGA','-7.1731','-79.4867','13','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130403','LA LIBERTAD','CHEPEN','PUEBLO NUEVO','-7.1883','-79.5142','13','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130501','LA LIBERTAD','JULCAN','JULCAN','-8.0439','-78.4881','13','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130502','LA LIBERTAD','JULCAN','CALAMARCA','-8.1644','-78.4153','13','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130503','LA LIBERTAD','JULCAN','CARABAMBA','-8.1108','-78.6092','13','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130504','LA LIBERTAD','JULCAN','HUASO','-8.2233','-78.4158','13','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130601','LA LIBERTAD','OTUZCO','OTUZCO','-7.9022','-78.5669','13','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130602','LA LIBERTAD','OTUZCO','AGALLPAMPA','-7.9853','-78.5481','13','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130604','LA LIBERTAD','OTUZCO','CHARAT','-7.8247','-78.4506','13','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130605','LA LIBERTAD','OTUZCO','HUARANCHAL','-7.6908','-78.4444','13','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130606','LA LIBERTAD','OTUZCO','LA CUESTA','-7.9189','-78.7081','13','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130608','LA LIBERTAD','OTUZCO','MACHE','-8.0303','-78.5367','13','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130610','LA LIBERTAD','OTUZCO','PARANDAY','-7.8847','-78.7119','13','06','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130611','LA LIBERTAD','OTUZCO','SALPO','-8.0053','-78.6064','13','06','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130613','LA LIBERTAD','OTUZCO','SINSICAP','-7.8517','-78.7561','13','06','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130614','LA LIBERTAD','OTUZCO','USQUIL','-7.8156','-78.4192','13','06','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130701','LA LIBERTAD','PACASMAYO','SAN PEDRO DE LLOC','-7.4278','-79.5036','13','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130702','LA LIBERTAD','PACASMAYO','GUADALUPE','-7.2428','-79.4717','13','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130703','LA LIBERTAD','PACASMAYO','JEQUETEPEQUE','-7.3369','-79.5628','13','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130704','LA LIBERTAD','PACASMAYO','PACASMAYO','-7.4006','-79.5686','13','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130705','LA LIBERTAD','PACASMAYO','SAN JOSE','-7.3494','-79.4569','13','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130801','LA LIBERTAD','PATAZ','TAYABAMBA','-8.2769','-77.2986','13','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130802','LA LIBERTAD','PATAZ','BULDIBUYO','-8.1281','-77.3981','13','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130803','LA LIBERTAD','PATAZ','CHILLIA','-8.1258','-77.5169','13','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130804','LA LIBERTAD','PATAZ','HUANCASPATA','-8.4575','-77.3011','13','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130805','LA LIBERTAD','PATAZ','HUAYLILLAS','-8.1867','-77.3447','13','08','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130806','LA LIBERTAD','PATAZ','HUAYO','-8.0053','-77.5936','13','08','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130807','LA LIBERTAD','PATAZ','ONGON','-8.1689','-76.9664','13','08','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130808','LA LIBERTAD','PATAZ','PARCOY','-8.035','-77.4817','13','08','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130809','LA LIBERTAD','PATAZ','PATAZ','-7.7856','-77.5942','13','08','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130810','LA LIBERTAD','PATAZ','PIAS','-7.8728','-77.5494','13','08','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130811','LA LIBERTAD','PATAZ','SANTIAGO DE CHALLAS','-8.4389','-77.3239','13','08','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130812','LA LIBERTAD','PATAZ','TAURIJA','-8.3083','-77.425','13','08','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130813','LA LIBERTAD','PATAZ','URPAY','-8.3478','-77.3917','13','08','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130901','LA LIBERTAD','SANCHEZ CARRION','HUAMACHUCO','-7.8153','-78.0525','13','09','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130902','LA LIBERTAD','SANCHEZ CARRION','CHUGAY','-7.7825','-77.8694','13','09','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130903','LA LIBERTAD','SANCHEZ CARRION','COCHORCO','-7.8058','-77.72','13','09','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130904','LA LIBERTAD','SANCHEZ CARRION','CURGOS','-7.8592','-77.9431','13','09','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130905','LA LIBERTAD','SANCHEZ CARRION','MARCABAL','-7.7053','-78.0306','13','09','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130906','LA LIBERTAD','SANCHEZ CARRION','SANAGORAN','-7.7856','-78.1411','13','09','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130907','LA LIBERTAD','SANCHEZ CARRION','SARIN','-7.9122','-77.9044','13','09','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('130908','LA LIBERTAD','SANCHEZ CARRION','SARTIMBAMBA','-7.6994','-77.7411','13','09','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131001','LA LIBERTAD','SANTIAGO DE CHUCO','SANTIAGO DE CHUCO','-8.1456','-78.1753','13','10','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131002','LA LIBERTAD','SANTIAGO DE CHUCO','ANGASMARCA','-8.1331','-78.0547','13','10','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131003','LA LIBERTAD','SANTIAGO DE CHUCO','CACHICADAN','-8.0917','-78.1467','13','10','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131004','LA LIBERTAD','SANTIAGO DE CHUCO','MOLLEBAMBA','-8.1706','-77.9764','13','10','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131005','LA LIBERTAD','SANTIAGO DE CHUCO','MOLLEPATA','-8.1908','-77.9558','13','10','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131006','LA LIBERTAD','SANTIAGO DE CHUCO','QUIRUVILCA','-8.0025','-78.3108','13','10','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131007','LA LIBERTAD','SANTIAGO DE CHUCO','SANTA CRUZ DE CHUCA','-8.1194','-78.1411','13','10','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131008','LA LIBERTAD','SANTIAGO DE CHUCO','SITABAMBA','-8.0231','-77.7314','13','10','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131101','LA LIBERTAD','GRAN CHIMU','CASCAS','-7.4803','-78.8167','13','11','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131102','LA LIBERTAD','GRAN CHIMU','LUCMA','-7.6406','-78.5511','13','11','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131103','LA LIBERTAD','GRAN CHIMU','COMPIN','-7.6981','-78.6256','13','11','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131104','LA LIBERTAD','GRAN CHIMU','SAYAPULLO','-7.5964','-78.4681','13','11','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131201','LA LIBERTAD','VIRU','VIRU','-8.4156','-78.7511','13','12','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131202','LA LIBERTAD','VIRU','CHAO','-8.5394','-78.6825','13','12','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('131203','LA LIBERTAD','VIRU','GUADALUPITO','-8.9519','-78.6258','13','12','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140101','LAMBAYEQUE','CHICLAYO','CHICLAYO','-6.7736','-79.8397','14','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140102','LAMBAYEQUE','CHICLAYO','CHONGOYAPE','-6.6428','-79.3842','14','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140103','LAMBAYEQUE','CHICLAYO','ETEN','-6.9072','-79.8644','14','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140104','LAMBAYEQUE','CHICLAYO','ETEN PUERTO','-6.9269','-79.8664','14','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140105','LAMBAYEQUE','CHICLAYO','JOSE LEONARDO ORTIZ','-6.7592','-79.8408','14','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140106','LAMBAYEQUE','CHICLAYO','LA VICTORIA','-6.7883','-79.8367','14','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140107','LAMBAYEQUE','CHICLAYO','LAGUNAS','-6.9911','-79.6244','14','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140108','LAMBAYEQUE','CHICLAYO','MONSEFU','-6.8786','-79.8714','14','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140109','LAMBAYEQUE','CHICLAYO','NUEVA ARICA','-6.8731','-79.3386','14','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140110','LAMBAYEQUE','CHICLAYO','OYOTUN','-6.8458','-79.2981','14','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140111','LAMBAYEQUE','CHICLAYO','PICSI','-6.7186','-79.7708','14','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140112','LAMBAYEQUE','CHICLAYO','PIMENTEL','-6.8369','-79.9361','14','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140113','LAMBAYEQUE','CHICLAYO','REQUE','-6.8644','-79.8181','14','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140114','LAMBAYEQUE','CHICLAYO','SANTA ROSA','-6.88','-79.9231','14','01','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140115','LAMBAYEQUE','CHICLAYO','SAÑA','-6.9233','-79.5839','14','01','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140116','LAMBAYEQUE','CHICLAYO','CAYALTI','-6.8917','-79.5617','14','01','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140117','LAMBAYEQUE','CHICLAYO','PATAPO','-6.7386','-79.6406','14','01','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140118','LAMBAYEQUE','CHICLAYO','POMALCA','-6.7667','-79.7728','14','01','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140119','LAMBAYEQUE','CHICLAYO','PUCALA','-6.78','-79.6122','14','01','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140120','LAMBAYEQUE','CHICLAYO','TUMAN','-6.7478','-79.7017','14','01','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140201','LAMBAYEQUE','FERREÑAFE','FERREÑAFE','-6.6394','-79.7911','14','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140202','LAMBAYEQUE','FERREÑAFE','CAÑARIS','-6.0447','-79.2647','14','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140203','LAMBAYEQUE','FERREÑAFE','INCAHUASI','-6.2372','-79.315','14','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140204','LAMBAYEQUE','FERREÑAFE','MANUEL ANTONIO MESONES MURO','-6.6456','-79.7361','14','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140205','LAMBAYEQUE','FERREÑAFE','PITIPO','-6.5664','-79.7808','14','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140206','LAMBAYEQUE','FERREÑAFE','PUEBLO NUEVO','-6.6367','-79.7947','14','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140301','LAMBAYEQUE','LAMBAYEQUE','LAMBAYEQUE','-6.7006','-79.9072','14','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140302','LAMBAYEQUE','LAMBAYEQUE','CHOCHOPE','-6.1586','-79.6469','14','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140303','LAMBAYEQUE','LAMBAYEQUE','ILLIMO','-6.4733','-79.8531','14','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140304','LAMBAYEQUE','LAMBAYEQUE','JAYANCA','-6.3881','-79.8211','14','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140305','LAMBAYEQUE','LAMBAYEQUE','MOCHUMI','-6.5467','-79.8647','14','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140306','LAMBAYEQUE','LAMBAYEQUE','MORROPE','-6.54','-80.0128','14','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140307','LAMBAYEQUE','LAMBAYEQUE','MOTUPE','-6.1536','-79.7153','14','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140308','LAMBAYEQUE','LAMBAYEQUE','OLMOS','-5.9883','-79.75','14','03','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140309','LAMBAYEQUE','LAMBAYEQUE','PACORA','-6.4275','-79.84','14','03','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140310','LAMBAYEQUE','LAMBAYEQUE','SALAS','-6.2736','-79.6044','14','03','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140311','LAMBAYEQUE','LAMBAYEQUE','SAN JOSE','-6.7703','-79.9686','14','03','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('140312','LAMBAYEQUE','LAMBAYEQUE','TUCUME','-6.5097','-79.8594','14','03','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150101','LIMA','LIMA','LIMA','-12.0467','-77.0322','15','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150102','LIMA','LIMA','ANCON','-11.7764','-77.1703','15','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150103','LIMA','LIMA','ATE','-12.0256','-76.9242','15','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150104','LIMA','LIMA','BARRANCO','-12.1494','-77.0247','15','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150105','LIMA','LIMA','BREÑA','-12.0567','-77.0536','15','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150106','LIMA','LIMA','CARABAYLLO','-11.8583','-77.0419','15','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150107','LIMA','LIMA','CHACLACAYO','-11.9783','-76.7642','15','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150108','LIMA','LIMA','CHORRILLOS','-12.1742','-77.0247','15','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150109','LIMA','LIMA','CIENEGUILLA','-12.1178','-76.8125','15','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150110','LIMA','LIMA','COMAS','-11.95','-77.05','15','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150111','LIMA','LIMA','EL AGUSTINO','-12.0433','-76.9986','15','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150112','LIMA','LIMA','INDEPENDENCIA','-12.0008','-77.0522','15','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150113','LIMA','LIMA','JESUS MARIA','-12.0697','-77.045','15','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150114','LIMA','LIMA','LA MOLINA','-12.0875','-76.9339','15','01','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150115','LIMA','LIMA','LA VICTORIA','-12.0653','-77.0308','15','01','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150116','LIMA','LIMA','LINCE','-12.0811','-77.0306','15','01','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150117','LIMA','LIMA','LOS OLIVOS','-11.9828','-77.0694','15','01','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150118','LIMA','LIMA','LURIGANCHO','-11.9372','-76.7036','15','01','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150119','LIMA','LIMA','LURIN','-12.2686','-76.8847','15','01','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150120','LIMA','LIMA','MAGDALENA DEL MAR','-12.0967','-77.0747','15','01','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150121','LIMA','LIMA','PUEBLO LIBRE','-12.0733','-77.0631','15','01','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150122','LIMA','LIMA','MIRAFLORES','-12.1175','-77.0453','15','01','22');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150123','LIMA','LIMA','PACHACAMAC','-12.2286','-76.8597','15','01','23');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150124','LIMA','LIMA','PUCUSANA','-12.4825','-76.7964','15','01','24');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150125','LIMA','LIMA','PUENTE PIEDRA','-11.8464','-77.1058','15','01','25');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150126','LIMA','LIMA','PUNTA HERMOSA','-12.3375','-76.8258','15','01','26');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150127','LIMA','LIMA','PUNTA NEGRA','-12.3661','-76.7947','15','01','27');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150128','LIMA','LIMA','RIMAC','-12.0294','-77.0436','15','01','28');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150129','LIMA','LIMA','SAN BARTOLO','-12.3883','-76.7806','15','01','29');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150130','LIMA','LIMA','SAN BORJA','-12.1078','-76.9989','15','01','30');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150131','LIMA','LIMA','SAN ISIDRO','-12.0989','-77.0344','15','01','31');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150132','LIMA','LIMA','SAN JUAN DE LURIGANCHO','-12.0244','-77.0025','15','01','32');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150133','LIMA','LIMA','SAN JUAN DE MIRAFLORES','-12.1589','-76.9722','15','01','33');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150134','LIMA','LIMA','SAN LUIS','-12.0728','-76.9975','15','01','34');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150135','LIMA','LIMA','SAN MARTIN DE PORRES','-12.0303','-77.0469','15','01','35');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150136','LIMA','LIMA','SAN MIGUEL','-12.09','-77.0864','15','01','36');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150137','LIMA','LIMA','SANTA ANITA','-12.0433','-76.985','15','01','37');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150138','LIMA','LIMA','SANTA MARIA DEL MAR','-12.4092','-76.7758','15','01','38');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150139','LIMA','LIMA','SANTA ROSA','-11.7983','-77.1775','15','01','39');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150140','LIMA','LIMA','SANTIAGO DE SURCO','-12.1506','-77.0078','15','01','40');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150141','LIMA','LIMA','SURQUILLO','-12.1136','-77.0081','15','01','41');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150142','LIMA','LIMA','VILLA EL SALVADOR','-12.2164','-76.9433','15','01','42');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150143','LIMA','LIMA','VILLA MARIA DEL TRIUNFO','-12.1572','-76.9528','15','01','43');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150201','LIMA','BARRANCA','BARRANCA','-10.7564','-77.7603','15','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150202','LIMA','BARRANCA','PARAMONGA','-10.6742','-77.8197','15','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150203','LIMA','BARRANCA','PATIVILCA','-10.6961','-77.7792','15','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150204','LIMA','BARRANCA','SUPE','-10.7992','-77.7133','15','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150205','LIMA','BARRANCA','SUPE PUERTO','-10.8003','-77.7447','15','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150301','LIMA','CAJATAMBO','CAJATAMBO','-10.4722','-76.9939','15','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150302','LIMA','CAJATAMBO','COPA','-10.3856','-77.0789','15','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150303','LIMA','CAJATAMBO','GORGOR','-10.6214','-77.0389','15','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150304','LIMA','CAJATAMBO','HUANCAPON','-10.5483','-77.1128','15','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150305','LIMA','CAJATAMBO','MANAS','-10.5953','-77.1669','15','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150401','LIMA','CANTA','CANTA','-11.4675','-76.6231','15','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150402','LIMA','CANTA','ARAHUAY','-11.6222','-76.6731','15','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150403','LIMA','CANTA','HUAMANTANGA','-11.4997','-76.7489','15','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150404','LIMA','CANTA','HUAROS','-11.4058','-76.5761','15','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150405','LIMA','CANTA','LACHAQUI','-11.5567','-76.6244','15','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150406','LIMA','CANTA','SAN BUENAVENTURA','-11.4897','-76.6631','15','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150407','LIMA','CANTA','SANTA ROSA DE QUIVES','-11.6928','-76.8444','15','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150501','LIMA','CAÑETE','SAN VICENTE DE CAÑETE','-13.0825','-76.3883','15','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150502','LIMA','CAÑETE','ASIA','-12.7789','-76.5572','15','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150503','LIMA','CAÑETE','CALANGO','-12.5256','-76.5433','15','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150504','LIMA','CAÑETE','CERRO AZUL','-13.0267','-76.4794','15','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150505','LIMA','CAÑETE','CHILCA','-12.5172','-76.7361','15','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150506','LIMA','CAÑETE','COAYLLO','-12.7258','-76.4606','15','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150507','LIMA','CAÑETE','IMPERIAL','-13.0608','-76.35','15','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150508','LIMA','CAÑETE','LUNAHUANA','-12.9597','-76.1392','15','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150509','LIMA','CAÑETE','MALA','-12.6553','-76.63','15','05','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150510','LIMA','CAÑETE','NUEVO IMPERIAL','-13.0742','-76.3158','15','05','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150511','LIMA','CAÑETE','PACARAN','-12.8636','-76.0519','15','05','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150512','LIMA','CAÑETE','QUILMANA','-12.95','-76.3828','15','05','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150513','LIMA','CAÑETE','SAN ANTONIO','-12.6431','-76.65','15','05','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150514','LIMA','CAÑETE','SAN LUIS','-13.0508','-76.4294','15','05','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150515','LIMA','CAÑETE','SANTA CRUZ DE FLORES','-12.6194','-76.6397','15','05','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150516','LIMA','CAÑETE','ZUÑIGA','-12.8581','-76.0225','15','05','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150601','LIMA','HUARAL','HUARAL','-11.4914','-77.2053','15','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150602','LIMA','HUARAL','ATAVILLOS ALTO','-11.2331','-76.6561','15','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150603','LIMA','HUARAL','ATAVILLOS BAJO','-11.3533','-76.8231','15','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150604','LIMA','HUARAL','AUCALLAMA','-11.5592','-77.1744','15','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150605','LIMA','HUARAL','CHANCAY','-11.5669','-77.2658','15','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150606','LIMA','HUARAL','IHUARI','-11.1889','-76.9519','15','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150607','LIMA','HUARAL','LAMPIAN','-11.2369','-76.8386','15','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150608','LIMA','HUARAL','PACARAOS','-11.1833','-76.6464','15','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150609','LIMA','HUARAL','SAN MIGUEL DE ACOS','-11.2736','-76.8214','15','06','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150610','LIMA','HUARAL','SANTA CRUZ DE ANDAMARCA','-11.1947','-76.6336','15','06','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150611','LIMA','HUARAL','SUMBILCA','-11.4072','-76.8194','15','06','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150612','LIMA','HUARAL','VEINTISIETE DE NOVIEMBRE','-11.1919','-76.7786','15','06','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150701','LIMA','HUAROCHIRI','MATUCANA','-11.8458','-76.3878','15','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150702','LIMA','HUAROCHIRI','ANTIOQUIA','-12.0814','-76.5133','15','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150703','LIMA','HUAROCHIRI','CALLAHUANCA','-11.8275','-76.6203','15','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150704','LIMA','HUAROCHIRI','CARAMPOMA','-11.6561','-76.5181','15','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150705','LIMA','HUAROCHIRI','CHICLA','-11.7078','-76.2711','15','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150706','LIMA','HUAROCHIRI','CUENCA','-12.1336','-76.4378','15','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150707','LIMA','HUAROCHIRI','HUACHUPAMPA','-11.7228','-76.59','15','07','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150708','LIMA','HUAROCHIRI','HUANZA','-11.6561','-76.5069','15','07','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150709','LIMA','HUAROCHIRI','HUAROCHIRI','-12.1381','-76.2344','15','07','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150710','LIMA','HUAROCHIRI','LAHUAYTAMBO','-12.0969','-76.3911','15','07','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150711','LIMA','HUAROCHIRI','LANGA','-12.1253','-76.4233','15','07','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150712','LIMA','HUAROCHIRI','LARAOS','-11.6647','-76.5422','15','07','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150713','LIMA','HUAROCHIRI','MARIATANA','-12.2378','-76.3261','15','07','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150714','LIMA','HUAROCHIRI','RICARDO PALMA','-11.925','-76.6617','15','07','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150715','LIMA','HUAROCHIRI','SAN ANDRES DE TUPICOCHA','-12.0008','-76.4778','15','07','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150716','LIMA','HUAROCHIRI','SAN ANTONIO','-11.7439','-76.6519','15','07','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150717','LIMA','HUAROCHIRI','SAN BARTOLOME','-11.9114','-76.5275','15','07','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150718','LIMA','HUAROCHIRI','SAN DAMIAN','-12.0178','-76.3936','15','07','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150719','LIMA','HUAROCHIRI','SAN JUAN DE IRIS','-11.6847','-76.5275','15','07','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150720','LIMA','HUAROCHIRI','SAN JUAN DE TANTARANCHE','-12.1136','-76.185','15','07','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150721','LIMA','HUAROCHIRI','SAN LORENZO DE QUINTI','-12.1453','-76.2133','15','07','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150722','LIMA','HUAROCHIRI','SAN MATEO','-11.7589','-76.3031','15','07','22');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150723','LIMA','HUAROCHIRI','SAN MATEO DE OTAO','-11.8686','-76.5475','15','07','23');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150724','LIMA','HUAROCHIRI','SAN PEDRO DE CASTA','-11.7583','-76.5989','15','07','24');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150725','LIMA','HUAROCHIRI','SAN PEDRO DE HUANCAYRE','-12.1311','-76.2186','15','07','25');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150726','LIMA','HUAROCHIRI','SANGALLAYA','-12.1606','-76.2297','15','07','26');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150727','LIMA','HUAROCHIRI','SANTA CRUZ DE COCACHACRA','-11.9108','-76.5406','15','07','27');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150728','LIMA','HUAROCHIRI','SANTA EULALIA','-11.9106','-76.6656','15','07','28');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150729','LIMA','HUAROCHIRI','SANTIAGO DE ANCHUCAYA','-12.0961','-76.2325','15','07','29');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150730','LIMA','HUAROCHIRI','SANTIAGO DE TUNA','-11.985','-76.5275','15','07','30');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150731','LIMA','HUAROCHIRI','SANTO DOMINGO DE LOS OLLEROS','-12.2203','-76.5161','15','07','31');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150732','LIMA','HUAROCHIRI','SURCO','-11.885','-76.4425','15','07','32');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150801','LIMA','HUAURA','HUACHO','-11.1069','-77.61','15','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150802','LIMA','HUAURA','AMBAR','-10.7572','-77.2694','15','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150803','LIMA','HUAURA','CALETA DE CARQUIN','-11.0917','-77.6278','15','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150804','LIMA','HUAURA','CHECRAS','-10.935','-76.8336','15','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150805','LIMA','HUAURA','HUALMAY','-11.1014','-77.61','15','08','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150806','LIMA','HUAURA','HUAURA','-11.0692','-77.6003','15','08','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150807','LIMA','HUAURA','LEONCIO PRADO','-11.0586','-76.9308','15','08','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150808','LIMA','HUAURA','PACCHO','-10.9567','-76.9336','15','08','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150809','LIMA','HUAURA','SANTA LEONOR','-10.9483','-76.7447','15','08','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150810','LIMA','HUAURA','SANTA MARIA','-11.0883','-77.5883','15','08','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150811','LIMA','HUAURA','SAYAN','-11.1364','-77.1917','15','08','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150812','LIMA','HUAURA','VEGUETA','-11.0225','-77.6425','15','08','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150901','LIMA','OYON','OYON','-10.6692','-76.7728','15','09','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150902','LIMA','OYON','ANDAJES','-10.7914','-76.91','15','09','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150903','LIMA','OYON','CAUJUL','-10.8053','-76.9786','15','09','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150904','LIMA','OYON','COCHAMARCA','-10.8617','-77.1278','15','09','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150905','LIMA','OYON','NAVAN','-10.8353','-77.0122','15','09','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('150906','LIMA','OYON','PACHANGARA','-10.8125','-76.8744','15','09','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151001','LIMA','YAUYOS','YAUYOS','-12.46','-75.9217','15','10','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151002','LIMA','YAUYOS','ALIS','-12.2803','-75.7864','15','10','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151003','LIMA','YAUYOS','AYAUCA','-12.5922','-76.0367','15','10','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151004','LIMA','YAUYOS','AYAVIRI','-12.3825','-76.1389','15','10','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151005','LIMA','YAUYOS','AZANGARO','-12.9994','-75.8367','15','10','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151006','LIMA','YAUYOS','CACRA','-12.8119','-75.7828','15','10','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151007','LIMA','YAUYOS','CARANIA','-12.3444','-75.8717','15','10','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151008','LIMA','YAUYOS','CATAHUASI','-12.8003','-75.8911','15','10','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151009','LIMA','YAUYOS','CHOCOS','-12.9133','-75.8631','15','10','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151010','LIMA','YAUYOS','COCHAS','-12.2964','-76.1589','15','10','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151011','LIMA','YAUYOS','COLONIA','-12.6319','-75.8906','15','10','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151012','LIMA','YAUYOS','HONGOS','-12.8108','-75.7647','15','10','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151013','LIMA','YAUYOS','HUAMPARA','-12.3608','-76.1661','15','10','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151014','LIMA','YAUYOS','HUANCAYA','-12.2028','-75.7992','15','10','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151015','LIMA','YAUYOS','HUANGASCAR','-12.8997','-75.8311','15','10','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151016','LIMA','YAUYOS','HUANTAN','-12.4572','-75.8106','15','10','16');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151017','LIMA','YAUYOS','HUAÑEC','-12.2939','-76.1386','15','10','17');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151018','LIMA','YAUYOS','LARAOS','-12.3456','-75.7856','15','10','18');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151019','LIMA','YAUYOS','LINCHA','-12.8','-75.6658','15','10','19');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151020','LIMA','YAUYOS','MADEAN','-12.945','-75.7775','15','10','20');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151021','LIMA','YAUYOS','MIRAFLORES','-12.2747','-75.8536','15','10','21');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151022','LIMA','YAUYOS','OMAS','-12.5172','-76.2903','15','10','22');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151023','LIMA','YAUYOS','PUTINZA','-12.6689','-75.9494','15','10','23');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151024','LIMA','YAUYOS','QUINCHES','-12.3075','-76.1422','15','10','24');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151025','LIMA','YAUYOS','QUINOCAY','-12.3642','-76.2264','15','10','25');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151026','LIMA','YAUYOS','SAN JOAQUIN','-12.2844','-76.1464','15','10','26');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151027','LIMA','YAUYOS','SAN PEDRO DE PILAS','-12.4544','-76.2267','15','10','27');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151028','LIMA','YAUYOS','TANTA','-12.1214','-76.0122','15','10','28');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151029','LIMA','YAUYOS','TAURIPAMPA','-12.6156','-76.16','15','10','29');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151030','LIMA','YAUYOS','TOMAS','-12.2372','-75.7461','15','10','30');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151031','LIMA','YAUYOS','TUPE','-12.7403','-75.8089','15','10','31');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151032','LIMA','YAUYOS','VIÑAC','-12.9311','-75.7794','15','10','32');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('151033','LIMA','YAUYOS','VITIS','-12.2236','-75.8069','15','10','33');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160101','LORETO','MAYNAS','IQUITOS','-3.7497','-73.2619','16','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160102','LORETO','MAYNAS','ALTO NANAY','-3.8869','-73.7003','16','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160103','LORETO','MAYNAS','FERNANDO LORES','-4.0064','-73.1525','16','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160104','LORETO','MAYNAS','INDIANA','-3.4983','-73.0444','16','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160105','LORETO','MAYNAS','LAS AMAZONAS','-3.4136','-72.7689','16','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160106','LORETO','MAYNAS','MAZAN','-3.4978','-73.1142','16','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160107','LORETO','MAYNAS','NAPO','-2.4936','-73.6806','16','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160108','LORETO','MAYNAS','PUNCHANA','-3.7289','-73.2447','16','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160110','LORETO','MAYNAS','TORRES CAUSANA','-0.9642','-75.1814','16','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160112','LORETO','MAYNAS','BELEN','-3.7644','-73.2444','16','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160113','LORETO','MAYNAS','SAN JUAN BAUTISTA','-3.7742','-73.2864','16','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160201','LORETO','ALTO AMAZONAS','YURIMAGUAS','-5.8944','-76.1094','16','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160202','LORETO','ALTO AMAZONAS','BALSAPUERTO','-5.8314','-76.5597','16','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160205','LORETO','ALTO AMAZONAS','JEBEROS','-5.2939','-76.2836','16','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160206','LORETO','ALTO AMAZONAS','LAGUNAS','-5.23','-75.6775','16','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160210','LORETO','ALTO AMAZONAS','SANTA CRUZ','-5.5125','-75.8572','16','02','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160211','LORETO','ALTO AMAZONAS','TENIENTE CESAR LOPEZ ROJAS','-6.0272','-75.8742','16','02','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160301','LORETO','LORETO','NAUTA','-4.4567','-73.5261','16','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160302','LORETO','LORETO','PARINARI','-4.56','-74.4844','16','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160303','LORETO','LORETO','TIGRE','-3.5503','-74.6903','16','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160304','LORETO','LORETO','TROMPETEROS','-3.8028','-75.0597','16','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160305','LORETO','LORETO','URARINAS','-4.5333','-74.7597','16','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160401','LORETO','MARISCAL RAMON CASTILLA','RAMON CASTILLA','-3.9078','-70.5178','16','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160402','LORETO','MARISCAL RAMON CASTILLA','PEBAS','-3.3192','-71.8631','16','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160403','LORETO','MARISCAL RAMON CASTILLA','YAVARI','-4.3567','-70.0408','16','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160404','LORETO','MARISCAL RAMON CASTILLA','SAN PABLO','-4.0164','-71.1022','16','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160501','LORETO','REQUENA','REQUENA','-5.0589','-73.8525','16','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160502','LORETO','REQUENA','ALTO TAPICHE','-6.0256','-74.0908','16','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160503','LORETO','REQUENA','CAPELO','-5.4072','-74.1592','16','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160504','LORETO','REQUENA','EMILIO SAN MARTIN','-5.7936','-74.2864','16','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160505','LORETO','REQUENA','MAQUIA','-5.7892','-74.5503','16','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160506','LORETO','REQUENA','PUINAHUA','-5.2533','-74.3433','16','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160507','LORETO','REQUENA','SAQUENA','-4.7261','-73.5333','16','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160508','LORETO','REQUENA','SOPLIN','-6.005','-73.6911','16','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160509','LORETO','REQUENA','TAPICHE','-5.6644','-74.1886','16','05','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160510','LORETO','REQUENA','JENARO HERRERA','-4.9053','-73.6728','16','05','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160511','LORETO','REQUENA','YAQUERANA','-5.1494','-72.8761','16','05','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160601','LORETO','UCAYALI','CONTAMANA','-7.325','-75.0414','16','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160602','LORETO','UCAYALI','INAHUAYA','-7.1164','-75.2667','16','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160603','LORETO','UCAYALI','PADRE MARQUEZ','-7.9444','-74.8403','16','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160604','LORETO','UCAYALI','PAMPA HERMOSA','-7.195','-75.2969','16','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160605','LORETO','UCAYALI','SARAYACU','-6.3958','-75.1178','16','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160606','LORETO','UCAYALI','VARGAS GUERRA','-6.9094','-75.1594','16','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160701','LORETO','DATEM DEL MARAÑON','BARRANCA','-4.8219','-76.5642','16','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160702','LORETO','DATEM DEL MARAÑON','CAHUAPANAS','-5.2711','-76.9858','16','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160703','LORETO','DATEM DEL MARAÑON','MANSERICHE','-4.565','-77.4183','16','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160704','LORETO','DATEM DEL MARAÑON','MORONA','-4.3247','-77.2147','16','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160705','LORETO','DATEM DEL MARAÑON','PASTAZA','-4.6442','-76.5981','16','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160706','LORETO','DATEM DEL MARAÑON','ANDOAS','-3.475','-76.4344','16','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160801','LORETO','MAYNAS','PUTUMAYO','-2.4497','-72.6556','16','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160802','LORETO','MAYNAS','ROSA PANDURO','-1.7964','-73.4078','16','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160803','LORETO','MAYNAS','TENIENTE MANUEL CLAVERO','-0.3783','-74.6753','16','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('160804','LORETO','MAYNAS','YAGUAS','-2.4114','-71.1836','16','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170101','MADRE DE DIOS','TAMBOPATA','TAMBOPATA','-12.5972','-69.1875','17','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170102','MADRE DE DIOS','TAMBOPATA','INAMBARI','-13.1','-70.3678','17','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170103','MADRE DE DIOS','TAMBOPATA','LAS PIEDRAS','-12.2781','-69.1536','17','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170104','MADRE DE DIOS','TAMBOPATA','LABERINTO','-12.7172','-69.59','17','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170201','MADRE DE DIOS','MANU','MANU','-12.8381','-71.3633','17','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170202','MADRE DE DIOS','MANU','FITZCARRALD','-12.2678','-70.9336','17','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170203','MADRE DE DIOS','MANU','MADRE DE DIOS','-12.6181','-70.3936','17','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170204','MADRE DE DIOS','MANU','HUEPETUHE','-12.9975','-70.5336','17','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170301','MADRE DE DIOS','TAHUAMANU','IÑAPARI','-10.9544','-69.5814','17','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170302','MADRE DE DIOS','TAHUAMANU','IBERIA','-11.4072','-69.4889','17','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('170303','MADRE DE DIOS','TAHUAMANU','TAHUAMANU','-11.455','-69.3214','17','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180101','MOQUEGUA','MARISCAL NIETO','MOQUEGUA','-17.195','-70.9369','18','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180102','MOQUEGUA','MARISCAL NIETO','CARUMAS','-16.8106','-70.6953','18','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180103','MOQUEGUA','MARISCAL NIETO','CUCHUMBAYA','-16.7525','-70.6878','18','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180104','MOQUEGUA','MARISCAL NIETO','SAMEGUA','-17.1797','-70.9008','18','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180105','MOQUEGUA','MARISCAL NIETO','SAN CRISTOBAL','-16.7406','-70.6831','18','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180106','MOQUEGUA','MARISCAL NIETO','TORATA','-17.0767','-70.8442','18','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180201','MOQUEGUA','GENERAL SANCHEZ CERR','OMATE','-16.6739','-70.9719','18','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180202','MOQUEGUA','GENERAL SANCHEZ CERR','CHOJATA','-16.3894','-70.7286','18','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180203','MOQUEGUA','GENERAL SANCHEZ CERR','COALAQUE','-16.6486','-71.0239','18','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180204','MOQUEGUA','GENERAL SANCHEZ CERR','ICHUÑA','-16.1411','-70.5392','18','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180205','MOQUEGUA','GENERAL SANCHEZ CERR','LA CAPILLA','-16.7581','-71.1767','18','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180206','MOQUEGUA','GENERAL SANCHEZ CERR','LLOQUE','-16.3239','-70.7381','18','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180207','MOQUEGUA','GENERAL SANCHEZ CERR','MATALAQUE','-16.4819','-70.8278','18','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180208','MOQUEGUA','GENERAL SANCHEZ CERR','PUQUINA','-16.6211','-71.1842','18','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180209','MOQUEGUA','GENERAL SANCHEZ CERR','QUINISTAQUILLAS','-16.7486','-70.8808','18','02','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180210','MOQUEGUA','GENERAL SANCHEZ CERR','UBINAS','-16.3856','-70.8581','18','02','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180211','MOQUEGUA','GENERAL SANCHEZ CERR','YUNGA','-16.1964','-70.6814','18','02','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180301','MOQUEGUA','ILO','ILO','-17.6444','-71.345','18','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180302','MOQUEGUA','ILO','EL ALGARROBAL','-17.6228','-71.2703','18','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('180303','MOQUEGUA','ILO','PACOCHA','-17.6161','-71.34','18','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190101','PASCO','PASCO','CHAUPIMARCA','-10.6828','-76.2556','19','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190102','PASCO','PASCO','HUACHON','-10.6378','-75.9522','19','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190103','PASCO','PASCO','HUARIACA','-10.4428','-76.1889','19','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190104','PASCO','PASCO','HUAYLLAY','-11.0044','-76.3681','19','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190105','PASCO','PASCO','NINACACA','-10.8617','-76.1131','19','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190106','PASCO','PASCO','PALLANCHACRA','-10.4147','-76.2356','19','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190107','PASCO','PASCO','PAUCARTAMBO','-10.7731','-75.8128','19','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190108','PASCO','PASCO','SAN FRANCISCO DE ASIS DE YARUSYACAN','-10.4914','-76.1964','19','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190109','PASCO','PASCO','SIMON BOLIVAR','-10.6897','-76.3175','19','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190110','PASCO','PASCO','TICLACAYAN','-10.5344','-76.1625','19','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190111','PASCO','PASCO','TINYAHUARCO','-10.7689','-76.2733','19','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190112','PASCO','PASCO','VICCO','-10.8414','-76.2375','19','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190113','PASCO','PASCO','YANACANCHA','-10.6689','-76.2556','19','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190201','PASCO','DANIEL ALCIDES CARRI','YANAHUANCA','-10.4925','-76.5169','19','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190202','PASCO','DANIEL ALCIDES CARRI','CHACAYAN','-10.435','-76.4383','19','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190203','PASCO','DANIEL ALCIDES CARRI','GOYLLARISQUIZGA','-10.4733','-76.4078','19','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190204','PASCO','DANIEL ALCIDES CARRI','PAUCAR','-10.3697','-76.445','19','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190205','PASCO','DANIEL ALCIDES CARRI','SAN PEDRO DE PILLAO','-10.4392','-76.4972','19','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190206','PASCO','DANIEL ALCIDES CARRI','SANTA ANA DE TUSI','-10.4719','-76.3547','19','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190207','PASCO','DANIEL ALCIDES CARRI','TAPUC','-10.4558','-76.4617','19','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190208','PASCO','DANIEL ALCIDES CARRI','VILCABAMBA','-10.4789','-76.4492','19','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190301','PASCO','OXAPAMPA','OXAPAMPA','-10.5728','-75.4039','19','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190302','PASCO','OXAPAMPA','CHONTABAMBA','-10.6044','-75.4633','19','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190303','PASCO','OXAPAMPA','HUANCABAMBA','-10.4261','-75.5131','19','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190304','PASCO','OXAPAMPA','PALCAZU','-10.1878','-75.1458','19','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190305','PASCO','OXAPAMPA','POZUZO','-10.0653','-75.5569','19','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190306','PASCO','OXAPAMPA','PUERTO BERMUDEZ','-10.2964','-74.9358','19','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190307','PASCO','OXAPAMPA','VILLA RICA','-10.7364','-75.2722','19','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('190308','PASCO','OXAPAMPA','CONSTITUCIÓN','-9.8458','-74.9986','19','03','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200101','PIURA','PIURA','PIURA','-5.1942','-80.6289','20','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200104','PIURA','PIURA','CASTILLA','-5.2006','-80.6211','20','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200105','PIURA','PIURA','CATACAOS','-5.2697','-80.6764','20','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200107','PIURA','PIURA','CURA MORI','-5.325','-80.6656','20','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200108','PIURA','PIURA','EL TALLAN','-5.4128','-80.68','20','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200109','PIURA','PIURA','LA ARENA','-5.3464','-80.7108','20','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200110','PIURA','PIURA','LA UNION','-5.4031','-80.7433','20','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200111','PIURA','PIURA','LAS LOMAS','-4.6578','-80.2442','20','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200114','PIURA','PIURA','TAMBO GRANDE','-4.9331','-80.3414','20','01','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200115','PIURA','PIURA','26 DE OCTUBRE','-5.1847','-80.6703','20','01','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200201','PIURA','AYABACA','AYABACA','-4.6392','-79.7161','20','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200202','PIURA','AYABACA','FRIAS','-4.9342','-79.9431','20','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200203','PIURA','AYABACA','JILILI','-4.5839','-79.7989','20','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200204','PIURA','AYABACA','LAGUNAS','-4.79','-79.8456','20','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200205','PIURA','AYABACA','MONTERO','-4.6303','-79.8275','20','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200206','PIURA','AYABACA','PACAIPAMPA','-4.9953','-79.67','20','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200207','PIURA','AYABACA','PAIMAS','-4.6269','-79.9453','20','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200208','PIURA','AYABACA','SAPILLICA','-4.7786','-79.9831','20','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200209','PIURA','AYABACA','SICCHEZ','-4.5703','-79.765','20','02','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200210','PIURA','AYABACA','SUYO','-4.5139','-80.0031','20','02','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200301','PIURA','HUANCABAMBA','HUANCABAMBA','-5.2394','-79.4508','20','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200302','PIURA','HUANCABAMBA','CANCHAQUE','-5.3758','-79.6097','20','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200303','PIURA','HUANCABAMBA','EL CARMEN DE LA FRONTERA','-5.1481','-79.4347','20','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200304','PIURA','HUANCABAMBA','HUARMACA','-5.5683','-79.5247','20','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200305','PIURA','HUANCABAMBA','LALAQUIZ','-5.2128','-79.6783','20','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200306','PIURA','HUANCABAMBA','SAN MIGUEL DE EL FAIQUE','-5.4022','-79.6053','20','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200307','PIURA','HUANCABAMBA','SONDOR','-5.315','-79.4106','20','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200308','PIURA','HUANCABAMBA','SONDORILLO','-5.3394','-79.43','20','03','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200401','PIURA','MORROPON','CHULUCANAS','-5.0969','-80.1642','20','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200402','PIURA','MORROPON','BUENOS AIRES','-5.2678','-79.9708','20','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200403','PIURA','MORROPON','CHALACO','-5.0417','-79.7958','20','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200404','PIURA','MORROPON','LA MATANZA','-5.2114','-80.0906','20','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200405','PIURA','MORROPON','MORROPON','-5.1861','-79.9717','20','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200406','PIURA','MORROPON','SALITRAL','-5.3419','-79.8319','20','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200407','PIURA','MORROPON','SAN JUAN DE BIGOTE','-5.3189','-79.7875','20','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200408','PIURA','MORROPON','SANTA CATALINA DE MOSSA','-5.1031','-79.8872','20','04','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200409','PIURA','MORROPON','SANTO DOMINGO','-5.0292','-79.8756','20','04','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200410','PIURA','MORROPON','YAMANGO','-5.1814','-79.7528','20','04','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200501','PIURA','PAITA','PAITA','-5.0883','-81.1164','20','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200502','PIURA','PAITA','AMOTAPE','-4.8822','-81.0178','20','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200503','PIURA','PAITA','ARENAL','-4.8842','-81.0269','20','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200504','PIURA','PAITA','COLAN','-4.9092','-81.0572','20','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200505','PIURA','PAITA','LA HUACA','-4.9117','-80.9608','20','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200506','PIURA','PAITA','TAMARINDO','-4.8792','-80.9739','20','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200507','PIURA','PAITA','VICHAYAL','-4.8653','-81.0719','20','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200601','PIURA','SULLANA','SULLANA','-4.9044','-80.7047','20','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200602','PIURA','SULLANA','BELLAVISTA','-4.8908','-80.6808','20','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200603','PIURA','SULLANA','IGNACIO ESCUDERO','-4.8458','-80.8747','20','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200604','PIURA','SULLANA','LANCONES','-4.5767','-80.4778','20','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200605','PIURA','SULLANA','MARCAVELICA','-4.8814','-80.7061','20','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200606','PIURA','SULLANA','MIGUEL CHECA','-4.9025','-80.8169','20','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200607','PIURA','SULLANA','QUERECOTILLO','-4.84','-80.6519','20','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200608','PIURA','SULLANA','SALITRAL','-4.8583','-80.6794','20','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200701','PIURA','TALARA','PARIÑAS','-4.5811','-81.2747','20','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200702','PIURA','TALARA','EL ALTO','-4.2697','-81.2239','20','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200703','PIURA','TALARA','LA BREA','-4.6564','-81.3069','20','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200704','PIURA','TALARA','LOBITOS','-4.4531','-81.2783','20','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200705','PIURA','TALARA','LOS ORGANOS','-4.1789','-81.1322','20','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200706','PIURA','TALARA','MANCORA','-4.1083','-81.0556','20','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200801','PIURA','SECHURA','SECHURA','-5.5567','-80.8217','20','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200802','PIURA','SECHURA','BELLAVISTA DE LA UNION','-5.4394','-80.7547','20','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200803','PIURA','SECHURA','BERNAL','-5.4608','-80.7422','20','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200804','PIURA','SECHURA','CRISTO NOS VALGA','-5.4939','-80.7414','20','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200805','PIURA','SECHURA','VICE','-5.4231','-80.7767','20','08','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('200806','PIURA','SECHURA','RINCONADA LLICUAR','-5.4572','-80.7614','20','08','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210101','PUNO','PUNO','PUNO','-15.8406','-70.0278','21','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210102','PUNO','PUNO','ACORA','-15.9736','-69.7978','21','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210103','PUNO','PUNO','AMANTANI','-15.6572','-69.7194','21','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210104','PUNO','PUNO','ATUNCOLLA','-15.6878','-70.1436','21','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210105','PUNO','PUNO','CAPACHICA','-15.6431','-69.8303','21','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210106','PUNO','PUNO','CHUCUITO','-15.8947','-69.8922','21','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210107','PUNO','PUNO','COATA','-15.5711','-69.9503','21','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210108','PUNO','PUNO','HUATA','-15.6144','-69.9722','21','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210109','PUNO','PUNO','MAÑAZO','-15.7992','-70.3458','21','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210110','PUNO','PUNO','PAUCARCOLLA','-15.7461','-70.0556','21','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210111','PUNO','PUNO','PICHACANI','-16.1508','-70.0642','21','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210112','PUNO','PUNO','PLATERIA','-15.9475','-69.8356','21','01','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210113','PUNO','PUNO','SAN ANTONIO','-16.1414','-70.3458','21','01','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210114','PUNO','PUNO','TIQUILLACA','-15.7978','-70.1872','21','01','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210115','PUNO','PUNO','VILQUE','-15.7661','-70.2594','21','01','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210201','PUNO','AZANGARO','AZANGARO','-14.9083','-70.1969','21','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210202','PUNO','AZANGARO','ACHAYA','-15.2847','-70.1608','21','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210203','PUNO','AZANGARO','ARAPA','-15.1411','-70.1117','21','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210204','PUNO','AZANGARO','ASILLO','-14.7864','-70.3544','21','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210205','PUNO','AZANGARO','CAMINACA','-15.3239','-70.0747','21','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210206','PUNO','AZANGARO','CHUPA','-15.1069','-69.9861','21','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210207','PUNO','AZANGARO','JOSE DOMINGO CHOQUEHUANCA','-15.0336','-70.3381','21','02','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210208','PUNO','AZANGARO','MUÑANI','-14.7689','-69.9528','21','02','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210209','PUNO','AZANGARO','POTONI','-14.3944','-70.1136','21','02','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210210','PUNO','AZANGARO','SAMAN','-15.2917','-70.0169','21','02','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210211','PUNO','AZANGARO','SAN ANTON','-14.5922','-70.3125','21','02','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210212','PUNO','AZANGARO','SAN JOSE','-14.6817','-70.1606','21','02','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210213','PUNO','AZANGARO','SAN JUAN DE SALINAS','-14.9911','-70.1056','21','02','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210214','PUNO','AZANGARO','SANTIAGO DE PUPUJA','-15.0547','-70.2792','21','02','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210215','PUNO','AZANGARO','TIRAPATA','-14.9544','-70.4028','21','02','15');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210301','PUNO','CARABAYA','MACUSANI','-14.0686','-70.4308','21','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210302','PUNO','CARABAYA','AJOYANI','-14.2294','-70.2264','21','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210303','PUNO','CARABAYA','AYAPATA','-13.7781','-70.325','21','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210304','PUNO','CARABAYA','COASA','-13.9853','-70.0197','21','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210305','PUNO','CARABAYA','CORANI','-13.8686','-70.6042','21','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210306','PUNO','CARABAYA','CRUCERO','-14.3619','-70.025','21','03','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210307','PUNO','CARABAYA','ITUATA','-13.8761','-70.2178','21','03','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210308','PUNO','CARABAYA','OLLACHEA','-13.7944','-70.4756','21','03','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210309','PUNO','CARABAYA','SAN GABAN','-13.4333','-70.3889','21','03','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210310','PUNO','CARABAYA','USICAYOS','-14.1256','-69.9672','21','03','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210401','PUNO','CHUCUITO','JULI','-16.215','-69.4619','21','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210402','PUNO','CHUCUITO','DESAGUADERO','-16.5653','-69.0433','21','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210403','PUNO','CHUCUITO','HUACULLANI','-16.6292','-69.325','21','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210404','PUNO','CHUCUITO','KELLUYO','-16.7208','-69.2492','21','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210405','PUNO','CHUCUITO','PISACOMA','-16.9092','-69.3736','21','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210406','PUNO','CHUCUITO','POMATA','-16.2728','-69.2933','21','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210407','PUNO','CHUCUITO','ZEPITA','-16.4964','-69.105','21','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210501','PUNO','EL COLLAO','ILAVE','-16.0867','-69.6386','21','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210502','PUNO','EL COLLAO','CAPAZO','-17.1828','-69.7439','21','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210503','PUNO','EL COLLAO','PILCUYO','-16.11','-69.5547','21','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210504','PUNO','EL COLLAO','SANTA ROSA','-16.7414','-69.7175','21','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210505','PUNO','EL COLLAO','CONDURIRI','-16.6156','-69.7025','21','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210601','PUNO','HUANCANE','HUANCANE','-15.2017','-69.7614','21','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210602','PUNO','HUANCANE','COJATA','-15.0161','-69.3647','21','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210603','PUNO','HUANCANE','HUATASANI','-15.0589','-69.8042','21','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210604','PUNO','HUANCANE','INCHUPALLA','-15.0089','-69.6822','21','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210605','PUNO','HUANCANE','PUSI','-15.4419','-69.9294','21','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210606','PUNO','HUANCANE','ROSASPATA','-15.2347','-69.5303','21','06','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210607','PUNO','HUANCANE','TARACO','-15.2978','-69.9792','21','06','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210608','PUNO','HUANCANE','VILQUE CHICO','-15.2144','-69.6886','21','06','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210701','PUNO','LAMPA','LAMPA','-15.3636','-70.3653','21','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210702','PUNO','LAMPA','CABANILLA','-15.6194','-70.3489','21','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210703','PUNO','LAMPA','CALAPUJA','-15.31','-70.2217','21','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210704','PUNO','LAMPA','NICASIO','-15.2361','-70.2622','21','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210705','PUNO','LAMPA','OCUVIRI','-15.1128','-70.9117','21','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210706','PUNO','LAMPA','PALCA','-15.235','-70.5992','21','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210707','PUNO','LAMPA','PARATIA','-15.4539','-70.6008','21','07','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210708','PUNO','LAMPA','PUCARA','-15.0419','-70.3689','21','07','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210709','PUNO','LAMPA','SANTA LUCIA','-15.6986','-70.6061','21','07','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210710','PUNO','LAMPA','VILAVILA','-15.1883','-70.6606','21','07','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210801','PUNO','MELGAR','AYAVIRI','-14.8811','-70.5897','21','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210802','PUNO','MELGAR','ANTAUTA','-14.3','-70.295','21','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210803','PUNO','MELGAR','CUPI','-14.9058','-70.8683','21','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210804','PUNO','MELGAR','LLALLI','-14.9339','-70.8792','21','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210805','PUNO','MELGAR','MACARI','-14.7706','-70.9033','21','08','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210806','PUNO','MELGAR','NUÑOA','-14.4767','-70.6372','21','08','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210807','PUNO','MELGAR','ORURILLO','-14.7261','-70.5133','21','08','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210808','PUNO','MELGAR','SANTA ROSA','-14.6072','-70.7872','21','08','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210809','PUNO','MELGAR','UMACHIRI','-14.8497','-70.7494','21','08','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210901','PUNO','MOHO','MOHO','-15.36','-69.5','21','09','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210902','PUNO','MOHO','CONIMA','-15.4572','-69.4375','21','09','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210903','PUNO','MOHO','HUAYRAPATA','-15.3211','-69.3494','21','09','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('210904','PUNO','MOHO','TILALI','-15.5192','-69.3456','21','09','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211001','PUNO','SAN ANTONIO DE PUTIN','PUTINA','-14.9003','-69.8619','21','10','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211002','PUNO','SAN ANTONIO DE PUTIN','ANANEA','-14.6786','-69.5333','21','10','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211003','PUNO','SAN ANTONIO DE PUTIN','PEDRO VILCA APAZA','-15.0592','-69.8897','21','10','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211004','PUNO','SAN ANTONIO DE PUTIN','QUILCAPUNCU','-14.8964','-69.7344','21','10','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211005','PUNO','SAN ANTONIO DE PUTIN','SINA','-14.49','-69.2817','21','10','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211101','PUNO','SAN ROMAN','JULIACA','-15.4939','-70.1356','21','11','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211102','PUNO','SAN ROMAN','CABANA','-15.65','-70.3211','21','11','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211103','PUNO','SAN ROMAN','CABANILLAS','-15.6425','-70.3503','21','11','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211104','PUNO','SAN ROMAN','CARACOTO','-15.5683','-70.1022','21','11','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211105','PUNO','SAN ROMAN','SAN MIGUEL','-15.4097','-70.0958','21','11','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211201','PUNO','SANDIA','SANDIA','-14.3231','-69.4667','21','12','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211202','PUNO','SANDIA','CUYOCUYO','-14.4717','-69.54','21','12','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211203','PUNO','SANDIA','LIMBANI','-14.1458','-69.6897','21','12','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211204','PUNO','SANDIA','PATAMBUCO','-14.3594','-69.6222','21','12','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211205','PUNO','SANDIA','PHARA','-14.1511','-69.6642','21','12','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211206','PUNO','SANDIA','QUIACA','-14.4253','-69.3417','21','12','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211207','PUNO','SANDIA','SAN JUAN DEL ORO','-14.2211','-69.1528','21','12','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211208','PUNO','SANDIA','YANAHUAYA','-14.2822','-69.1844','21','12','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211209','PUNO','SANDIA','ALTO INAMBARI','-14.0897','-69.2442','21','12','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211210','PUNO','SANDIA','SAN PEDRO DE PUTINA PUNCO','-14.1119','-69.0467','21','12','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211301','PUNO','YUNGUYO','YUNGUYO','-16.2469','-69.095','21','13','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211302','PUNO','YUNGUYO','ANAPIA','-16.3133','-68.8539','21','13','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211303','PUNO','YUNGUYO','COPANI','-16.3989','-69.0439','21','13','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211304','PUNO','YUNGUYO','CUTURAPI','-16.2706','-69.1781','21','13','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211305','PUNO','YUNGUYO','OLLARAYA','-16.2308','-68.9981','21','13','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211306','PUNO','YUNGUYO','TINICACHI','-16.1967','-68.9603','21','13','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('211307','PUNO','YUNGUYO','UNICACHI','-16.2239','-68.9761','21','13','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220101','SAN MARTIN','MOYOBAMBA','MOYOBAMBA','-6.0283','-76.9719','22','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220102','SAN MARTIN','MOYOBAMBA','CALZADA','-6.0319','-77.0675','22','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220103','SAN MARTIN','MOYOBAMBA','HABANA','-6.0808','-77.0928','22','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220104','SAN MARTIN','MOYOBAMBA','JEPELACIO','-6.1081','-76.9161','22','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220105','SAN MARTIN','MOYOBAMBA','SORITOR','-6.1408','-77.105','22','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220106','SAN MARTIN','MOYOBAMBA','YANTALO','-5.9747','-77.0225','22','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220201','SAN MARTIN','BELLAVISTA','BELLAVISTA','-7.0653','-76.5883','22','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220202','SAN MARTIN','BELLAVISTA','ALTO BIAVO','-7.2936','-76.4544','22','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220203','SAN MARTIN','BELLAVISTA','BAJO BIAVO','-7.1011','-76.4867','22','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220204','SAN MARTIN','BELLAVISTA','HUALLAGA','-7.1292','-76.6489','22','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220205','SAN MARTIN','BELLAVISTA','SAN PABLO','-6.8081','-76.5731','22','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220206','SAN MARTIN','BELLAVISTA','SAN RAFAEL','-7.0308','-76.4764','22','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220301','SAN MARTIN','EL DORADO','SAN JOSE DE SISA','-6.6136','-76.6931','22','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220302','SAN MARTIN','EL DORADO','AGUA BLANCA','-6.7289','-76.6975','22','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220303','SAN MARTIN','EL DORADO','SAN MARTIN','-6.5147','-76.7425','22','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220304','SAN MARTIN','EL DORADO','SANTA ROSA','-6.7456','-76.6264','22','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220305','SAN MARTIN','EL DORADO','SHATOJA','-6.5283','-76.7211','22','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220401','SAN MARTIN','HUALLAGA','SAPOSOA','-6.9339','-76.7733','22','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220402','SAN MARTIN','HUALLAGA','ALTO SAPOSOA','-6.7658','-76.8139','22','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220403','SAN MARTIN','HUALLAGA','EL ESLABON','-7.0031','-76.7436','22','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220404','SAN MARTIN','HUALLAGA','PISCOYACU','-6.9831','-76.7647','22','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220405','SAN MARTIN','HUALLAGA','SACANCHE','-7.07','-76.7136','22','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220406','SAN MARTIN','HUALLAGA','TINGO DE SAPOSOA','-7.0936','-76.6417','22','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220501','SAN MARTIN','LAMAS','LAMAS','-6.4217','-76.5211','22','05','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220502','SAN MARTIN','LAMAS','ALONSO DE ALVARADO','-6.35','-76.77','22','05','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220503','SAN MARTIN','LAMAS','BARRANQUITA','-6.2517','-76.0331','22','05','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220504','SAN MARTIN','LAMAS','CAYNARACHI','-6.3306','-76.2836','22','05','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220505','SAN MARTIN','LAMAS','CUÑUMBUQUI','-6.5089','-76.4803','22','05','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220506','SAN MARTIN','LAMAS','PINTO RECODO','-6.3794','-76.6033','22','05','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220507','SAN MARTIN','LAMAS','RUMISAPA','-6.4486','-76.4722','22','05','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220508','SAN MARTIN','LAMAS','SAN ROQUE DE CUMBAZA','-6.3864','-76.4419','22','05','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220509','SAN MARTIN','LAMAS','SHANAO','-6.41','-76.5939','22','05','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220510','SAN MARTIN','LAMAS','TABALOSOS','-6.3856','-76.6333','22','05','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220511','SAN MARTIN','LAMAS','ZAPATERO','-6.5308','-76.4911','22','05','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220601','SAN MARTIN','MARISCAL CACERES','JUANJUI','-7.1819','-76.7317','22','06','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220602','SAN MARTIN','MARISCAL CACERES','CAMPANILLA','-7.4814','-76.6528','22','06','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220603','SAN MARTIN','MARISCAL CACERES','HUICUNGO','-7.3272','-76.7783','22','06','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220604','SAN MARTIN','MARISCAL CACERES','PACHIZA','-7.2975','-76.7739','22','06','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220605','SAN MARTIN','MARISCAL CACERES','PAJARILLO','-7.1789','-76.6881','22','06','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220701','SAN MARTIN','PICOTA','PICOTA','-6.9194','-76.3317','22','07','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220702','SAN MARTIN','PICOTA','BUENOS AIRES','-6.7939','-76.3269','22','07','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220703','SAN MARTIN','PICOTA','CASPISAPA','-6.9589','-76.4189','22','07','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220704','SAN MARTIN','PICOTA','PILLUANA','-6.7781','-76.2931','22','07','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220705','SAN MARTIN','PICOTA','PUCACACA','-6.8506','-76.3417','22','07','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220706','SAN MARTIN','PICOTA','SAN CRISTOBAL','-6.9925','-76.4186','22','07','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220707','SAN MARTIN','PICOTA','SAN HILARION','-7.0022','-76.4428','22','07','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220708','SAN MARTIN','PICOTA','SHAMBOYACU','-7.0425','-76.1119','22','07','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220709','SAN MARTIN','PICOTA','TINGO DE PONASA','-6.9356','-76.2511','22','07','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220710','SAN MARTIN','PICOTA','TRES UNIDOS','-6.8064','-76.2311','22','07','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220801','SAN MARTIN','RIOJA','RIOJA','-6.0589','-77.1669','22','08','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220802','SAN MARTIN','RIOJA','AWAJUN','-5.8139','-77.3822','22','08','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220803','SAN MARTIN','RIOJA','ELIAS SOPLIN VARGAS','-5.9908','-77.2781','22','08','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220804','SAN MARTIN','RIOJA','NUEVA CAJAMARCA','-5.94','-77.3083','22','08','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220805','SAN MARTIN','RIOJA','PARDO MIGUEL','-5.7381','-77.5025','22','08','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220806','SAN MARTIN','RIOJA','POSIC','-6.0139','-77.1636','22','08','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220807','SAN MARTIN','RIOJA','SAN FERNANDO','-5.9019','-77.27','22','08','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220808','SAN MARTIN','RIOJA','YORONGOS','-6.1356','-77.1447','22','08','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220809','SAN MARTIN','RIOJA','YURACYACU','-5.9278','-77.2269','22','08','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220901','SAN MARTIN','SAN MARTIN','TARAPOTO','-6.4969','-76.3664','22','09','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220902','SAN MARTIN','SAN MARTIN','ALBERTO LEVEAU','-6.6633','-76.2878','22','09','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220903','SAN MARTIN','SAN MARTIN','CACATACHI','-6.4619','-76.4514','22','09','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220904','SAN MARTIN','SAN MARTIN','CHAZUTA','-6.5739','-76.0931','22','09','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220905','SAN MARTIN','SAN MARTIN','CHIPURANA','-6.3539','-75.7411','22','09','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220906','SAN MARTIN','SAN MARTIN','EL PORVENIR','-6.215','-75.7867','22','09','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220907','SAN MARTIN','SAN MARTIN','HUIMBAYOC','-6.4167','-75.7658','22','09','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220908','SAN MARTIN','SAN MARTIN','JUAN GUERRA','-6.5833','-76.3336','22','09','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220909','SAN MARTIN','SAN MARTIN','LA BANDA DE SHILCAYO','-6.5033','-76.3514','22','09','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220910','SAN MARTIN','SAN MARTIN','MORALES','-6.4797','-76.3828','22','09','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220911','SAN MARTIN','SAN MARTIN','PAPAPLAYA','-6.245','-75.7903','22','09','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220912','SAN MARTIN','SAN MARTIN','SAN ANTONIO','-6.42','-76.4044','22','09','12');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220913','SAN MARTIN','SAN MARTIN','SAUCE','-6.6914','-76.2183','22','09','13');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('220914','SAN MARTIN','SAN MARTIN','SHAPAJA','-6.58','-76.2653','22','09','14');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('221001','SAN MARTIN','TOCACHE','TOCACHE','-8.1883','-76.5153','22','10','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('221002','SAN MARTIN','TOCACHE','NUEVO PROGRESO','-8.45','-76.3253','22','10','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('221003','SAN MARTIN','TOCACHE','POLVORA','-7.9075','-76.6706','22','10','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('221004','SAN MARTIN','TOCACHE','SHUNTE','-8.35','-76.7231','22','10','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('221005','SAN MARTIN','TOCACHE','UCHIZA','-8.4558','-76.46','22','10','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230101','TACNA','TACNA','TACNA','-18.01','-70.2478','23','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230102','TACNA','TACNA','ALTO DE LA ALIANZA','-17.9908','-70.2475','23','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230103','TACNA','TACNA','CALANA','-17.9406','-70.1825','23','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230104','TACNA','TACNA','CIUDAD NUEVA','-17.985','-70.2378','23','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230105','TACNA','TACNA','INCLAN','-17.795','-70.4919','23','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230106','TACNA','TACNA','PACHIA','-17.8972','-70.1528','23','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230107','TACNA','TACNA','PALCA','-17.7733','-69.9583','23','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230108','TACNA','TACNA','POCOLLAY','-17.9964','-70.2197','23','01','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230109','TACNA','TACNA','SAMA','-17.8586','-70.5731','23','01','09');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230110','TACNA','TACNA','CORONEL GREGORIO ALBARRACIN LANCHIPA','-18.0408','-70.2542','23','01','10');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230111','TACNA','TACNA','LA YARADA-LOS PALOS','-18.2292','-70.4769','23','01','11');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230201','TACNA','CANDARAVE','CANDARAVE','-17.2669','-70.2497','23','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230202','TACNA','CANDARAVE','CAIRANI','-17.2861','-70.3628','23','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230203','TACNA','CANDARAVE','CAMILACA','-17.2669','-70.3833','23','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230204','TACNA','CANDARAVE','CURIBAYA','-17.3822','-70.3353','23','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230205','TACNA','CANDARAVE','HUANUARA','-17.3133','-70.3217','23','02','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230206','TACNA','CANDARAVE','QUILAHUANI','-17.3175','-70.2583','23','02','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230301','TACNA','JORGE BASADRE','LOCUMBA','-17.6133','-70.7611','23','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230302','TACNA','JORGE BASADRE','ILABAYA','-17.4214','-70.5122','23','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230303','TACNA','JORGE BASADRE','ITE','-17.8617','-70.965','23','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230401','TACNA','TARATA','TARATA','-17.4772','-70.0306','23','04','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230402','TACNA','TARATA','HEROES ALBARRACIN','-17.4817','-70.1211','23','04','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230403','TACNA','TARATA','ESTIQUE','-17.5428','-70.0206','23','04','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230404','TACNA','TARATA','ESTIQUE-PAMPA','-17.5372','-70.0344','23','04','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230405','TACNA','TARATA','SITAJARA','-17.3747','-70.1342','23','04','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230406','TACNA','TARATA','SUSAPAYA','-17.3528','-70.1311','23','04','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230407','TACNA','TARATA','TARUCACHI','-17.5253','-70.0292','23','04','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('230408','TACNA','TARATA','TICACO','-17.4506','-70.0456','23','04','08');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240101','TUMBES','TUMBES','TUMBES','-3.5647','-80.4536','24','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240102','TUMBES','TUMBES','CORRALES','-3.6022','-80.4797','24','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240103','TUMBES','TUMBES','LA CRUZ','-3.6378','-80.5925','24','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240104','TUMBES','TUMBES','PAMPAS DE HOSPITAL','-3.6956','-80.4358','24','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240105','TUMBES','TUMBES','SAN JACINTO','-3.6431','-80.4511','24','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240106','TUMBES','TUMBES','SAN JUAN DE LA VIRGEN','-3.6275','-80.4336','24','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240201','TUMBES','CONTRALMIRANTE VILLA','ZORRITOS','-3.6806','-80.6783','24','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240202','TUMBES','CONTRALMIRANTE VILLA','CASITAS','-3.9406','-80.6519','24','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240203','TUMBES','CONTRALMIRANTE VILLA','CANOAS DE PUNTA SAL','-3.9467','-80.9428','24','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240301','TUMBES','ZARUMILLA','ZARUMILLA','-3.5011','-80.275','24','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240302','TUMBES','ZARUMILLA','AGUAS VERDES','-3.4814','-80.2461','24','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240303','TUMBES','ZARUMILLA','MATAPALO','-3.6839','-80.1997','24','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('240304','TUMBES','ZARUMILLA','PAPAYAL','-3.5736','-80.2333','24','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250101','UCAYALI','CORONEL PORTILLO','CALLERIA','-8.3828','-74.5322','25','01','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250102','UCAYALI','CORONEL PORTILLO','CAMPOVERDE','-8.4761','-74.8072','25','01','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250103','UCAYALI','CORONEL PORTILLO','IPARIA','-9.3064','-74.4378','25','01','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250104','UCAYALI','CORONEL PORTILLO','MASISEA','-8.6025','-74.3097','25','01','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250105','UCAYALI','CORONEL PORTILLO','YARINACOCHA','-8.355','-74.5769','25','01','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250106','UCAYALI','CORONEL PORTILLO','NUEVA REQUENA','-8.3061','-74.8653','25','01','06');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250107','UCAYALI','CORONEL PORTILLO','MANANTAY','-8.3981','-74.5378','25','01','07');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250201','UCAYALI','ATALAYA','RAYMONDI','-10.7278','-73.7592','25','02','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250202','UCAYALI','ATALAYA','SEPAHUA','-11.1464','-73.0475','25','02','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250203','UCAYALI','ATALAYA','TAHUANIA','-10.1033','-73.9808','25','02','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250204','UCAYALI','ATALAYA','YURUA','-9.5281','-72.7622','25','02','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250301','UCAYALI','PADRE ABAD','PADRE ABAD','-9.0375','-75.5128','25','03','01');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250302','UCAYALI','PADRE ABAD','IRAZOLA','-8.8289','-75.2139','25','03','02');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250303','UCAYALI','PADRE ABAD','CURIMANA','-8.4353','-75.1597','25','03','03');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250304','UCAYALI','PADRE ABAD','NESHUYA','-8.6392','-74.9644','25','03','04');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250305','UCAYALI','PADRE ABAD','ALEXANDER VON HUMBOLDT','-8.8264','-75.0522','25','03','05');
INSERT INTO ubigeo(ubigeo,departamento,provincia,distrito,latitud,longitud,cod_dep,cod_pro,cod_dis) VALUES('250401','UCAYALI','PURUS','PURUS','-9.7703','-70.7122','25','04','01');

CREATE VIEW lista_ubigeo
As
Select ubigeo,departamento,provincia,distrito,CONCAT_WS(' - ',departamento,provincia,distrito)  As 'descripcion',latitud, longitud From ubigeo;



CREATE TABLE anio  (
idanio smallint(4) NOT NULL AUTO_INCREMENT,
anio smallint(4) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idanio)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

INSERT INTO anio (anio) VALUES(2022);
INSERT INTO anio (anio) VALUES(2023);

CREATE TABLE mes  (
idmes smallint(4) NOT NULL AUTO_INCREMENT,
mes varchar(15) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idmes)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

INSERT INTO mes (mes) VALUES('ENERO');
INSERT INTO mes (mes) VALUES('FEBRERO');
INSERT INTO mes (mes) VALUES('MARZO');
INSERT INTO mes (mes) VALUES('ABRIL');
INSERT INTO mes (mes) VALUES('MAYO');
INSERT INTO mes (mes) VALUES('JUNIO');
INSERT INTO mes (mes) VALUES('JULIO');
INSERT INTO mes (mes) VALUES('AGOSTO');
INSERT INTO mes (mes) VALUES('SEPTIEMBRE');
INSERT INTO mes (mes) VALUES('OCTUBRE');
INSERT INTO mes (mes) VALUES('NOVIEMBRE');
INSERT INTO mes (mes) VALUES('DICIEMBRE');

CREATE TABLE perfil  (
idperfil smallint(4) NOT NULL AUTO_INCREMENT,
perfil varchar(50) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idperfil)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into perfil (perfil) values('ADMINISTRADOR');
insert into perfil (perfil) values('ESTANDAR');

create table tipo_documento(
idtipodocumento smallint(4) NOT NULL AUTO_INCREMENT,
codigo_curl varchar(2) NOT NULL,
codigo_sunat varchar(1) NOT NULL,
tipo_documento varchar(20) NOT NULL,
longitud smallint(4) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY(idtipodocumento)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

INSERT INTO tipo_documento(idtipodocumento,codigo_curl,codigo_sunat,tipo_documento,longitud) VALUES(1,'01','1','D.N.I.',8);
INSERT INTO tipo_documento(idtipodocumento,codigo_curl,codigo_sunat,tipo_documento,longitud) VALUES(2,'03','4','CARNET ETX.',9);

CREATE TABLE usuarios  (
  idusuario smallint(4) NOT NULL AUTO_INCREMENT,
  idtipodocumento smallint(4) NOT NULL,
  numero_documento varchar(10) NOT NULL,
  avatar varchar(30),
  apellidos varchar(50) NOT NULL,
  nombres varchar(50) NOT NULL,
  usuario varchar(50) NOT NULL,
  passwd varchar(50) NOT NULL,
  idperfil smallint(4) NOT NULL,
  activo char(1) DEFAULT '1',
  PRIMARY KEY (idusuario),
  FOREIGN KEY (idperfil) REFERENCES perfil (idperfil) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (idtipodocumento) REFERENCES tipo_documento (idtipodocumento) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

INSERT INTO usuarios (idusuario,idtipodocumento,numero_documento,avatar,apellidos,nombres,usuario,passwd,idperfil) VALUES (1,1,'42545573', '000120190310064855.png', 'ARAUJO CUADROS', 'KLAUS JOSEPH', 'admin', 'e4619e8fb50a0aa59ad1b92364f127afad06afe1',1);
INSERT INTO usuarios (idusuario,idtipodocumento,numero_documento,avatar,apellidos,nombres,usuario,passwd,idperfil) VALUES (2,1,'42253941', '000120190310064855.png', 'TABOADA MARTINEZ', 'SILVIA LETICIA', 'staboada', 'e4619e8fb50a0aa59ad1b92364f127afad06afe1',2);

CREATE TABLE modulo  (
  idmodulo smallint(4) NOT NULL AUTO_INCREMENT,
  descripcion varchar(200) NOT NULL,
  menu varchar(30) NOT NULL,
  icono varchar(25) NOT NULL,
  url varchar(25) NOT NULL,
  imagen char(1) NOT NULL,
  mini varchar(30) NOT NULL,
  orden smallint(4) NOT NULL,
  PRIMARY KEY (idmodulo)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;
	
	INSERT INTO modulo (idmodulo,descripcion,menu,icono,url,imagen,mini,orden) VALUES (1,'Módulo de Registro de Proveedores y Transacciones','Módulo Proveedores','proveedores.png','proveedores','1','fa fa-bar-chart',1);
	INSERT INTO modulo (idmodulo,descripcion,menu,icono,url,imagen,mini,orden) VALUES (2,'Módulo de Registro de Movimientos de Caja','Módulo Caja','servicios.png','servicios','1','fa fa-money',2);
	INSERT INTO modulo (idmodulo,descripcion,menu,icono,url,imagen,mini,orden) VALUES (3,'Módulo de Registro de Certificaciones','Módulo Certificaciones','utilitarios.png','certificaciones','1','fa fa-cog',3);
	INSERT INTO modulo (idmodulo,descripcion,menu,icono,url,imagen,mini,orden) VALUES (4,'Módulo de Registro de Usuarios y Accesos Personalizados','Módulo Usuarios','usuarios.png','usuarios','1','fa fa-users',4);
	
CREATE TABLE modulo_rol  (	
	idmodulorol smallint(4) NOT NULL AUTO_INCREMENT,
	idmodulo smallint(4) NOT NULL,
	idperfil smallint(4) NOT NULL,
	activo char(1) DEFAULT '1',
	PRIMARY KEY (idmodulorol),
	FOREIGN KEY (idmodulo) REFERENCES modulo (idmodulo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idperfil) REFERENCES perfil (idperfil) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;
	/*Administrador*/
	INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(1,1,'1');
	INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(2,1,'1');
	INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(3,1,'1');
	INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(4,1,'1');
		
	/*Estandar*/
	INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(1,2,'1');
	INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(2,2,'1');
	INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(3,2,'1');
	INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(4,2,'0');

CREATE TABLE permiso  (
  idpermiso smallint(4) NOT NULL AUTO_INCREMENT,
  descripcion varchar(50) NOT NULL,
  tipo char(1) NOT NULL,
  orden smallint(4) NOT NULL,
  activo char(1) DEFAULT '1',
  idmodulo smallint(4) NOT NULL,
  PRIMARY KEY (idpermiso),
	FOREIGN KEY (idmodulo) REFERENCES modulo (idmodulo) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(1,'Editar Proveedor','1',1,1);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(2,'Movimientos Proveedor','1',2,1);
	
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(3,'Anular Operación','1',3,1);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(4,'Editar Guia Ingreso','1',4,1);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(5,'Anular Guia Ingreso','1',5,1);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(6,'Ver Guia Ingreso (PDF)','1',6,1);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(7,'Ver Comprobante (PDF)','1',7,1);
	
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(8,'Anular Valorización','1',8,1);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(9,'Ver Valorización','1',9,1);
	
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(10,'Editar Usuario','1',10,4);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(11,'Asignar Sucursales','1',11,4);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(12,'Asignar Permisos','1',12,4);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(13,'Resetar Clave','1',13,4);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(14,'Activar/Desactivar','1',14,4);

	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(15,'Editar Certificado','1',15,3);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(16,'Asignar Parámetros','1',16,3);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(17,'Anular Certificado','1',17,3);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(18,'Emitir PDF','1',18,3);
	
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(19,'Editar Movimiento','1',19,2);
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(20,'Anular Movimiento','1',20,2);

CREATE TABLE menu  (
  idmenu smallint(4) NOT NULL AUTO_INCREMENT,
  idmodulo smallint(4) NOT NULL,
  descripcion varchar(100) NOT NULL,
  nivel char(1) NOT NULL,
  url varchar(30) NOT NULL,
  icono varchar(30) NOT NULL,
  activo char(1) DEFAULT '1',
  PRIMARY KEY (idmenu),
	FOREIGN KEY (idmodulo) REFERENCES modulo (idmodulo) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;
	/*Menus del Módulo de Proveedores*/
	INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(1,1,'Lista Proveedores','0','proveedores','fa fa-bar-chart');
	INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(2,1,'Nuevo Registro','0','nuevoproveedor','fa fa-address-card-o');
	INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(3,1,'Gestor de Reportes','1','#','fa fa-table');
	/*Menus del Módulo de Usuarios*/
	INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(4,4,'Lista Usuarios','0','usuarios','fa fa-list');
	INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(5,4,'Nuevo Registro','0','nuevousuario','fa fa-pencil-square-o');
	/*Menus del Módulo de Cajas*/
	INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(6,2,'Lista Movimientos','0','cajas','fa fa-list');
	INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(7,2,'Nuevo Registro','0','nuevacaja','fa fa-pencil-square-o');
	
	/*Menus del Módulo de Certificaciones*/
	INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(8,3,'Lista Certificados','0','certificaciones','fa fa-list');
	INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(9,3,'Nuevo Registro','0','nuevacertificacion','fa fa-pencil-square-o');
	

CREATE TABLE menu_detalle  (
  idmenudetalle smallint(4) NOT NULL AUTO_INCREMENT,
  idmenu smallint(4) NOT NULL,
  descripcion varchar(100) NOT NULL,
  url varchar(50) NOT NULL,
  icono varchar(25) NOT NULL,
  orden int(1) NOT NULL,
  activo char(1) DEFAULT '1',
  PRIMARY KEY (idmenudetalle),
	FOREIGN KEY (idmenu) REFERENCES menu (idmenu) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

	/*SubMenus del Módulo de Proveedores*/
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(1,3,'Movimientos Proveedores','#','fa fa-th-list',1);
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(2,3,'Movimientos Caja','#','fa fa-newspaper-o',2);
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(3,3,'Productos Valorizados','#','fa fa-newspaper-o',3);
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(4,3,'Productos no Valorizados','#','fa fa-newspaper-o',4);
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(5,3,'Reporte Deudores','#','fa fa-newspaper-o',5);
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(6,3,'Reporte Deudas','#','fa fa-newspaper-o',6);
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(7,3,'Reporte Gastos','#','fa fa-newspaper-o',7);
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(8,3,'Reporte Salidas','#','fa fa-newspaper-o',8);
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(9,3,'Operaciones Usuarios','#','fa fa-newspaper-o',9);
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(10,3,'Reporte Transacciones','#','fa fa-newspaper-o',10);

CREATE TABLE permisos_menu  (
  idpermisosmenu smallint(4) NOT NULL AUTO_INCREMENT,
  idmenu smallint(4) NOT NULL,
  idusuario smallint(4) NOT NULL,
  activo char(1) DEFAULT '1',
  PRIMARY KEY (idpermisosmenu),
	FOREIGN KEY (idmenu) REFERENCES menu (idmenu) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (idusuario) REFERENCES usuarios (idusuario) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;
	
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(1,1,1);
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(2,2,1);
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(3,3,1);
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(4,4,1);
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(5,5,1);
	
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(9,6,1);
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(10,7,1);
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(11,8,1);
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(12,9,1);

	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(6,1,2);
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(7,2,2);
	INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(8,3,2);

CREATE TABLE permisos_menu_detalle  (
  idpermisosmenudetalle smallint(4) NOT NULL AUTO_INCREMENT,
  idmenudetalle smallint(4) NOT NULL,
  idusuario smallint(4) NOT NULL,
  activo char(1) DEFAULT '1',
  PRIMARY KEY (idpermisosmenudetalle),
	FOREIGN KEY (idmenudetalle) REFERENCES menu_detalle (idmenudetalle) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (idusuario) REFERENCES usuarios (idusuario) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;
	
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (1,1,1);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (2,2,1);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (3,3,1);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (4,4,1);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (5,5,1);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (6,6,1);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (7,7,1);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (8,8,1);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (9,9,1);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (10,10,1);

	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (11,1,2);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (12,2,2);

CREATE TABLE permisos_opcion  (
  idpermisoopcion smallint(4) NOT NULL AUTO_INCREMENT,
  idpermiso smallint(4) NOT NULL,
  idusuario smallint(4) NOT NULL,
  activo char(1) DEFAULT '1',
  PRIMARY KEY (idpermisoopcion),
	FOREIGN KEY (idpermiso) REFERENCES permiso (idpermiso) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idusuario) REFERENCES usuarios (idusuario) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(1,1,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(2,2,1);
	
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(3,3,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(4,4,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(5,5,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(6,6,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(7,7,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(8,8,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(9,9,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(10,10,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(12,12,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(11,11,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(13,13,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(14,14,1);
	
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(17,15,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(18,16,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(19,17,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(20,18,1);
	
	
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(15,1,2);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(16,2,2);

CREATE TABLE sucursal  (
idsucursal smallint(4) NOT NULL AUTO_INCREMENT,
sucursal varchar(15) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idsucursal)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into sucursal (idsucursal,sucursal) values ('1','LA MERCED');
insert into sucursal (idsucursal,sucursal) values ('2','PICHANAKI');
insert into sucursal (idsucursal,sucursal) values ('3','VILLA RICA');
insert into sucursal (idsucursal,sucursal) values ('4','SAN RAMON');

CREATE TABLE usuarios_sucursal(
idsucursalusuario smallint(4) NOT NULL AUTO_INCREMENT,
idsucursal smallint(4) NOT NULL,
idusuario smallint(4) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idsucursalusuario),
FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idusuario) REFERENCES usuarios (idusuario) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

INSERT INTO usuarios_sucursal(idsucursalusuario,idsucursal,idusuario) VALUES(1,1,1);	
INSERT INTO usuarios_sucursal(idsucursalusuario,idsucursal,idusuario) VALUES(2,2,1);	
INSERT INTO usuarios_sucursal(idsucursalusuario,idsucursal,idusuario) VALUES(3,3,1);	
INSERT INTO usuarios_sucursal(idsucursalusuario,idsucursal,idusuario) VALUES(4,4,1);	

create table articulo(
idarticulo smallint(4) NOT NULL AUTO_INCREMENT,
articulo varchar(50) NOT NULL,
tipo char(1)NOT NULL DEFAULT '1',
facturable char(1)NOT NULL DEFAULT '1',
activo char(1) DEFAULT '1',
PRIMARY KEY (idarticulo)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into articulo(idarticulo,articulo) values (1,'CAFÉ PERGAMINO');
insert into articulo(idarticulo,articulo) values (2,'CAFÉ CEREZO');
insert into articulo(idarticulo,articulo) values (3,'CAFÉ BOLA');
insert into articulo(idarticulo,articulo) values (4,'CAFÉ CACHAZA');
insert into articulo(idarticulo,articulo) values (5,'CACAO');
insert into articulo(idarticulo,articulo) values (6,'ACHIOTE');
insert into articulo(idarticulo,articulo) values (7,'MAIZ');
insert into articulo(idarticulo,articulo) values (8,'SACHAINCHI');

create table proveedor(
idproveedor smallint(4) NOT NULL AUTO_INCREMENT,
idtipodocumento smallint(4) NOT NULL,
numero_documento varchar(10) NOT NULL,
RUC varchar(11) NOT NULL,
nombre varchar(100) NOT NULL,
domicilio varchar(100)NULL,
celular varchar(9) NULL,
correo varchar(100) NULL,
ubigeo varchar(6),
latitud varchar(25),
longitud varchar(25),
zona varchar(30)NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idproveedor)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into proveedor(idproveedor,idtipodocumento,numero_documento,RUC,nombre) values (1,1,'00000000','20365581569','NARSA CENTRAL');

create table tipo_operacion_proveedor(
idtipooperacion smallint(4) NOT NULL AUTO_INCREMENT,
tipo_operacion VARCHAR(50),
combo_movimientos char(1) default '0',
activo char(1) DEFAULT '1',
PRIMARY KEY (idtipooperacion))  ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into tipo_operacion_proveedor (idtipooperacion,tipo_operacion,combo_movimientos) values (1,'PRESTAMOS A PROVEEDORES','1');
insert into tipo_operacion_proveedor (idtipooperacion,tipo_operacion,combo_movimientos) values (2,'PAGOS A PROVEEDORES','1');
insert into tipo_operacion_proveedor (idtipooperacion,tipo_operacion,combo_movimientos) values (3,'COBROS A PROVEEDORES','1');
insert into tipo_operacion_proveedor (idtipooperacion,tipo_operacion,combo_movimientos) values (4,'PAGOS DE INTERESES A PROVEEDORES','1');
insert into tipo_operacion_proveedor (idtipooperacion,tipo_operacion,combo_movimientos) values (5,'COBROS DE INTERESES A PROVEEDORES','1');
insert into tipo_operacion_proveedor (idtipooperacion,tipo_operacion,combo_movimientos) values (6,'VALORIZACION DE PRODUCTOS','0');
insert into tipo_operacion_proveedor (idtipooperacion,tipo_operacion,combo_movimientos) values (7,'PRESTAMOS A LA EMPRESA','1');
insert into tipo_operacion_proveedor (idtipooperacion,tipo_operacion,combo_movimientos) values (8,'ADELANTOS A PROVEEDORES','0');


create table tipo_operacion_caja(
idtipooperacion smallint(4) NOT NULL AUTO_INCREMENT,
tipo_operacion VARCHAR(50),
combo_movimientos char(1) default '0',
activo char(1) DEFAULT '1',
PRIMARY KEY (idtipooperacion))  ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (1,'PRESTAMOS A PROVEEDORES','0');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (2,'PAGOS A PROVEEDORES','0');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (3,'COBROS A PROVEEDORES','0');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (4,'PAGOS DE INTERESES A PROVEEDORES','0');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (5,'COBROS DE INTERESES A PROVEEDORES','0');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (6,'PRESTAMOS A LA EMPRESA','0');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (7,'INGRESO DE EFECTIVO A CAJA','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (8,'TRANSFERENCIA A SUCURSALES','0');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (9,'GASTOS OPERATIVOS','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (10,'ADELANTOS A PROVEEDORES','0');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (11,'PAGO DE PLANILLAS','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (12,'PAGO DE SERVICIOS BASICOS','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (13,'GASTOS VARIOS','1');

create table transacciones(
idtransaccion smallint(4) NOT NULL AUTO_INCREMENT,
fecha datetime,
vencimiento datetime,
monto decimal(20,2),
activo char(1) DEFAULT '1',
PRIMARY KEY (idtransaccion)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table factor(
idfactor smallint(4) NOT NULL AUTO_INCREMENT,
destino smallint(4),
idtipooperacion smallint(4),
factor decimal(20,2),	
activo char(1) DEFAULT '1',
PRIMARY KEY (idfactor)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into factor (idfactor,destino,idtipooperacion,factor) values (1,1,1,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (2,1,2,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (3,1,3,1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (4,1,4,1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (5,1,5,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (6,1,6,1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (7,1,7,1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (17,1,8,-1);


insert into factor (idfactor,destino,idtipooperacion,factor) values (8,2,1,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (9,2,2,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (10,2,3,1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (11,2,4,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (12,2,5,1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (13,2,6,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (14,2,7,1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (15,2,8,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (16,2,9,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (18,2,10,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (19,2,11,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (20,2,12,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (21,2,13,-1);

create table movimientos_proveedor(
	idmovimiento smallint(4) NOT NULL AUTO_INCREMENT,
	idtipooperacion smallint(4) NOT NULL,
	idsucursal smallint(4) NOT NULL,
	idproveedor smallint(4) NOT NULL,
	idtransaccion smallint(4) NOT NULL,
	monto decimal(20,2) NOT NULL,
	interes decimal(20,2) DEFAULT 0,
	idfactor smallint(4),
	fecha_vencimiento datetime,
	fecha_movimiento datetime NOT NULL,
	idusuario_registro smallint(4),
	fecha_registro datetime,
	idusuario_modificacion smallint(4),
	fecha_modificacion datetime,
	idusuario_anulacion smallint(4),
	fecha_anulacion datetime,
	activo char(1) DEFAULT '1',
	PRIMARY KEY (idmovimiento),
	FOREIGN KEY (idtipooperacion) REFERENCES tipo_operacion_proveedor (idtipooperacion) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idtransaccion) REFERENCES transacciones (idtransaccion) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idfactor) REFERENCES factor (idfactor) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table movimientos_caja(
	idmovimiento smallint(4) NOT NULL AUTO_INCREMENT,
	idtipooperacion smallint(4) NOT NULL,
	idsucursal smallint(4) NOT NULL,
	idtransaccion smallint(4) NOT NULL,
	monto decimal(20,2) NOT NULL,
	interes decimal(20,2) DEFAULT 0,
	idfactor smallint(4),
	fecha_vencimiento datetime,
	fecha_movimiento datetime NOT NULL,
	idusuario_registro smallint(4),
	fecha_registro datetime,
	idusuario_modificacion smallint(4),
	fecha_modificacion datetime,
	idusuario_anulacion smallint(4),
	fecha_anulacion datetime,
	observaciones varchar(1000),
	activo char(1) DEFAULT '1',
	PRIMARY KEY (idmovimiento),
	FOREIGN KEY (idtipooperacion) REFERENCES tipo_operacion_caja (idtipooperacion) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idtransaccion) REFERENCES transacciones (idtransaccion) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idfactor) REFERENCES factor (idfactor) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table guia_entrada(
idguia smallint(4) NOT NULL AUTO_INCREMENT,
anio_guia smallint(4) NOT NULL,
numero smallint(4) NOT NULL,
fecha datetime NOT NULL,
idsucursal smallint(4) NOT NULL,
idproveedor smallint(4) NOT NULL,
pago char(1) DEFAULT '0',
tipo_pago char(1) DEFAULT '0',
idtransaccion_valorizacion smallint(4) DEFAULT 0,
idtransaccion_pago smallint(4) DEFAULT 0,
monto_valor decimal(20,2) Default 0,
monto_pagado decimal(20,2) Default 0,
observaciones varchar(1000), 
idusuario_registro smallint(4),
fecha_registro datetime,
idusuario_modificacion smallint(4),
fecha_modificacion datetime,
idusuario_anulacion smallint(4),
fecha_anulacion datetime,
activo char(1) DEFAULT '1',
PRIMARY KEY (idguia),
FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table guia_entrada_detalle(
iddetalle smallint(4) NOT NULL AUTO_INCREMENT,
idguia smallint(4) NOT NULL,
idarticulo smallint(4) NOT NULL,
cantidad decimal(20,2),
valorizado char(1)DEFAULT '0',
cantidad_valorizada decimal(20,2) Default 0,
humedad decimal(20,2) Default 0,
calidad decimal(20,2) Default 0,
costo decimal(20,2) DEFAULT 0,
activo char(1) DEFAULT '1',
PRIMARY KEY (iddetalle),
FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idguia) REFERENCES guia_entrada (idguia) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table valorizacion(
idvalorizacion smallint(4) NOT NULL AUTO_INCREMENT,
anio_valorizacion smallint(4) NOT NULL,
numero smallint(4) NOT NULL,
fecha datetime NOT NULL,
idsucursal smallint(4) NOT NULL,
idproveedor smallint(4) NOT NULL,
idtransaccion smallint(4) NOT NULL,
idusuario_registro smallint(4),
fecha_registro datetime,
idusuario_modificacion smallint(4),
fecha_modificacion datetime,
idusuario_anulacion smallint(4),
fecha_anulacion datetime,
activo char(1) DEFAULT '1',
PRIMARY KEY (idvalorizacion),
FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idtransaccion) REFERENCES transacciones (idtransaccion) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table valorizacion_detalle(
iddetalle smallint(4) NOT NULL AUTO_INCREMENT,
idvalorizacion smallint(4),
idguia smallint(4) NOT NULL,
idarticulo smallint(4) NOT NULL,
cantidad decimal(20,2),
costo decimal(20,2),
activo char(1) DEFAULT '1',
PRIMARY KEY (iddetalle),
FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idvalorizacion) REFERENCES valorizacion (idvalorizacion) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idguia) REFERENCES guia_entrada (idguia) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table guia_entrada_detalle_valorizacion(
iddetalle smallint(4) NOT NULL AUTO_INCREMENT,
idguia smallint(4) NOT NULL,
idarticulo smallint(4) NOT NULL,
idvalorizacion smallint(4),
cantidad decimal(20,2),
costo decimal(20,2),
activo char(1) DEFAULT '1',
PRIMARY KEY (iddetalle),
FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idguia) REFERENCES guia_entrada (idguia) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idvalorizacion) REFERENCES valorizacion (idvalorizacion) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create view lista_movimientos_proveedor
as
select mp.idmovimiento,mp.idtipooperacion,top.tipo_operacion,mp.idsucursal,s.sucursal,mp.idproveedor,td.tipo_documento,p.numero_documento,p.nombre,p.domicilio,p.zona,p.celular,p.correo,mp.idtransaccion,mp.monto,mp.interes as 'tasa',((DATEDIFF(NOW(),mp.fecha_movimiento) * mp.monto)  * ((mp.interes)/30)/100) as 'intereses',f.idfactor,f.factor * mp.monto as monto_factor,f.factor * ((mp.monto)) as monto_factor_final,mp.fecha_vencimiento,mp.fecha_movimiento,DATEDIFF(NOW(),mp.fecha_movimiento) as 'dias'
from movimientos_proveedor as mp inner join tipo_operacion_proveedor as top on top.idtipooperacion=mp.idtipooperacion inner join sucursal as s on s.idsucursal = mp.idsucursal inner join proveedor as p on p.idproveedor = mp.idproveedor inner join tipo_documento as td on td.idtipodocumento = p.idtipodocumento inner join factor as f on f.idfactor=mp.idfactor
where mp.activo='1';

create view lista_ingresos_proveedores
as
select ge.idguia,ge.idsucursal,s.sucursal,ge.anio_guia,ge.numero,ge.fecha,ge.observaciones,ge.idproveedor,td.tipo_documento,p.numero_documento,p.nombre,p.domicilio,p.zona,p.celular,p.correo,ged.idarticulo,a.articulo,ged.cantidad,ged.cantidad_valorizada,ged.costo
from guia_entrada as ge inner join sucursal as s on s.idsucursal = ge.idsucursal inner join proveedor as p on p.idproveedor = ge.idproveedor inner join tipo_documento as td on td.idtipodocumento = p.idtipodocumento inner join guia_entrada_detalle as ged on ged.idguia=ge.idguia inner join articulo as a on a.idarticulo = ged.idarticulo 
where ge.activo='1' and ged.activo='1';

create view lista_ingresos_valorizaciones_pre
as
select ge.idguia,ge.idsucursal,s.sucursal,ge.anio_guia,ge.numero,ge.fecha,ge.idproveedor,td.tipo_documento,p.numero_documento,p.nombre,p.domicilio,p.zona,p.celular,p.correo,ged.idarticulo,a.articulo,ged.cantidad
from guia_entrada as ge inner join sucursal as s on s.idsucursal = ge.idsucursal inner join proveedor as p on p.idproveedor = ge.idproveedor inner join tipo_documento as td on td.idtipodocumento = p.idtipodocumento inner join guia_entrada_detalle as ged on ged.idguia=ge.idguia inner join articulo as a on a.idarticulo = ged.idarticulo 
where ge.activo='1' and ged.activo='1'
union all 
select ge.idguia,ge.idsucursal,s.sucursal,ge.anio_guia,ge.numero,ge.fecha,ge.idproveedor,td.tipo_documento,p.numero_documento,p.nombre,p.domicilio,p.zona,p.celular,p.correo,gedv.idarticulo,a.articulo,gedv.cantidad *-1
from guia_entrada as ge inner join sucursal as s on s.idsucursal = ge.idsucursal inner join proveedor as p on p.idproveedor = ge.idproveedor inner join tipo_documento as td on td.idtipodocumento = p.idtipodocumento inner join guia_entrada_detalle_valorizacion as gedv on gedv.idguia=ge.idguia inner join articulo as a on a.idarticulo = gedv.idarticulo 
where ge.activo='1' and gedv.activo='1';

create view lista_ingresos_valorizaciones_saldo
as
select idguia,idsucursal,sucursal,anio_guia,numero,fecha,idproveedor,tipo_documento,numero_documento,nombre,domicilio,zona,celular,correo,idarticulo,articulo,sum(cantidad) as cantidad from lista_ingresos_valorizaciones_pre group by idguia,idsucursal,sucursal,anio_guia,numero,fecha,idproveedor,tipo_documento,numero_documento,nombre,domicilio,celular,zona,correo,idarticulo,articulo;

create view lista_valorizaciones_proveedores
As
select v.idvalorizacion,v.anio_valorizacion,v.numero,v.fecha,v.idsucursal,s.sucursal,v.idproveedor,p.idtipodocumento,td.tipo_documento,p.numero_documento,p.RUC,p.nombre,p.domicilio,p.zona,p.celular,p.correo,v.idtransaccion,vd.idguia,ge.anio_guia,ge.numero as 'numero_guia',ge.fecha as 'fecha_guia',vd.idarticulo,a.articulo,vd.cantidad,vd.costo,vd.cantidad * vd.costo as 'importe'
from valorizacion as v inner join sucursal as s on s.idsucursal = v.idsucursal inner join proveedor as p on p.idproveedor = v.idproveedor inner join tipo_documento as td on td.idtipodocumento = p.idtipodocumento inner join valorizacion_detalle as vd on vd.idvalorizacion = v.idvalorizacion inner join articulo as a on a.idarticulo = vd.idarticulo inner join guia_entrada as ge on ge.idguia = vd.idguia
where v.activo='1' and vd.activo='1';

create view lista_movimientos_caja
as
select mc.idmovimiento,mc.idtipooperacion,toc.tipo_operacion,mc.idsucursal,s.sucursal,mc.idtransaccion,mc.monto,mc.interes as 'tasa',mc.monto * (mc.interes/100) as 'intereses',f.idfactor,f.factor * mc.monto as monto_factor,f.factor * ((mc.monto)+mc.monto * (mc.interes/100)) as monto_factor_final,mc.fecha_vencimiento,mc.fecha_movimiento 
from movimientos_caja as mc inner join tipo_operacion_caja as toc on toc.idtipooperacion=mc.idtipooperacion inner join sucursal as s on s.idsucursal = mc.idsucursal inner join factor as f on f.idfactor=mc.idfactor
where mc.activo='1';

create view saldos_caja
as
select idsucursal,sucursal,sum(monto_factor_final) as saldo from lista_movimientos_caja group by idsucursal,sucursal;

create table proceso(
idproceso smallint(4) NOT NULL AUTO_INCREMENT,
proceso varchar(30) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY(idproceso)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into proceso(proceso) values('SUAVE LAVADO');

create table variedad(
idvariedad smallint(4) NOT NULL AUTO_INCREMENT,
variedad varchar(30) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY(idvariedad))ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into variedad(variedad) values('BLEND');

create table certificado(
idcertificado smallint(4) NOT NULL AUTO_INCREMENT,
anio_certificado smallint(4) NOT NULL,
numero smallint(4) NOT NULL,
fecha datetime NOT NULL,
idsucursal smallint(4) NOT NULL,
idproveedor smallint(4) NOT NULL,
pago char(1) DEFAULT '0',
idtransaccion smallint(4) DEFAULT 0,
monto_pagado decimal(20,2) Default 0,
altitud int DEFAULT 0,
h2overde decimal (20,2) default 0,
idproceso smallint(4) NOT NULL,
idvariedad smallint(4) NOT NULL,
densidad decimal(20,2) default 0,
observaciones varchar(1000), 
idusuario_registro smallint(4),
fecha_registro datetime,
idusuario_modificacion smallint(4),
fecha_modificacion datetime,
idusuario_anulacion smallint(4),
fecha_anulacion datetime,
activo char(1) DEFAULT '1',
PRIMARY KEY (idcertificado),
FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idproceso) REFERENCES proceso (idproceso) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idvariedad) REFERENCES variedad (idvariedad) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table color(
idcolor smallint(4) NOT NULL AUTO_INCREMENT,
color varchar(30) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY(idcolor))ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into color (color) values ('VERDE');
insert into color (color) values ('MARRÓN');

create table olor(
idolor smallint(4) NOT NULL AUTO_INCREMENT,
olor varchar(30) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY(idolor))ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into olor (olor) values ('FRESCO');
insert into olor (olor) values ('SECO');

create table apariencia(
idapariencia smallint(4) NOT NULL AUTO_INCREMENT,
apariencia varchar(30) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY(idapariencia))ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into apariencia (apariencia) values ('HOMOGÈNEO');

create table quaker(
idquaker smallint(4) NOT NULL AUTO_INCREMENT,
quaker varchar(30) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY(idquaker))ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into quaker (quaker) values ('GRADO ESPECIAL');

create table certificado_detalle(
iddetalle smallint(4) NOT NULL AUTO_INCREMENT,
idcertificado smallint(4) NOT NULL,
idcolor smallint(4) NOT NULL,
idolor smallint(4) NOT NULL,
granumelometria_malla_general decimal (20,2) default 0,
granumelometria_malla_1620_nro decimal (20,2) default 0,
granumelometria_malla_1620_por decimal (20,2) default 0,
granumelometria_malla_15_nro decimal (20,2) default 0,
granumelometria_malla_15_por decimal (20,2) default 0,
granumelometria_malla_14_nro decimal (20,2) default 0,
granumelometria_malla_14_por decimal (20,2) default 0,
granumelometria_malla_base_nro decimal (20,2) default 0,
granumelometria_malla_base_por decimal (20,2) default 0,
analisis_cafe_exportable_peso decimal (20,2) default 0,
analisis_cafe_exportable_por decimal (20,2) default 0,
analisis_sub_procuto_peso decimal (20,2) default 0,
analisis_sub_procuto_por decimal (20,2) default 0,
analisis_descarte_peso decimal (20,2) default 0,
analisis_descarte_por decimal (20,2) default 0,
analisis_cascara_peso decimal (20,2) default 0,
analisis_cascara_por decimal (20,2) default 0,
tostado_tiempo decimal (20,2) default 0,
tostado_color_agtron decimal (20,2) default 0,
tostado_perdida decimal (20,2) default 0,
idapariencia smallint(4) NOT NULL,
idquaker smallint(4) NOT NULL,
def_pri_negro_completo_num smallint(4)  default 0,
def_pri_negro_completo_equi smallint(4)  default 0,
def_pri_agrio_completo_num smallint(4)  default 0,
def_pri_agrio_completo_equi smallint(4) default 0,
def_pri_cereza_seca_num smallint(4) default 0,
def_pri_cereza_seca_equi smallint(4) default 0,
def_pri_danado_num smallint(4) default 0,
def_pri_danado_equi smallint(4) default 0,
def_pri_danado_severo_num smallint(4) default 0,
def_pri_danado_severo_equi smallint(4) default 0,
def_pri_materia_num smallint(4) default 0,
def_pri_materia_equi smallint(4) default 0,
def_sec_negro_parcial_num smallint(4) default 0,
def_sec_negro_parcial_equi smallint(4) default 0,
def_sec_agrio_parcial_num smallint(4) default 0,
def_sec_agrio_parcial_equi smallint(4) default 0,
def_sec_pergamino_num smallint(4) default 0,
def_sec_pergamino_equi smallint(4) default 0,
def_sec_flotador_num smallint(4) default 0,
def_sec_flotador_equi smallint(4) default 0,
def_sec_inmaduro_num smallint(4) default 0,
def_sec_inmaduro_equi smallint(4) default 0,
def_sec_averanado_num smallint(4) default 0,
def_sec_averanado_equi smallint(4) default 0,
def_sec_concha_num smallint(4) default 0,
def_sec_concha_equi smallint(4) default 0,
def_sec_quebrado_num smallint(4) default 0,
def_sec_quebrado_equi smallint(4) default 0,
def_sec_cascara_num smallint(4) default 0,
def_sec_cascara_equi smallint(4) default 0,
def_sec_insectos_num smallint(4) default 0,
def_sec_insectos_equi smallint(4) default 0,
atributos_fragancia_puntos decimal(20,2) default 0,
atributos_fragancia_caracteristicas varchar(100),
atributos_sabor_puntos decimal(20,2) default 0,
atributos_sabor_caracteristicas varchar(100),
atributos_residual_puntos decimal(20,2) default 0,
atributos_residual_caracteristicas varchar(100),
atributos_acidez_puntos decimal(20,2) default 0,
atributos_acidez_caracteristicas varchar(100),
atributos_cuerpo_puntos decimal(20,2) default 0,
atributos_cuerpo_caracteristicas varchar(100),
atributos_uniformidad_puntos decimal(20,2) default 0,
atributos_uniformidad_caracteristicas varchar(100),
atributos_balance_puntos decimal(20,2) default 0,
atributos_balance_caracteristicas varchar(100),
atributos_taza_puntos decimal(20,2) default 0,
atributos_taza_caracteristicas varchar(100),
atributos_dulzura_puntos decimal(20,2) default 0,
atributos_dulzura_caracteristicas varchar(100),
atributos_apreciacion_puntos decimal(20,2) default 0,
atributos_apreciacion_caracteristicas varchar(100),
atributos_numero_tasas decimal(20,2) default 0,
atributos_numero_intensidad decimal(20,2) default 0,
atributos_defectos_sustraer decimal(20,2) default 0,
activo char(1) DEFAULT '1',
PRIMARY KEY (iddetalle),
FOREIGN KEY (idcertificado) REFERENCES certificado (idcertificado) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idcolor) REFERENCES color (idcolor) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idolor) REFERENCES olor (idolor) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idapariencia) REFERENCES apariencia (idapariencia) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idquaker) REFERENCES quaker (idquaker) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table catador(
idcatador smallint(4) NOT NULL AUTO_INCREMENT,
idtipodocumento smallint(4) NOT NULL,
numero_documento varchar(10) NOT NULL,
apellidos varchar(50) NOT NULL,
nombres varchar(50) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idcatador),
FOREIGN KEY (idtipodocumento) REFERENCES tipo_documento (idtipodocumento) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into catador (idcatador,idtipodocumento,numero_documento,apellidos,nombres) values (1,1,'04319898','AREVALO TELLO','JULIO ABEL');
insert into catador (idcatador,idtipodocumento,numero_documento,apellidos,nombres) values (2,1,'44804102','VELASQUE DAMIANO','RICHARD');
insert into catador (idcatador,idtipodocumento,numero_documento,apellidos,nombres) values (3,1,'70322894','CUYA CORONEL','MEGUMI HORTENCIA');

create table certificado_catador(
idcertificadocatador smallint(4) NOT NULL AUTO_INCREMENT,
idcertificado smallint(4) NOT NULL,
idcatador smallint(4) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idcertificadocatador),
FOREIGN KEY (idcertificado) REFERENCES certificado (idcertificado) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idcatador) REFERENCES catador (idcatador) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

/*
Nuevas Entradas en la Base de Datos (25/02/2023)
*/
alter table movimientos_caja add ruc_proveedor varchar(11) after observaciones;
alter table movimientos_caja add razon_social_proveedor varchar(200) after ruc_proveedor;
alter table movimientos_caja add tipo_comprobante varchar(2) after razon_social_proveedor;
alter table movimientos_caja add serie_comprobante varchar(5) after tipo_comprobante;
alter table movimientos_caja add numero_comprobante varchar(8) after serie_comprobante;
alter table movimientos_caja add base_imponible decimal(20,0) after numero_comprobante;
alter table movimientos_caja add impuesto_igv decimal(20,0) after base_imponible;
alter table movimientos_caja add impuesto_renta decimal(20,0) after impuesto_igv;

alter table movimientos_caja alter column base_imponible set default 0;
alter table movimientos_caja alter column impuesto_igv set default 0;
alter table movimientos_caja alter column impuesto_renta set default 0;

update movimientos_caja set base_imponible=0,impuesto_igv=0,impuesto_renta=0;

/*
00 - OTROS (ESPECIFICAR)
01 - FACTURA
02 - RECIBO POR HONORARIOS
03 - BOLETA DE VENTA
04 - LIQUIDACIÓN DE COMPRA
05 - BOLETO TRANSPORTE AEREO
06 - CARTA DE PORTE AEREO
07 - NOTA DE CRÉDITO
08 - NOTA DE DÉBITO
09 - GUÍA DE REMISIÓN-REMITENTE
10 - RECIBO POR ARRENDAMIENTO
11 - PÓLIZA EMITIDA POR LAS BOLSAS DE VALORES
12 - TICKET O CINTA EMITIDO POR MÁQUINA REGISTRADORA
13 - DOCUMENTO BANCARIO
14 - RECIBO POR SERVICIOS PÚBLICOS
*/

alter table movimientos_caja modify column base_imponible decimal(20,2);
alter table movimientos_caja modify column impuesto_igv decimal(20,2);
alter table movimientos_caja modify column impuesto_renta decimal(20,2);

alter table movimientos_caja add detalle_comprobante varchar(500) after impuesto_renta;

INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(21,'Reportar Movimiento','1',21,2);

alter table movimientos_caja add check_igv char(1) after impuesto_igv;
alter table movimientos_caja add check_renta char(1) after impuesto_renta;

alter table movimientos_caja alter column check_igv set default '0';
alter table movimientos_caja alter column check_renta set default '0';

update movimientos_caja set check_igv='0',check_renta='0';

insert into tipo_documento(idtipodocumento,codigo_curl,codigo_sunat,tipo_documento,longitud,activo) values (3,'00','0','NO ESPECIFICO',0,'1');

INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario,activo) VALUES(21,19,1,1);
INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario,activo) VALUES(22,20,1,1);
INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario,activo) VALUES(23,21,1,1);

/*
Nuevas Entradas en la Base de Datos (02/03/2023)
*/
alter table guia_entrada_detalle add tasa decimal(20,2) after calidad;
alter table guia_entrada_detalle alter column tasa set default 0;
update guia_entrada_detalle set tasa='0';

alter table movimientos_proveedor add liquidado char(1) after interes;
alter table movimientos_proveedor alter column liquidado set default '0';
update movimientos_proveedor set liquidado='0';
alter table movimientos_proveedor add interes_total decimal(20,2) after liquidado;
alter table movimientos_proveedor alter column interes_total set default 0;
update movimientos_proveedor set interes_total='0';

drop view lista_movimientos_proveedor;

create view lista_movimientos_proveedor
as
select mp.idmovimiento,mp.idtipooperacion,top.tipo_operacion,mp.idsucursal,s.sucursal,mp.idproveedor,td.tipo_documento,p.numero_documento,p.nombre,p.domicilio,p.zona,p.celular,p.correo,mp.idtransaccion,mp.monto,mp.interes as 'tasa',IF(mp.liquidado='1',0,((DATEDIFF(NOW(),mp.fecha_movimiento) * mp.monto)  * ((mp.interes)/30)/100)) as 'intereses',mp.interes_total as 'interes_pagado',f.idfactor,f.factor * mp.monto as monto_factor,f.factor * ((mp.monto)) as monto_factor_final,mp.fecha_vencimiento,mp.fecha_movimiento,DATEDIFF(NOW(),mp.fecha_movimiento) as 'dias',mp.liquidado
from movimientos_proveedor as mp inner join tipo_operacion_proveedor as top on top.idtipooperacion=mp.idtipooperacion inner join sucursal as s on s.idsucursal = mp.idsucursal inner join proveedor as p on p.idproveedor = mp.idproveedor inner join tipo_documento as td on td.idtipodocumento = p.idtipodocumento inner join factor as f on f.idfactor=mp.idfactor
where mp.activo='1';

/*
Nuevas Entradas en la Base de Datos (13/03/2023)
*/

alter table movimientos_proveedor add observaciones varchar(1000) after interes_total;
alter table certificado add ruta_grafico varchar(1000) after observaciones;
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (14,'VENTA DE PRODUCTOS','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (15,'ESTADO DE CUENTA ANTERIOR PROVEEDOR','0');
insert into factor (idfactor,destino,idtipooperacion,factor) values (22,2,14,1);
insert into tipo_operacion_proveedor (idtipooperacion,tipo_operacion,combo_movimientos) values (9,'ESTADO DE CUENTA ANTERIOR','1');
insert into factor (idfactor,destino,idtipooperacion,factor) values (23,1,9,1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (24,2,15,0);

/*
Nuevas Entradas en la Base de Datos (16/03/2023)
*/
update modulo set orden =5 where idmodulo=4;
INSERT INTO modulo (idmodulo,descripcion,menu,icono,url,imagen,mini,orden) VALUES (5,'Módulo de Registro Ventas','Módulo Ventas','ventas.png','ventas','1','fa fa-money',4);

INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(5,1,'1');
INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(5,2,'1');

INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(22,'Editar Cliente','1',22,5);
INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(23,'Ventas Cliente','1',23,5);
INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(24,'Anular Venta','1',24,5);
INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(25,'Editar Venta','1',25,5);
INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(26,'Ver Guia Salida (PDF)','1',26,5);
INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(27,'Ver Comprobante (PDF)','1',27,5);

INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(10,5,'Lista Clientes','0','clientes','fa fa-bar-chart');
INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(11,5,'Nuevo Registro','0','nuevocliente','fa fa-address-card-o');
INSERT INTO menu(idmenu,idmodulo,descripcion,nivel,url,icono) VALUES(12,5,'Gestor de Reportes','1','#','fa fa-table');

INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(13,10,1);
INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(14,11,1);
INSERT INTO permisos_menu(idpermisosmenu,idmenu,idusuario) VALUES(15,12,1);

insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (16,'VENTA DE PRODUCTOS (EFECTIVO)','0');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (17,'VENTA DE PRODUCTOS (OTROS MEDIOS)','0');

INSERT INTO permisos_opcion(idpermiso,idusuario) VALUES(22,1);
INSERT INTO permisos_opcion(idpermiso,idusuario) VALUES(23,1);
INSERT INTO permisos_opcion(idpermiso,idusuario) VALUES(24,1);
INSERT INTO permisos_opcion(idpermiso,idusuario) VALUES(25,1);
INSERT INTO permisos_opcion(idpermiso,idusuario) VALUES(26,1);
INSERT INTO permisos_opcion(idpermiso,idusuario) VALUES(27,1);

insert into factor (idfactor,destino,idtipooperacion,factor) values (25,3,1,1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (26,3,2,0);

alter table proveedor add finca varchar(100) after zona;
alter table proveedor add altitud smallint(4) after finca;

create table cliente(
idcliente smallint(4) NOT NULL AUTO_INCREMENT,
idtipodocumento smallint(4) NOT NULL,
numero_documento varchar(10) NOT NULL,
RUC varchar(11) NOT NULL,
nombre varchar(100) NOT NULL,
domicilio varchar(100)NULL,
celular varchar(9) NULL,
correo varchar(100) NULL,
ubigeo varchar(6),
latitud varchar(25),
longitud varchar(25),
zona varchar(30)NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idcliente)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into cliente (idcliente,idtipodocumento,numero_documento,RUC,nombre,domicilio,celular,correo,ubigeo,latitud,longitud,zona) values (1,1,'00000000','00000000000','CLIENTE GENERICO','[N/A]','999999999','[N/A]','150101','','','[N/A]');

create table medio_pago(
idmediopago smallint(4) NOT NULL AUTO_INCREMENT,
medio_pago varchar(30),
numero_cuenta varchar(20),
activo char(1) DEFAULT '1',
PRIMARY KEY (idmediopago)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into medio_pago(medio_pago,numero_cuenta) values ('[N/A]','00000000000000000000');
insert into medio_pago(medio_pago,numero_cuenta) values ('EFECTIVO','00000000000000000000');
insert into medio_pago(medio_pago,numero_cuenta) values ('TRANSFERENCIA','00000000000000000000');
insert into medio_pago(medio_pago,numero_cuenta) values ('DEPOSITO','00000000000000000000');
insert into medio_pago(medio_pago,numero_cuenta) values ('PLIN','00000000000000000000');
insert into medio_pago(medio_pago,numero_cuenta) values ('YAPE','00000000000000000000');
insert into medio_pago(medio_pago,numero_cuenta) values ('TUNKI','00000000000000000000');
insert into medio_pago(medio_pago,numero_cuenta) values ('TARJETA','00000000000000000000');

create table guia_salida(
idguia smallint(4) NOT NULL AUTO_INCREMENT,
anio_guia smallint(4) NOT NULL,
numero smallint(4) NOT NULL,
fecha datetime NOT NULL,
idsucursal smallint(4) NOT NULL,
idcliente smallint(4) NOT NULL,
idtransaccion smallint(4) DEFAULT 0,
monto_valor decimal(20,2) Default 0,
monto_pagado decimal(20,2) Default 0,
observaciones varchar(1000), 
idusuario_registro smallint(4),
fecha_registro datetime,
idusuario_modificacion smallint(4),
fecha_modificacion datetime,
idusuario_anulacion smallint(4),
fecha_anulacion datetime,
activo char(1) DEFAULT '1',
PRIMARY KEY (idguia),
FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idcliente) REFERENCES cliente (idcliente) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table guia_salida_detalle(
iddetalle smallint(4) NOT NULL AUTO_INCREMENT,
idguia smallint(4) NOT NULL,
idarticulo smallint(4) NOT NULL,
cantidad decimal(20,2),
humedad decimal(20,2) Default 0,
calidad decimal(20,2) Default 0,
costo decimal(20,2) DEFAULT 0,
tasa decimal(20,2) DEFAULT 0,
activo char(1) DEFAULT '1',
PRIMARY KEY (iddetalle),
FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idguia) REFERENCES guia_salida (idguia) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table tipo_operacion_cliente(
idtipooperacion smallint(4) NOT NULL AUTO_INCREMENT,
tipo_operacion VARCHAR(50),
combo_movimientos char(1) default '0',
activo char(1) DEFAULT '1',
PRIMARY KEY (idtipooperacion))  ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into tipo_operacion_cliente (idtipooperacion,tipo_operacion,combo_movimientos) values (1,'VENTA AL CONTADO','1');
insert into tipo_operacion_cliente (idtipooperacion,tipo_operacion,combo_movimientos) values (2,'VENTA AL CREDITO','1');
insert into tipo_operacion_cliente (idtipooperacion,tipo_operacion,combo_movimientos) values (3,'PAGO DE CREDITOS','0');

create table movimientos_cliente(
	idmovimiento smallint(4) NOT NULL AUTO_INCREMENT,
	idtipooperacion smallint(4) NOT NULL,
	idtransaccion smallint(4) DEFAULT 0,
	idmediopago smallint(4) DEFAULT 0,
	idsucursal smallint(4) NOT NULL,
	idcliente smallint(4) NOT NULL,
	monto decimal(20,2) NOT NULL,
	idfactor smallint(4) NOT NULL,
	fecha_movimiento datetime NOT NULL,
	idusuario_registro smallint(4),
	fecha_registro datetime,
	idusuario_modificacion smallint(4),
	fecha_modificacion datetime,
	idusuario_anulacion smallint(4),
	fecha_anulacion datetime,
	activo char(1) DEFAULT '1',
	PRIMARY KEY (idmovimiento),
	FOREIGN KEY (idtipooperacion) REFERENCES tipo_operacion_cliente (idtipooperacion) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idcliente) REFERENCES cliente (idcliente) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idtransaccion) REFERENCES transacciones (idtransaccion) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idfactor) REFERENCES factor (idfactor) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idmediopago) REFERENCES medio_pago (idmediopago) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;
	
/*
Nuevas Entradas en la Base de Datos (21/03/2023)
*/
alter table movimientos_cliente add tipo_comprobante varchar(2) after monto;
alter table movimientos_cliente add serie_comprobante varchar(5) after tipo_comprobante;
alter table movimientos_cliente add numero_comprobante varchar(8) after serie_comprobante;
alter table movimientos_cliente add base_imponible decimal(20,2) after numero_comprobante;
alter table movimientos_cliente add impuesto_igv decimal(20,2) after base_imponible;

alter table movimientos_cliente alter column base_imponible set default 0;
alter table movimientos_cliente alter column impuesto_igv set default 0;

/*
Nuevas Entradas en la Base de Datos (01/04/2023)
*/
alter table certificado add bourbon char(1) after idvariedad;
alter table certificado add tipica char(1) after bourbon;
alter table certificado add caturra char(1) after tipica;
alter table certificado add pache char(1) after caturra;
alter table certificado add catimor char(1) after pache;
alter table certificado add catuai char(1) after catimor;
alter table certificado add pacamara char(1) after catuai;
alter table certificado add gesha char(1) after pacamara;
alter table certificado add marcellesa char(1) after gesha;
alter table certificado add gran_colombia char(1) after marcellesa;
alter table certificado add costa_rica_95 char(1) after gran_colombia;
alter table certificado add tupo char(1) after costa_rica_95;
alter table certificado add limani char(1) after tupo;
alter table certificado add maragogipe char(1) after limani;
alter table certificado add otros char(1) after maragogipe;
alter table certificado add otros_detalle varchar(100) after otros;

alter table certificado alter column bourbon set default '0';
alter table certificado alter column tipica set default '0';
alter table certificado alter column caturra set default '0';
alter table certificado alter column pache set default '0';
alter table certificado alter column catimor set default '0';
alter table certificado alter column catuai set default '0';
alter table certificado alter column pacamara set default '0';
alter table certificado alter column gesha set default '0';
alter table certificado alter column marcellesa set default '0';
alter table certificado alter column gran_colombia set default '0';
alter table certificado alter column costa_rica_95 set default '0';
alter table certificado alter column tupo set default '0';
alter table certificado alter column limani set default '0';
alter table certificado alter column maragogipe set default '0';
alter table certificado alter column otros set default '0';

update factor set factor = 1 where idfactor=13;

alter table movimientos_caja add liquidado char(1) after interes;
alter table movimientos_caja alter column liquidado set default '0';

drop view lista_movimientos_caja;
create view lista_movimientos_caja
as
select mc.idmovimiento,mc.idtipooperacion,toc.tipo_operacion,mc.idsucursal,s.sucursal,mc.idtransaccion,mc.monto,mc.interes as 'tasa',IF(mc.liquidado='1',0,((DATEDIFF(NOW(),mc.fecha_movimiento) * mc.monto)  * ((mc.interes)/30)/100)) as 'intereses',f.idfactor,f.factor * mc.monto as monto_factor,f.factor * mc.monto as monto_factor_final,mc.fecha_vencimiento,mc.fecha_movimiento 
from movimientos_caja as mc inner join tipo_operacion_caja as toc on toc.idtipooperacion=mc.idtipooperacion inner join sucursal as s on s.idsucursal = mc.idsucursal inner join factor as f on f.idfactor=mc.idfactor
where mc.activo='1';

/*
Nuevas Entradas en la Base de Datos (12/04/2023)
*/

insert into tipo_operacion_proveedor (idtipooperacion,tipo_operacion,combo_movimientos) values (10,'PAGO DE VALORIZACIONES PENDIENTES','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (18,'PAGO DE VALORIZACIONES A PROVEEDORES','0');
insert into factor (idfactor,destino,idtipooperacion,factor) values (27,1,10,-1);
insert into factor (idfactor,destino,idtipooperacion,factor) values (28,2,18,-1);

alter table certificado_detalle add olor varchar(200) after idolor;

INSERT INTO tipo_operacion_caja (idtipooperacion, tipo_operacion, combo_movimientos, activo) VALUES ('19', 'SALIDA DE DINERO DE CAJA (BANCOS)', '0', '1');
INSERT INTO factor (idfactor, destino, idtipooperacion, factor, activo) VALUES ('29', '2', '19', '-1', '1');

/*
Nuevas para Reportes
*/

drop view if exists reporte_deudores;
drop view if exists reporte_deudas;
drop view if exists cuentas_cobrar;
drop view if exists cuentas_pagar;
drop view if exists articulos_ingresados;
drop view if exists articulos_valorizados;
drop view if exists articulos_x_valorizar;


create view cuentas_cobrar
as
select idsucursal,sucursal,idproveedor,tipo_documento,numero_documento,nombre,zona,celular,sum(monto_factor_final) as 'monto' from lista_movimientos_proveedor 
group by idsucursal,sucursal,idproveedor,tipo_documento,numero_documento,nombre,zona,celular
having sum(monto_factor_final)<0;

create view cuentas_pagar
as
select idsucursal,sucursal,idproveedor,tipo_documento,numero_documento,nombre,zona,celular,sum(monto_factor_final) as 'monto' from lista_movimientos_proveedor 
group by idsucursal,sucursal,idproveedor,tipo_documento,numero_documento,nombre,zona,celular
having sum(monto_factor_final)>0;

update menu_detalle set descripcion ='Reporte 1' where idmenudetalle=1;
update menu_detalle set descripcion ='Reporte 2' where idmenudetalle=2;
update menu_detalle set descripcion ='Reporte 3' where idmenudetalle=3;
update menu_detalle set descripcion ='Reporte 4' where idmenudetalle=4;
update menu_detalle set descripcion ='Reporte 5' where idmenudetalle=5;
update menu_detalle set descripcion ='Reporte 6' where idmenudetalle=6;
update menu_detalle set descripcion ='Reporte 7' where idmenudetalle=7;
update menu_detalle set descripcion ='Reporte 8' where idmenudetalle=8;
update menu_detalle set descripcion ='Reporte 9' where idmenudetalle=9;
update menu_detalle set descripcion ='Reporte 10' where idmenudetalle=10;

update menu_detalle set descripcion ='Articulos Ingresados',url='reporte1',icono='fa fa-newspaper-o' where idmenudetalle=1;
update menu_detalle set descripcion ='Articulos Valorizados',url='reporte2' where idmenudetalle=2;
update menu_detalle set descripcion ='Articulos Por Valorizar',url='reporte3' where idmenudetalle=3;
update menu_detalle set descripcion ='Cuentas por Cobrar',url='reporte4' where idmenudetalle=4;
update menu_detalle set descripcion ='Cuentas por Pagar',url='reporte5' where idmenudetalle=5;

create view articulos_ingresados
as
select idsucursal,sucursal,anio_guia as 'anio',tipo_documento,numero_documento,nombre as 'productor',idguia,numero as 'guia',fecha,articulo,cantidad,costo from lista_ingresos_proveedores;

create view articulos_valorizados
as
select idsucursal,sucursal,anio_valorizacion as 'anio',tipo_documento,numero_documento,nombre as 'productor',idguia,numero_guia as guia,fecha_guia,articulo,cantidad,costo from lista_valorizaciones_proveedores;

create view articulos_x_valorizar
as
select idsucursal,sucursal,anio_guia as 'anio',tipo_documento,numero_documento,nombre as 'productor',numero as 'guia',fecha,articulo,cantidad from lista_ingresos_valorizaciones_saldo where cantidad>0;


/*
Nuevas para Tostados
*/
INSERT INTO modulo (idmodulo,descripcion,menu,icono,url,imagen,mini,orden) VALUES (6,'Módulo de Registro Ordenes de Tostado','Módulo Tostado','tostado.png','tostado','1','fa fa-thermometer-full',5);

UPDATE modulo set orden=6 where idmodulo=4;

insert into modulo_rol(idmodulorol,idmodulo,idperfil) values(11,6,1);
insert into modulo_rol(idmodulorol,idmodulo,idperfil) values(12,6,2);

insert into menu(idmenu,idmodulo,descripcion,nivel,url,icono) values (13,6,'Nuevo Registro',0,'nuevotostado','fa fa-pencil-square-o');

insert into permiso(idpermiso,descripcion,tipo,orden,activo,idmodulo) values(28,'Editar Tostado','1','28','1','6');
insert into permiso(idpermiso,descripcion,tipo,orden,activo,idmodulo) values(29,'Anular Proceso','1','29','1','6');
insert into permiso(idpermiso,descripcion,tipo,orden,activo,idmodulo) values(30,'Emitir PDF','1','30','1','6');

insert into permisos_menu(idpermisosmenu,idmenu,idusuario) values (16,13,1);

insert into permisos_opcion(idpermisoopcion,idpermiso,idusuario) values (51,28,1);
insert into permisos_opcion(idpermisoopcion,idpermiso,idusuario) values (52,29,1);
insert into permisos_opcion(idpermisoopcion,idpermiso,idusuario) values (53,30,1);

create table tostado(
idtostado smallint(4) NOT NULL AUTO_INCREMENT,
anio_tostado smallint(4) NOT NULL,
numero smallint(4) NOT NULL,
fecha datetime NOT NULL,
idsucursal smallint(4) NOT NULL,
idproveedor smallint(4) NOT NULL,
idarticulo smallint(4) NOT NULL,
cantidad decimal (20,2),
cascara decimal (20,2),
malla15 decimal (20,2),
malla14 decimal (20,2),
descarte decimal (20,2),
eliminacion decimal (20,2),
seleccion smallint(4),
tostado smallint(4),
molido smallint(4),
envasado smallint(4),
observaciones varchar(1000), 
idusuario_registro smallint(4),
fecha_registro datetime,
idusuario_modificacion smallint(4),
fecha_modificacion datetime,
idusuario_anulacion smallint(4),
fecha_anulacion datetime,
activo char(1) DEFAULT '1',
PRIMARY KEY (idtostado),
FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

/*
Items Campo 
1 - Exportacion
2 - Segunda

Items Campo Tostado 
1 - Claro
2 - Medio
3 - Oscuro

Items Campo Molido 
1 - Fino
2 - Medio
3 - Grueso

Items Campo Envasado 
1 - 1 Kg.
2 - 500 Gr.
3 - 250 Gr.
*/

/* New desde 06/08/2023*/
update menu_detalle set descripcion ='Productor Movimientos',url='reporte6' where idmenudetalle=6;

DROP TABLE IF EXISTS tostado_trillado;
DROP TABLE IF EXISTS tostado_empaquetado;
DROP TABLE IF EXISTS tostado_maquina;
DROP TABLE IF EXISTS tostado;

create table tostado(
idtostado smallint(4) NOT NULL AUTO_INCREMENT,
anio_tostado smallint(4) NOT NULL,
numero smallint(4) NOT NULL,
idsucursal smallint(4) NOT NULL,
idproveedor smallint(4) NOT NULL,
idarticulo smallint(4) NOT NULL,
cantidad decimal (20,2),
fecha datetime NOT NULL,
densidad decimal (20,2),
h2o decimal (20,2),
seleccionado char(1),
precio_total decimal (20,2),
a_cuenta decimal (20,2),
saldo decimal (20,2),
tipo_tostado_claro decimal (20,2),
tipo_tostado_medio decimal (20,2),
tipo_tostado_oscuro decimal (20,2),
tipo_molienda_media decimal (20,2),
tipo_molienda_media_fina decimal (20,2),
tipo_molienda_media_gruesa decimal (20,2),
tipo_embolsado_250 decimal (20,2),
tipo_embolsado_500 decimal (20,2),
tipo_embolsado_1000 decimal (20,2),
observaciones varchar(1000), 
idusuario_registro smallint(4),
fecha_registro datetime,
idusuario_modificacion smallint(4),
fecha_modificacion datetime,
idusuario_anulacion smallint(4),
fecha_anulacion datetime,
activo char(1) DEFAULT '1',
PRIMARY KEY (idtostado),
FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into permiso(idpermiso,descripcion,tipo,orden,activo,idmodulo) values(31,'Operaciones','1','31','1','6');
insert into permisos_opcion(idpermisoopcion,idpermiso,idusuario) values (54,31,1);

create table tostado_trillado(
idtostadotrillado smallint(4) NOT NULL AUTO_INCREMENT,
idtostado smallint(4) NOT NULL,
cantidad decimal (20,2),
zaranda_15_17 decimal(20,2),
zaranda_13_14 decimal(20,2),
zaranda_descarte decimal(20,2),
pesos_gra decimal(20,2),
pesos_segunda decimal(20,2),
pesos_cascarilla decimal(20,2),
activo char(1) DEFAULT '1',
PRIMARY KEY (idtostadotrillado),
FOREIGN KEY (idtostado) REFERENCES tostado (idtostado) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table tostado_maquina(
idtostadomaquina smallint(4) NOT NULL AUTO_INCREMENT,
idtostado smallint(4) NOT NULL,
idmaquina smallint(4) NOT NULL,
idtipo smallint(4) NOT NULL,
cantidad decimal(20,2),
codigo varchar(20),
activo char(1) DEFAULT '1',
PRIMARY KEY (idtostadomaquina),
FOREIGN KEY (idtostado) REFERENCES tostado (idtostado) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table tostado_empaquetado(
idtostadoempaquetado smallint(4) NOT NULL AUTO_INCREMENT,
idtostado smallint(4) NOT NULL,
empaque_250 smallint(4),
empaque_500 smallint(4),
empaque_1000 smallint(4),
activo char(1) DEFAULT '1',
PRIMARY KEY (idtostadoempaquetado),
FOREIGN KEY (idtostado) REFERENCES tostado (idtostado) ON DELETE CASCADE ON UPDATE CASCADE)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

/*Reporte Anulados*/
create view lista_movimientos_proveedor_anulados
as
select mp.idmovimiento,mp.idtipooperacion,top.tipo_operacion,mp.idsucursal,s.sucursal,mp.idproveedor,td.tipo_documento,p.numero_documento,p.nombre,p.domicilio,p.zona,p.celular,p.correo,mp.idtransaccion,mp.monto,mp.interes as 'tasa',((DATEDIFF(NOW(),mp.fecha_movimiento) * mp.monto)  * ((mp.interes)/30)/100) as 'intereses',f.idfactor,f.factor * mp.monto as monto_factor,f.factor * ((mp.monto)) as monto_factor_final,mp.fecha_vencimiento,mp.fecha_movimiento,DATEDIFF(NOW(),mp.fecha_movimiento) as 'dias'
from movimientos_proveedor as mp inner join tipo_operacion_proveedor as top on top.idtipooperacion=mp.idtipooperacion inner join sucursal as s on s.idsucursal = mp.idsucursal inner join proveedor as p on p.idproveedor = mp.idproveedor inner join tipo_documento as td on td.idtipodocumento = p.idtipodocumento inner join factor as f on f.idfactor=mp.idfactor
where mp.activo='0';

update menu_detalle set descripcion ='Productor Anulaciones',url='reporte7' where idmenudetalle=7;

/*Queryz adicionales para el pase del Dashboard*/

INSERT INTO modulo (idmodulo,descripcion,menu,icono,url,imagen,mini,orden) VALUES (7,'Tablero de Mando - Dashboard','Dashboard','dashboard.png','dashboard/dash','1','fa fa-tachometer',7);
INSERT INTO modulo_rol (idmodulo,idperfil) values (7,1);

drop view IF EXISTS grafico_valorizados_reporte;
drop view IF EXISTS grafico_valorizados;
create view grafico_valorizados
as
select year(fecha) as anio,idsucursal,sucursal,articulo,sum(cantidad) as valorizado,0 as no_valorizado from lista_ingresos_valorizaciones_saldo group by idsucursal,sucursal,articulo
union all
select year(fecha) as anio,idsucursal,sucursal,articulo,0 as valorizado,sum(cantidad) as no_valorizado from lista_valorizaciones_proveedores group by idsucursal,sucursal,articulo;

create view grafico_valorizados_reporte
as
select anio,sucursal,articulo,sum(valorizado) as valorizado,sum(no_valorizado) as no_valorizado from grafico_valorizados GROUP BY anio,sucursal,articulo;}





/*Nuevas Ejecuciones en Bases de Datos al 08/02/2024*/

drop table IF EXISTS movimientos_banco;

create table movimientos_banco(
	idmovimiento smallint(4) NOT NULL AUTO_INCREMENT,
	idtipooperacion smallint(4) NOT NULL,
	idsucursal smallint(4) NOT NULL,
	idtransaccion smallint(4) NOT NULL,
	monto decimal(20,2) NOT NULL,
	interes decimal(20,2) DEFAULT 0,
	idfactor smallint(4),
	fecha_vencimiento datetime,
	fecha_movimiento datetime NOT NULL,
	idusuario_registro smallint(4),
	fecha_registro datetime,
	idusuario_modificacion smallint(4),
	fecha_modificacion datetime,
	idusuario_anulacion smallint(4),
	fecha_anulacion datetime,
	observaciones varchar(1000),
	activo char(1) DEFAULT '1',
	PRIMARY KEY (idmovimiento),
	FOREIGN KEY (idtipooperacion) REFERENCES tipo_operacion_caja (idtipooperacion) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idtransaccion) REFERENCES transacciones (idtransaccion) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idfactor) REFERENCES factor (idfactor) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

	alter table movimientos_banco add ruc_proveedor varchar(11) after observaciones;
	alter table movimientos_banco add razon_social_proveedor varchar(200) after ruc_proveedor;
	alter table movimientos_banco add tipo_comprobante varchar(2) after razon_social_proveedor;
	alter table movimientos_banco add serie_comprobante varchar(5) after tipo_comprobante;
	alter table movimientos_banco add numero_comprobante varchar(8) after serie_comprobante;
	alter table movimientos_banco add base_imponible decimal(20,0) after numero_comprobante;
	alter table movimientos_banco add impuesto_igv decimal(20,0) after base_imponible;
	alter table movimientos_banco add impuesto_renta decimal(20,0) after impuesto_igv;
	alter table movimientos_banco alter column base_imponible set default 0;
	alter table movimientos_banco alter column impuesto_igv set default 0;
	alter table movimientos_banco alter column impuesto_renta set default 0;
	update movimientos_banco set base_imponible=0,impuesto_igv=0,impuesto_renta=0;
	alter table movimientos_banco modify column base_imponible decimal(20,2);
	alter table movimientos_banco modify column impuesto_igv decimal(20,2);
	alter table movimientos_banco modify column impuesto_renta decimal(20,2);
	alter table movimientos_banco add detalle_comprobante varchar(500) after impuesto_renta;
	alter table movimientos_banco add check_igv char(1) after impuesto_igv;
	alter table movimientos_banco add check_renta char(1) after impuesto_renta;
	alter table movimientos_banco alter column check_igv set default '0';
	alter table movimientos_banco alter column check_renta set default '0';
	update movimientos_banco set check_igv='0',check_renta='0';
	alter table movimientos_banco add liquidado char(1) after interes;
	alter table movimientos_banco alter column liquidado set default '0';

drop view IF EXISTS lista_movimientos_banco;
create view lista_movimientos_banco
as
select mc.idmovimiento,mc.idtipooperacion,toc.tipo_operacion,mc.idsucursal,s.sucursal,mc.idtransaccion,mc.monto,mc.interes as 'tasa',IF(mc.liquidado='1',0,((DATEDIFF(NOW(),mc.fecha_movimiento) * mc.monto)  * ((mc.interes)/30)/100)) as 'intereses',f.idfactor,f.factor * mc.monto as monto_factor,f.factor * mc.monto as monto_factor_final,mc.fecha_vencimiento,mc.fecha_movimiento 
from movimientos_banco as mc inner join tipo_operacion_caja as toc on toc.idtipooperacion=mc.idtipooperacion inner join sucursal as s on s.idsucursal = mc.idsucursal inner join factor as f on f.idfactor=mc.idfactor
where mc.activo='1';