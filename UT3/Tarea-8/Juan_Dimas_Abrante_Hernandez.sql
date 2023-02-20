-- Creacion de tabalas

CREATE TABLE pieza (
	id int,
	nombre text,
	PRIMARY KEY (id)
);

CREATE TABLE proveedor (
	id text, 
	nombre text, 
	PRIMARY KEY (id)
);

CREATE TABLE suministra (
	ref_pieza_codigo int REFERENCES pieza(id),
	ref_proveedor text REFERENCES proveedor(id),
	precio int, 
	PRIMARY KEY (ref_pieza_codigo,ref_proveedor)
);
		

-- Inserción de datos

INSERT INTO pieza VALUES (1,"Tuerca");
INSERT INTO pieza VALUES(2,"Tornillo");
INSERT INTO pieza VALUES (3,"Rodamiento");
INSERT INTO pieza VALUES (4,"Clavo");
INSERT INTO pieza VALUES (5,"Aceite");
INSERT INTO pieza VALUES (6,"Polea");
INSERT INTO pieza VALUES (7,"Cadena");
INSERT INTO pieza VALUES (8,"Correa");
INSERT INTO pieza VALUES (9,"Manguera");
INSERT INTO pieza VALUES (10,"Flotador");

INSERT INTO proveedor VALUES ("HAL","Almacenes Paco");
INSERT INTO proveedor VALUES ("TNBC","SjeHington Supplies");
INSERT INTO proveedor VALUES ("RBT","Susan Calvin Corp");
INSERT INTO proveedor VALUES ("MNL","Manolo e Hijos");
INSERT INTO proveedor VALUES ("ETM","Marrero");

INSERT INTO suministra VALUES (1,"HAL",12);
INSERT INTO suministra VALUES (2,"TNBC",6);
INSERT INTO suministra VALUES (3,"RBT",5);
INSERT INTO suministra VALUES (4,"RBT",10);
INSERT INTO suministra VALUES (5,"MNL",6);
INSERT INTO suministra VALUES (6,"ETM",17);
INSERT INTO suministra VALUES (7,"HAL",8);
INSERT INTO suministra VALUES (8,"TNBC",9);
INSERT INTO suministra VALUES (9,"MNL",12);
INSERT INTO suministra VALUES (10,"HAL",11);
INSERT INTO suministra VALUES (10,"TNBC",12);
INSERT INTO suministra VALUES (1,"ETM",13);
INSERT INTO suministra VALUES (2,"MNL",14);
INSERT INTO suministra VALUES (3,"HAL",15);
INSERT INTO suministra VALUES (4,"ETM",11);
INSERT INTO suministra VALUES (5,"TNBC",12);
INSERT INTO suministra VALUES (6,"TNBC",21);
INSERT INTO suministra VALUES (7,"ETM",15);
INSERT INTO suministra VALUES (8,"HAL",13);
INSERT INTO suministra VALUES (9,"RBT",12);

-- Consultas


-- Obtener los nombres de todas las piezas.

SELECT nombre FROM pieza;

-- Obtener todos los datos de todos los proveedores.

SELECT * FROM proveedor;

-- Obtener el precio medio al que se nos suministran las piezas.

SELECT avg(precio) FROM suministra;

-- Obtener los nombres de los proveedores que suministran la pieza 1.

SELECT p.nombre FROM proveedor as p, suministra as s WHERE p.id=s.ref_proveedor and s.ref_pieza_codigo=1;

-- Obtener los nombres de las piezas suministradas por el proveedor cuyo código es HAL.

SELECT p.nombre FROM pieza as p, suministra as s WHERE p.id=s.ref_pieza_codigo and s.ref_proveedor="HAL";

-- Obtener los nombres de los proveedores que suministran las piezas más caras, indicando el nombre de la pieza y el precio al que la suministran.

SELECT p.nombre FROM proveedor as p, suministra as s WHERE p.id=s.ref_proveedor GROUP BY s.ref_proveedor HAVING max(precio) in (SELECT max(precio) FROM suministra);

-- Hacer constar en la base de datos que la empresa SkeHington Supplies (codigo TNBC) va a empezar a suministrarnos los elementos piezas con código 1 a 10 € cada tuerca.

INSERT INTO suministra VALUES (1,"TNBC",10);

-- Aumentar los precios en una unidad.

UPDATE suministra SET precio = precio + 1;

-- Hacer constar en la base de datos que la empresa Susan Calvin Corp.(RBT) no va a suministrarnos ninguna pieza (aunque la empresa en si va a seguir constando en nuestra base de datos).

DELETE FROM suministra WHERE ref_proveedor="RBT";

-- Hacer constar en la base de datos que la empresa Susan Calvin Corp. (RBT) ya no va a suministrarnos clavos (código 4).

DELETE FROM suministra WHERE ref_proveedor="RBT" and ref_pieza_codigo=1;