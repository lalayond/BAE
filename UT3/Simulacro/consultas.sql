-- Consultas sobre una tabla (0,6 puntos)

-- 1. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

sqlite> select nombre, precio from producto order by precio limit 1; 

-- ┌───────────────────────────┬────────┐
-- │          nombre           │ precio │
-- ├───────────────────────────┼────────┤
-- │ Impresora HP Deskjet 3720 │ 59.99  │
-- └───────────────────────────┴────────┘

-- 2. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

sqlite> select * from producto where precio >= 80 and precio <= 300;
-- ┌────────┬─────────────────────────────────┬────────┬───────────────────┐
-- │ codigo │             nombre              │ precio │ codigo_fabricante │
-- ├────────┼─────────────────────────────────┼────────┼───────────────────┤
-- │ 1      │ Disco duro SATA3 1TB            │ 86.99  │ 5                 │
-- │ 2      │ Memoria RAM DDR4 8GB            │ 120.0  │ 6                 │
-- │ 3      │ Disco SSD 1 TB                  │ 150.99 │ 4                 │
-- │ 4      │ GeForce GTX 1050Ti              │ 185.0  │ 7                 │
-- │ 6      │ Monitor 24 LED Full HD          │ 202.0  │ 1                 │
-- │ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │
-- │ 11     │ Impresora HP Laserjet Pro M26nw │ 180.0  │ 3                 │
-- └────────┴─────────────────────────────────┴────────┴───────────────────┘

-- 3. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

sqlite> select nombre from fabricante where nombre regexp "^....$";
-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Asus   │
-- └────────┘

-- 4. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

sqlite> select nombre from producto where nombre regexp ".*Portátil*";
-- ┌─────────────────────┐
-- │       nombre        │
-- ├─────────────────────┤
-- │ Portátil Yoga 520   │
-- │ Portátil Ideapd 320 │
-- └─────────────────────┘

-- 5. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

sqlite> select nombre from producto where nombre regexp ".*Monitor*" and precio < 215;
-- ┌────────────────────────┐
-- │         nombre         │
-- ├────────────────────────┤
-- │ Monitor 24 LED Full HD │
-- └────────────────────────┘

-- 6. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

sqlite> select nombre, precio from producto where precio >= 180 order by nombre, precio desc;

-- ┌─────────────────────────────────┬────────┐
-- │             nombre              │ precio │
-- ├─────────────────────────────────┼────────┤
-- │ GeForce GTX 1050Ti              │ 185.0  │
-- │ GeForce GTX 1080 Xtreme         │ 755.0  │
-- │ Impresora HP Laserjet Pro M26nw │ 180.0  │
-- │ Monitor 24 LED Full HD          │ 202.0  │
-- │ Monitor 27 LED Full HD          │ 245.99 │
-- │ Portátil Ideapd 320             │ 444.0  │
-- │ Portátil Yoga 520               │ 559.0  │
-- └─────────────────────────────────┴────────┘

-- Consultas multitabla (INNER 0,7 puntos) Obligatorio aprobar

-- 7. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

sqlite> select p.nombre, max(p.precio) as precio, f.nombre from producto as p join fabricante as f on p.codigo_fabricante=f.codigo;

-- ┌─────────────────────────┬────────┬─────────┐
-- │         nombre          │ precio │ nombre  │
-- ├─────────────────────────┼────────┼─────────┤
-- │ GeForce GTX 1080 Xtreme │ 755.0  │ Crucial │
-- └─────────────────────────┴────────┴─────────┘

-- 8. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

sqlite> select p.* from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where f.nombre in ("Crucial") and p.precio > 200;

-- ┌────────┬─────────────────────────┬────────┬───────────────────┐
-- │ codigo │         nombre          │ precio │ codigo_fabricante │
-- ├────────┼─────────────────────────┼────────┼───────────────────┤
-- │ 5      │ GeForce GTX 1080 Xtreme │ 755.0  │ 6                 │
-- └────────┴─────────────────────────┴────────┴───────────────────┘

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

sqlite> select p.* from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where f.nombre="Asus" or f.nombre="Hewlett-Packardy Seagate";

-- ┌────────┬────────────────────────┬────────┬───────────────────┐
-- │ codigo │         nombre         │ precio │ codigo_fabricante │
-- ├────────┼────────────────────────┼────────┼───────────────────┤
-- │ 6      │ Monitor 24 LED Full HD │ 202.0  │ 1                 │
-- │ 7      │ Monitor 27 LED Full HD │ 245.99 │ 1                 │
-- └────────┴────────────────────────┴────────┴───────────────────┘

-- 10. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

sqlite> select p.* from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where f.nombre in ("Asus","Hewlett-Packardy Seagate");

-- ┌────────┬────────────────────────┬────────┬───────────────────┐
-- │ codigo │         nombre         │ precio │ codigo_fabricante │
-- ├────────┼────────────────────────┼────────┼───────────────────┤
-- │ 6      │ Monitor 24 LED Full HD │ 202.0  │ 1                 │
-- │ 7      │ Monitor 27 LED Full HD │ 245.99 │ 1                 │
-- └────────┴────────────────────────┴────────┴───────────────────┘

-- 11. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

sqlite> select p.nombre, p.precio from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where f.nombre regexp ".*e$";

-- ┌──────────────────────┬────────┐
-- │        nombre        │ precio │
-- ├──────────────────────┼────────┤
-- │ Disco duro SATA3 1TB │ 86.99  │
-- │ GeForce GTX 1050Ti   │ 185.0  │
-- └──────────────────────┴────────┘

-- 12. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

sqlite> select p.nombre, p.precio from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where f.nombre regexp "w";
-- ┌─────────────────────────────────┬────────┐
-- │             nombre              │ precio │
-- ├─────────────────────────────────┼────────┤
-- │ Impresora HP Deskjet 3720       │ 59.99  │
-- │ Impresora HP Laserjet Pro M26nw │ 180.0  │
-- └─────────────────────────────────┴────────┘

-- 13. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

sqlite> select p.nombre, p.precio, f.nombre  from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where precio >= 180 order by p.precio desc, p.nombre; 
-- ┌─────────────────────────────────┬────────┬─────────────────┐
-- │             nombre              │ precio │     nombre      │
-- ├─────────────────────────────────┼────────┼─────────────────┤
-- │ GeForce GTX 1080 Xtreme         │ 755.0  │ Crucial         │
-- │ Portátil Yoga 520               │ 559.0  │ Lenovo          │
-- │ Portátil Ideapd 320             │ 444.0  │ Lenovo          │
-- │ Monitor 27 LED Full HD          │ 245.99 │ Asus            │
-- │ Monitor 24 LED Full HD          │ 202.0  │ Asus            │
-- │ GeForce GTX 1050Ti              │ 185.0  │ Gigabyte        │
-- │ Impresora HP Laserjet Pro M26nw │ 180.0  │ Hewlett-Packard │
-- └─────────────────────────────────┴────────┴─────────────────┘

-- 14. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

sqlite> select f.codigo, f.nombre from fabricante as f left join producto as p on p.codigo_fabricante=f.codigo where p.codigo_fabricante is null;

-- ┌────────┬────────┐
-- │ codigo │ nombre │
-- ├────────┼────────┤
-- │ 8      │ Huawei │
-- │ 9      │ Xiaomi │
-- └────────┴────────┘

-- Consultas multitabla (LEFT/RIGHT JOIN 0,2) Obligatorio aprobar

-- 15. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

sqlite> select f.*, p.nombre from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante;

-- ┌────────┬─────────────────┬─────────────────────────────────┐
-- │ codigo │     nombre      │             nombre              │
-- ├────────┼─────────────────┼─────────────────────────────────┤
-- │ 1      │ Asus            │ Monitor 24 LED Full HD          │
-- │ 1      │ Asus            │ Monitor 27 LED Full HD          │
-- │ 2      │ Lenovo          │ Portátil Ideapd 320             │
-- │ 2      │ Lenovo          │ Portátil Yoga 520               │
-- │ 3      │ Hewlett-Packard │ Impresora HP Deskjet 3720       │
-- │ 3      │ Hewlett-Packard │ Impresora HP Laserjet Pro M26nw │
-- │ 4      │ Samsung         │ Disco SSD 1 TB                  │
-- │ 5      │ Seagate         │ Disco duro SATA3 1TB            │
-- │ 6      │ Crucial         │ GeForce GTX 1080 Xtreme         │
-- │ 6      │ Crucial         │ Memoria RAM DDR4 8GB            │
-- │ 7      │ Gigabyte        │ GeForce GTX 1050Ti              │
-- │ 8      │ Huawei          │                                 │
-- │ 9      │ Xiaomi          │                                 │
-- └────────┴─────────────────┴─────────────────────────────────┘

-- 16. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

sqlite> select f.* from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante where p.codigo_fabricante is null;

-- ┌────────┬────────┐
-- │ codigo │ nombre │
-- ├────────┼────────┤
-- │ 8      │ Huawei │
-- │ 9      │ Xiaomi │
-- └────────┴────────┘

--  Consultas resumen (0,6)

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

sqlite> select f.nombre,  max(p.precio) as precio_max, min(p.precio) as precio_min, avg(p.precio) as precio_med from fabricante as f join producto as p on f.codigo=p.codigo_fabricante group by f.codigo;

-- ┌─────────────────┬────────────┬────────────┬────────────┐
-- │     nombre      │ precio_max │ precio_min │ precio_med │
-- ├─────────────────┼────────────┼────────────┼────────────┤
-- │ Asus            │ 245.99     │ 202.0      │ 223.995    │
-- │ Lenovo          │ 559.0      │ 444.0      │ 501.5      │
-- │ Hewlett-Packard │ 180.0      │ 59.99      │ 119.995    │
-- │ Samsung         │ 150.99     │ 150.99     │ 150.99     │
-- │ Seagate         │ 86.99      │ 86.99      │ 86.99      │
-- │ Crucial         │ 755.0      │ 120.0      │ 437.5      │
-- │ Gigabyte        │ 185.0      │ 185.0      │ 185.0      │
-- └─────────────────┴────────────┴────────────┴────────────┘

-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
-- No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.

select f.nombre,  max(p.precio) as precio_max, min(p.precio) as precio_min, avg(p.precio) as precio_med, count(p.codigo) as cantidad from fabricante as f join producto as p on f.codigo=p.codigo_fabricante group by f.codigo having precio_med > 200;

-- ┌─────────┬────────────┬────────────┬────────────┬──────────┐
-- │ nombre  │ precio_max │ precio_min │ precio_med │ cantidad │
-- ├─────────┼────────────┼────────────┼────────────┼──────────┤
-- │ Asus    │ 245.99     │ 202.0      │ 223.995    │ 2        │
-- │ Lenovo  │ 559.0      │ 444.0      │ 501.5      │ 2        │
-- │ Crucial │ 755.0      │ 120.0      │ 437.5      │ 2        │
-- └─────────┴────────────┴────────────┴────────────┴──────────┘

-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.

sqlite> select f.nombre,  max(p.precio) as precio_max, min(p.precio) as precio_min, avg(p.precio) as precio_med, count(p.codigo) from fabricante as f join producto as p on f.codigo=p.codigo_fabricante group by f.codigo having precio_med > 200;
-- ┌─────────┬────────────┬────────────┬────────────┬─────────────────┐
-- │ nombre  │ precio_max │ precio_min │ precio_med │ count(p.codigo) │
-- ├─────────┼────────────┼────────────┼────────────┼─────────────────┤
-- │ Asus    │ 245.99     │ 202.0      │ 223.995    │ 2               │
-- │ Lenovo  │ 559.0      │ 444.0      │ 501.5      │ 2               │
-- │ Crucial │ 755.0      │ 120.0      │ 437.5      │ 2               │
-- └─────────┴────────────┴────────────┴────────────┴─────────────────┘

-- 20. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes,
--  es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

sqlite> select f.nombre, coalesce(count(p.codigo), 0) as cantidad from fabricante as f join producto as p on f.codigo=p.codigo_fabricante where p.precio > 220 group by f.codigo;

-- ┌─────────┬──────────┐
-- │ nombre  │ cantidad │
-- ├─────────┼──────────┤
-- │ Asus    │ 1        │
-- │ Lenovo  │ 2        │
-- │ Crucial │ 1        │
-- └─────────┴──────────┘

-- 21. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.

sqlite> select f.nombre from fabricante as f join producto as p on f.codigo=p.codigo_fabricante group by f.codigo having sum(p.precio) > 1000;

-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Lenovo │
-- └────────┘

-- 22. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. 
-- El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

sqlite> select p.nombre, max(p.precio) as precio , f.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante group by f.codigo order by f.nombre;

-- ┌─────────────────────────────────┬────────┬─────────────────┐
-- │             nombre              │ precio │     nombre      │
-- ├─────────────────────────────────┼────────┼─────────────────┤
-- │ Monitor 27 LED Full HD          │ 245.99 │ Asus            │
-- │ Portátil Yoga 520               │ 559.0  │ Lenovo          │
-- │ Impresora HP Laserjet Pro M26nw │ 180.0  │ Hewlett-Packard │
-- │ Disco SSD 1 TB                  │ 150.99 │ Samsung         │
-- │ Disco duro SATA3 1TB            │ 86.99  │ Seagate         │
-- │ GeForce GTX 1080 Xtreme         │ 755.0  │ Crucial         │
-- │ GeForce GTX 1050Ti              │ 185.0  │ Gigabyte        │
-- └─────────────────────────────────┴────────┴─────────────────┘

--  Subconsultas (En la cláusula WHERE 0,9 obligatorio aprobar)

-- 23. Con operadores básicos de comparación
-- 24. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

sqlite> select p.nombre from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and  f.nombre in ("Lenovo");

-- ┌─────────────────────┐
-- │       nombre        │
-- ├─────────────────────┤
-- │ Portátil Yoga 520   │
-- │ Portátil Ideapd 320 │
-- └─────────────────────┘

-- 25. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

sqlite> select p.* from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and p.precio = (select max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Lenovo"));

-- ┌────────┬───────────────────┬────────┬───────────────────┐
-- │ codigo │      nombre       │ precio │ codigo_fabricante │
-- ├────────┼───────────────────┼────────┼───────────────────┤
-- │ 8      │ Portátil Yoga 520 │ 559.0  │ 2                 │
-- └────────┴───────────────────┴────────┴───────────────────┘

-- 26. Lista el nombre del producto más caro del fabricante Lenovo.

sqlite> select p.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Lenovo") and p.precio in (select max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Lenovo"));

-- ┌───────────────────┐
-- │      nombre       │
-- ├───────────────────┤
-- │ Portátil Yoga 520 │
-- └───────────────────┘

-- 27. Lista el nombre del producto más barato del fabricante Hewlett-Packard.



-- 28. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

sqlite> select nombre from producto where precio >= (select max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Lenovo"));

-- ┌─────────────────────────┐
-- │         nombre          │
-- ├─────────────────────────┤
-- │ GeForce GTX 1080 Xtreme │
-- │ Portátil Yoga 520       │
-- └─────────────────────────┘

-- 29. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

sqlite> select p.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Asus") and p.precio > (select avg(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre in ("Asus"));
-- ┌────────────────────────┐
-- │         nombre         │
-- ├────────────────────────┤
-- │ Monitor 27 LED Full HD │
-- └────────────────────────┘

-- 30. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.



-- 31.Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.


-- Subconsultas con IN y NOT IN (0,2 obligatorio aprobar)

-- 32. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

sqlite> select distinct f.nombre from fabricante as f join producto as p on f.codigo=p.codigo_fabricante where p.codigo in ( select codigo from producto);
-- ┌─────────────────┐
-- │     nombre      │
-- ├─────────────────┤
-- │ Seagate         │
-- │ Crucial         │
-- │ Samsung         │
-- │ Gigabyte        │
-- │ Asus            │
-- │ Lenovo          │
-- │ Hewlett-Packard │
-- └─────────────────┘

-- 33. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

select distinct f.nombre from fabricante as f, producto as p where f.codigo not in ( select codigo_fabricante from producto);

-- Subconsultas con EXISTS y NOT EXISTS (0,2 obligatorio aprobar)

-- 34. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

sqlite> select distinct f.nombre from fabricante as f join producto as p on f.codigo=p.codigo_fabricante where exists ( select codigo from producto);

-- ┌─────────────────┐
-- │     nombre      │
-- ├─────────────────┤
-- │ Seagate         │
-- │ Crucial         │
-- │ Samsung         │
-- │ Gigabyte        │
-- │ Asus            │
-- │ Lenovo          │
-- │ Hewlett-Packard │
-- └─────────────────┘

-- 35. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

sqlite> select distinct f.nombre from fabricante as f join producto as p on f.codigo=p.codigo_fabricante where not exists ( select codigo from producto);

--  Subconsultas correlacionadas (0,5 obligatorio aprobar)

-- 36. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

sqlite> select f.nombre, p.nombre, p.precio as precio  from fabricante as f, producto as p where f.codigo=p.codigo_fabricante and p.codigo in (select p.codigo from producto as p, fabricante as f where f.codigo=p.codigo_fabricante group by f.codigo having max(p.precio));

-- ┌─────────────────┬─────────────────────────────────┬────────┐
-- │     nombre      │             nombre              │ precio │
-- ├─────────────────┼─────────────────────────────────┼────────┤
-- │ Seagate         │ Disco duro SATA3 1TB            │ 86.99  │
-- │ Samsung         │ Disco SSD 1 TB                  │ 150.99 │
-- │ Gigabyte        │ GeForce GTX 1050Ti              │ 185.0  │
-- │ Crucial         │ GeForce GTX 1080 Xtreme         │ 755.0  │
-- │ Asus            │ Monitor 27 LED Full HD          │ 245.99 │
-- │ Lenovo          │ Portátil Yoga 520               │ 559.0  │
-- │ Hewlett-Packard │ Impresora HP Laserjet Pro M26nw │ 180.0  │
-- └─────────────────┴─────────────────────────────────┴────────┘

-- 37. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

sqlite> select p.nombre from fabricante as f, producto as p where f.codigo=p.codigo_fabricante and p.precio >= (select avg(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante group by f.codigo);

-- ┌─────────────────────────┐
-- │         nombre          │
-- ├─────────────────────────┤
-- │ GeForce GTX 1080 Xtreme │
-- │ Monitor 27 LED Full HD  │
-- │ Portátil Yoga 520       │
-- │ Portátil Ideapd 320     │
-- └─────────────────────────┘

-- 38. Lista el nombre del producto más caro del fabricante Lenovo.



--  39. Subconsultas (En la cláusula HAVING)
-- 40 .Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.