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
DROP TABLE IF EXISTS transacciones;
DROP TABLE IF EXISTS tipo_operacion;
DROP TABLE IF EXISTS guia_entrada_detalle;
DROP TABLE IF EXISTS guia_entrada_detalle_valorizacion;
DROP TABLE IF EXISTS guia_entrada;
DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS proveedor;
DROP TABLE IF EXISTS usuarios_sucursal;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS tipo_documento;
DROP TABLE IF EXISTS perfil;
DROP TABLE IF EXISTS sucursal;

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
	INSERT INTO permiso(idpermiso,descripcion,tipo,orden,idmodulo) VALUES(2,'Movimientos ','1',2,1);

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
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(1,3,'Reporte 01','#','fa fa-th-list',1);
	INSERT INTO menu_detalle (idmenudetalle,idmenu,descripcion,url,icono,orden) VALUES(2,3,'Reporte 02','#','fa fa-newspaper-o',2);

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

	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (3,1,2);
	Insert Into permisos_menu_detalle(idpermisosmenudetalle,idmenudetalle,idusuario) Values (4,2,2);

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

	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(3,1,2);
	INSERT INTO permisos_opcion(idpermisoopcion,idpermiso,idusuario) VALUES(4,2,2);




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
zona varchar(30)NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idproveedor)) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into proveedor(idproveedor,idtipodocumento,numero_documento,RUC,nombre) values (1,1,'00000000','00000000000','NARSA CENTRAL');

create table tipo_operacion(
idtipooperacion smallint(4) NOT NULL AUTO_INCREMENT,
tipo_operacion VARCHAR(50),
activo char(1) DEFAULT '1',
PRIMARY KEY (idtipooperacion))  ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

insert into tipo_operacion (idtipooperacion,tipo_operacion) values (1,'PRESTAMOS A PROVEEDORES');
insert into tipo_operacion (idtipooperacion,tipo_operacion) values (2,'PAGO A PROVEEDORES');
insert into tipo_operacion (idtipooperacion,tipo_operacion) values (3,'COBRO A PROVEEDORES');
insert into tipo_operacion (idtipooperacion,tipo_operacion) values (4,'PAGO POR VALORIZACION DE PRODUCTOS');
insert into tipo_operacion (idtipooperacion,tipo_operacion) values (5,'PAGOS DE INTERESES A PROVEEDORES');
insert into tipo_operacion (idtipooperacion,tipo_operacion) values (6,'COBRO DE INTERESES A PROVEEDORES');
insert into tipo_operacion (idtipooperacion,tipo_operacion) values (7,'INGRESO DE PRODUCTOS SIN VALORIZAR');
insert into tipo_operacion (idtipooperacion,tipo_operacion) values (8,'PRESTAMOS A LA EMPRESA');
insert into tipo_operacion (idtipooperacion,tipo_operacion) values (9,'INGRESO DE EFECTIVO A CAJA');
insert into tipo_operacion (idtipooperacion,tipo_operacion) values (10,'SALIDA DE EFECTIVO DE CAJA');

create table transacciones(
idtransaccion smallint(4) NOT NULL AUTO_INCREMENT,
idtipooperacion smallint(4) NOT NULL,
idsucursal smallint(4) NOT NULL,
idproveedor smallint(4) NOT NULL,
fecha datetime,
monto decimal(20,2),
activo char(1) DEFAULT '1',
PRIMARY KEY (idtransaccion),
FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idtipooperacion) REFERENCES tipo_operacion (idtipooperacion) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table guia_entrada(
idguia smallint(4) NOT NULL AUTO_INCREMENT,
anio_guia smallint(4) NOT NULL,
numero smallint(4) NOT NULL,
fecha datetime NOT NULL,
idsucursal smallint(4) NOT NULL,
idproveedor smallint(4) NOT NULL,
activo char(1) DEFAULT '1',
PRIMARY KEY (idguia),
FOREIGN KEY (idsucursal) REFERENCES sucursal (idsucursal) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table guia_entrada_detalle(
iddetalle smallint(4) NOT NULL AUTO_INCREMENT,
idguia smallint(4) NOT NULL,
idarticulo smallint(4) NOT NULL,
cantidad decimal(20,2),
costo decimal(20,2),
activo char(1) DEFAULT '1',
PRIMARY KEY (iddetalle),
FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idguia) REFERENCES guia_entrada (idguia) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

create table guia_entrada_detalle_valorizacion(
iddetalle smallint(4) NOT NULL AUTO_INCREMENT,
idguia smallint(4) NOT NULL,
idarticulo smallint(4) NOT NULL,
cantidad decimal(20,2),
costo decimal(20,2),
activo char(1) DEFAULT '1',
PRIMARY KEY (iddetalle),
FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idguia) REFERENCES guia_entrada (idguia) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;





