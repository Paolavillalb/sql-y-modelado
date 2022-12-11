
create schema paola_villalba_practica authorization gimvedtb;

-- empezamos con Grupo empresarial -----

create table paola_villalba_practica.grupo_empresarial(
	id_grupo varchar (20) not null, --PK
	nombre varchar(200) not null, 
	descripcion varchar(512) null 
);

alter table paola_villalba_practica.grupo_empresarial
add constraint id_grupo_PK primary key (id_grupo);

-- Marcas de Marca --

create table paola_villalba_practica.marca(
	id_marca varchar (20) not null, --PK 
	nombre varchar(200) not null, 
	descripcion varchar(512) null 

);

alter table paola_villalba_practica.marca
add constraint id_marca_PK primary key (id_marca);


-- tabla modelos

create table paola_villalba_practica.modelos(
	id_modelos varchar(20) not null, --PK 
	modelos varchar(200) not null 

);

alter table paola_villalba_practica.modelos
add constraint id_modelos_PK primary key (id_modelos);

-- tabla color

create table paola_villalba_practica.colores(
	id_color varchar(20) not null, --PK 
	nombre varchar(200) not null

);

alter table paola_villalba_practica.colores
add constraint id_color_PK primary key (id_color);

-- tabla aseguradora

create table paola_villalba_practica.aseguradora(
	id_aseguradora varchar(20) not null, --PK 
	nombre varchar(200) not null

);

alter table paola_villalba_practica.aseguradora
add constraint id_aseguradora_PK primary key (id_aseguradora);

-- tabla poliza

create table paola_villalba_practica.poliza(
	id_poliza varchar(20) not null, --PK  
	fecha_inicio date not null, 
	fecha_fin date null,
	id_aseguradora varchar(20) not null -- FK

);

alter table paola_villalba_practica.poliza
add constraint id_poliza_PK primary key (id_poliza);

alter table paola_villalba_practica.poliza
add constraint id_aseguradora_FK foreign key (id_aseguradora)
references paola_villalba_practica.aseguradora (id_aseguradora);

-- tabla importe

create table paola_villalba_practica.importe(
	id_importe varchar(20) not null, --PK 
	tipo varchar(200) not null
);

alter table paola_villalba_practica.importe
add constraint id_importe_PK primary key (id_importe);


-- TABLA Modelo

create table paola_villalba_practica.modelo(
	id_modelo varchar(20) not null, --PK 
	id_modelos varchar(200) not null,--FK
	id_marca varchar(200) not null, -- FK 
	id_grupo varchar(200)  not null --FK

);

alter table paola_villalba_practica.modelo
add constraint id_modelo_PK primary key (id_modelo);

alter table paola_villalba_practica.modelo
add constraint id_modelos_FK foreign key (id_modelos)
references paola_villalba_practica.modelos (id_modelos);

alter table paola_villalba_practica.modelo
add constraint id_marca_FK foreign key (id_marca)
references paola_villalba_practica.marca (id_marca);

alter table paola_villalba_practica.modelo
add constraint id_grupo_FK foreign key (id_grupo)
references paola_villalba_practica.grupo_empresarial (id_grupo);

-- TABLA Vehiculo

create table paola_villalba_practica.vehiculos(
	id_vehiculo varchar(20) not null, --PK 
	id_color varchar(200) not null,--FK
	matricula varchar(200) not null, 
	km_total varchar(200)  not null,
	id_aseguradora varchar (200) not null, --FK 
	id_poliza varchar (200) not null, --FK 
	fecha_compra date not null

);

alter table paola_villalba_practica.vehiculos
add constraint id_vehiculo_PK primary key (id_vehiculo);

alter table paola_villalba_practica.vehiculos
add constraint id_color_FK foreign key (id_color)
references paola_villalba_practica.colores (id_color);

alter table paola_villalba_practica.vehiculos
add constraint id_aseguradora_FK foreign key (id_aseguradora)
references paola_villalba_practica.aseguradora (id_aseguradora);

alter table paola_villalba_practica.vehiculos
add constraint id_poliza_FK foreign key (id_poliza)
references paola_villalba_practica.poliza (id_poliza);


-- tabla Revisiones 

create table paola_villalba_practica.revisiones(
	id_revisiones varchar(20) not null, --PK 
	id_vehiculo varchar(200) not null,
	km_revision varchar (200) not null, 
	fecha_revision date not null, 
	id_importe varchar (20)  not null
);

alter table paola_villalba_practica.revisiones
add constraint id_revisiones_PK primary key (id_revisiones);

alter table paola_villalba_practica.revisiones
add constraint id_vehiculo_FK foreign key (id_vehiculo)
references paola_villalba_practica.vehiculos (id_vehiculo);

alter table paola_villalba_practica.revisiones
add constraint id_importe_FK foreign key (id_importe)
references paola_villalba_practica.importe (id_importe);


-- CARGAMOS LOS DATOS ...

insert into paola_villalba_practica.grupo_empresarial 
(id_grupo, nombre, descripcion)
values(1, 'BMW', ' ');
insert into paola_villalba_practica.grupo_empresarial 
(id_grupo, nombre, descripcion)
values(2, 'PSA', ' ');
insert into paola_villalba_practica.grupo_empresarial 
(id_grupo, nombre, descripcion)
values(3, 'Honda', ' ');
insert into paola_villalba_practica.grupo_empresarial 
(id_grupo, nombre, descripcion)
values(4, 'Hyundai', ' ');

-- cargamos tabla marca 

insert into paola_villalba_practica.marca 
(id_marca, nombre)
values( 1, 'BMW');
insert into paola_villalba_practica.marca 
(id_marca, nombre)
values(2, 'Mini');
insert into paola_villalba_practica.marca 
(id_marca, nombre)
values(3, 'Roll-Royce');
insert into paola_villalba_practica.marca 
(id_marca, nombre)
values(4, 'Honda');
insert into paola_villalba_practica.marca 
(id_marca, nombre)
values(5, 'Kia');
insert into paola_villalba_practica.marca 
(id_marca, nombre)
values(6, 'Hyundai');
insert into paola_villalba_practica.marca 
(id_marca, nombre)
values(7, '	Opel');
insert into paola_villalba_practica.marca 
(id_marca, nombre)
values(8, 'Citroen');
insert into paola_villalba_practica.marca 
(id_marca, nombre)
values(9, 'Peugeot');

--select distinct tabla modelos

insert into paola_villalba_practica.modelos
values(001, 'Modelo 1');

insert into paola_villalba_practica.modelos
values(002, 'Modelo 2');

insert into paola_villalba_practica.modelos
values(003, 'Modelo 3');

-- datos color
insert into paola_villalba_practica.colores
values(001, 'Blanco');
insert into paola_villalba_practica.colores
values(002, 'Azul');
insert into paola_villalba_practica.colores
values(003, 'Negro');
insert into paola_villalba_practica.colores
values(004, 'Rojo');

-- datos aseguradora
insert into paola_villalba_practica.aseguradora
values('A1', 'Mapfre');
insert into paola_villalba_practica.aseguradora
values('A2', 'MMT');
insert into paola_villalba_practica.aseguradora
values('A3', 'AXA');

-- datos poliza
insert into paola_villalba_practica.poliza
values(1234,'2005-03-22','2010-09-15','A1');
insert into paola_villalba_practica.poliza
values(4567, '2002-03-07', '2005-08-02', 'A3');
insert into paola_villalba_practica.poliza
values(8912, '1992-11-12', '2001-07-01', 'A2');

-- modelo 

insert into paola_villalba_practica.modelo
values(1,002, 3,1);
insert into paola_villalba_practica.modelo
values(2,002, 4,3);
insert into paola_villalba_practica.modelo
values(3,003, 5,4);
insert into paola_villalba_practica.modelo
values(4,001, 9, 2);
insert into paola_villalba_practica.modelo
values(5,001, 7, 2);
insert into paola_villalba_practica.modelo
values(6,003, 1, 1);

-- cargar importe 
insert into paola_villalba_practica.importe
values(1,'Euro');
insert into paola_villalba_practica.importe
values(2,'Dolar');
insert into paola_villalba_practica.importe
values(3,'Libra');

-- CARGAR VEHICULO 

insert into paola_villalba_practica.vehiculos 
values(1, 002, '2862K', 35600, 'A1', 8912, '1890-11-07');
insert into paola_villalba_practica.vehiculos 
values(2, 001, '8943N', 25000, 'A3', 1234, '2010-11-07');
insert into paola_villalba_practica.vehiculos 
values(3, 002, '1234P', 100000, 'A2', 4567, '2008-12-27');
insert into paola_villalba_practica.vehiculos 
values(4, 003, '9002K', 50200, 'A1', 8912, '1986-12-06');
insert into paola_villalba_practica.vehiculos 
values(5, 004, '2367L', 120000, 'A3',1234, '2000-11-07');
insert into paola_villalba_practica.vehiculos 
values(6, 002, '2762K', 63000, 'A1', 8912, '1990-11-07');

-- cargar revisiones
insert into paola_villalba_practica.revisiones 
values('R001',2, 30000, '2012-02-22',1 );
insert into paola_villalba_practica.revisiones 
values('R002',4, 50000, '2001-08-02',3 );
insert into paola_villalba_practica.revisiones 
values('R003',1, 70000, '2000-10-09',3 );
insert into paola_villalba_practica.revisiones 
values('R004',3, 120000, '2015-12-02',2 );
insert into paola_villalba_practica.revisiones 
values('R005',6, 130000, '2005-09-02',1 );
insert into paola_villalba_practica.revisiones 
values('R006',5, 160000, '2010-05-02',1 );


--select* from paola_villalba_practica.revisiones

