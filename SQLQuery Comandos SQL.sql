-- COMANDOS EN SQL SERVER
--Creacion de base datos
CREATE DATABASE Principal
-- Llamar base datos
use Principal
--Creacion de una tabla
create table Empleados(
idempleado int,
nombre varchar (20),
apellido varchar (30),
edad numeric(2),
telefono numeric (10),
direccion varchar (100),
fecha_nacimiento date,
salario decimal (18,2),
activo char(2)
);
-- Metadatos de la tabla
exec sp_help empleados;
--Insertar datos en tabla
insert into Empleados values(
1,'Rodrigo', 'Tenorio', 15, 9152918,'La Molina','2023-06-17',12354.00, 'SI'); 
--SELECIONAR DATOS
SELECT *FROM Empleados
--Concultar las tablas creadas en nuestra DB Empleados
select* from sys.tables;
--Seleccionar columnas especificas
select nombre, apellido from Empleados
--Renombrar el nombre de tabla
exec sp_rename 'Usuarios', 'Empleados';
--	Crear una DB, crear y borrar una tabla
create database Prueba2
use Prueba2
create table Prueba2(
campo int);
drop table Prueba2
--insertar datos de una fuente externa
 insert into empleados values (1, 'Juan', 'Pérez', 25, 1234567890, 'Calle 123', '1978-06-15', 2500.00, 'SI');
  insert into empleados values (2, 'María', 'López', 30, 9876543210, 'Avenida 456', '1980-03-20', 3000.00, 'SI');
  insert into empleados values (3, 'Carlos', 'González', 28, 5555555555, 'Calle 789', '1979-11-10', 2800.00, 'SI');
  insert into empleados values (4, 'Ana', 'Martínez', 35, 9998887770, 'Avenida 012', '1977-09-05', 3500.00, 'SI');
  insert into empleados values (5, 'Pedro', 'Sánchez', 22, 1112223334, 'Calle 567', '1980-01-25', 2000.00, 'SI');
  insert into empleados values (6, 'Laura', 'Ramírez', 31, 4444444444, 'Avenida 890', '1978-07-12', 3200.00, 'SI');
  insert into empleados values (7, 'Luis', 'Torres', 29, 7777777777, 'Calle 345', '1979-04-18', 2700.00, 'SI');
  insert into empleados values (8, 'Carmen', 'Hernández', 27, 6666666666, 'Avenida 678', '1980-02-03', 2600.00, 'SI');
  insert into empleados values (9, 'Jorge', 'García', 33, 2223334445, 'Calle 901', '1977-12-27', 3400.00, 'SI');
  insert into empleados values (10, 'Silvia', 'Lara', 24, 8889990000, 'Avenida 234', '1980-05-09', 2200.00, 'SI');
  insert into empleados values (11, 'Roberto', 'Rojas', 26, 3334445556, 'Calle 567', '1979-02-14', 2400.00, 'SI');
  insert into empleados values (12, 'Patricia', 'Cruz', 32, 2223334444, 'Avenida 890', '1978-08-21', 3100.00, 'SI');
  insert into empleados values (13, 'Daniel', 'Gómez', 29, 5556667778, 'Calle 123', '1979-06-06', 2800.00, 'SI');
  insert into empleados values (14, 'Sara', 'Vargas', 34, 6667778889, 'Avenida 456', '1977-04-01', 3300.00, 'SI');
  insert into empleados values (15, 'Hugo', 'Orozco', 23, 9998887776, 'Calle 789', '1980-03-16', 2100.00, 'SI');

 -- Verificar datos en table
 select * from Empleados
-- Clausuala whre
select * from empleados  where apellido= 'Tenorio'
select nombre, apellido,edad from Empleados where edad<30
-- Borrar registro especificos
delete from Empleados where nombre = 'Juan';
-- borrar todos los registros
delete from Empleados;
-- incluir y eliminar un campo adicional en tabla
alter table Empleados add sexo char (1)
alter table Empleados drop column sexo
--operadores relacionales
-- =, <>, >,<; <=,
select* from empleados where edad <> 25
select *from empleados where salario>2000
-- Anular lineas de codigo y delimitar 
/* select from empleados
where edad > 25; */;
/* Habilitar lineas de codigo
tools, options, text edito, general, line number*/

--renombrar nombre de un campo 
exec sp_rename 'Empleados.idempleado', 'id'
select *from empleados
--renombrar varios campos
exec sp_rename 'Empleados.id', 'ID'
exec sp_rename 'Empleados.nombre', 'NOMBRE'
exec sp_rename 'Empleados.apellido', 'APELLIDO'
exec sp_rename 'Empleados.edad', 'EDAD'
exec sp_rename 'Empleados.telefono', 'TELEFONO'
exec sp_rename 'Empleados.direccion', 'DIRECCION'
exec sp_rename 'Empleados.fecha_nacimiento', 'FECHA_NACIMIENTO'
exec sp_rename 'Empleados.salario', 'SALARIO'
exec sp_rename 'Empleados.activo', 'ACTIVO'
-- modificar campo especifico con update
update empleados set Direccion = 'Chorrillos'
where id= 1
-- modificar campo y fila especifico con update
update empleados set edad = 22
where id in (3,7,9)
-- utilizando la instruccion inn
select *from empleados where edad in (24,26)
delete from empleados where apellido in ('Lara')
--INSERTAR DATOS DESDE OTRA TABLA
create table salarios(
nombre varchar (20),
apellido varchar (30),
salario decimal(18,2));
Insert into salarios (nombre,apellido,salario)
select nombre,apellido,salario from Empleados;

select * from salarios

Insert into salarios (nombre,apellido,salario)
select nombre,apellido,salario from Empleados
where salario > 3000;

select * from salarios

-- SELECCIONAR TOPS Y PORCENTAJES
select top 5 * from empleados;
select top 10 percent * from empleados;

select top 3 * from empleados
where activo='NO';

select * from empleados
-- LA NULIDAD NULL
Create table clientes(
idclientes int,
nombre varchar (10),
apellido varchar (20),
direccion varchar (100),
);

insert into clientes values(1,'Juan','Perez','Calle A, Ciudad');
insert into clientes values(2, 'Maria', NULL, 'Calle B Ciudad');
insert into clientes values(3,'Carlos','Lopez', NULL);
insert into clientes values(4, NULL, 'Rodriguez', 'Calle D Ciudad');
insert into clientes values(5,'Pedro', NULL, NULL);
insert into clientes values(6,NULL ,NULL,  'Calle D Ciudad');
insert into clientes values(7,'Luis','Gonzales', 'Calle G Ciudad');
insert into clientes values(8, NULL, 'Diaz', NULL);
insert into clientes values(9,'Jorge', NULL,' Calle I Ciudad');
insert into clientes values(10,NULL, NULL, NULL);
insert into clientes values(11,'Ana', 'Hernandez', 'Calle M Ciudad');
insert into clientes values(12,NULL, NULL, 'Calle M Ciudad'); 
insert into clientes values(13,NULL, 'Sanchez', NULL);
insert into clientes values(14,'Sofía', NULL, 'Calle M Ciudad');
insert into clientes values(15,NULL, NULL,  'Calle P Ciudad');
insert into clientes values(16,'Daniel', 'Garcia', NULL);
insert into clientes values(17,'Martha','Fernandez', NULL);
insert into clientes values(18,NULL, 'Martinez',  'Calle Q Ciudad');
insert into clientes values(19,'Pablo', NULL, NULL);
insert into clientes values(20, NULL, 'Lopez', 'Calle S Ciudad');

select * from clientes
select * from clientes where nombre is null
select * from clientes where nombre is not null
 update clientes set direccion = 'no tiene' where direccion is null;
select * from clientes

-- CONSTRAINTS - PRIMARY KEY
create table Personas(
idpersona int primary key,
nombre varchar(10) not null,
edad int not null);

insert into Personas values  (1,'jose', 50);
select * from Personas

-- CONSTRAINTS UNIQUE
create table Personas(
idpersona int not null,
clave varchar (10),
nombre varchar(10),
edad int,
constraint UQ_idpersona unique (idpersona),
constraint UQ_clave unique (clave)
);

insert into personas values (1,'claves1,'Alberto',30)
insert into personas values (1,'claves1,'Alberto', 30)

-- CONSTRAINTS - IDENTITY
create table Libros(
codigo int identity,
titulo varchar (60) not null,
autor varchar (60) not null,
);
insert into Libros values ('Cien años', 'Garcia Marquez')
insert into Libros values ('pepito', 'marco pepito')

select * from Libros
-- varia el rango de incremento de la tabla
create table Libros(
codigo int identity (19,5),
titulo varchar (60) not null,
autor varchar (60) not null,
);
insert into Libros values ('Cien años', 'Garcia Marquez')
insert into Libros values ('pepito', 'marco pepito')

select * from Libros

-- CONSTRAINTS FOREIGN KEY (Restriccion llave foranea)
create table clientes(
id_cliente int,
nombre varchar (20) not null,
apellido varchar (20) not null,
edad int not null
constraint PK_clientes primary key (id_cliente)
);














