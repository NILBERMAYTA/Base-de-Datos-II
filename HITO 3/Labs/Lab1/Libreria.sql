CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autor (
                       id INTEGER AUTO_INCREMENT PRIMARY KEY,
                       nombre VARCHAR(50) NOT NULL,
                       nacionalidad VARCHAR(50),
                       fecha_nacimiento DATE
);

CREATE TABLE usuario (
                         id INTEGER AUTO_INCREMENT PRIMARY KEY,
                         nombre VARCHAR(50) NOT NULL,
                         email VARCHAR(100) NOT NULL,
                         fecha_nacimiento DATE,
                         direccion VARCHAR(100)
);

CREATE TABLE libro (
                       id INTEGER AUTO_INCREMENT PRIMARY KEY,
                       titulo VARCHAR(100) NOT NULL,
                       isbn VARCHAR(20),
                       fecha_publicacion DATE,
                       autor_id INTEGER,
                       FOREIGN KEY (autor_id) REFERENCES autor(id)
);

CREATE TABLE prestamo (
                          id INTEGER AUTO_INCREMENT PRIMARY KEY,
                          fecha_inicio DATE NOT NULL,
                          fecha_fin DATE NOT NULL,
                          libro_id INTEGER REFERENCES libro(id) ON DELETE CASCADE,
                          usuario_id INTEGER REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE categoria (
                           id INTEGER AUTO_INCREMENT PRIMARY KEY,
                           nombre VARCHAR(50) NOT NULL
);

CREATE TABLE libro_categoria (
                                 id INTEGER AUTO_INCREMENT PRIMARY KEY,
                                 libro_id INTEGER REFERENCES libro(id) ON DELETE CASCADE,
                                 categoria_id INTEGER REFERENCES categoria(id) ON DELETE CASCADE
);


INSERT INTO autor (nombre, nacionalidad, fecha_nacimiento) VALUES
                                                               ('Gabriel Garcia Marquez', 'Colombiano', '1927-03-06'),
                                                               ('Mario Vargas Llosa', 'Peruano', '1936-03-28'),
                                                               ('Pablo Neruda', 'Chileno', '1904-07-12'),
                                                               ('Octavio Paz', 'Mexicano', '1914-03-31'),
                                                               ('Jorge Luis Borges', 'Argentino', '1899-08-24');


INSERT INTO libro (titulo, isbn, fecha_publicacion, autor_id) VALUES
                                                                  ('Cien años de soledad', '978-0307474728', '1967-05-30', 1),
                                                                  ('La ciudad y los perros', '978-8466333867', '1962-10-10', 2),
                                                                  ('Veinte poemas de amor y una canción desesperada', '978-0307477927', '1924-08-14', 3),
                                                                  ('El laberinto de la soledad', '978-9681603011', '1950-01-01', 4),
                                                                  ('El Aleph', '978-0307950901', '1949-06-30', 5);


INSERT INTO usuario (nombre, email, fecha_nacimiento, direccion) VALUES
                                                                     ('Juan Perez', 'juan.perez@gmail.com', '1985-06-20', 'Calle Falsa 123'),
                                                                     ('Maria Rodriguez', 'maria.rodriguez@hotmail.com', '1990-03-15', 'Av. Siempreviva 456'),
                                                                     ('Pedro Gomez', 'pedro.gomez@yahoo.com', '1982-12-10', 'Calle 7ma 789'),
                                                                     ('Laura Sanchez', 'laura.sanchez@gmail.com', '1995-07-22', 'Av. Primavera 234'),
                                                                     ('Jorge Fernandez', 'jorge.fernandez@gmail.com', '1988-04-18', 'Calle Real 567');


INSERT INTO prestamo (fecha_inicio, fecha_fin, libro_id, usuario_id) VALUES
                                                                         ('2022-01-01', '2022-01-15', 1, 1),
                                                                         ('2022-01-03', '2022-01-18', 2, 2),
                                                                         ('2022-01-05', '2022-01-20', 3, 3),
                                                                         ('2022-01-07', '2022-01-22', 4, 4),
                                                                         ('2022-01-09', '2022-01-24', 5, 5);


INSERT INTO categoria (nombre) VALUES
                                   ('Novela'),
                                   ('Poesía'),
                                   ('Ensayo'),
                                   ('Ciencia Ficción'),
                                   ('Historia');


INSERT INTO libro_categoria (libro_id, categoria_id) VALUES
                                                         (1, 1),
                                                         (1, 3),
                                                         (2, 1),
                                                         (2, 5),
                                                         (3, 2),
                                                         (4, 3),
                                                         (5, 4);


alter table libro add column paginas integer default 20;

alter table libro add column editorial varchar(70) default 'Don Bosco';


create view Autores_Peruanos as
select cat2.nombre as Categoria, au.nombre as Name , au.nacionalidad as Nacionalidad
from libro as li
    inner join autor as au on li.autor_id = au.id
    inner join libro_categoria as cat1 on li.id = cat1.libro_id
    inner join categoria as cat2 on cat1.categoria_id = cat2.id
where au.nacionalidad='Peruano' and cat2.nombre = 'Historia';

select *
from autores_peruanos;


#modelo nasiceo de una funcion


create function nombre()
returns varchar(30)
begin
    return 'Nilber';
end;

select nombre();

#alterar una funcion

create or replace function nombre()
    returns varchar(30)
begin
    return 'Nilber Mayta';
end;

select nombre();

#retornar un numero

create function num()
    returns integer
begin
    return 10;
end;

select num();

#retornar un parametro

create or replace function getnombreCompleto(nombres varchar(30))
    returns varchar(30)
begin
    return nombres;
end;

select getnombreCompleto('Nilber');

#crear una funcion que sume tres numeros de tipo int

create or replace function sumaNumeros(num1 integer,num2 integer,num3 integer)
    returns int
begin
    declare resp integer;
    set resp = num1+num2+num3;
    return resp;
end;

select sumaNumeros(8,9,10) as Suma;

#crear una funcion calculadora que reciba tres parametros que reciba un numero 1,2 y el tercero una cadena

create or replace function Calculadora(num1 integer,num2 integer,operacion varchar(20))
    returns int
begin
    declare resp integer;
    case operacion
    when 'Suma' then
        set resp = num1+num2;
    when 'Resta' then
        set resp = num1-num2;
    when 'Multiplicacion' then
        set resp = num1*num2;
    when 'Divicion' then
        set resp = num1/num2;
    end case;
    return resp;
end;




select Calculadora(8,4,'Suma') as Suma;
select Calculadora(8,4,'Resta') as Resta;
select Calculadora(8,4,'Multiplicacion') as Multiplicacion;
select Calculadora(8,4,'Divicion') as Divicion;


create function valida_historia_peru(cat varchar(30), nac varchar(30))
returns bool
begin
    declare respuesta bool default false;
    if cat = 'Historia' and nac = 'Peruano' then
        set respuesta = true;
    end if;
    return respuesta;
end;


select cat2.nombre as Categoria, au.nombre as Name , au.nacionalidad as Nacionalidad
from libro as li
         inner join autor as au on li.autor_id = au.id
         inner join libro_categoria as cat1 on li.id = cat1.libro_id
         inner join categoria as cat2 on cat1.categoria_id = cat2.id
where valida_historia_peru(cat2.nombre, au.nacionalidad) = true;


drop function;



