Create database Evaluacion_procesual_H3;
use Evaluacion_procesual_H3;

create function sumarNumeros(num1 int, num2 int)
    returns integer
begin
    declare resp int default 0;
    set resp = num1 + num2;
    return resp;
end;

select sumarNumeros(7,5);

create or replace function sumarNumeros(num1 int, num2 int)
    returns int
begin
    declare resp int default 0;
    set resp = num1 - num2;
    return resp;
end;

select sumarNumeros(7,5);

drop function sumarNumeros;

select sumarNumeros(7,5);


create or replace function Concatenacion(txt1 text, txt2 text, txt3 text)
    returns text
begin
    declare resp text default '';
    set resp = concat(txt1,txt2,txt3);
    return resp;
end;

select Concatenacion('hola','Mundo','Concatenado');


create or replace function SubTextos(txt text)
    returns text
begin
    declare resp text default '';
    set resp = SUBSTRING(txt , 1 , 7);
    return resp;
end;


select SubTextos('Ximena Condori Mar');


create or replace function CompararCadenas(txt1 text, txt2 text, txt3 text)
    returns text
begin
    declare resp text;
    if(strcmp(txt1, txt2) = 0 or strcmp(txt1, txt3) = 0 or strcmp(txt2, txt3) = 0) then
        set resp = 'Dos cadenas son iguales';
    else
        set resp = 'No son iguales';
    end if;
    return resp;
end;

select CompararCadenas('hola', 'hola', 'hole');

select CompararCadenas('hola', 'holi', 'hole');

create or replace function ContarCaracteres(cadena varchar(50),letra char)
    returns TEXT
BEGIN
    declare resp text default 'La letra no esta en la cadena';
    declare cont integer default 1;
    declare nVeces int default 0;
    declare puntero char;

    if locate(letra,cadena)>0 then
        WHILE cont <= char_length(cadena) do
                set puntero = substr(cadena,cont,1);
                if puntero = letra then
                    set nVeces = nVeces+1;
                end if;
                set cont = cont+1;
            end while;
        set resp = concat('la letra ',letra,' se repite ',nVeces);
    end if;

    return resp;
end;

select ContarCaracteres('sahfkdnglvy','y');


-- ---------------------------------------------------------------------------------

create table estudiantes(
    id_est integer primary key auto_increment not null,
    nombre varchar(50) not null ,
    apellidos varchar(50)not null ,
    edad integer not null ,
    fono integer not null ,
    email varchar(100)not null ,
    direccion varchar(100)not null ,
    sexo varchar(10)
);


create table materias (
    id_mat integer primary key auto_increment not null ,
    nombre_mat varchar(100) not null ,
    cod_mat varchar(100)
);


create table inscricion(
    id_ins integer primary key auto_increment not null ,
    semestre varchar(20) not null ,
    gestion integer not null ,
    id_est integer not null ,
    id_mat integer not null ,
    foreign key (id_est) references estudiantes(id_est),
    foreign key (id_mat) references materias(id_mat)
);

insert into estudiantes(nombre,apellidos,edad,fono,email,direccion,sexo)
values('Miguel','Gonzales Veliz',20,2832115,'miguel@gmail.com','Av. 6 de Agosto','masculino'),
      ('Sandra','Mavir Uria',25,2832116,'sandra@gmail.com','AV. 6 de Agosto','femenino'),
      ('Joel','Aduviri Mondar',30,2832117,'joel@gmail.com','AV. 6 de Agosto','masculino'),
      ('Andrea','Arias Ballesteros',21,2832118,'andrea@gmail.com','AV. 6 de Agosto','femenino'),
      ('Santos','Montes Valenzuela',24,2832119,'santos@gmail.com','Av. 6 de Agosto','masculino');


insert into materias(nombre_mat, cod_mat)
values('Introduccion a la Arquitectura','ARQ-101'),
      ('Urbanismo y Diseno','ARQ-102'),
      ('Dibujo y Pintura Arquitectonico','ARQ-103'),
      ('Matematica discreta','ARQ-104'),
      ('Fisica Basica','ARQ-105');

insert into inscricion(semestre,gestion,id_est,id_mat)
values ('1er Semestre',2018,1,1),
       ('2do Semestre',2018,1,2),
       ('1er Semestre',2019,2,4),
       ('2do Semestre',2019,2,3),
       ('2do Semestre',2020,3,3),
       ('3er Semestre',2020,3,1),
       ('4to Semestre',2020,4,4),
       ('5to Semestre',2021,5,5);

select *
from estudiantes;

select *
from materias;

select *
from inscricion;

create or replace function  fibonacci(num int)
    returns text
    begin
        declare a int default 0;
        declare b int default 1;
        declare resp text default '';

        while num>0 do
            set resp = concat(resp,a,' , ');
            set b = a + b;
            set a = b - a;
            set num = num - 1;
            end while;
        return resp;
    end;

select fibonacci(13);

set @limite = 7;

create or replace function  fibonacci_v2()
    returns text
begin
    declare a int default 0;
    declare b int default 1;
    declare resp text default '';
    declare num int default 0;
    set num = @limite;

    while num>0 do
            set resp = concat(resp,a,' , ');
            set b = a + b;
            set a = b - a;
            set num = num - 1;
        end while;
    return resp;
end;

select fibonacci_v2();


select min(est.edad)
from estudiantes as est;


create or replace function  edadMinima()
    returns int
begin
    declare resp int;
    select min(est.edad) into resp
    from estudiantes as est;
    return resp;
end;

select edadMinima();


create or replace function  ParesImpares()
    returns text
begin
    declare cont int default 0;
    declare resp text default '';
    declare aux int;
    set aux = edadMinima();
    if aux % 2 = 0 then
        while cont <= aux do
                set resp = concat(resp,cont,' , ');
                set cont = cont+2;
            end while;
    else
        repeat
            set resp = concat(resp,aux,' , ');
            set aux = aux - 2;
        until  aux <= 0 end repeat;
    end if;
    return resp;
end;

select ParesImpares();


create or replace function ContarVocales(cadena varchar(50))
    returns TEXT
BEGIN
    declare resp text default '';
    declare cont integer default 1;
    declare nVecesa int default 0;
    declare nVecese int default 0;
    declare nVecesi int default 0;
    declare nVeceso int default 0;
    declare nVecesu int default 0;
    declare puntero char;

    if locate('a',cadena)>0 or locate('e',cadena)>0 or locate('i',cadena)>0 or locate('o',cadena)>0 or locate('u',cadena)>0 then
        WHILE cont <= char_length(cadena) do
                set puntero = substr(cadena,cont,1);
                if puntero = 'a' then
                    set nVecesa = nVecesa + 1;
                end if;
                if puntero = 'e' then
                    set nVecese = nVecese + 1;
                end if;
                if  puntero = 'i' then
                    set nVecesi = nVecesi + 1;
                end if;
                if puntero = 'o' then
                    set nVeceso = nVeceso + 1;
                end if;
                if puntero = 'u' then
                    set nVecesu = nVecesu + 1;
                end if;
                set cont = cont+1;
            end while;
        set resp = concat(' a: ',nVecesa,', e: ',nVecese,', i: ',nVecesi,', o: ',nVeceso,', u: ',nVecesu);
    end if;
    return resp;
end;



select ContarVocales('taller de base de datos');



create or replace function tipocredito(credit_number integer)
    returns text
BEGIN
    declare resp text default '';

    if credit_number > 50000 then
        set resp = 'cliente platino';
    end if;
    if credit_number >=10000 and credit_number <=50000 then
        set resp = 'cliente gold';
    end if;
    if credit_number < 10000 then
        set resp = 'cliente silver';
    end if;

    return resp;

end;

select tipocredito(5000000);
select tipocredito(1);
select tipocredito(9999);


create or replace function SinVocales(txt1 varchar(20), txt2 varchar(20))
    returns text
begin
    declare resp text default '';
    declare aux char(1);
    declare cont int default 1;
    declare nuevaCadena varchar(100) default concat(txt1,'-',txt2);

    while (cont <= char_length(nuevaCadena)) do
        set aux = substr(nuevaCadena, cont, 1);
        if (aux not in ('a','e','i','o','u'))then
            set resp = concat(resp, aux);
            if (aux = '') then
                set resp = concat(resp, aux);
            end if;
        end if;
        set cont = cont + 1;
        end while;
    return resp;
end;


select SinVocales('TALLER DBA II','GESTION 2023');


create or replace function Deletreado(txt varchar(100))
    returns text
begin
    declare resp text default '';
    declare aux varchar(100);
    declare cont int default char_length(txt);

    repeat
        set aux = substr(txt,-cont,cont);
        set resp = concat(resp,aux,', ');
        set cont = cont-1;
    until  cont=0 end repeat;
    return resp;

end;


select Deletreado('dbaii')






