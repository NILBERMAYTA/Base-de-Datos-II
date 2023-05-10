create database hito3_2023;

use hito3_2023;

#Declrar un variable
set @usuario = 'GUEST';
set @locacion = 'EL ALTO';

#Mostrar una variable
select @usuario;
select @locacio;

create or replace function variable()
    returns text
    BEGIN
        return @usuario;
end;

select variable();

set @hito3 = 'ADMIN';

create or replace function Valida_usuario()
    returns varchar(50)
BEGIN
    declare resp varchar(50);

    if @hito3 = 'ADMIN' then
        set resp = 'USUARIO ADMIN';
    else
        set resp = 'USUARIO INVITADO';
    end if;
    return resp;
end;

select Valida_usuario();


create or replace function Valida_usuario2()
    returns varchar(50)
BEGIN
    declare resp varchar(50);
    case @hito3
        when 'ADMIN' then
            set resp = 'USUARIO ADMIN';
    else
        set resp = 'USUARIO INVITADO';
        end case;
    return resp;
end;


select Valida_usuario2() as TIPO;

create or replace function N_NATURALES(limite int)
    returns TEXT
BEGIN
    declare cont int default 1;

    declare resp text default ' ';

    while cont <= limite do
        set resp = concat(resp,cont,' , ');
        set cont = cont+1;
        end while;
    return resp;
end;

select N_NATURALES(10);


create or replace function N_NATURALESv2(limite int)
    returns TEXT
BEGIN
    declare cont int default 2;

    declare resp text default ' ';

    while cont <= limite do
            set resp = concat(resp,cont,' , ');
            set cont = cont+2;
        end while;
    return resp;
end;

select N_NATURALESv2(10);





