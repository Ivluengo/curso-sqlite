-- Active: 1690095792729@@127.0.0.1@3306
DROP DATABASE IF EXISTS facturacion;
DROP DATABASE IF EXISTS inventario;
DROP DATABASE IF EXISTS rrhh;
DROP DATABASE IF EXISTS tienda;
DROP DATABASE IF EXISTS `facturacion`;
CREATE DATABASE `facturacion`; 
USE `facturacion`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `metodos_pago` (
  `metodo_pago_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`metodo_pago_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `metodos_pago` VALUES (1,'Tarjeta de Crédito');
INSERT INTO `metodos_pago` VALUES (2,'Efectivo');
INSERT INTO `metodos_pago` VALUES (3,'PayPal');
INSERT INTO `metodos_pago` VALUES (4,'Transferencia bancaria');

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `comunidad_autonoma` varchar(50) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `clientes` VALUES (1,'Lucia','Calle de Toledo, 2533','Elche','Comunidad Valenciana','636-803-361');
INSERT INTO `clientes` VALUES (2,'Felipe','Calle de Tetuán, 48','Alcalá de Henares','Madrid','635-338-796');
INSERT INTO `clientes` VALUES (3,'Dolores','Calle del Pez, 98','A Coruña','Galicia','680-061-315');
INSERT INTO `clientes` VALUES (4,'German','Calle Mota, 69','Málaga','Andalucía','695-427-758');
INSERT INTO `clientes` VALUES (5,'Susana','Calle de Ferraz, 78','Llança','Cataluña','673-374-837');

CREATE TABLE `facturas` (
  `factura_id` int(11) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `factura_total` decimal(9,2) NOT NULL,
  `pago_total` decimal(9,2) NOT NULL DEFAULT '0.00',
  `factura_fecha` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  PRIMARY KEY (`factura_id`),
  KEY `FK_cliente_id` (`cliente_id`),
  CONSTRAINT `FK_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `facturas` VALUES (1,'91-953-3396',2,101.79,0.00,'2019-03-09','2019-03-29',NULL);
INSERT INTO `facturas` VALUES (2,'03-898-6735',5,175.32,8.18,'2019-06-11','2019-07-01','2019-02-12');
INSERT INTO `facturas` VALUES (3,'20-228-0335',5,147.99,0.00,'2019-07-31','2019-08-20',NULL);
INSERT INTO `facturas` VALUES (4,'56-934-0748',3,152.21,0.00,'2019-03-08','2019-03-28',NULL);
INSERT INTO `facturas` VALUES (5,'87-052-3121',5,169.36,0.00,'2019-07-18','2019-08-07',NULL);
INSERT INTO `facturas` VALUES (6,'75-587-6626',1,157.78,74.55,'2019-01-29','2019-02-18','2019-01-03');
INSERT INTO `facturas` VALUES (7,'68-093-9863',3,133.87,0.00,'2019-09-04','2019-09-24',NULL);
INSERT INTO `facturas` VALUES (8,'78-145-1093',1,189.12,0.00,'2019-05-20','2019-06-09',NULL);
INSERT INTO `facturas` VALUES (9,'77-593-0081',5,172.17,0.00,'2019-07-09','2019-07-29',NULL);
INSERT INTO `facturas` VALUES (10,'48-266-1517',1,159.50,0.00,'2019-06-30','2019-07-20',NULL);
INSERT INTO `facturas` VALUES (11,'20-848-0181',3,126.15,0.03,'2019-01-07','2019-01-27','2019-01-11');
INSERT INTO `facturas` VALUES (13,'41-666-1035',5,135.01,87.44,'2019-06-25','2019-07-15','2019-01-26');
INSERT INTO `facturas` VALUES (15,'55-105-9605',3,167.29,80.31,'2019-11-25','2019-12-15','2019-01-15');
INSERT INTO `facturas` VALUES (16,'10-451-8824',1,162.02,0.00,'2019-03-30','2019-04-19',NULL);
INSERT INTO `facturas` VALUES (17,'33-615-4694',3,126.38,68.10,'2019-07-30','2019-08-19','2019-01-15');
INSERT INTO `facturas` VALUES (18,'52-269-9803',5,180.17,42.77,'2019-05-23','2019-06-12','2019-01-08');
INSERT INTO `facturas` VALUES (19,'83-559-4105',1,134.47,0.00,'2019-11-23','2019-12-13',NULL);

CREATE TABLE `pagos` (
  `pago_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` decimal(9,2) NOT NULL,
  `metodo_pago` tinyint(4) NOT NULL,
  PRIMARY KEY (`pago_id`),
  KEY `fk_cliente_id_idx` (`cliente_id`),
  KEY `fk_factura_id_idx` (`factura_id`),
  KEY `fk_pago_metodo_pago_idx` (`metodo_pago`),
  CONSTRAINT `fk_pago_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pago_factura` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`factura_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pago_metodo_pago` FOREIGN KEY (`metodo_pago`) REFERENCES `metodos_pago` (`metodo_pago_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `pagos` VALUES (1,5,2,'2019-02-12',8.18,1);
INSERT INTO `pagos` VALUES (2,1,6,'2019-01-03',74.55,1);
INSERT INTO `pagos` VALUES (3,3,11,'2019-01-11',0.03,1);
INSERT INTO `pagos` VALUES (4,5,13,'2019-01-26',87.44,1);
INSERT INTO `pagos` VALUES (5,3,15,'2019-01-15',80.31,1);
INSERT INTO `pagos` VALUES (6,3,17,'2019-01-15',68.10,1);
INSERT INTO `pagos` VALUES (7,5,18,'2019-01-08',32.77,1);
INSERT INTO `pagos` VALUES (8,5,18,'2019-01-08',10.00,2);


DROP DATABASE IF EXISTS `tienda`;
CREATE DATABASE `tienda`;
USE `tienda`;

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `cantidad_stock` int(11) NOT NULL,
  `precio_unitario` decimal(4,2) NOT NULL,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `productos` VALUES (1,'Plato hondo de espuma',70,1.21);
INSERT INTO `productos` VALUES (2,'Cerdo - Tocino',49,4.65);
INSERT INTO `productos` VALUES (3,'Lechuga - Romana, Corazón',38,3.35);
INSERT INTO `productos` VALUES (4,'Brocolinni',90,4.53);
INSERT INTO `productos` VALUES (5,'Salsa - Aderezo Ranchero',94,1.63);
INSERT INTO `productos` VALUES (6,'Baguette pequeña',14,2.39);
INSERT INTO `productos` VALUES (7,'Brotes de guisantes',98,3.29);
INSERT INTO `productos` VALUES (8,'Island Oasis - Frambuesa',26,0.74);
INSERT INTO `productos` VALUES (9,'Recogedor',67,2.26);
INSERT INTO `productos` VALUES (10,'Escoba',6,1.09);


CREATE TABLE `transportistas` (
  `transportista_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`transportista_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `transportistas` VALUES (1,'TransEcoSpain');
INSERT INTO `transportistas` VALUES (2,'SpeedyTrans');
INSERT INTO `transportistas` VALUES (3,'SpeedyTrans');
INSERT INTO `transportistas` VALUES (4,'HispaniGo');
INSERT INTO `transportistas` VALUES (5,'TraviSpain');


CREATE TABLE `consumidores` (
  `consumidor_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `comunidad_autonoma` varchar(50) NOT NULL,
  `puntos` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`consumidor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `consumidores` VALUES (1,'Álvaro','Santana','1986-03-28','608-622-040','Calle del Prado, 89','Huesca','Aragón',2273);
INSERT INTO `consumidores` VALUES (2,'Ines','Moya','1986-04-13','625-341-088','Calle del Barquillo, 17','Barcelona','Cataluña',947);
INSERT INTO `consumidores` VALUES (3,'Esperanza','García','1985-02-07','678-219-103','Paseo de Zorrilla, 57','Cádiz','Andalucía',2967);
INSERT INTO `consumidores` VALUES (4,'Isabel','Ruiz','1974-04-14','639-130-922','Avenida de Salamanca, 314','Guadalajara','Madrid',457);
INSERT INTO `consumidores` VALUES (5,'Lorenzo','Ferrer','1973-11-07',NULL,'Avenida del Planetario, 82','Pontevedra','Galicia',3675);
INSERT INTO `consumidores` VALUES (6,'Carmelo','Garrido','1991-09-04','686-750-153"','Calle de Ferraz, 84','Santa Cruz de Tenerife','Islas Canarias',3073);
INSERT INTO `consumidores` VALUES (7,'Magda','Montero','1964-08-30','615-641-475','Avenida de Burgos, 39','Cáceres','Extremadura',1672);
INSERT INTO `consumidores` VALUES (8,'Pedro','Nieto','1993-07-17','674-587-107','Calle de Toledo, 32','Sevilla','Andalucía',205);
INSERT INTO `consumidores` VALUES (9,'Consuelo','López','1992-05-23','688-113-456"','Avenida de Andalucía, 210','Bilbao','País Vasco',1486);
INSERT INTO `consumidores` VALUES (10,'Vicenta','Román','1969-10-13','690-911-457','Calle del Zapato, 3','Barcelona','Cataluña',796);


CREATE TABLE `estados_pedidos` (
  `estado_pedido_id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`estado_pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `estados_pedidos` VALUES (1,'Procesado');
INSERT INTO `estados_pedidos` VALUES (2,'Enviado');
INSERT INTO `estados_pedidos` VALUES (3,'Entregado');


CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL AUTO_INCREMENT,
  `consumidor_id` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `comentarios` varchar(2000) DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `transportista_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `fk_pedidos_consumidores_idx` (`consumidor_id`),
  KEY `fk_pedidos_transportistas_idx` (`transportista_id`),
  KEY `fk_pedidos_estados_pedidos_idx` (`estado`),
  CONSTRAINT `fk_pedidos_consumidores` FOREIGN KEY (`consumidor_id`) REFERENCES `consumidores` (`consumidor_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pedidos_estados_pedidos` FOREIGN KEY (`estado`) REFERENCES `estados_pedidos` (`estado_pedido_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pedidos_transportistas` FOREIGN KEY (`transportista_id`) REFERENCES `transportistas` (`transportista_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `pedidos` VALUES (1,6,'2019-01-30',1,NULL,NULL,NULL);
INSERT INTO `pedidos` VALUES (2,7,'2018-08-02',2,NULL,'2018-08-03',4);
INSERT INTO `pedidos` VALUES (3,8,'2017-12-01',1,NULL,NULL,NULL);
INSERT INTO `pedidos` VALUES (4,2,'2017-01-22',1,NULL,NULL,NULL);
INSERT INTO `pedidos` VALUES (5,5,'2017-08-25',2,'','2017-08-26',3);
INSERT INTO `pedidos` VALUES (6,10,'2018-11-18',1,'Aliquam erat volutpat. In congue.',NULL,NULL);
INSERT INTO `pedidos` VALUES (7,2,'2018-09-22',2,NULL,'2018-09-23',4);
INSERT INTO `pedidos` VALUES (8,5,'2018-06-08',1,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',NULL,NULL);
INSERT INTO `pedidos` VALUES (9,10,'2017-07-05',2,'Nulla mollis molestie lorem. Quisque ut erat.','2017-07-06',1);
INSERT INTO `pedidos` VALUES (10,6,'2018-04-22',2,NULL,'2018-04-23',2);


CREATE TABLE `items_pedido` (
  `pedido_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(4,2) NOT NULL,
  PRIMARY KEY (`pedido_id`,`producto_id`),
  KEY `fk_items_pedido_productos_idx` (`producto_id`),
  CONSTRAINT `fk_items_pedido_pedidos` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_items_pedido_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `items_pedido` VALUES (1,4,4,3.74);
INSERT INTO `items_pedido` VALUES (2,1,2,9.10);
INSERT INTO `items_pedido` VALUES (2,4,4,1.66);
INSERT INTO `items_pedido` VALUES (2,6,2,2.94);
INSERT INTO `items_pedido` VALUES (3,3,10,9.12);
INSERT INTO `items_pedido` VALUES (4,3,7,6.99);
INSERT INTO `items_pedido` VALUES (4,10,7,6.40);
INSERT INTO `items_pedido` VALUES (5,2,3,9.89);
INSERT INTO `items_pedido` VALUES (6,1,4,8.65);
INSERT INTO `items_pedido` VALUES (6,2,4,3.28);
INSERT INTO `items_pedido` VALUES (6,3,4,7.46);
INSERT INTO `items_pedido` VALUES (6,5,1,3.45);
INSERT INTO `items_pedido` VALUES (7,3,7,9.17);
INSERT INTO `items_pedido` VALUES (8,5,2,6.94);
INSERT INTO `items_pedido` VALUES (8,8,2,8.59);
INSERT INTO `items_pedido` VALUES (9,6,5,7.28);
INSERT INTO `items_pedido` VALUES (10,1,10,6.01);
INSERT INTO `items_pedido` VALUES (10,9,9,4.28);

CREATE TABLE `tienda`.`item_pedido_notas` (
  `nota_id` INT NOT NULL,
  `pedido_Id` INT NOT NULL,
  `producto_id` INT NOT NULL,
  `nota` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`nota_id`));

INSERT INTO `item_pedido_notas` (`nota_id`, `pedido_Id`, `producto_id`, `nota`) VALUES ('1', '1', '2', 'primera nota');
INSERT INTO `item_pedido_notas` (`nota_id`, `pedido_Id`, `producto_id`, `nota`) VALUES ('2', '1', '2', 'segunda nota');


DROP DATABASE IF EXISTS `rrhh`;
CREATE DATABASE `rrhh`;
USE `rrhh`;


CREATE TABLE `oficinas` (
  `oficina_id` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `comunidad_autonoma` varchar(50) NOT NULL,
  PRIMARY KEY (`oficina_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `oficinas` VALUES (1,'Calle del Sol, 123','Barcelona','Cataluña');
INSERT INTO `oficinas` VALUES (2,'Avenida de la Luna, 45','Madrid','Madrid');
INSERT INTO `oficinas` VALUES (3,'Plaza del Mar, 7','Valencia','Comunidad Valenciana');
INSERT INTO `oficinas` VALUES (4,'Paseo de la Montaña, 22','Bilbao','País Vasco');
INSERT INTO `oficinas` VALUES (5,'Carrera de la Rosa, 9','Sevilla','Andalucía');
INSERT INTO `oficinas` VALUES (6,'Camino del Viento, 18','Zaragoza','Aragón');
INSERT INTO `oficinas` VALUES (7,'Camino del Viento, 18','A Coruña','Galícia');
INSERT INTO `oficinas` VALUES (8,'Calle del Marfil, 31','Alicante','Comunidad Valenciana');
INSERT INTO `oficinas` VALUES (9,'Plaza de la Estrella, 3','Palma de Mallorca','Islas Baleares');
INSERT INTO `oficinas` VALUES (10,'Avenida del Pinar, 27','Murcia','Región de Murcia');



CREATE TABLE `empleados` (
  `empleado_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `puesto_titulo` varchar(50) NOT NULL,
  `salario` int(11) NOT NULL,
  `informa_a` int(11) DEFAULT NULL,
  `oficina_id` int(11) NOT NULL,
  PRIMARY KEY (`empleado_id`),
  KEY `fk_empleados_oficinas_idx` (`oficina_id`),
  KEY `fk_empleados_empleados_idx` (`informa_a`),
  CONSTRAINT `fk_empleados_directivos` FOREIGN KEY (`informa_a`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `fk_empleados_oficinas` FOREIGN KEY (`oficina_id`) REFERENCES `oficinas` (`oficina_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `empleados` VALUES (37270,'Pedro','García','Director General',63996,NULL,10);
INSERT INTO `empleados` VALUES (33391,'Laura','Rodríguez','Recursos Humanos',62871,37270,1);
INSERT INTO `empleados` VALUES (37851,'Manuel','Martínez','Jefe de Finanzas',98926,37270,1);
INSERT INTO `empleados` VALUES (40448,'Carmen','López','Coordinador de Marketing',94860,37270,1);
INSERT INTO `empleados` VALUES (56274,'Alejandro','Fernández','Analista de Datos',110150,37270,1);
INSERT INTO `empleados` VALUES (63196,'Beatriz','Torres','Especialista en Desarrollo de Productos',32179,37270,2);
INSERT INTO `empleados` VALUES (67009,'Javier','Ramírez','Diseñador Gráfico',114257,37270,2);
INSERT INTO `empleados` VALUES (67370,'Isabel','Sánchez','Encargado de Logística',96767,37270,2);
INSERT INTO `empleados` VALUES (68249,'Ricardo','Gómez','Técnico de Soporte IT',52832,37270,2);
INSERT INTO `empleados` VALUES (72540,'Marta','González','Ingeniero de Calidad',117690,37270,3);
INSERT INTO `empleados` VALUES (72913,'Andrés','Morales','Asistente Administrativo',96401,37270,3);
INSERT INTO `empleados` VALUES (75900,'Paula','Navarro','Coordinador de Proyectos',54578,37270,3);
INSERT INTO `empleados` VALUES (76196,'Sergio','Ortega','Ejecutivo de Ventas',119241,37270,3);
INSERT INTO `empleados` VALUES (80529,'Elena','Castro','Investigador de Mercado',77182,37270,4);
INSERT INTO `empleados` VALUES (80679,'Adrián','Ruiz','Diseñador Gráfico',67987,37270,4);
INSERT INTO `empleados` VALUES (84791,'Nuria','Herrera','Especialista en Relaciones Públicas',93760,37270,4);
INSERT INTO `empleados` VALUES (95213,'Juan','Delgado','Recursos Humanos',86119,37270,4);
INSERT INTO `empleados` VALUES (96513,'Martina','Vargas','Supervisor de Producción',47354,37270,5);
INSERT INTO `empleados` VALUES (98374,'Óscar','Jiménez','Encargado de Mantenimiento',70187,37270,5);
INSERT INTO `empleados` VALUES (115357,'Ana','Moreno','Diseñador Gráfico',92710,37270,5);


DROP DATABASE IF EXISTS `inventario`;
CREATE DATABASE `inventario`;
USE `inventario`;


CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `cantidad_stock` int(11) NOT NULL,
  `precio_unitario` decimal(4,2) NOT NULL,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `productos` VALUES (1,'Plato hondo de espuma',70,1.21);
INSERT INTO `productos` VALUES (2,'Cerdo - Tocino',49,4.65);
INSERT INTO `productos` VALUES (3,'Lechuga - Romana, Corazón',38,3.35);
INSERT INTO `productos` VALUES (4,'Brocolinni',90,4.53);
INSERT INTO `productos` VALUES (5,'Salsa - Aderezo Ranchero',94,1.63);
INSERT INTO `productos` VALUES (6,'Baguette pequeña',14,2.39);
INSERT INTO `productos` VALUES (7,'Brotes de guisantes',98,3.29);
INSERT INTO `productos` VALUES (8,'Island Oasis - Frambuesa',26,0.74);
INSERT INTO `productos` VALUES (9,'Recogedor',67,2.26);
INSERT INTO `productos` VALUES (10,'Escoba',6,1.09);
