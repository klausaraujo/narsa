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
DROP TABLE IF EXISTS factor;
DROP TABLE IF EXISTS tipo_operacion_caja;
DROP TABLE IF EXISTS tipo_operacion_proveedor;
DROP TABLE IF EXISTS guia_entrada_detalle;
DROP TABLE IF EXISTS guia_entrada_detalle_valorizacion;
DROP TABLE IF EXISTS valorizacion_detalle;
DROP TABLE IF EXISTS valorizacion;
DROP TABLE IF EXISTS guia_entrada;
DROP TABLE IF EXISTS transacciones;
DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS proveedor;
DROP TABLE IF EXISTS usuarios_sucursal;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS tipo_documento;
DROP TABLE IF EXISTS perfil;
DROP TABLE IF EXISTS sucursal;
DROP VIEW IF EXISTS lista_movimientos_proveedor;
DROP VIEW IF EXISTS lista_ingresos_proveedores;
DROP VIEW IF EXISTS lista_ingresos_valorizaciones_pre;
DROP VIEW IF EXISTS lista_ingresos_valorizaciones_saldo;
DROP VIEW IF EXISTS lista_valorizaciones_proveedores;

CREATE TABLE anio  (
idanio smallint(4) NOT NULL AUTO_INCREMENT,
anio smallint(4) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idanio)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

INSERT INTO anio (anio) VALUES(2022);

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
	INSERT INTO modulo (idmodulo,descripcion,menu,icono,url,imagen,mini,orden) VALUES (2,'Módulo de Registro de Servicios Generales y Facturación','Módulo Facturación','servicios.png','servicios','1','fa fa-money',2);
	INSERT INTO modulo (idmodulo,descripcion,menu,icono,url,imagen,mini,orden) VALUES (3,'Módulo de Configuraciones y Tablas Padre del Sistema','Módulo Configuraciones','utilitarios.png','utilitarios','1','fa fa-cog',3);
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
	INSERT INTO modulo_rol(idmodulo,idperfil,activo) VALUES(3,2,'0');
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
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(11,11,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(12,12,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(13,13,1);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(14,14,1);
	
	
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
zona varchar(30)NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idproveedor)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into proveedor(idproveedor,idtipodocumento,numero_documento,RUC,nombre) values (1,1,'00000000','00000000000','NARSA CENTRAL');

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

insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (1,'PRESTAMOS A PROVEEDORES','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (2,'PAGOS A PROVEEDORES','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (3,'COBROS A PROVEEDORES','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (4,'PAGOS DE INTERESES A PROVEEDORES','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (5,'COBROS DE INTERESES A PROVEEDORES','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (6,'PRESTAMOS A LA EMPRESA','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (7,'INGRESO DE EFECTIVO A CAJA','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (8,'TRANSFERENCIA A SUCURSALES','1');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (9,'GASTOS OPERATIVOS','1');

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
select mp.idmovimiento,mp.idtipooperacion,top.tipo_operacion,mp.idsucursal,s.sucursal,mp.idproveedor,td.tipo_documento,p.numero_documento,p.nombre,p.domicilio,p.zona,p.celular,p.correo,mp.idtransaccion,mp.monto,mp.interes as 'tasa',mp.monto * (mp.interes/100) as 'intereses',f.idfactor,f.factor * mp.monto as monto_factor,f.factor * ((mp.monto)+mp.monto * (mp.interes/100)) as monto_factor_final,mp.fecha_vencimiento,mp.fecha_movimiento 
from movimientos_proveedor as mp inner join tipo_operacion_proveedor as top on top.idtipooperacion=mp.idtipooperacion inner join sucursal as s on s.idsucursal = mp.idsucursal inner join proveedor as p on p.idproveedor = mp.idproveedor inner join tipo_documento as td on td.idtipodocumento = p.idtipodocumento inner join factor as f on f.idfactor=mp.idfactor
where mp.activo='1';

create view lista_ingresos_proveedores
as
select ge.idguia,ge.idsucursal,s.sucursal,ge.anio_guia,ge.numero,ge.fecha,ge.idproveedor,td.tipo_documento,p.numero_documento,p.nombre,p.domicilio,p.zona,p.celular,p.correo,ged.idarticulo,a.articulo,ged.cantidad
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