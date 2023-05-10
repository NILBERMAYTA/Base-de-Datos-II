create database defensa_hito3_2023;

use defensa_hito3_2023;

create or replace function EliminaConsonantesYNumeros(txt varchar(100))
    returns text
begin
    declare resp text default '';
    declare aux char(1);
    declare cont int default 1;

    while (cont <= char_length(txt)) do
            set aux = substr(txt, cont, 1);

            if (aux in ('a','e','i','o','u'))then
                set resp = concat(resp, aux);
            end if;
            set cont = cont + 1;
        end while;
    return resp;
end;

select EliminaConsonantesYNumeros('Hola Mundo');

drop function EliminaConsonantesYNumeros;

create table clientes (
    id_client integer primary key auto_increment not null,
    fullname varchar(20) not null ,
    last_name varchar (20)not null ,
    age integer not null ,
    genero char not null
);

insert into clientes(fullname, last_name, age, genero)
values ('Juan','Gutierrez',25,'m'),
       ('Ana','Poma',19,'f'),
       ('Carolina','Mancilla',21,'f');

create or replace function EdadMaxima()
    returns text
begin
    declare resp text default '';
    select max(cli.age) into resp
    from clientes as cli;
    return resp;
end;

select EdadMaxima();


create or replace function  ParesImpares()
    returns text
begin

    declare resp text default '';
    declare aux int default 0;
    declare cont int default 0;
    set aux = EdadMaxima();


    if aux % 2 = 0 then
        dbaii: loop
            if aux < 0 then
                leave dbaii;
            end if;

            set resp = concat(resp,cont,', ');
            set cont = cont+2;
            set aux=aux-2;

            iterate dbaii;
        end loop;
    else
        dbaii: loop
            if aux < 0 then
                leave dbaii;
            end if;

            set resp = concat(resp,aux,', ');
            set aux=aux-2;

            iterate dbaii;
        end loop;
    end if;
    return resp;
end;




create or replace function  serie_fibinacci(num int)
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

select serie_fibinacci(5);



create or replace function remplazar_palabras(txt1 varchar(100),txt2 varchar(100), txt3 varchar(100))
    returns text
begin
    declare resp text default 'la palabra no esta en la cadena';

    select replace(txt1,txt2,txt3) into resp;

    return resp;
end;

select remplazar_palabras('Bienvenidos a unifranz , unifranz tiene 10 carreras','unifranz','univalle');

create or replace function invertir_palabras(txt1 varchar(100))
    returns text
begin
    declare resp text default 'la palabra no esta en la cadena';

    select reverse(txt1) into resp;

    return resp;
end;

select invertir_palabras('Hola Mundo');











