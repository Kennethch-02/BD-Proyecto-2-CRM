---- Creacion de la base de datos
create database IF NOT EXISTS SistemaCRM;
USE SistemaCRM;

---- Creacion de las tablas de la base de datos
CREATE TABLE IF NOT EXISTS Usuario(
	cedula varchar(10) primary key,
	nombre varchar(20),
    nombre varchar(20),
	apellidos varchar(40),
	departamento varchar(20),
	clave varchar(10),
	rol varchar(10)
);

CREATE TABLE IF NOT EXISTS Cliente(
	nombreDeUsuario varchar(20) not null primary key,
	correoElectronico varchar(30) not null,
	contactoPrincipal varchar(10) not null,
	moneda varchar(10) not null,
	telefono varchar(15) not null,
	celular varchar(15) not null,
	sitioWeb varchar(30) not null,
	infoAdicional varchar(200),
	asesor varchar(10),
    foreign key (asesor) references Usuario(cedula),
	zona varchar(15) not null,
	sector varchar(15) not null
);

CREATE TABLE IF NOT EXISTS Contacto(
	cliente varchar(20),
	foreign key (cliente) references Cliente(nombreDeUsuario),
	tipo varchar(15) not null,
	motivo varchar(30) not null,
	nombre varchar(20) not null,
	telefono varchar(15) not null,
	correoElectronico varchar(30) not null,
	estado varchar(10) not null,
	direccion varchar(20) not null,
	sector varchar(15) not null,
	zona varchar(15) not null,
	asesor varchar(10) not null,
	descripcion varchar(50) not null,
	primary key(cliente)
);

CREATE TABLE IF NOT EXISTS Familia(
	codigo varchar(10) not null primary key,
	nombre varchar(20) not null,
	activo varchar(10) not null,
	descripcion varchar(50) not null
);

CREATE TABLE IF NOT EXISTS Producto(
	codigo varchar(10) not null primary key,
	nombre varchar(20) not null,
	activo varchar(10) not null,
	descripcion varchar(50) not null,
    familia varchar(10),
	foreign key (familia) references Familia(codigo),
	precioEstandar decimal(9,2) not null
);

CREATE TABLE IF NOT EXISTS Caso(
	propietario varchar(10),
	foreign key (propietario) references Usuario(cedula),
	origen varchar(15) not null,
	nombreDeCuenta varchar(20) not null,
	numeroProyecto varchar(15) not null,
	nombreContacto varchar(20) not null,
	asunto varchar(20) not null,
	direccion varchar(30) not null,
	descripcion varchar(50) not null,
	estado varchar(15) not null,
	tipo varchar(15) not null,
	prioridad varchar(15) not null,
	primary key(propietario)
);

CREATE TABLE IF NOT EXISTS Ejecucion(
	departamento varchar(20) not null,
	numeroCotizacion varchar(6) not null,
	propietario varchar(20) not null primary key,
	nombre varchar(20) not null,
	fecha varchar(10) not null,
	nombreDeCuenta varchar(20) not null,
	mesAnnoProyectadoCierre varchar(7) not null,
    asesor varchar(10),
	foreign key (asesor) references Usuario(cedula),
	fechaCierre varchar(10) not null
);

CREATE TABLE IF NOT EXISTS Cotizacion(
	numero varchar(6) not null primary key,
	nombreOportunidad varchar(15) not null,
	fecha varchar(10) not null,
	nombreCuenta varchar(20) not null,
	mesAnnoProyectado varchar(7) not null,
    asesor varchar(10),
	foreign key (asesor) references Usuario(cedula),
	fechaCierre varchar(10) not null,
	etapa varchar(15) not null,
	moneda varchar(15) not null,
	probabilidad decimal(3,1) not null,
	ordenCompra varchar(6) not null,
	tipo varchar(15) not null,
	descripcion varchar(50) not null,
	zona varchar(15) not null,
	sector varchar(15) not null,
	numeroContacto varchar(10) not null,
	numeroFactura varchar(10) not null,
    producto varchar(10),
	foreign key (producto) references Producto(codigo),
	cantidad int not null,
	razonNegacion varchar(30),
	conraQuien varchar(20)
);