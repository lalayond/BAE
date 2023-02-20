-- sentencia sql de creación de la/s tabla/s de la bbdd

CREATE TABLE despacho (
	id int, 
	capacidad int, 
	PRIMARY KEY (id)
);

CREATE TABLE director (
	dni text, 
	nombre text, 
	apellido text, 
	director_jefe text REFERENCES director(dni),
	id_despacho int REFERENCES despacho(id),
	PRIMARY KEY (dni)
);

-- sentencia sql para la inserción de datos

INSERT INTO despacho VALUES ( 1, 5 );
INSERT INTO despacho VALUES ( 2, 5 );
INSERT INTO despacho VALUES ( 3, 3 );
INSERT INTO despacho VALUES ( 4, 4 );
INSERT INTO despacho VALUES ( 5, 6 );
INSERT INTO despacho VALUES ( 6, 4 );
INSERT INTO despacho VALUES ( 7, 6 );

INSERT INTO director VALUES ( "00000006A","Manolo","Gonzalez",NULL,2);
INSERT INTO director VALUES ( "00000007A","Martín","Abrante",NULL,4);
INSERT INTO director VALUES ( "00000008A","Jorge","Perez",NULL,5);
INSERT INTO director VALUES ( "00000009A","Noelia","Carrillo",NULL,6);
INSERT INTO director VALUES ( "000000010A","Elena","Hernandez",NULL,7);
INSERT INTO director VALUES ( "000000011A","Marcos","Perez",NULL,7);
INSERT INTO director VALUES ( "000000012A","Luis","Carrillo",NULL,6);
INSERT INTO director VALUES ( "000000013A","Miriam","Hernandez",NULL,5);
INSERT INTO director VALUES ( "00000001A","Juan","Abrante","00000006A",4);
INSERT INTO director VALUES ( "00000002A","Paco","Hernandez","00000007A",3);
INSERT INTO director VALUES ( "00000003A","Jorge","Garcia","00000008A",3);
INSERT INTO director VALUES ( "00000004A","Antonio","Mendoza","000000010A",3);
INSERT INTO director VALUES ( "00000005A","Dimas","Abrante","000000011A",1);

-- Sentencia sql para cada una de las consultas especificadas.

1 -- Mostrar el DNI, nombre y apellidos de todos los directores.

SELECT dni,nombre,apellido FROM director;

2 -- Mostrar los datos de los directores que no tienen jefes,

SELECT dni,nombre,apellido FROM director WHERE director_jefe is NULL;

3 -- Mostrar el nombre y apellidos de cada director, junto con la capacidad del despacho en el que se encuentra.

SELECT d.nombre,d.apellido,de.capacidad FROM director as d, despacho as de WHERE d.id_despacho=de.id;

4 -- Mostrar el número de directores que hay en cada despacho.

SELECT de.id,count(d.dni) as cantidas_de_directores FROM despacho as de,director as d WHERE d.id_despacho=de.id GROUP BY de.id;

5 -- Mostrar los datos de los directores cuyos jefes no tienen jefes.


6 -- Mostrar los nombres y apellidos de los directores junto con los de su jefe.

SELECT d.nombre, d.apellido, dj.nombre as nombre_jefe, dj.apellido as apellido_jefe FROM director as d, director as dj WHERE d.director_jefe=dj.dni;

7 -- Mostrar el número de despachos que están sobreutilizados.

SELECT d.id FROM despacho as d, director as di WHERE d.id=di.id_despacho GROUP BY d.id HAVING count(di.dni)>d.capacidad;


8 -- Añadir un nuevo director llamado Paco Pérez, DNI 11111111T, sin jefe, y situado en el despacho 3,

INSERT INTO director VALUES ("11111111T","Paco","Pérez",NULL,3);

9 -- Asignar a todos los empleados apellidados Pérez un nuevo jefe con DNI 00000000H.

UPDATE director SET director_jefe="00000000H" WHERE apellido="Pérez";

10 -- Despedir a todos los directores, excepto a los que no tienen jefe.

DELETE FROM director WHERE director_jefe is not NULL;