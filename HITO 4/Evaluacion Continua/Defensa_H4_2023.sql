create database defensa_hito4_2023;

use defensa_hito4_2023;

create table departamento(
                             id_dep int primary key,
                             nombre varchar(50)
);

create table provincia(
                          id_prov int primary key,
                          nombre varchar(50),
                          id_dep int not null ,
                          foreign key (id_dep) references departamento(id_dep)
);

create table persona(
                        id_per int primary key,
                        nombre varchar(20),
                        apellidos varchar(50),
                        fecha_nac date ,
                        edad int  ,
                        email varchar(50) ,
                        id_dep int ,
                        id_pov int ,
                        foreign key (id_dep) references departamento (id_dep),
                        foreign key (id_pov) references provincia (id_prov),
                        sexo char not null
);

create table proyecto(
                         id_proy int primary key ,
                         nombreProy varchar(100) ,
                         tipoProy varchar(30)
);

create table detalle_proyecto(
                                 id_dp int primary key  ,
                                 id_per int  ,
                                 id_proy int  ,
                                 foreign key (id_per) references persona (id_per),
                                 foreign key (id_proy) references proyecto (id_proy)
);

insert into departamento(id_dep, nombre)
values (1,'La Paz'),
       (2,'Santa Cruz');

insert into provincia(id_prov, nombre, id_dep)
values (1,'Yungas',1),
       (2,'Chiquitos',2);

insert into persona(id_per, nombre, apellidos, fecha_nac, edad, email, id_dep, id_pov, sexo)
values (1,'Pepe','Mamani','2000-09-03',23,'pepe@gmail.com',1,1,'M'),
       (2,'Maria','Torrez','2003-04-19',20,'maria@gmail.com',2,2,'F');

insert into proyecto(id_proy, nombreProy, tipoProy)
values (1,'Construccion Punete','Construccion'),
       (3,'Replantacion de arboles','Forestacion');

insert into detalle_proyecto(id_dp, id_per, id_proy)
values (1,1,1),
       (2,2,2);

create table audit_proyectos (
    id_audit int auto_increment primary key not null ,
    nombre_proy_anterior varchar(30),
    nombre_proy_posterior varchar(30),
    tipo_proy_anterior varchar(30),
    tipo_proy_posterior varchar(30),
    operation varchar(30),
    userid varchar(30),
    hostname varchar(30),
    fecha varchar(30)
);



create or replace trigger tr_audit_insert_proyecto
    after insert
    on proyecto
    for each row
begin
    insert into audit_proyectos(nombre_proy_anterior, nombre_proy_posterior, tipo_proy_anterior, tipo_proy_posterior, operation, userid, hostname, fecha)
        select 'No hay dato anterior',NEW.nombreProy,'No hay dato anterior',NEW.tipoProy,'INSERT',user(),@@hostname,now();
end;


create or replace trigger tr_audit_update_proyecto
    before update
    on proyecto
    for each row
begin
    insert into audit_proyectos(nombre_proy_anterior, nombre_proy_posterior, tipo_proy_anterior, tipo_proy_posterior, operation, userid, hostname, fecha)
    select OLD.nombreProy,NEW.nombreProy,OLD.tipoProy,NEW.tipoProy,'UPDATE',user(),@@hostname,now();
end;


create or replace trigger tr_audit_delete_proyecto
    after delete
    on proyecto
    for each row
begin
    insert into audit_proyectos(nombre_proy_anterior, nombre_proy_posterior, tipo_proy_anterior, tipo_proy_posterior, operation, userid, hostname, fecha)
    select OLD.nombreProy,'No hay dato posterior',OLD.tipoProy,'No hay dato posterior','DELETE',user(),@@hostname,now();
end;


insert into proyecto (id_proy, nombreProy, tipoProy)
values (1,'Construccion de represa','CIVIL');

delete from proyecto
where id_proy = 1;

insert into proyecto (id_proy, nombreProy, tipoProy)
values (2,'Plantacion de arboles','PROYECTO');

update proyecto set nombreProy = 'Construccion' where id_proy = 2;

select *
from proyecto;

select *
from audit_proyectos;


select concat(pe.nombre,' ',pe.apellidos) as fullname,pe.edad,pe.fecha_nac,pro.nombreProy
from persona as pe
         inner join detalle_proyecto det on pe.id_per = det.id_per
         inner join proyecto pro on det.id_proy = pro.id_proy
         inner join departamento dep on pe.id_dep = dep.id_dep;

create or replace view reporte_proyectos as
    select concat(pe.nombre,' ',pe.apellidos)as fullname,
           concat(pro.nombreProy,' ',pro.tipoProy) as desc_proyecto,
           concat(dep.nombre) departamento ,
           concat(

               case
                   when dep.nombre = 'La Paz' then 'LPZ'
                   when dep.nombre = 'Cochabamba' then 'CBB'
                   when dep.nombre = 'El Alto' then 'EAT'
                   else 'No esta disponible'
                   END
               )as codigo_dep
    from  persona as pe
              inner join detalle_proyecto det on pe.id_per = det.id_per
              inner join proyecto pro on det.id_proy = pro.id_proy
              inner join departamento dep on pe.id_dep = dep.id_dep;


select *
from reporte_proyectos;

create or replace trigger tr_valicdacion
    before  insert
    on proyecto
    for each row
begin
    declare dia_de_la_semana text default '';
    declare mes text default '';
    set dia_de_la_semana =  dayname(current_date);
    set  mes = monthname(current_date);


    if NEW.tipoProy in ('Forestacion') and dia_de_la_semana ='Wednesday' and mes = 'JUNE'

           then
                 signal sqlstate '45000'
                set message_text ='Proyecto no disponible en este momento';

    end if;
end;

insert into proyecto(id_proy, nombreProy, tipoProy)
values (9,'Forestacion de arboles','Forestacion');

insert into proyecto(id_proy, nombreProy, tipoProy)
values (10,'Construccion Hospital','Construccion');

select *
from proyecto;


create or replace function DiccionarioDias(dia text)
    returns TEXT
BEGIN
    declare resp text default '';
    case
        when dia = 'MONDAY' then set resp = 'LUNES';
        when dia = 'TSUEDAY' then set resp = 'MARTES';
        when dia = 'WENDNESDAY' then set resp = 'MIERCOLES';
        when dia = 'THURSDAY' then set resp = 'JUEVES';
        when dia = 'FRIDAY' then set resp ='VIERNES';
        when dia = 'SATURDAY' then set resp = 'SABADO';
        when dia = 'SUNDAY' then set resp = 'DOMINGO';
    else
        set resp = 'NO esta en el diccionario';
    end case ;
    return resp;
end;

select DiccionarioDias('WENDNESDAY')
