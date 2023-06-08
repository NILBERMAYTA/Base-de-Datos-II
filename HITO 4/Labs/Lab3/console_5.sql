use hito4;

create table usuarios_rrhh(
    id_usr integer primary key not null ,
    nombre_completo varchar(50) not null ,
    fecha_nac date not null ,
    correo varchar(100)not null ,
    pasword varchar(100)
);

insert into usuarios_rrhh(id_usr, nombre_completo, fecha_nac, correo, pasword)
values (9210838,'Nilber Mayta Cuno','2003/09/18','nilberrmayta@gmail.com','9210838');

select * from usuarios_rrhh;


-- triguers de auditoria


select current_date; -- permite obtener la fecha actual

select now(); --  esto obtiene la fecha actual y la hora


-- permite obtener el usuario logueado

select user();

-- me permite obtener el host name

select @@hostname;

-- este comando me permite ver todas las variables de la base de datos
show variables;

-- la auditoria es erar una tabla de auditoria para ver un registro de modificaciones lo que nos permite monitorear el registro de actividad

create table audit_usuarios_rrhh
  (
      fecha_mod text not null ,
      usuario_log text not null ,
      hostname text not null ,
      acccion text not null ,

      id_usr text not null ,
      nombre_completo text not null ,
      password text not null
  );

create trigger tr_audit_usuarios_rrhh
    after delete
    on usuarios_rrhh
    for each row
    begin
        declare id_usuario text;
        declare nombres text;
        declare user_password text;

        set id_usuario = OLD.id_usr;
        set nombres = OLD.nombre_completo;
        set user_password = OLD.pasword;

        insert into audit_usuarios_rrhh(fecha_mod, usuario_log, hostname, acccion, id_usr, nombre_completo, password) select
        now(),user(),@@hostname,'DELETE',id_usuario,nombres,user_password;
    end;

create trigger tr_audit_insert_usuarios_rrhh
    after insert
    on usuarios_rrhh
    for each row
begin

    insert into audit_usuarios_rrhh(fecha_mod, usuario_log, hostname, acccion, id_usr, nombre_completo, password) select
    now(),user(),@@hostname,'INSERT',new.id_usr,new.nombre_completo,new.pasword;
end;

insert into usuarios_rrhh(id_usr, nombre_completo, fecha_nac, correo, pasword)
values (921085,'Pepe Juan Cuno','2003/09/18','nilberrmayta@gmail.com','9210838');

select * from usuarios_rrhh;

delete from usuarios_rrhh
where id_usr =  92108788;

select * from audit_usuarios_rrhh;



alter table audit_usuarios_rrhh add column (antes_del_cambio text, dspues_del_cambio text);


create or replace trigger tr_audit_update_usuarios_rrhh
    before update
    on usuarios_rrhh
    for each row
begin

    insert into audit_usuarios_rrhh(fecha_mod, usuario_log, hostname, acccion, id_usr, nombre_completo, password,antes_del_cambio,dspues_del_cambio) select
    now(),user(),@@hostname,'INSERT',new.id_usr,new.nombre_completo,new.pasword,concat(old.id_usr,old.nombre_completo,old.fecha_nac),concat(new.id_usr,new.nombre_completo,new.fecha_nac);
end;


select * from usuarios_rrhh;
update usuarios_rrhh set nombre_completo = 'juanito' where id_usr = 921085;

select * from audit_usuarios_rrhh;

create or replace procedure insertar_datos(
    fecha text,
    usuario text,
    host_name text,
    accion text,
    antes text,
    despues text
)
begin
    insert into audit_usuarios_rrhh(fecha_mod, usuario_log, hostname, acccion, antes_del_cambio,dspues_del_cambio )
        values (fecha,usuario,host_name,accion,antes,despues);
end;


call insertar_datos(
    now(),user(),@@hostname,'UPDATE','antes','despues'
    );


create or replace trigger tr_audit_update_usuarios_rrhh
    before update
    on usuarios_rrhh
    for each row
begin
    call insertar_datos(
        now(),
        user(),
        @@hostname,
        'UPDATE',
        concat(old.id_usr,old.nombre_completo,NEW.fecha_nac),
        concat(new.id_usr,new.nombre_completo,new.fecha_nac)
        );
end;







