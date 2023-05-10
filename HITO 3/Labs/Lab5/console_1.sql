-- cuenta caracteres

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

select ContarCaracteres('yyyyyyyyy','y');


create or replace function ContarVocales(cadena varchar(50))
    returns TEXT
BEGIN
    declare resp text default 'La letra no esta en la cadena';
    declare cont integer default 1;
    declare nVeces int default 0;
    declare puntero char;

    if locate('a',cadena)>0 or locate('e',cadena)>0 or locate('i',cadena)>0 or locate('o',cadena)>0 or locate('u',cadena)>0  then
        WHILE cont <= char_length(cadena) do
                set puntero = substr(cadena,cont,1);
                if puntero = 'a'or puntero = 'e'or puntero = 'i'or puntero = 'o'or puntero = 'u' then
                    set nVeces = nVeces+1;
                end if;
                set cont = cont+1;
            end while;
        set resp = concat('la letra  se repite ',nVeces);
    end if;

    return resp;
end;

select ContarVocales('qawsedrftgyhujik')

