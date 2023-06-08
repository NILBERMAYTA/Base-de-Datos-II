-- Creacion de la base de datos

create database DefensaH4;
use DefensaH4;

-- Creacion de las tablas solicitdas

create table departamento(
    id_dep int auto_increment primary key not null ,
    nombre varchar(50) not null
);

create table provincia(
    id_prov int auto_increment primary key not null ,
    nombre varchar(50) not null,
    id_dep int not null ,
    foreign key (id_dep) references departamento(id_dep)
);

create table persona(
    id_per int auto_increment primary key not null ,
    nombre varchar(20)not null ,
    apellidos varchar(50) not null ,
    fecha_nac date not null ,
    edad int not null ,
    email varchar(50) not null ,
    id_dep int not null ,
    id_pov int not null ,
    foreign key (id_dep) references departamento (id_dep),
    foreign key (id_pov) references provincia (id_prov),
    sexo char not null
);

create table proyecto(
    id_proy int auto_increment primary key not null ,
    nombreProy varchar(100) not null ,
    tipoProy varchar(30)not null
);

create table detalle_proyecto(
    id_dp int auto_increment primary key not null ,
    id_per int not null ,
    id_proy int not null ,
    foreign key (id_per) references persona (id_per),
    foreign key (id_proy) references proyecto (id_proy)
);

-- Insercion de registros en las tablas

insert into departamento (nombre)
values ('La Paz'),
       ('Cochabamba');

insert into provincia (nombre, id_dep)
values ('Yungas',1),
       ('Quillacollo',2);

insert into persona (nombre, apellidos, fecha_nac, edad, email, id_dep, id_pov, sexo)
values ('Juan', 'García', '1990-05-10', 33, 'juan.garcia@example.com', 1, 1, 'M'),
       ('María', 'López', '1985-12-15', 38, 'maria.lopez@example.com', 2, 2, 'F');

insert into proyecto (nombreProy, tipoProy)
values ('Proyecto de Marketing', 'Publicidad'),
       ('Proyecto de Desarrollo', 'Tecnología');

insert into detalle_proyecto (id_per, id_proy)
values (1,1),
       (2,2);

-- Crear una función que sume los valores de la serie Fibonacc

-- Creacion de la serie fibonacci

create or replace function  serie_fibonacci(num int)
    returns text
begin
    declare a int default 0;
    declare b int default 1;
    declare resp text default '';

    while num>0 do
            set resp = concat(resp,a,',');
            set b = a + b;
            set a = b - a;
            set num = num - 1;
        end while;
    return resp;
end;

select serie_fibonacci(7);

-- creacion de la suma de la serie fibonacci

create or replace function  suma_serie_fibonacci(Limite int)
    returns int
begin
    declare resp int default 0;
    declare cont int default 1;
    declare aux char default '';
    declare num int default 0;
    declare fibonacci text;
    set fibonacci = serie_fibinacci(Limite);

    while (cont <= length(fibonacci)) do
            set aux = substr(fibonacci, cont, 1);
            if (aux not in (','))then
                set num = cast(aux as unsigned);
                set resp = resp + num;
            end if;
            set cont = cont + 1;
        end while;

    return resp;
end;

select suma_serie_fibonacci(7);

-- Manejo de vistas

-- creacion de la consulta

select concat(pe.nombre,' ',pe.apellidos) as fullname,pe.edad,pe.fecha_nac,pro.nombreProy
from persona as pe
    inner join detalle_proyecto det on pe.id_per = det.id_per
    inner join proyecto pro on det.id_proy = pro.id_proy
    inner join departamento dep on pe.id_dep = dep.id_dep
where pe.sexo = 'F' and dep.nombre = 'El Alto' and pe.fecha_nac = '2000-10-10';

-- Crecion de la vista

create or replace view DatosPersonales as
select concat(pe.nombre,' ',pe.apellidos) as fullname,pe.edad,pe.fecha_nac,pro.nombreProy
from persona as pe
         inner join detalle_proyecto det on pe.id_per = det.id_per
         inner join proyecto pro on det.id_proy = pro.id_proy
         inner join departamento dep on pe.id_dep = dep.id_dep
where pe.sexo = 'F' and dep.nombre = 'El Alto' and pe.fecha_nac = '2000-10-10';

select *
from datospersonales as date;

-- creacion de la nueva columna de la tabla proyecto

alter table proyecto
add column (estado text);

-- creacion de triguer para INSERT

create or replace trigger tr_insert
    before insert
    on proyecto
    for each row
begin
    if NEW.tipoProy in ('EDUCACION','FORESTACION','CULTURA') then
        set NEW.estado = 'ACTIVO';
    else
        set NEW.estado = 'INACTIVO';
    end if;
end;

-- creacion de triguer para UPDATE

create or replace trigger tr_update
    before update
    on proyecto
    for each row
begin
    if NEW.tipoProy in ('EDUCACION','FORESTACION','CULTURA') then
        set NEW.estado = 'ACTIVO';
    else
        set NEW.estado = 'INACTIVO';
    end if;
end;

insert into proyecto (nombreProy, tipoProy)
values ('Talacion de arboles','EUDUCACION');

insert into proyecto (nombreProy, tipoProy)
values ('Construccion de puentes','CIVIL');

select *
from proyecto;

update proyecto set tipoProy = 'CULTURA' where id_proy = 2;

select *
from proyecto;

-- calcular edad mediante un triguer

create or replace trigger tr_calculaEdad
    before insert
    on persona
    for each row
begin
    declare edad int default timestampdiff(YEAR, New.fecha_nac,curdate());

    set NEW.edad = edad;

end;

insert into persona (nombre, apellidos, fecha_nac, edad, email, id_dep, id_pov, sexo)
values ('Nilber','Mayta','2003-08-18',1,'nilber@gmail.com',1,1,'M');

select *
from persona;

create table copia_persona(
        nombre varchar(20)not null ,
        apellidos varchar(50) not null ,
        fecha_nac date not null ,
        edad int not null ,
        email varchar(50) not null ,
        id_dep int not null ,
        id_pov int not null ,
        sexo char not null
);

create or replace trigger tr_CopiaPersona
    before insert
    on persona
    for each row
begin
    insert into copia_persona(nombre, apellidos, fecha_nac, edad, email, id_dep, id_pov, sexo)
        select NEW.nombre,NEW.apellidos,NEW.fecha_nac,NEW.edad,NEW.email,new.id_dep,NEW.id_pov,NEW.sexo;
end;


insert into persona(nombre, apellidos, fecha_nac, edad, email, id_dep, id_pov, sexo)
values ('Luis','MAMANI','2004-05-12',18,'juan@gmail.com',2,2,'M');

select *
from copia_persona;


select concat(pe.nombre,' ',pe.apellidos)as fullname,dep.nombre,prov.nombre,pro.tipoProy
from persona as pe
         inner join detalle_proyecto det on pe.id_per = det.id_per
         inner join proyecto pro on det.id_proy = pro.id_proy
         inner join departamento dep on pe.id_dep = dep.id_dep
         inner join provincia prov on dep.id_dep = prov.id_dep;


create or replace view ConsultaGeneral as
select concat(pe.nombre,' ',pe.apellidos)as fullname,dep.nombre as departamento,prov.nombre as provincia,pro.tipoProy as tipo
from persona as pe
         inner join detalle_proyecto det on pe.id_per = det.id_per
         inner join proyecto pro on det.id_proy = pro.id_proy
         inner join departamento dep on pe.id_dep = dep.id_dep
         inner join provincia prov on dep.id_dep = prov.id_dep;

select * from ConsultaGeneral;
