-- Consultas sobre una tabla (0,6 puntos)

-- 1. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
-- 2. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
-- 3. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
-- 4. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
-- 5. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
-- 6. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

-- Consultas multitabla (INNER 0,7 puntos) Obligatorio aprobar

-- 7. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
-- 8. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
-- 10. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
-- 11. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
-- 12. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
-- 13. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
-- 14. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

-- Consultas multitabla (LEFT/RIGHT JOIN 0,2) Obligatorio aprobar

-- 15. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
-- El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

sqlite> select f.nombre, p.nombre from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante;

-- ┌─────────────────┬─────────────────────────────────┐
-- │     nombre      │             nombre              │
-- ├─────────────────┼─────────────────────────────────┤
-- │ Asus            │ Monitor 24 LED Full HD          │
-- │ Asus            │ Monitor 27 LED Full HD          │
-- │ Lenovo          │ Portátil Ideapd 320             │
-- │ Lenovo          │ Portátil Yoga 520               │
-- │ Hewlett-Packard │ Impresora HP Deskjet 3720       │
-- │ Hewlett-Packard │ Impresora HP Laserjet Pro M26nw │
-- │ Samsung         │ Disco SSD 1 TB                  │
-- │ Seagate         │ Disco duro SATA3 1TB            │
-- │ Crucial         │ GeForce GTX 1080 Xtreme         │
-- │ Crucial         │ Memoria RAM DDR4 8GB            │
-- │ Gigabyte        │ GeForce GTX 1050Ti              │
-- │ Huawei          │                                 │
-- │ Xiaomi          │                                 │
-- └─────────────────┴─────────────────────────────────┘

-- 16. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

sqlite> select f.nombre from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante where p.codigo is null;

-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Huawei │
-- │ Xiaomi │
-- └────────┘

--  Consultas resumen (0,6)

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
-- 20. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ 
-- deberá aparecer en el listado con un valor igual a 0 en el número de productos.

sqlite> select f.nombre, count(p.codigo) from fabricante as f left join (select * from producto where precio >= 220)  as p on f.codigo=p.codigo_fabricante group by f.codigo;

-- ┌─────────────────┬─────────────────┐
-- │     nombre      │ count(p.codigo) │
-- ├─────────────────┼─────────────────┤
-- │ Asus            │ 1               │
-- │ Lenovo          │ 2               │
-- │ Hewlett-Packard │ 0               │
-- │ Samsung         │ 0               │
-- │ Seagate         │ 0               │
-- │ Crucial         │ 1               │
-- │ Gigabyte        │ 0               │
-- │ Huawei          │ 0               │
-- │ Xiaomi          │ 0               │
-- └─────────────────┴─────────────────┘


-- 21. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
-- 22. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

--  Subconsultas (En la cláusula WHERE 0,9 obligatorio aprobar)

-- 23. Con operadores básicos de comparación
-- 24. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

sqlite> select nombre from producto where codigo_fabricante=(select codigo from fabricante where nombre="Lenovo");            

-- ┌─────────────────────┐
-- │       nombre        │
-- ├─────────────────────┤
-- │ Portátil Yoga 520   │
-- │ Portátil Ideapd 320 │
-- └─────────────────────┘

-- 25. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

sqlite> select * from producto where precio=(select precio from producto where codigo_fabricante=(select codigo from fabricante where nombre in ("Lenovo")) order by precio desc limit 1); 

-- ┌────────┬───────────────────┬────────┬───────────────────┐
-- │ codigo │      nombre       │ precio │ codigo_fabricante │
-- ├────────┼───────────────────┼────────┼───────────────────┤
-- │ 8      │ Portátil Yoga 520 │ 559.0  │ 2                 │
-- └────────┴───────────────────┴────────┴───────────────────┘

-- 26. Lista el nombre del producto más caro del fabricante Lenovo.

sqlite> select nombre from producto where codigo in (select codigo from producto where codigo_fabricante=(select codigo from fabricante where nombre in ("Lenovo")) order by precio desc limit 1); 

-- ┌───────────────────┐
-- │      nombre       │
-- ├───────────────────┤
-- │ Portátil Yoga 520 │
-- └───────────────────┘

-- 27. Lista el nombre del producto más barato del fabricante Hewlett-Packard.

sqlite> select nombre from producto where codigo in (select codigo from producto where codigo_fabricante=(select codigo from fabricante where nombre in ("Hewlett-Packard")) order by precio limit 1);  

-- ┌───────────────────────────┐
-- │          nombre           │
-- ├───────────────────────────┤
-- │ Impresora HP Deskjet 3720 │
-- └───────────────────────────┘

-- 28. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

sqlite> select * from producto where precio >= (select precio from producto where codigo_fabricante=(select codigo from fabricante where nombre in ("Lenovo")) order by precio desc limit 1);

-- ┌────────┬─────────────────────────┬────────┬───────────────────┐
-- │ codigo │         nombre          │ precio │ codigo_fabricante │
-- ├────────┼─────────────────────────┼────────┼───────────────────┤
-- │ 5      │ GeForce GTX 1080 Xtreme │ 755.0  │ 6                 │
-- │ 8      │ Portátil Yoga 520       │ 559.0  │ 2                 │
-- └────────┴─────────────────────────┴────────┴───────────────────┘

-- 29. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

sqlite> select nombre from producto where codigo_fabricante=(select codigo from fabricante where nombre in ("Asus")) and precio > (select avg(precio) from producto where codigo_fabricante=(select codigo from fabricante where nombre in ("Asus")));
sqlite> select p.nombre from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre="Asus" and precio > (select avg(precio) from producto where codigo_fabricante=(select codigo from fabricante where nombre in ("Asus"))); 
┌────────────────────────┐
│         nombre         │
├────────────────────────┤
│ Monitor 27 LED Full HD │
└────────────────────────┘

-- 30. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
-- 31.Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.


-- Subconsultas con IN y NOT IN (0,2 obligatorio aprobar)

-- 32. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

sqlite> select nombre from fabricante where codigo in (select codigo_fabricante from producto);

-- ┌─────────────────┐
-- │     nombre      │
-- ├─────────────────┤
-- │ Asus            │
-- │ Lenovo          │
-- │ Hewlett-Packard │
-- │ Samsung         │
-- │ Seagate         │
-- │ Crucial         │
-- │ Gigabyte        │
-- └─────────────────┘

-- 33. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

sqlite> select nombre from fabricante where codigo not in (select codigo_fabricante from producto);

-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Huawei │
-- │ Xiaomi │
-- └────────┘

-- Subconsultas con EXISTS y NOT EXISTS (0,2 obligatorio aprobar)

-- 34. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

sqlite> select f.nombre from fabricante as f where exists (select * from producto where producto.codigo_fabricante=f.codigo);

-- ┌─────────────────┐
-- │     nombre      │
-- ├─────────────────┤
-- │ Asus            │
-- │ Lenovo          │
-- │ Hewlett-Packard │
-- │ Samsung         │
-- │ Seagate         │
-- │ Crucial         │
-- │ Gigabyte        │
-- └─────────────────┘

-- 35. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

sqlite> select f.nombre from fabricante as f where not exists (select * from producto where producto.codigo_fabricante=f.codigo);

-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Huawei │
-- │ Xiaomi │
-- └────────┘

--  Subconsultas correlacionadas (0,5 obligatorio aprobar)

-- 36. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

sqlite> select f.nombre, p.nombre, p.precio from fabricante as f, producto as p where f.codigo=p.codigo_fabricante and p.precio=(select max(precio) from producto where producto.codigo_fabricante=f.codigo);
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

sqlite> select p.* from producto as p where p.precio >= (select avg(precio) from producto where producto.codigo_fabricante=p.codigo_fabricante);                                                  

-- ┌────────┬─────────────────────────────────┬────────┬───────────────────┐
-- │ codigo │             nombre              │ precio │ codigo_fabricante │
-- ├────────┼─────────────────────────────────┼────────┼───────────────────┤
-- │ 1      │ Disco duro SATA3 1TB            │ 86.99  │ 5                 │
-- │ 3      │ Disco SSD 1 TB                  │ 150.99 │ 4                 │
-- │ 4      │ GeForce GTX 1050Ti              │ 185.0  │ 7                 │
-- │ 5      │ GeForce GTX 1080 Xtreme         │ 755.0  │ 6                 │
-- │ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │
-- │ 8      │ Portátil Yoga 520               │ 559.0  │ 2                 │
-- │ 11     │ Impresora HP Laserjet Pro M26nw │ 180.0  │ 3                 │
-- └────────┴─────────────────────────────────┴────────┴───────────────────┘

-- 38. Lista el nombre del producto más caro del fabricante Lenovo.

sqlite> select p.nombre from fabricante as f, producto as p where f.codigo=p.codigo_fabricante and f.nombre="Lenovo" and p.precio=(select max(precio) from producto where producto.codigo_fabricante=f.codigo);   

-- ┌───────────────────┐
-- │      nombre       │
-- ├───────────────────┤
-- │ Portátil Yoga 520 │
-- └───────────────────┘

-- 39. Subconsultas (En la cláusula HAVING)

-- 40 .Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.

sqlite> select nombre from fabricante where codigo in (select codigo_fabricante from producto group by codigo_fabricante having count(codigo)=(select count(p.codigo) from fabricante as f join producto as p on f.codigo=p.codigo_fabricante where f.nombre in ("Lenovo")));

-- ┌─────────────────┐
-- │     nombre      │
-- ├─────────────────┤
-- │ Asus            │
-- │ Lenovo          │
-- │ Hewlett-Packard │
-- │ Crucial         │
-- └─────────────────┘