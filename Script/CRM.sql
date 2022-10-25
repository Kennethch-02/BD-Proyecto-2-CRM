-- CREACION DE LA BASE DE DATOS --
IF not exists (SELECT [name] FROM sys.databases WHERE [name] = N'SistemaCRM')
BEGIN
	CREATE DATABASE SistemaCRM
END;

-- DROP TABLES --

use SistemaCRM
go

if OBJECT_ID(N'ValorPresenteCotizaciones', N'U') IS NOT NULL
	DROP table ValorPresenteCotizaciones
go

if OBJECT_ID(N'ActividadXCotizacion', N'U') IS NOT NULL
	DROP table ActividadXCotizacion
go

if OBJECT_ID(N'TareaXCotizacion', N'U') IS NOT NULL
	DROP table TareaXCotizacion
go

if OBJECT_ID(N'ProductoXCotizacion', N'U') IS NOT NULL
	DROP table ProductoXCotizacion
go

if OBJECT_ID(N'ActividadesXEjecucion', N'U') IS NOT NULL
	DROP table ActividadesXEjecucion
go

if OBJECT_ID(N'TareaXEjecucion', N'U') IS NOT NULL
	DROP table TareaXEjecucion
go

if OBJECT_ID(N'PropietarioEjecucion', N'U') IS NOT NULL
	DROP table PropietarioEjecucion
go

if OBJECT_ID(N'TareaXContacto', N'U') IS NOT NULL
	DROP table TareaXContacto
go

if OBJECT_ID(N'cotizacionContraQuien', N'U') IS NOT NULL
	DROP table cotizacionContraQuien
go

if OBJECT_ID(N'cotizacionDenegada', N'U') IS NOT NULL
	DROP table cotizacionDenegada
go

if OBJECT_ID(N'Tarea', N'U') IS NOT NULL
	DROP table Tarea
go

if OBJECT_ID(N'Ejecucion', N'U') IS NOT NULL
	DROP table Ejecucion
go

if OBJECT_ID(N'Cotizacion', N'U') IS NOT NULL
	DROP table Cotizacion
go

if OBJECT_ID(N'Caso', N'U') IS NOT NULL
	DROP table Caso
go

if OBJECT_ID(N'Producto', N'U') IS NOT NULL
	DROP table Producto
go

if OBJECT_ID(N'Familia', N'U') IS NOT NULL
	DROP table Familia
go

if OBJECT_ID(N'Producto', N'U') IS NOT NULL
	DROP table Producto
go

if OBJECT_ID(N'Contacto', N'U') IS NOT NULL
	DROP table Contacto
go

if OBJECT_ID(N'Cliente', N'U') IS NOT NULL
	DROP table Cliente
go

if OBJECT_ID(N'Asesor', N'U') IS NOT NULL
	DROP table Asesor
go

if OBJECT_ID(N'Usuario', N'U') IS NOT NULL
	DROP table Usuario
go

if OBJECT_ID(N'Departamento', N'U') IS NOT NULL
	DROP table Departamento
go

if OBJECT_ID(N'RolXOperaciones', N'U') IS NOT NULL
	DROP table RolXOperaciones
go

if OBJECT_ID(N'Moneda', N'U') IS NOT NULL
	DROP table Moneda
go

if OBJECT_ID(N'ZonaSector', N'U') IS NOT NULL
	DROP table ZonaSector
go

if OBJECT_ID(N'Actividad', N'U') IS NOT NULL
	DROP table Actividad
go

if OBJECT_ID(N'Modulo', N'U') IS NOT NULL
	DROP table Modulo
go

if OBJECT_ID(N'TipoContacto', N'U') IS NOT NULL
	DROP table TipoContacto
go

if OBJECT_ID(N'TipoCaso', N'U') IS NOT NULL
	DROP table TipoCaso
go

if OBJECT_ID(N'Prioridad', N'U') IS NOT NULL
	DROP table Prioridad
go

if OBJECT_ID(N'EstadoCaso', N'U') IS NOT NULL
	DROP table EstadoCaso
go

if OBJECT_ID(N'EstadoContacto', N'U') IS NOT NULL
	DROP table EstadoContacto
go

if OBJECT_ID(N'Probabilidad', N'U') IS NOT NULL
	DROP table Probabilidad
go

if OBJECT_ID(N'Operaciones', N'U') IS NOT NULL
	DROP table Operaciones
go

if OBJECT_ID(N'Etapa', N'U') IS NOT NULL
	DROP table Etapa
go

if OBJECT_ID(N'TipoCotizacion', N'U') IS NOT NULL
	DROP table TipoCotizacion
go

if OBJECT_ID(N'nombreCuenta', N'U') IS NOT NULL
	DROP table nombreCuenta
go

if OBJECT_ID(N'Inflacion', N'U') IS NOT NULL
	DROP table Inflacion
go

if OBJECT_ID(N'Rol', N'U') IS NOT NULL
	DROP table Rol
go

create table Departamento(
	id smallint not null primary key,
	nombre varchar(15) not null
)

CREATE TABLE Rol(
	id smallint not null primary key,
	tipo varchar(15) not null,
)

create table Moneda(
	id smallint not null primary key,
	nombre varchar(15) not null
)

create table ZonaSector(
	id smallint not null primary key,
	zona varchar(20) not null,
	sector varchar(20) not null
)

create table Actividad(
	id smallint not null primary key,
	descripcion varchar(50) not null,
	fechaInicio date not null,
	fechaFinal date not null
)

-- Tipo de modulo --
create table Modulo(
	id smallint not null primary key,
	tipo varchar(15) not null
)

-- Tipo de contacto --
create table TipoContacto(
	id smallint not null primary key,
	tipo varchar(15) not null
)

-- Tipo de caso --
create table TipoCaso(
	id smallint not null primary key,
	tipo varchar(15) not null
)

-- Prioridad del caso --
create table Prioridad(
	id smallint not null primary  key,
	prioridad varchar(10) not null
)

-- Estado del caso --
create table EstadoCaso(
	id smallint not null primary key,
	estado varchar(10) not null
)


-- Estado del contacto --
create table EstadoContacto(
	id smallint not null primary key,
	estado varchar(10) not null
)

create table Probabilidad(
	id smallint not null primary key,
	porcentaje smallint not null,
)

create table Operaciones(
	id smallint not null primary key,
	nombre varchar(20) not null,
	modulo smallint not null foreign key references Modulo(id)
)

create table RolXOperaciones(
	id smallint not null primary key,
	rol smallint not null foreign key references Rol(id),
	modulo smallint not null foreign key references Operaciones(id)
)

create table Etapa(
	ID smallint not null primary key,
	etapa varchar(15) not null,
)

create table TipoCotizacion(
	ID smallint not null primary key,
	tipo varchar(20) not null
)

create table nombreCuenta(
	id smallint not null primary key,
	nombre varchar(20) not null
)

create table Inflacion(
	id smallint not null primary key,
	porcentaje int not null check (porcentaje between 0 and 100)
)

CREATE TABLE Usuario(
	cedula varchar(10) not null primary key,
	nombre varchar(20) not null,
	apellidos varchar(40) not null,
	departamento smallint not null foreign key references Departamento(id),
	clave varchar(10) not null,
	rol smallint not null foreign key references Rol(id)
)

create table Asesor(
	id smallint not null primary key,
	cedula varchar(10) not null foreign key references Usuario(cedula),
)

CREATE TABLE Cliente(
	nombreDeUsuario varchar(20) not null primary key,
	correoElectronico varchar(30) not null,
	contactoPrincipal varchar(10) not null,
	moneda smallint not null foreign key references Moneda(id),
	telefono varchar(15) not null,
	celular varchar(15) not null,
	sitioWeb varchar(30) not null,
	infoAdicional varchar(200),
	asesor varchar(10) not null foreign key references Usuario(cedula),
	zonaSector smallint not null foreign key references ZonaSector(id)
)

CREATE TABLE Contacto(
	cliente varchar(20) not null foreign key references Cliente(nombreDeUsuario),
	tipo smallint not null foreign key references TipoContacto(id),
	motivo varchar(30) not null,
	nombre varchar(20) not null primary key,
	telefono varchar(15) not null,
	correoElectronico varchar(30) not null,
	estado smallint not null foreign key references EstadoContacto(id),
	direccion varchar(20) not null,
	zonaSector smallint not null foreign key references ZonaSector(id),
	asesor smallint not null foreign key references Asesor(id),
	descripcion varchar(50) not null,
	idModulo smallint not null foreign key references Modulo(id)
)

CREATE TABLE Familia(
	codigo varchar(10) not null primary key,
	nombre varchar(20) not null,
	descripcion varchar(50) not null
)

CREATE TABLE Producto(
	codigo varchar(10) not null primary key,
	nombre varchar(20) not null,
	activo smallint not null check (activo between 0 and 1),
	descripcion varchar(50) not null,
	familia varchar(10) not null foreign key references Familia(codigo),
	precioEstandar decimal(9,2) not null	
)

CREATE TABLE Caso(
	propietario varchar(20) not null foreign key references Cliente(nombreDeUsuario),
	origen varchar(15) not null,
	nombreDeCuenta varchar(20) not null foreign key references Cliente(nombreDeUsuario),
	numeroProyecto varchar(15) not null primary key,
	nombreContacto varchar(20) not null foreign key references Contacto(nombre),
	asunto varchar(20) not null,
	direccion varchar(30) not null,
	descripcion varchar(50) not null,
	estado smallint not null foreign key references EstadoCaso(id),
	tipo smallint not null foreign key references TipoCaso(id),
	prioridad smallint not null foreign key references Prioridad(id),
)

CREATE TABLE Cotizacion(
	numero varchar(6) not null primary key,
	nombreOportunidad varchar(15) not null,
	fecha date not null,
	nombreCuenta varchar(20) not null foreign key references Cliente(nombreDeUsuario),
	mesAnnoProyectado varchar(7) not null,
	asesor smallint not null foreign key references Asesor(id),
	fechaCierre date not null,
	etapa smallint not null foreign key references Etapa(ID),
	moneda smallint not null foreign key references Moneda(id),
	probabilidad smallint not null foreign key references Probabilidad(id),
	ordenCompra varchar(6) not null,
	tipo smallint not null foreign key references TipoCotizacion(ID),
	descripcion varchar(50) not null,
	zonaSector smallint not null foreign key references ZonaSector(id),
	contacto varchar(20) not null foreign key references Contacto(nombre),
	numeroFactura varchar(10) not null,
	inflacion smallint not null foreign key references Inflacion(id)
)

CREATE TABLE Ejecucion(
	ID smallint not null primary key,
	departamento smallint not null foreign key references Departamento(id),
	numeroCotizacion varchar(6) not null foreign key references Cotizacion(numero),
	propietario varchar(20) not null,
	nombre varchar(20) not null,
	fecha date not null,
	nombreDeCuenta varchar(20) not null foreign key references Cliente(nombreDeUsuario),
	mesAnnoProyectadoCierre varchar(7) not null,
	asesor varchar(10) foreign key references Usuario(cedula),
	fechaCierre date not null
)

create table cotizacionDenegada(
	id smallint not null primary key,
	razon varchar(30) not null,
)

create table cotizacionContraQuien(
	id smallint not null primary key,
	nombre varchar(20) not null foreign key references Cliente(nombreDeUsuario)
)

create table Tarea(
	id smallint not null primary key,
	estado varchar(10) not null,
	fechaCreacion date not null,
	fechaFinal date not null,
	info varchar(30) not null
)

create table TareaXContacto(
	contacto varchar(20) not null foreign key references Contacto(nombre),
	tarea smallint  not null foreign key references Tarea(id),
	primary key(contacto, tarea)
)

create table PropietarioEjecucion(
	id smallint not null primary key,
	nombre varchar(20) not null
)

create table TareaXEjecucion(
    ejecucion smallint not null foreign key references Ejecucion (ID), 
	tarea smallint not null foreign key references Tarea(id),
	primary key(ejecucion,tarea)
)

create table ActividadesXEjecucion(
    ejecucion smallint not null foreign key references Ejecucion (ID), 
	actividad smallint not null foreign key references Actividad(id),
	primary key(ejecucion,actividad)
)

create table ProductoXCotizacion(
	codigoProducto varchar(10) not null foreign key references Producto(codigo),
	cantidad int not null,
	precioNegociado decimal(9,2) not null,
	cotizacion varchar(6) not null foreign key references Cotizacion(numero),
	primary key(codigoProducto, cotizacion)
)

create table TareaXCotizacion(
	numeroCotizacion varchar(6) not null foreign key references Cotizacion(numero),
	tarea smallint not null foreign key references Tarea(id)
	primary key(numeroCotizacion, tarea)
)

create table ActividadXCotizacion(
	numeroCotizacion varchar(6) not null foreign key references Cotizacion(numero),
	actividad smallint not null foreign key references Actividad(id)
	primary key(numeroCotizacion, actividad)
)

create table ValorPresenteCotizaciones(
	nombreOportunidad varchar(15) not null,
	fechaCotizacion date not null,
	totalCotizacion decimal(9,2) not null,
	totalPresente decimal(9,2) not null,
	numeroCotizacion varchar(6) not null foreign key references Cotizacion(numero),
	nombreContacto varchar(20) not null foreign key references Contacto(nombre),
	nombreCuenta varchar(20) not null foreign key references Cliente(nombreDeUsuario),
)

