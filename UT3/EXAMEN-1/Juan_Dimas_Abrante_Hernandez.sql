-- 

-- creacion de tabla

CREATE TABLE clase (
	id int, 
	max_alumnos int, 
	PRIMARY KEY (id)
);

CREATE TABLE alumno (
	dni text, 
	nombre text, 
	apellido text, 
	nota int, 
	id_clase int REFERENCES clase(id),
	PRIMARY KEY (dni)
);

-- insert 

insert into clase VALUES(1,20);
insert into clase VALUES(2,20);
insert into clase VALUES(3,20);
insert into clase VALUES(4,20);
insert into clase VALUES(5,20);
insert into clase VALUES(6,20);
insert into clase VALUES(7,20);
insert into clase VALUES(8,20);
insert into clase VALUES(9,20);
insert into clase VALUES(10,20);

INSERT INTO alumno VALUES("0000000A","Juan","Martínez",10,1);
INSERT INTO alumno VALUES("0000001A","Paco","Martínez",5,2);
INSERT INTO alumno VALUES("0000002A","Luis","Pérez",6,3);
INSERT INTO alumno VALUES("0000003A","Maria","Antonia",2,4);
INSERT INTO alumno VALUES("0000004A","Carlos","Ignacio",4,5);
INSERT INTO alumno VALUES("0000005A","Marco","Polo",10,6);
INSERT INTO alumno VALUES("0000006A","Dimas","Martínez",10,7);
INSERT INTO alumno VALUES("0000007A","Juan","Abrante",10,8);
INSERT INTO alumno VALUES("0000008A","Noelia","Pérez",9,9);
INSERT INTO alumno VALUES("0000009A","Agusto","Gusto",7,2);
INSERT INTO alumno VALUES("0000010A","Paco","Maco",5,1);
INSERT INTO alumno VALUES("0000011A","Leo","Teo",3,5);
INSERT INTO alumno VALUES("0000012A","Lolo","Manus",3,7);
INSERT INTO alumno VALUES("0000013A","Richard","Martínez",8,9);
INSERT INTO alumno VALUES("0000014A","Carlos","Abrante",5,10);

-- Consultas

1. Realiza la inserción de, al menos, 10 alumnos.
-- 2. Obtener los apellidos de los alumnos.

SELECT apellido FROM alumno;

-- 3. Obtener los apellidos de los alumnos sin repeticiones.

SELECT DISTINCT apellido FROM alumno;

-- 4. Obtener todos los datos de los alumnos que se apellidan __Martínez__.

SELECT * FROM alumno WHERE apellido in ("Martínez");

-- 5. Obtener todos los datos de los alumnos que se apellidan __Martínez__ y los que se apellidan __Pérez__.

SELECT * FROM alumno WHERE apellido in ("Martínez","Pérez");

-- 6. Obtener todos los datos de los alumnos que asisten a la clase __10__.

SELECT * FROM alumno WHERE id_clase=10;

-- 7. Obtener todos los datos de los alumnos que asisten a la clase __8__ y para el clase 5.

SELECT * FROM alumno WHERE id_clase in (10,5);

-- 8. Obtener todos los datos de los alumnos cuyo apellido comience por __P__.

SELECT * FROM alumno WHERE nombre like "P%";

-- 9. Obtener el número máximo de alumnos por en todas las clases.

SELECT max_alumnos FROM clase;

-- 10. Obtener el número de alumnos en cada clase.

SELECT count(dni),id_clase FROM alumno GROUP BY id_clase;

-- 11. Muestra todos los alumnos ordenando por nombre de forma descendiente y por nota de forma asc.

SELECT * FROM alumno ORDER BY nota,nombre DESC;

-- 12. Obtener un listado completo de alumnos, incluyendo los datos de su clase a la que asisten.

SELECT a.dni , a.nombre, a.apellido, a.nota, c.id, c.max_alumnos FROM alumno as a, clase as c WHERE a.id_clase=c.id;

-- 13. Obtener los nombres y apellido de los alumnos que asisten a la clase 4 y cuyo máximo de alumnos es mayor 10.

SELECT nombre, apellido FROM alumno WHERE id_clase=4 and id_clase in (SELECT id FROM clase WHERE max_alumnos>10);

-- 14. Obtener los datos de los clases cuyo número de alumnos es superior a la media de todos los clases.



-- 15. Obtener los nombres (únicamente los nombres) de los clases que tiene más de dos alumnos.

SELECT id FROM clase WHERE id in (SELECT id_clase FROM alumno GROUP BY id_clase HAVING count(dni)>2);

-- 16. Añadir un nuevo clase, con un número máximo de alumnos es 20.

INSERT INTO clase VALUES (11,20);

-- 17. Añadir dos nuevos alumnos vinculando a la clase creada.

INSERT INTO alumno VALUES("00000015A","Juan","Lopez",3,11);
INSERT INTO alumno VALUES("00000016A","Paco","Maco",5,11);


-- 18. Calcula el 10% de los alumnos por clase.

SELECT id,max_alumnos*0.9 FROM clase GROUP BY id;

-- 19. Elimina a todos los alumnos que asisten a la clase con id 2.

DELETE FROM alumno WHERE id_clase=2;

-- 20. Elimina a todos los alumnos cuyo numero de alumnos máximo sea superior a 54

DELETE FROM alumno WHERE nota < (SELECT avg(nota)*0.3 FROM alumno);