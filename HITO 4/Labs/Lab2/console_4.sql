--  NO se puede modificar una dato en pecifico ya generado;


create or replace trigger GenerarContrasena
    after insert
    on Usuarios
    for each row
begin

    update Usuarios set NEW.password = lower(concat(substr(NEW.nombres,1,2),substr(NEW.apellidos,1,2),NEW.edad))
    where id_sr = last_insert_id(); -- nos sirve pora ver el ultimo elemnto insertado

end;

drop table Usuarios;

create table Usuarios(
                         id_sr integer primary key auto_increment not null ,
                         nombres varchar(50)not null ,
                         apellidos varchar(50)not null ,
                         fecha_nac date not null ,
                         correo varchar(50)not null,
                         password varchar(50),
                         edad integer

);

insert into Usuarios (nombres, apellidos, fecha_nac, correo)
values ('Nilbre','Mayta','2003/08/18','nilbermayta@gmail.com');

select *
from usuarios;

select timestampdiff(YEAR, us.fecha_nac,curdate()) as Edad
from usuarios as us;

create or replace trigger tr_calcula_pass_edad
    before insert
    on Usuarios
    for each row
begin

    set NEW.password = lower(concat(
        substr(NEW.nombres,1,2),
        substr(NEW.apellidos,1,2),
        substr(NEW.correo,1,2)));

    set NEW .edad = timestampdiff(YEAR, New.fecha_nac,curdate()); -- Para calcular la edad exacta

end;

truncate table Usuarios;

insert into Usuarios (nombres, apellidos, fecha_nac, correo)
values ('Nilbre','Mayta','2003/08/18','nilbermayta@gmail.com');

select *
from usuarios;

create or replace trigger tr_calcula_pass_edad
    before insert
    on Usuarios
    for each row


begin

    declare pass varchar(100) default NEW.password;
    declare edad int default timestampdiff(YEAR, New.fecha_nac,curdate());

    if char_length(NEW.password)>=10 then
        set NEW.password = NEW.password;
    else
        set NEW.password = lower(concat(
            substr(pass,-2,2),
            substr(NEW.nombres,1,2),
            substr(NEW.apellidos,1,2),edad));
    end if;

end;

drop trigger tr_calcula_pass_edad;

insert into Usuarios (nombres, apellidos, fecha_nac, correo,password)
values ('Luis','cucho','2003/08/18','lucho@gmail.com','12g');

insert into Usuarios (nombres, apellidos, fecha_nac, correo,password)
values ('Luis','cucho','2003/08/18','lucho@gmail.com','12gsdlknflksdflskjfdp');

truncate table Usuarios;

select *
from Usuarios;

create or replace trigger tr_usearios_mantenimiento
    before  insert
    on usuarios
    for each row
    begin
        declare  dia_de_la_semana text default '';
        set dia_de_la_semana =  dayname(current_date);

        if dia_de_la_semana = 'Wednesday'
            then
            signal sqlstate '45000'
            set message_text ='Base de datos en mantenimiento';
        end if;
    end;

drop trigger tr_usearios_mantenimiento;

alter table usuarios
add column nacionalidad varchar(20);


create or replace trigger tr_usuarios_nacionalidad
    before  insert
    on usuarios
    for each row
begin

    if NEW.nacionalidad not in ('Bolivia','Paraguay','Argentina')
    then
        signal sqlstate '45000'
            set message_text ='Nacionalidad no disponible en este momento';
    end if;
end;

select *
from usuarios;

truncate table usuarios;

insert into Usuarios (nombres, apellidos, fecha_nac, correo,nacionalidad)
values ('Nilber','Mayta','2003/08/18','nilber','Bolivia');


insert into Usuarios (nombres, apellidos, fecha_nac, correo,nacionalidad)
values ('Nilber','Mayta','2003/08/18','nilber','Chile')


























