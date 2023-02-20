-- sentencia sql de creación de la/s tabla/s de la bbdd



CREATE TABLE caja ( 
	id text,
	contenido text, 
	valor int, 
	id_almacen int REFERENCES almacen(id),
	PRIMARY KEY (id)
);
	

-- sentencia sql para la inserción de datos

INSERT INTO almacen VALUES (1,'Bilbao',50);
INSERT INTO almacen VALUES (2,'Bilbao',60);
INSERT INTO almacen VALUES (3,'Madrid',160);
INSERT INTO almacen VALUES (4,'Bilbao',150);
INSERT INTO almacen VALUES (5,'Santa Cruz de Tenerife',60);
INSERT INTO almacen VALUES (6,'Madrid',150);
INSERT INTO almacen VALUES (7,'Santa Cruz de Tenerife',60);
INSERT INTO almacen VALUES (8,'Bilbao',150);
INSERT INTO almacen VALUES (9,'Bilbao',60);
INSERT INTO almacen VALUES (10,'Santa Cruz de Tenerife',180);
INSERT INTO almacen VALUES (11,'Madrid',100);
INSERT INTO almacen VALUES (12,'Bilbao',150);
INSERT INTO almacen VALUES (13,'Madrid',160);
INSERT INTO almacen VALUES (14,'Barcelona',150);
INSERT INTO almacen VALUES (15,'Madrid',160);
INSERT INTO almacen VALUES (16,'Barcelona',180);
INSERT INTO almacen VALUES (17,'Barcelona',100);
INSERT INTO almacen VALUES (18,'Madrid',150);
INSERT INTO almacen VALUES (19,'Santa Cruz de Tenerife',160);
INSERT INTO almacen VALUES (20,'Bilbao',150);

INSERT INTO caja VALUES("AH1","Verdura",100,1);
INSERT INTO caja VALUES("AH2","Fruta",200,2);
INSERT INTO caja VALUES("AH3","Pescado",250,3);
INSERT INTO caja VALUES("AH4","Carne",70,4);
INSERT INTO caja VALUES("AH5","Piel",250,5);
INSERT INTO caja VALUES("AH6","Tela",300,6);
INSERT INTO caja VALUES("AH7","Carne",70,7);
INSERT INTO caja VALUES("AH8","Piel",250,8);
INSERT INTO caja VALUES("AH9","Tela",320,9);
INSERT INTO caja VALUES("AH10","Discos",70,10);
INSERT INTO caja VALUES("AH11","Chorizo",350,11);
INSERT INTO caja VALUES("AH12","Aluminio",500,12);
INSERT INTO caja VALUES("AH13","Verdura",100,13);
INSERT INTO caja VALUES("AH14","Fruta",200,14);
INSERT INTO caja VALUES("AH15","Pescado",250,15);
INSERT INTO caja VALUES("AH16","Carne",70,16);
INSERT INTO caja VALUES("AH17","Aguacate",500,17);
INSERT INTO caja VALUES("AH18","Tela",340,18);
INSERT INTO caja VALUES("AH19","Carne",120,19);
INSERT INTO caja VALUES("AH20","Piel",250,20);
INSERT INTO caja VALUES("AH21","Mangos",325,1);
INSERT INTO caja VALUES("AH22","Queso",70,2);
INSERT INTO caja VALUES("AH23","Ruedas",350,3);
INSERT INTO caja VALUES("AH24","Aluminio",500,12);


-- Sentencia sql para cada una de las consultas especificadas.

--- 1. Obtener todos los almacenes

SELECT * FROM almacen;

-- 2. Obtener todas las cajas cuyo contenido tenga un valor superior a 150 €.

SELECT id FROM caja WHERE valor > 150;

-- 3. Obtener los tipos de contenidos de las cajas.

SELECT DISTINCT contenido FROM caja;

-- 4. Obtener el valor medio de todas las cajas.

SELECT avg(valor) as valor_medio FROM caja;

-- 5. Obtener el valor medio de las cajas de cada almacén.

SELECT id_almacen, avg(valor) as valor_medio FROM caja GROUP BY id_almacen;

-- 6. Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150 €.

SELECT id_almacen FROM caja GROUP BY id_almacen HAVING avg(valor)>150;

-- 7. Obtener el numero de referencia de cada caja junto con el nombre de la ciudad en la que se encuentra.

SELECT c.id,a.lugar FROM caja as c, almacen as a WHERE c.id_almacen=a.id;

-- 8. Obtener el número de cajas que hay en cada almacén.

SELECT count(id),id_almacen FROM caja GROUP BY id_almacen;

-- 9. Obtener los códigos de los almacenes que están saturados (los almacenes donde el número de cajas es superior a la capacidad).

SELECT id_almacen FROM almacen,caja GROUP BY id_almacen HAVING count(caja.id)>capacidad;

-- 10. Obtener los números de referencia de las cajas que están en Bilbao.

SELECT DISTINCT caja.id FROM caja,almacen WHERE id_almacen=almacen.id and almacen.lugar="Bilbao";

-- 11. Insertar un nuevo almacén en Madrid con capacidad para 3 cajas.

INSERT INTO almacen VALUES (21,"Madrid",3);

-- 12. Insertar una nueva caja, con número de referencia PH5, con contenido Papel, valor 100, y situada en el almacén 2.

INSERT INTO caja VALUES ("PH5","Papel",100,2);

-- 13. Rebajar el valor de todas las cajas un 15%, dado que estamos en rebajas.

SELECT valor-((15*valor)/100) FROM caja;

-- 14. Rebajar un 20% el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas.

SELECT id, valor-((20*valor)/100) FROM caja WHERE valor > (SELECT avg(valor) as valor_medio FROM caja);

-- 15. Eliminar todas las cajas cuyo valor sea inferior a 100.

DELETE FROM caja WHERE valor < 100;

-- 16. Vaciar el contenido de los almacenes que están saturados.

DELETE FROM caja WHERE id in (SELECT count(caja.id) as num_cajas FROM caja,almacen GROUP BY id_almacen HAVING num_cajas > capacidad);
