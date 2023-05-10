-- repeticiones

create or replace function repeticiones(x integer)
    returns text
BEGIN

    declare str text default ' ';

    repeat
        set str = concat(str,x,' , ');
        set x = x - 1;
    until  x <= 0 end repeat;

    return str;

end;


select repeticiones(10);


-- repeat es considerado el "DO WHILE

create or replace function repeticiones_v2(x integer)
    returns text
BEGIN

    declare str text default ' ';

    repeat
        if x % 2=0 then
            set str = concat(str,x,' -AA- ');
        else
            set str = concat(str,x,' -BB- ');
        end if;
        set x = x - 1;

    until  x <= 0 end repeat;

    return str;

end;

select repeticiones_v2(10);


-- es una funcion que se llama a si misma
-- si o si requiere un if


create or replace function repeticiones_loop(x integer)
    returns text
BEGIN

    declare str text default '';
    dbaii: loop
        if x > 0 then
            leave dbaii;
        end if;


        set str = concat(str,x,', ');
        set x=x+1;

        iterate dbaii;
    end loop;

    return str;
end;



create or replace function repeticiones_loop_v2(x integer)
    returns text
BEGIN

    declare str text default '';
    dbaii: loop
        if x < 0 then
            leave dbaii;
        end if;


        if x % 2=0 then
            set str = concat(str,x,' -AA- ');
        else
            set str = concat(str,x,' -BB- ');
        end if;
        set x = x - 1;

        iterate dbaii;
    end loop;

    return str;
end;

select repeticiones_loop_v2(10);



create or replace function credito(credit_number integer)
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

select credito(5000000);
select credito(1);
select credito(9999);


-- contar cadenas de texto
create or replace function valida_leght(passwor text)
    returns text
BEGIN
    declare resp text default '';

    if char_length(passwor) > 7 then
        set resp = 'PASSED';
    else
        set resp = 'FAILED';
    end if;


    return resp;

end;


select valida_leght('hoallmkljdslkjf;ak');


-- comparar cadenas de texto
-- siendo que si son iguales es 0
-- si es deferente -1 o  1 en funcion al orden que se le de;

select strcmp('dbaii','DBAII');



-- determinar si dos cadenas son iguales


create or replace function valida_leght_v2(txt1 text,txt2 text)
    returns text
BEGIN
    declare resp text default '';

    if strcmp(txt1,txt2) = 0 then
        set resp = 'Son iguales';
    else
        set resp = 'Son diferentes';
    end if;
    return resp;

end;

select valida_leght_v2('hola','hola');

-- a las dos funciones anteriores determinar los siguienete
-- recibir 2 cadenas si las dos son iguales y ademas el legth es mayor a 15 retornar el mensaje Valido caso contrario no valido


create or replace function ValidoONo(txt1 text,txt2 text)
    returns text
BEGIN
    declare resp text default '';

    if strcmp(txt1,txt2) = 0 and char_length(concat(txt1,txt2)) >=15 then
        set resp = 'Valida';
    else
        set resp = 'No Valida';
    end if;
    return resp;

end;


select ValidoONo('12345678','12345678');










