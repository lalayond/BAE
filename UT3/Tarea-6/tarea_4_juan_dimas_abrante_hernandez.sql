-- sentencia sql de creación de la/s tabla/s de la bbdd

CREATE TABLE fabricante (
	dni text, 
	nombre text, 
	PRIMARY KEY (dni)
);

CREATE TABLE articulo (
	clave int,
	nombre text, 
	precio int,
	dni_fabricante text REFERENCES fabricante(dni),
	PRIMARY KEY (clave)
);


-- sentencia sql para la inserción de datos

INSERT INTO fabricante VALUES ("1",
"Kingston");
INSERT INTO fabricante VALUES ("2",
"Adata");
INSERT INTO fabricante VALUES ("3",
"Logitech");
INSERT INTO fabricante VALUES ("4",
"Lexar");
INSERT INTO fabricante VALUES ("5",
"Seagate");

INSERT INTO articulo VALUES (1,"Teclado",100,"3");
INSERT INTO articulo VALUES (2,"Disco duro 300 Gb",500,"5");
INSERT INTO articulo VALUES (3,"Mouse",80,"3");
INSERT INTO articulo VALUES (4,"Memoria USB",140,"4");
INSERT INTO articulo VALUES (5,"Memoria RAM 290",1,"2");
INSERT INTO articulo VALUES (6,"Disco duro extraíble 250 Gb",650,"5");
INSERT INTO articulo VALUES (7,"Memoria USB",279,"1");
INSERT INTO articulo VALUES (8,"DVD Rom",450,"2");
INSERT INTO articulo VALUES (9,"CD Rom",200,"2");
INSERT INTO articulo VALUES (10,"Tarjeta de red",180,"3");


-- Sentencia sql para cada una de las consultas especificadas.


1 -- Obtener todos los datos de los productos de la tienda.

SELECT * FROM articulo;

2 -- Obtener los nombres de los productos de la tienda.

SELECT nombre FROM articulo;

3 -- Obtener los nombres y precio de los productos de la tienda. Obtener los nombres de los artículos sin repeticiones.

SELECT DISTINCT nombre,precio FROM articulo;

4 -- Obtener todos los datos del artículo cuya clave de producto es 5.

SELECT * FROM articulo WHERE clave=5;

5 -- Obtener todos los datos del artículo cuyo nombre del producto es Teclado.

SELECT * FROM articulo WHERE nombre="Teclado";

6 -- Obtener todos los datos de la Memoria RAM y memorias USB.

SELECT * FROM articulo WHERE nombre in ("Memoria RAM","Memoria USB");

7 -- Obtener todos los datos de los artículos que empiezan con M.

SELECT * FROM articulo WHERE nombre like "M%";

8 -- Obtener el nombre de los productos donde el precio sea 100.

SELECT nombre FROM articulo WHERE precio=100;

9 -- Obtener el nombre de los productos donde el precio sea mayor a 200.

SELECT nombre FROM articulo WHERE precio>200;

10 -- Obtener todos los datos de los artículos cuyo precio este entre 100 y 350.

SELECT * FROM articulo WHERE precio > 100 and precio < 350;

11 -- Obtener el precio medio de todos los productos.

SELECT avg(precio) FROM articulo;

12 -- Obtener el precio medio de los artículos cuyo código de fabricante sea 2.

SELECT avg(precio) FROM articulo WHERE dni_fabricante=2;

13 -- Obtener el nombre y precio de los artículos ordenados por Nombre.

SELECT nombre,precio FROM articulo ORDER BY nombre;

14 -- Obtener todos los datos de los productos ordenados descendentemente por Precio.

SELECT * FROM articulo ORDER BY precio DESC;

15 -- Obtener el nombre y precio de los artículos cuyo precio sea mayor a 250 y ordenarlos descendentemente por precio y luego ascendentemente por nombre.

SELECT nombre,precio FROM articulo WHERE precio>250 ORDER BY nombre,precio DESC;

16 -- Obtener un listado completo de los productos, incluyendo por cada articulo los datos del articulo y del fabricante.

SELECT a.clave, a.nombre, a.precio, f.dni, f.nombre FROM articulo as a, fabricante as f;

17 -- Obtener la clave de producto, nombre del producto y nombre del fabricante de todos los productos en venta.

SELECT a.clave,a.nombre,f.nombre FROM articulo as a, fabricante as f WHERE a.clave=f.dni;

18 -- Obtener el nombre y precio de los artículos donde el fabricante sea Logitech ordenarlos alfabéticamente por nombre del producto.

SELECT DISTINCT a.nombre, a.precio FROM articulo as a, fabricante as f WHERE dni_fabricante in (SELECT dni_fabricante FROM fabricante,articulo WHERE dni_fabricante=dni and fabricante.nombre="Logitech") ORDER BY a.nombre;

19 -- Obtener el nombre, precio y nombre de fabricante de los productos que son marca Lexar o Kingston ordenados descendentemente por precio.

SELECT a.nombre, precio, f.nombre FROM articulo as a, fabricante as f WHERE dni=dni_fabricante and f.nombre in ("Lexar","Kingston") ORDER BY a.precio DESC;

20 -- Añade un nuevo producto: Clave del producto 11, Altavoces de 120 del fabricante 2.

INSERT INTO articulo VALUES(11,"Altavoces",120,"2");

21 -- Cambia el nombre del producto 6 a Impresora Laser.

UPDATE articulo SET nombre="Impresora Laser" WHERE clave=6;

22 -- Aplicar un descuento del 10% a todos los productos.

UPDATE articulo SET precio=precio-(10*(precio/100));

23 -- Aplicar un descuento de 10 a todos los productos cuyo precio sea mayor o igual a 300.

UPDATE articulo SET precio=precio-10 WHERE precio>=300;

24 -- Borra el producto número 6.

DELETE FROM articulo WHERE clave=6;

