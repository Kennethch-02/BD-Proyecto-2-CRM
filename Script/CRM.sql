-- CREACION DE LA BASE DE DATOS --
IF not exists (SELECT [name] FROM sys.databases WHERE [name] = N'SistemaCRM')
BEGIN
	CREATE DATABASE SistemaCRM
END;

-- DROP TABLES --

use SistemaCRM

go

if OBJECT_id(N'valorPresenteCotizaciones', N'U') IS NOT NULL
	DROP table valorPresenteCotizaciones
go

if OBJECT_id(N'actividadXcotizacion', N'U') IS NOT NULL
	DROP table actividadXcotizacion
go

if OBJECT_id(N'tareaXcotizacion', N'U') IS NOT NULL
	DROP table tareaXcotizacion
go

if OBJECT_id(N'productoXcotizacion', N'U') IS NOT NULL
	DROP table productoXcotizacion
go

if OBJECT_id(N'actividadXejecucion', N'U') IS NOT NULL
	DROP table actividadXejecucion
go

if OBJECT_id(N'tareaXejecucion', N'U') IS NOT NULL
	DROP table tareaXejecucion
go

if OBJECT_id(N'propietarioEjecucion', N'U') IS NOT NULL
	DROP table propietarioEjecucion
go

if OBJECT_id(N'tareaXcontacto', N'U') IS NOT NULL
	DROP table tareaXcontacto
go

if OBJECT_id(N'cotizacionContraQuien', N'U') IS NOT NULL
	DROP table cotizacionContraQuien
go

if OBJECT_id(N'cotizacionEstado', N'U') IS NOT NULL
	DROP table cotizacionEstado
go

if OBJECT_id(N'Tarea', N'U') IS NOT NULL
	DROP table Tarea
go

if OBJECT_id(N'Ejecucion', N'U') IS NOT NULL
	DROP table Ejecucion
go

if OBJECT_id(N'Cotizacion', N'U') IS NOT NULL
	DROP table Cotizacion
go

if OBJECT_id(N'Caso', N'U') IS NOT NULL
	DROP table Caso
go

if OBJECT_id(N'Producto', N'U') IS NOT NULL
	DROP table Producto
go

if OBJECT_id(N'Familia', N'U') IS NOT NULL
	DROP table Familia
go

if OBJECT_id(N'Producto', N'U') IS NOT NULL
	DROP table Producto
go

if OBJECT_id(N'Contacto', N'U') IS NOT NULL
	DROP table Contacto
go

if OBJECT_id(N'Cliente', N'U') IS NOT NULL
	DROP table Cliente
go

if OBJECT_id(N'Asesor', N'U') IS NOT NULL
	DROP table Asesor
go

if OBJECT_id(N'Usuario', N'U') IS NOT NULL
	DROP table Usuario
go

if OBJECT_id(N'Departamento', N'U') IS NOT NULL
	DROP table Departamento
go

if OBJECT_id(N'rolXoperaciones', N'U') IS NOT NULL
	DROP table rolXoperaciones
go

if OBJECT_id(N'Moneda', N'U') IS NOT NULL
	DROP table Moneda
go

if OBJECT_id(N'zonaSector', N'U') IS NOT NULL
	DROP table zonaSector
go

if OBJECT_id(N'Actividad', N'U') IS NOT NULL
	DROP table Actividad
go

if OBJECT_id(N'Modulo', N'U') IS NOT NULL
	DROP table Modulo
go

if OBJECT_id(N'tipoContacto', N'U') IS NOT NULL
	DROP table tipoContacto
go

if OBJECT_id(N'tipoCaso', N'U') IS NOT NULL
	DROP table tipoCaso
go

if OBJECT_id(N'Prioridad', N'U') IS NOT NULL
	DROP table Prioridad
go

if OBJECT_id(N'estadoCaso', N'U') IS NOT NULL
	DROP table estadoCaso
go

if OBJECT_id(N'estadoContacto', N'U') IS NOT NULL
	DROP table estadoContacto
go

if OBJECT_id(N'Probabilidad', N'U') IS NOT NULL
	DROP table Probabilidad
go

if OBJECT_id(N'Operaciones', N'U') IS NOT NULL
	DROP table Operaciones
go

if OBJECT_id(N'Etapa', N'U') IS NOT NULL
	DROP table Etapa
go

if OBJECT_id(N'tipoCotizacion', N'U') IS NOT NULL
	DROP table tipoCotizacion
go

if OBJECT_id(N'nombreCuenta', N'U') IS NOT NULL
	DROP table nombreCuenta
go

if OBJECT_id(N'Inflacion', N'U') IS NOT NULL
	DROP table Inflacion
go

if OBJECT_id(N'Rol', N'U') IS NOT NULL
	DROP table Rol
go

create table Departamento(
	id smallint not null primary key,
	nombre varchar(15) not null
);

CREATE TABLE Rol(
	id smallint not null primary key,
	tipo varchar(15) not null,
);

create table Moneda(
	id smallint not null primary key,
	nombre varchar(15) not null
);

create table zonaSector(
	id smallint not null primary key,
	zona varchar(20) not null,
	sector varchar(20) not null
);

create table Actividad(
	id smallint not null primary key,
	descripcion varchar(50) not null,
	fechaInicio date not null,
	fechaFinal date not null
);

-- Tipo de modulo --
create table Modulo(
	id smallint not null primary key,
	tipo varchar(15) not null
);

-- Tipo de contacto --
create table tipoContacto(
	id smallint not null primary key,
	tipo varchar(15) not null
);

-- Tipo de caso --
create table tipoCaso(
	id smallint not null primary key,
	tipo varchar(15) not null
);

-- Prioridad del caso --
create table Prioridad(
	id smallint not null primary  key,
	prioridad varchar(10) not null
);

-- Estado del caso --
create table estadoCaso(
	id smallint not null primary key,
	estado varchar(10) not null
);


-- Estado del contacto --
create table estadoContacto(
	id smallint not null primary key,
	estado varchar(10) not null
);

create table Probabilidad(
	id smallint not null primary key,
	porcentaje smallint not null,
);

create table Operaciones(
	id smallint not null primary key,
	nombre varchar(20) not null,
	modulo smallint not null foreign key references Modulo(id)
);

create table rolXoperaciones(
	id smallint not null primary key,
	rol smallint not null foreign key references Rol(id),
	modulo smallint not null foreign key references Operaciones(id)
);

create table Etapa(
	id smallint not null primary key,
	etapa varchar(15) not null,
);

create table tipoCotizacion(
	id smallint not null primary key,
	tipo varchar(20) not null
);

create table nombreCuenta(
	id smallint not null primary key,
	nombre varchar(20) not null
);

create table Inflacion(
	id smallint not null primary key,
	porcentaje int not null check (porcentaje between 0 and 100)
);

CREATE TABLE Usuario(
	cedula varchar(10) not null primary key,
	nombre varchar(20) not null,
	apellidos varchar(40) not null,
	departamento smallint not null foreign key references Departamento(id),
	clave varchar(10) not null,
	rol smallint not null foreign key references Rol(id)
);

create table Asesor(
	id smallint not null primary key,
	cedula varchar(10) not null foreign key references Usuario(cedula),
);

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
	zonaSector smallint not null foreign key references zonaSector(id)
);

CREATE TABLE Contacto(
	cliente varchar(20) not null foreign key references Cliente(nombreDeUsuario),
	tipo smallint not null foreign key references tipoContacto(id),
	motivo varchar(30) not null,
	nombre varchar(20) not null primary key,
	telefono varchar(15) not null,
	correoElectronico varchar(30) not null,
	estado smallint not null foreign key references estadoContacto(id),
	direccion varchar(20) not null,
	zonaSector smallint not null foreign key references zonaSector(id),
	asesor smallint not null foreign key references Asesor(id),
	descripcion varchar(50) not null,
	idModulo smallint not null foreign key references Modulo(id)
);

CREATE TABLE Familia(
	codigo varchar(10) not null primary key,
	nombre varchar(20) not null,
	descripcion varchar(50) not null
);

CREATE TABLE Producto(
	codigo varchar(10) not null primary key,
	nombre varchar(20) not null,
	activo smallint not null check (activo between 0 and 1),
	descripcion varchar(50) not null,
	familia varchar(10) not null foreign key references Familia(codigo),
	precioEstandar decimal(9,2) not null	
);

CREATE TABLE Caso(
	propietario varchar(20) not null foreign key references Cliente(nombreDeUsuario),
	origen varchar(15) not null,
	nombreDeCuenta smallint not null foreign key references nombreCuenta(id),
	numeroProyecto varchar(15) not null primary key,
	nombreContacto varchar(20) not null foreign key references Contacto(nombre),
	asunto varchar(20) not null,
	direccion varchar(30) not null,
	descripcion varchar(50) not null,
	estado smallint not null foreign key references estadoCaso(id),
	tipo smallint not null foreign key references tipoCaso(id),
	prioridad smallint not null foreign key references Prioridad(id),
);
create table cotizacionEstado(
	id smallint not null primary key,
	razon varchar(30) not null,
);
CREATE TABLE Cotizacion(
	numero varchar(6) not null primary key,
	nombreOportunidad varchar(15) not null,
	fecha date not null,
	nombreCuenta varchar(20) not null foreign key references Cliente(nombreDeUsuario),
	mesAñoProyectado varchar(7) not null,
	asesor smallint not null foreign key references Asesor(id),
	fechaCierre date not null,
	etapa smallint not null foreign key references Etapa(id),
	moneda smallint not null foreign key references Moneda(id),
	probabilidad smallint not null foreign key references Probabilidad(id),
	ordenCompra varchar(6) not null,
	tipo smallint not null foreign key references tipoCotizacion(id),
	descripcion varchar(50) not null,
	zonaSector smallint not null foreign key references zonaSector(id),
	contacto varchar(20) not null foreign key references Contacto(nombre),
	numeroFactura varchar(10) not null,
	estado smallint not null foreign key references cotizacionEstado(id),
	inflacion smallint not null foreign key references Inflacion(id)
);
create table propietarioEjecucion(
	id smallint not null primary key,
	nombre varchar(20) not null
);
CREATE TABLE Ejecucion(
	id smallint not null primary key,
	departamento smallint not null foreign key references Departamento(id),
	numeroCotizacion varchar(6) not null foreign key references Cotizacion(numero),
	propietario smallint not null foreign key references propietarioEjecucion(id),
	nombre varchar(20) not null,
	fecha date not null,
	nombreDeCuenta varchar(20) not null foreign key references Cliente(nombreDeUsuario),
	mesAnnoProyectadoCierre varchar(7) not null,
	asesor varchar(10) foreign key references Usuario(cedula),
	fechaCierre date not null
);


create table cotizacionContraQuien(
	id smallint not null primary key,
	nombre varchar(20) not null foreign key references Cliente(nombreDeUsuario)
);

create table Tarea(
	id smallint not null primary key,
	estado varchar(10) not null,
	fechaCreacion date not null,
	fechaFinal date not null,
	info varchar(30) not null
);

create table tareaXcontacto(
	contacto varchar(20) not null foreign key references Contacto(nombre),
	tarea smallint  not null foreign key references Tarea(id),
	primary key(contacto, tarea)
);



create table tareaXejecucion(
    ejecucion smallint not null foreign key references Ejecucion (id), 
	tarea smallint not null foreign key references Tarea(id),
	primary key(ejecucion,tarea)
);

create table actividadXejecucion(
    ejecucion smallint not null foreign key references Ejecucion (id), 
	actividad smallint not null foreign key references Actividad(id),
	primary key(ejecucion,actividad)
);

create table productoXcotizacion(
	codigoProducto varchar(10) not null foreign key references Producto(codigo),
	cantidad int not null,
	precioNegociado decimal(9,2) not null,
	cotizacion varchar(6) not null foreign key references Cotizacion(numero),
	primary key(codigoProducto, cotizacion)
);

create table tareaXcotizacion(
	numeroCotizacion varchar(6) not null foreign key references Cotizacion(numero),
	tarea smallint not null foreign key references Tarea(id)
	primary key(numeroCotizacion, tarea)
);

create table actividadXcotizacion(
	numeroCotizacion varchar(6) not null foreign key references Cotizacion(numero),
	actividad smallint not null foreign key references Actividad(id)
	primary key(numeroCotizacion, actividad)
);

create table valorPresenteCotizaciones(
	nombreOportunidad varchar(15) not null,
	fechaCotizacion date not null,
	totalCotizacion decimal(9,2) not null,
	totalPresente decimal(9,2) not null,
	numeroCotizacion varchar(6) not null foreign key references Cotizacion(numero),
	nombreContacto varchar(20) not null foreign key references Contacto(nombre),
	nombreCuenta varchar(20) not null foreign key references Cliente(nombreDeUsuario),
);
GO

--Procedimientos Almacenados
--- EJEMPLOOO
CREATE PROCEDURE uspCalcVelocity
                 @distance float,
                 @time float,
                 @velocity float OUTPUT
AS
IF (@time = 0.00)
BEGIN
   -- we can't divide by zero, so assume time is 1 hour
   Select @time = 1;
   SELECT @velocity = @distance / @time;
END
IF (@time = 1.00)
BEGIN
   -- we can't divide by zero, so assume time is 1 hour
   Select @time = 1;
   SELECT @velocity = @distance / @time;
END
ELSE
BEGIN
   SELECT @velocity = @distance / @time;   
END
GO

-- DESARROLLO
CREATE PROC UsuarioProc
				@cedula varchar(10),
				@nombre varchar(20),
				@apellidos varchar(40),
				@departamento smallint,
				@clave varchar(10),
				@rol smallint,
				@modo CHAR(1)
AS
if (@modo='I')
BEGIN
	INSERT Usuario VALUES (@cedula,@nombre,@apellidos,@departamento,@clave,@rol)
END
if (@modo='U')
BEGIN
	UPDATE Usuario SET cedula=@cedula,nombre=@nombre,apellidos=@apellidos,departamento=@departamento,clave=@clave,rol=@rol WHERE cedula = @cedula
END
if (@modo='D')
BEGIN
	DELETE FROM Usuario WHERE cedula = @cedula
END
GO