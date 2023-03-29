SHOW DATABASES;

CREATE DATABASE hito_2;

create database ejemplo;

drop database ejemplo;


create table  nombres
(
    id_nombres INT PRIMARY KEY NOT NULL,
    nombres VARCHAR (100) NOT NULL,
    apellidos VARCHAR (100) NOT NULL
);
INSERT INTO nombres (id_nombres, nombres,apellidos)
VALUES (1,'carlos','flores');
INSERT INTO nombres (id_nombres,nombres,apellidos)
VALUES (2,'romario','tola');

create database universidad2;
use universidad2;
create table estudiantes
(
    id_est INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    edad INTEGER NOT NULL,
    fono INTEGER NOT NULL,
    email VARCHAR(100) NOT NULL
);

DESCRIBE estudiantes;
insert into  estudiantes(nombres, apellidos, edad, fono, email)
values ('Nombre1','Apellidos1',10,11111,'user1@gmail.com'),
       ('Nombre2','Apellidos2',20,111114,'user2@gmail.com'),
       ('Nombre3','Apellidos13',100,112111,'user3@gmail.com');

SELECT * FROM estudiantes;

ALTER TABLE estudiantes
    ADD COLUMN direccion VARCHAR(100)
        DEFAULT 'EL ALTO';

alter table estudiantes

    ADD COLUMN fax VARCHAR(10),
    ADD COLUMN genero VARCHAR(10);

ALTER TABLE estudiantes
    DROP COLUMN fax;

SELECT *  FROM estudiantes;

SELECT *
FROM estudiantes
WHERE nombres = 'nombre4';

SELECT est.nombres, est.apellidos,est.edad
FROM estudiantes as est
WHERE edad > 18;

SELECT *
FROM estudiantes as est
where id_est  % 2 =! 0;

drop table estudiantes;

create table estudiantes
(
    id_est integer auto_increment primary key not null ,
    nombres varchar(100) not null ,
    apellidos varchar(100) not null ,
    edad integer not null ,
    fono integer not null ,
    email varchar(50) not null
);

create table materias
(
    id_mat integer auto_increment primary key not null ,
    nombre_mat varchar(100)not null ,
    cod_mat varchar(100)not null
);

create table inscripcion
(
    id_ins integer auto_increment primary key not null ,
    id_est integer not null ,
    id_mat integer not null ,
    foreign key (id_est) references estudiantes(id_est),
    foreign key (id_mat) references materias(id_mat)
);