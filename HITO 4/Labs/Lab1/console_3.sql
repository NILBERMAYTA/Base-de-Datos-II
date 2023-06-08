-- Vistas triguers o precedimientos almacenados que ocurren automatimente que cuando se cumpla un evento

create database Hito4;
use Hito4;

-- auditoria de base de datos = a trigers de base de datos
-- los eventos son los insert, deletes, updates.
-- cada ves que suceda un evento se ejecuta el triguer
-- una tabla siempre tiene dos tiempos after before

-- un trigger simpre esta relacionada con una tabla
create table numeros(
    numero bigint primary key  not null ,
    cuadrado bigint,
    cubo bigint,
    raiz_cuadrada real
);


insert into numeros (numero) values (2);

select *
from numeros;

create or replace trigger tr_compreta_datos    #creacion de ltrigger
    before insert                   #indicarle si es antes o despues
    on numeros                      #en que atabla
    for each row                    #crear dato
    begin
        declare valor_cuadrado bigint;
        declare valor_cubo bigint;
        declare valor_raiz real;

        set valor_cuadrado = power(NEW.numero,2);
        set valor_cubo = power(NEW.numero,3);
        set valor_raiz = sqrt(NEW.numero);

        set NEW.cuadrado = valor_cuadrado;
        set NEW.cubo = valor_cubo;
        set NEW.raiz_cuadrada = valor_raiz;
    end;

insert into numeros(numero) values (4);

select * from numeros;

create or replace trigger tr_compreta_datos    #creacion de ltrigger
    before insert                   #indicarle si es antes o despues
    on numeros                      #en que atabla
    for each row                    #crear dato
begin

    set NEW.cuadrado = power(NEW.numero,2);
    set NEW.cubo = power(NEW.numero,3);
    set NEW.raiz_cuadrada = sqrt(NEW.numero);

end;

drop trigger tr_compreta_datos;

delete from numeros
where numero;

alter table numeros
add suma_total real;

create or replace trigger tr_compreta_datos_suma
    before insert
    on numeros
    for each row
begin

    declare valor_cuadrado bigint;
    declare valor_cubo bigint;
    declare valor_raiz real;
    declare num int;


    set valor_cuadrado = power(NEW.numero,2);
    set valor_cubo = power(NEW.numero,3);
    set valor_raiz = sqrt(NEW.numero);
    set num = NEW.numero;


    set NEW.cuadrado = valor_cuadrado;
    set NEW.cubo = valor_cubo;
    set NEW.raiz_cuadrada = valor_raiz;

    set NEW.suma_total = (num+valor_cuadrado+valor_raiz+valor_cubo);

end;

insert into numeros(numero) values (2);

select *
from numeros;


create or replace trigger tr_compreta_datos
    before insert
    on numeros
    for each row
begin

    set NEW.cuadrado = power(NEW.numero,2);
    set NEW.cubo = power(NEW.numero,3);
    set NEW.raiz_cuadrada = sqrt(NEW.numero);
    set NEW.numero = NEW.numero+NEW.cubo+NEW.raiz_cuadrada;

end;

create table Usuarios(
    id_sr integer primary key auto_increment not null ,
    nombres varchar(50)not null ,
    apellidos varchar(50)not null ,
    edad integer not null ,
    correo varchar(50) not null,
    password varchar(50)
);

insert into Usuarios
values (74,'Luis','Alanoca',23,'lucho@gmail,com','1234');

delete from Usuarios
where id_sr;

create or replace trigger GenerarContrasena
    before insert
    on Usuarios
    for each row
begin

    set NEW.password = lower(concat(substr(NEW.nombres,1,2),substr(NEW.apellidos,1,2),NEW.edad));

end;

select *
from Usuarios;

insert into Usuarios
values (74,'Luis','Alanoca',23,'lucho@gmail,com','1234');

delete from Usuarios
where id_sr;

create or replace trigger GenerarContrasena
    before insert
    on Usuarios
    for each row
begin

    set NEW.password = lower(concat(substr(NEW.nombres,1,2),substr(NEW.apellidos,1,2),NEW.edad));

end;






