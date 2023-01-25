-- Creamos la base de datos Administración
DROP SCHEMA IF EXISTS administracion;
CREATE SCHEMA IF NOT EXISTS administracion;
USE administracion;

-- Creación de tablas

CREATE TABLE cliente (
id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
tipo_documento VARCHAR(20) NOT NULL,
documento INT NOT NULL,
correo VARCHAR(50),
telefono INT NOT NULL,
pass VARCHAR(6) NOT NULL
);

CREATE TABLE instalacion (
id_instalacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_inst VARCHAR(50) NOT NULL,
descripcion VARCHAR(150) NOT NULL,
direccion VARCHAR(50) NOT NULL,
costo INT NOT NULL,
foto LONGBLOB NOT NULL
);

CREATE TABLE cancha (
id_cancha INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
superficie VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
costo INT NOT NULL,
foto LONGBLOB NOT NULL
);

CREATE TABLE torneo (
id_torneo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
nombre_torneo VARCHAR(50) NOT NULL,
telefono INT NOT NULL,
foreign key (id_cliente) references cliente(id_cliente)
);

CREATE TABLE opinion (
id_opinion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
comentario VARCHAR(250) NOT NULL,
puntuacion INT NOT NULL,
foreign key (id_cliente) references cliente(id_cliente)
);

CREATE TABLE proveedor (
id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
provincia VARCHAR(50) NOT NULL,
ciudad VARCHAR(50) NOT NULL,
telefono INT NOT NULL
);

CREATE TABLE forma_de_pago (
id_forma_pago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_fp VARCHAR(50) NOT NULL,
descripcion VARCHAR(80) NOT NULL
);

CREATE TABLE categoria (
id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_categ VARCHAR(50) NOT NULL,
descripcion_cat VARCHAR(80) NOT NULL
);

CREATE TABLE alquiler (
id_alquiler INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
id_instalacion INT,
id_cancha INT,
fecha DATE,
hora_inicio TIME,
hora_fin TIME,
costo_total INT NOT NULL,
id_forma_pago INT,
foreign key (id_cliente) references cliente(id_cliente),
foreign key (id_instalacion) references instalacion(id_instalacion),
foreign key (id_cancha) references cancha(id_cancha),
foreign key (id_forma_pago) references forma_de_pago(id_forma_pago)
);

CREATE TABLE venta (
id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
fecha DATE,
monto_total INT NOT NULL,
id_forma_pago INT,
descuento INT,
foreign key (id_cliente) references cliente(id_cliente),
foreign key (id_forma_pago) references forma_de_pago(id_forma_pago)
);

CREATE TABLE producto (
id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_prod VARCHAR(30) NOT NULL,
id_categoria INT NOT NULL,
id_proveedor INT NOT NULL,
precio INT NOT NULL,
stock INT,
foreign key (id_categoria) references categoria(id_categoria),
foreign key (id_proveedor) references proveedor(id_proveedor)
);