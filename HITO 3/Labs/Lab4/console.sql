
-- la funcion permite cortar una cadena desde un determinado punto
-- siendo uno despues del numero entero
select substr('DBAII 2023 Unifranz',7);

-- empieza a contar desde el ultimo valor

select substr('hola',3);

-- si se le pone dos numeros se puede delimitar hasta donde termina de imprimir

select substr('DBAII 2023 Unifranz',7,4);

-- tambien se puede remplazar las comas con from y for

select substr('DBAII 2023 Unifranz' from 7 for 4);

-- para empezar a contar desde la derecha se usa un signo negativo

select substr('DBAII 2023 Unifranz',-8);

-- para delimitar desde la derecha el unico valor negativo es el primero

select substr('DBAII 2023 Unifranz',-13,4);

-- manejo de substr(subcadenas)
-- locate muestra la posicion un la que se encuentra una sub cadena especifica

select locate('2023','Base de datos II, gestion 2023 Unifranz');

-- se pone un valor entero al final que significa desde donde quieremos que empieze a buscar

select locate('2023','Base de datos II, gestion 2023 Unifranz 2023',30);


-- crear una fncion que recibe dos parameros de tipo txt
-- y la estencion
-- verificar si la segunda cadena se encuentra en la cadena principal
-- si existe retornar 'Si existe  + posicion'
-- si no existe retornar 'No existe'



create or replace function LocalizarSubcadena(txt1 text,txt2 text)
    returns text
BEGIN
    declare resp text default '';

    if locate(txt2,txt1) > 0  then
        set resp = concat('Si existe: ',locate(txt2,txt1));
    else
        set resp = 'No Existe';
    end if;
    return resp;

end;

select LocalizarSubcadena('7894lp','lp');


create or replace function LocalizarSubcadenav2(txt1 text,txt2 text)
    returns text
BEGIN
    declare resp text default '';
    declare busqueda text default locate(txt2,txt1);

    if busqueda > 0  then
        set resp = concat('Si existe: ', busqueda);
    else
        set resp = 'No Existe';
    end if;
    return resp;

end;

select LocalizarSubcadenav2('7894lp','lp');


create or replace function Numeros_Pares(limite int)
    returns TEXT
BEGIN
    declare cont int default 0;

    declare resp text default '';

    while cont <= limite do
            set resp = concat(resp,cont,' , ');
            set cont = cont+2;
        end while;
    return resp;
end;

select Numeros_Pares(10);

create or replace function ConcatenarCadenas(txt text,val int)
    returns TEXT
BEGIN
    declare cont int default 1;

    declare resp text default '';

    while cont <= val do
            set resp = concat(resp,' ',txt);
            set cont = cont+1;
        end while;
    return resp;
end;

select ConcatenarCadenas('HOlA',5)










