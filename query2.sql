/*
Nuevas Entradas en la Base de Datos (16/03/2023)
*/
DROP TABLE IF EXISTS guia_salida_detalle;
DROP TABLE IF EXISTS guia_salida;
DROP TABLE IF EXISTS medio_pago;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS movimientos_cliente;
DROP TABLE IF EXISTS tipo_operacion_cliente;

delete from modulo where idmodulo=5;
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

delete from tipo_operacion_caja where idtipooperacion in(16,17);
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (16,'VENTA DE PRODUCTOS (EFECTIVO)','0');
insert into tipo_operacion_caja (idtipooperacion,tipo_operacion,combo_movimientos) values (17,'VENTA DE PRODUCTOS (OTROS MEDIOS)','0');

delete from factor where idfactor in(25,26);
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
	


