create database empresa;
use empresa;

create table  empleado
(
    CI varchar(15) primary key not null,
    nombre varchar (20) not null ,
    ap_paterno varchar (20) not null ,
    ap_mayetno varchar (20) not null
);

create table area
(
    id_area integer auto_increment primary key not null ,
    nombre varchar(30)not null,
    CI varchar(15),
    foreign key (CI) references empleado(CI)
);

create table empresa
(
    nit varchar (10) primary key not null ,
    nombre varchar(20) not null ,
    ubicacion varchar (20) not null,
    id_area integer,
    foreign key (id_area) references area(id_area)
)