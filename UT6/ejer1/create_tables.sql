CREATE TABLE cientifico (
    id text PRIMARY KEY,
    nombre text, 
    apellido1 text, 
    apellido2 text   
);

CREATE TABLE proyecto(
    id text PRIMARY KEY,
    nombre text, 
    horas int
);

CREATE TABLE cientifico_proyecto (
    ref_cientifico references  cientifico(id),
    ref_proyecto references proyecto(id)
);


INSERT INTO cientifico VALUES ("1","Juan","Abrante","González");
INSERT INTO cientifico VALUES ("2","Juan","Hernández","González");
INSERT INTO cientifico VALUES ("3","Dimas","Abrante","Hernández");
INSERT INTO cientifico VALUES ("4","Noelia","Mesa","Carrillo");
INSERT INTO cientifico VALUES ("5","Manolo","Pérez","González");

INSERT INTO proyecto VALUES ("1","LOLOPO",200);
INSERT INTO proyecto VALUES ("2","LELEPE",300);

INSERT INTO cientifico_proyecto VALUES ("1","1",100);
INSERT INTO cientifico_proyecto VALUES ("2","2",100);
INSERT INTO cientifico_proyecto VALUES ("3","1",100);
INSERT INTO cientifico_proyecto VALUES ("4","2",100);
INSERT INTO cientifico_proyecto VALUES ("5","1",100);


DELIMITER $$ -- comienzo del delimitador
CREATE PROCEDURE obtener_datos
BEGIN
    SELECT c.*, p.* FROM cientifico as c join cientifico_proyecto as cp on cp.ref_cientifico=c.id join proyecto as p on p.id=cp.ref_proyecto;
END $$ -- fin del delimitador

DELIMITER $$ -- comienzo del delimitador
CREATE PROCEDURE obtener_numero_proyectos
BEGIN 
    SELECT count(ref_proyecto) FROM cientifico_proyecto GROUP BY ref_cientifico;
END $$ -- fin del delimitador

DELIMITER $$ -- comienzo del delimitador
CREATE PROCEDURE obtener_numero_cientificos
BEGIN
    SELECT count(cp.ref_cientifico),cp.ref_proyecto, p.nombre FROM proyecto as p join cientifico_proyecto as cp on cp.ref_proyecto=p.id GROUP BY cp.ref_proyecto;

