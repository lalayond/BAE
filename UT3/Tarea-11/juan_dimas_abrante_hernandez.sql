-- Consultas con multitabla con clausula where:

-- 1 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

sqlite> select p.nombre, p.precio, f.nombre from producto as p, fabricante as f where f.codigo=p.codigo_fabricante;

-- nombre                           precio  nombre         
-- -------------------------------  ------  ---------------
-- Disco duro SATA3 1TB             86.99   Seagate        
-- Memoria RAM DDR4 8GB             120.0   Crucial        
-- Disco SSD 1 TB                   150.99  Samsung        
-- GeForce GTX 1050Ti               185.0   Gigabyte       
-- GeForce GTX 1080 Xtreme          755.0   Crucial        
-- Monitor 24 LED Full HD           202.0   Asus           
-- Monitor 27 LED Full HD           245.99  Asus           
-- Portátil Yoga 520                559.0   Lenovo         
-- Portátil Ideapd 320              444.0   Lenovo         
-- Impresora HP Deskjet 3720        59.99   Hewlett-Packard
-- Impresora HP Laserjet Pro M26nw  180.0   Hewlett-Packard

-- 2 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

sqlite> select p.nombre, p.precio, f.nombre from producto as p, fabricante as f where f.codigo=p.codigo_fabricante order by f.nombre;

-- nombre                           precio  nombre         
-- -------------------------------  ------  ---------------
-- Monitor 24 LED Full HD           202.0   Asus           
-- Monitor 27 LED Full HD           245.99  Asus           
-- Memoria RAM DDR4 8GB             120.0   Crucial        
-- GeForce GTX 1080 Xtreme          755.0   Crucial        
-- GeForce GTX 1050Ti               185.0   Gigabyte       
-- Impresora HP Deskjet 3720        59.99   Hewlett-Packard
-- Impresora HP Laserjet Pro M26nw  180.0   Hewlett-Packard
-- Portátil Yoga 520                559.0   Lenovo         
-- Portátil Ideapd 320              444.0   Lenovo         
-- Disco SSD 1 TB                   150.99  Samsung        
-- Disco duro SATA3 1TB             86.99   Seagate    

-- 3 Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.

sqlite> select p.codigo, p.nombre, f.codigo, f.nombre from producto as p, fabricante as f where f.codigo=p.codigo_fabricante;

-- codigo  nombre                           codigo  nombre         
-- ------  -------------------------------  ------  ---------------
-- 1       Disco duro SATA3 1TB             5       Seagate        
-- 2       Memoria RAM DDR4 8GB             6       Crucial        
-- 3       Disco SSD 1 TB                   4       Samsung        
-- 4       GeForce GTX 1050Ti               7       Gigabyte       
-- 5       GeForce GTX 1080 Xtreme          6       Crucial        
-- 6       Monitor 24 LED Full HD           1       Asus           
-- 7       Monitor 27 LED Full HD           1       Asus           
-- 8       Portátil Yoga 520                2       Lenovo         
-- 9       Portátil Ideapd 320              2       Lenovo         
-- 10      Impresora HP Deskjet 3720        3       Hewlett-Packard
-- 11      Impresora HP Laserjet Pro M26nw  3       Hewlett-Packard


-- 4 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.    

sqlite> select p.nombre, p.precio, f.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo order by p.precio limit 1;

-- nombre                     precio  nombre         
-- -------------------------  ------  ---------------
-- Impresora HP Deskjet 3720  59.99   Hewlett-Packard

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

sqlite> select p.nombre, p.precio, f.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo order by p.precio desc limit 1;

-- nombre                   precio  nombre 
-- -----------------------  ------  -------
-- GeForce GTX 1080 Xtreme  755.0   Crucial


-- 5 Devuelve una lista de todos los productos del fabricante Lenovo.

sqlite> select p.nombre, p.precio from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre="Lenovo";

-- nombre               precio
-- -------------------  ------
-- Portátil Yoga 520    559.0 
-- Portátil Ideapd 320  444.0 

-- 6 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

sqlite> select p.nombre, p.precio from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Crucial") and precio > 200;

-- nombre                   precio
-- -----------------------  ------
-- GeForce GTX 1080 Xtreme  755.0 


-- 7 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

sqlite> select p.nombre, p.precio from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre="Asus" or f.nombre="Hewlett-Packardy Seagate";

-- nombre                  precio
-- ----------------------  ------
-- Monitor 24 LED Full HD  202.0 
-- Monitor 27 LED Full HD  245.99


-- 8 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

sqlite> select p.nombre, p.precio from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Asus","Hewlett-Packardy Seagate");

-- nombre                  precio
-- ----------------------  ------
-- Monitor 24 LED Full HD  202.0 
-- Monitor 27 LED Full HD  245.99


-- 9 Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

sqlite> select p.nombre, p.precio from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre like "%e";

-- nombre                precio
-- --------------------  ------
-- Disco duro SATA3 1TB  86.99 
-- GeForce GTX 1050Ti    185.0 


-- 10 Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

sqlite> select p.nombre, p.precio from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre like "%w%";

-- nombre                           precio
-- -------------------------------  ------
-- Impresora HP Deskjet 3720        59.99 
-- Impresora HP Laserjet Pro M26nw  180.0 

-- 11 Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

sqlite> select p.nombre,p.precio,f.nombre from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and precio >= 180 order by p.precio desc, p.nombre;

-- nombre                           precio  nombre         
-- -------------------------------  ------  ---------------
-- GeForce GTX 1080 Xtreme          755.0   Crucial        
-- Portátil Yoga 520                559.0   Lenovo         
-- Portátil Ideapd 320              444.0   Lenovo         
-- Monitor 27 LED Full HD           245.99  Asus           
-- Monitor 24 LED Full HD           202.0   Asus           
-- GeForce GTX 1050Ti               185.0   Gigabyte       
-- Impresora HP Laserjet Pro M26nw  180.0   Hewlett-Packard


-- 12 Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

sqlite> select distinct f.codigo, f.nombre from fabricante as f, producto as p where f.codigo=p.codigo_fabricante;

-- codigo  nombre         
-- ------  ---------------
-- 5       Seagate        
-- 6       Crucial        
-- 4       Samsung        
-- 7       Gigabyte       
-- 1       Asus           
-- 2       Lenovo         
-- 3       Hewlett-Packard


-- Consultas con LEFT JOIN y RIGHT JOIN 

-- 13 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

sqlite> select  f.nombre, p.nombre from fabricante as f left join producto as p ON f.codigo=p.codigo_fabricante;

-- nombre           nombre                         
-- ---------------  -------------------------------
-- Asus             Monitor 24 LED Full HD         
-- Asus             Monitor 27 LED Full HD         
-- Lenovo           Portátil Ideapd 320            
-- Lenovo           Portátil Yoga 520              
-- Hewlett-Packard  Impresora HP Deskjet 3720      
-- Hewlett-Packard  Impresora HP Laserjet Pro M26nw
-- Samsung          Disco SSD 1 TB                 
-- Seagate          Disco duro SATA3 1TB           
-- Crucial          GeForce GTX 1080 Xtreme        
-- Crucial          Memoria RAM DDR4 8GB           
-- Gigabyte         GeForce GTX 1050Ti             
-- Huawei                                          
-- Xiaomi 

-- 14 Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

sqlite> select  f.nombre, p.nombre from fabricante as f left join producto as p ON f.codigo=p.codigo_fabricante where p.nombre is null;

-- nombre  nombre
-- ------  ------
-- Huawei        
-- Xiaomi 


-- 15 Calcula el número total de productos que hay en la tabla productos.

sqlite> select count(p.codigo) from producto as p;

sqlite> select count(p.codigo) as "numero total de productos" from producto as p;

-- numero total de productos
-- -------------------------
-- 11      

-- 16 Calcula el número total de fabricantes que hay en la tabla fabricante.

sqlite> select count(f.codigo) from fabricante as f;

-- count(f.codigo)
-- ---------------
-- 9     

-- 17 Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.

sqlite> select distinct count(p.codigo) from producto as p;

-- count(p.codigo)
-- ---------------
-- 11             
-- sqlite> 

-- 18 Calcula la media del precio de todos los productos.

sqlite> select avg(precio) as "media de precio" from producto;

-- media de precio 
-- ----------------
-- 271.723636363636

-- 19 Calcula el precio más barato de todos los productos.

sqlite> select min(precio) as "precio minimo" from producto;

-- precio minimo
-- -------------
-- 59.99       

-- 20 Calcula el precio más caro de todos los productos.

sqlite> select max(precio) as "precio maximo" from producto;

-- precio maximo
-- -------------
-- 755.0   

-- 21 Lista el nombre y el precio del producto más barato.

sqlite> select nombre , min(precio) as precio from producto;

-- nombre                     precio
-- -------------------------  ------
-- Impresora HP Deskjet 3720  59.99 

-- 22 Lista el nombre y el precio del producto más caro.

sqlite> select nombre , max(precio) as precio from producto;

-- nombre                   precio
-- -----------------------  ------
-- GeForce GTX 1080 Xtreme  755.0 

-- 23 Calcula la suma de los precios de todos los productos.

sqlite> select sum(precio) as "precio total" from producto;

-- precio total
-- ------------
-- 2988.96     

-- 24 Calcula el número de productos que tiene el fabricante Asus.

sqlite> select count(p.codigo) as "numero de productos" from producto as p JOIN fabricante as f ON p.codigo_fabricante=f.codigo where f.nombre = "Asus";

-- numero de productos
-- -------------------
-- 2             

-- 25 Calcula la media del precio de todos los productos del fabricante Asus.

sqlite> select avg(p.precio) as "precio total" from producto as p JOIN fabricante as f ON p.codigo_fabricante=f.codigo where f.nombre = "Asus";

-- precio total
-- ------------
-- 223.995     

-- 26 Calcula el precio más barato de todos los productos del fabricante Asus.

sqlite> select min(p.precio) as "precio minimo" from producto as p JOIN fabricante as f ON p.codigo_fabricante=f.codigo where f.nombre = "Asus";

-- precio minimo
-- -------------
-- 202.0        

-- 27 Calcula el precio más caro de todos los productos del fabricante Asus.

sqlite> select max(p.precio) as "precio minimo" from producto as p JOIN fabricante as f ON p.codigo_fabricante=f.codigo where f.nombre = "Asus";

-- precio minimo
-- -------------
-- 245.99      

-- 28 Calcula la suma de todos los productos del fabricante Asus.

sqlite> select sum(p.precio) as "precio total" from producto as p JOIN fabricante as f ON p.codigo_fabricante=f.codigo where f.nombre = "Asus";

-- precio total
-- ------------
-- 447.99      

-- 29 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.

sqlite> select max(p.precio) as "precio maximo", min(p.precio) as "precio minimo", avg(p.precio) as "media del precio", count(p.codigo) as "numero de productos" from producto as p join fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Crucial");

-- precio maximo  precio minimo  media del precio  numero de productos
-- -------------  -------------  ----------------  -------------------
-- 755.0          120.0          437.5             2              

-- 30

sqlite> select max(p.precio) as "precio maximo", min(p.precio) as "precio minimo", avg(p.precio) as "media del precio", count(p.codigo) as "numero de productos" from producto as p join fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Crucial");

-- ┌───────────────┬───────────────┬──────────────────┬─────────────────────┐
-- │ precio maximo │ precio minimo │ media del precio │ numero de productos │
-- ├───────────────┼───────────────┼──────────────────┼─────────────────────┤
-- │ 755.0         │ 120.0         │ 437.5            │ 2                   │
-- └───────────────┴───────────────┴──────────────────┴─────────────────────┘

-- 31 Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.

sqlite> select f.nombre , count(p.codigo) as "numero de productos" from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante group by f.codigo order by "numero de productos" desc;  

-- ┌─────────────────┬─────────────────────┐
-- │     nombre      │ numero de productos │
-- ├─────────────────┼─────────────────────┤
-- │ Asus            │ 2                   │
-- │ Lenovo          │ 2                   │
-- │ Hewlett-Packard │ 2                   │
-- │ Crucial         │ 2                   │
-- │ Samsung         │ 1                   │
-- │ Seagate         │ 1                   │
-- │ Gigabyte        │ 1                   │
-- │ Huawei          │ 0                   │
-- │ Xiaomi          │ 0                   │
-- └─────────────────┴─────────────────────┘

-- 32 Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

sqlite> select max(p.precio) as "precio maximo", min(p.precio) as "precio minimo", avg(p.precio) as "precio medio", f.nombre from producto as p join fabricante as f on p.codigo_fabricante=f.codigo group by f.nombre;

-- ┌───────────────┬───────────────┬──────────────┬─────────────────┐
-- │ precio maximo │ precio minimo │ precio medio │     nombre      │
-- ├───────────────┼───────────────┼──────────────┼─────────────────┤
-- │ 245.99        │ 202.0         │ 223.995      │ Asus            │
-- │ 755.0         │ 120.0         │ 437.5        │ Crucial         │
-- │ 185.0         │ 185.0         │ 185.0        │ Gigabyte        │
-- │ 180.0         │ 59.99         │ 119.995      │ Hewlett-Packard │
-- │ 559.0         │ 444.0         │ 501.5        │ Lenovo          │
-- │ 150.99        │ 150.99        │ 150.99       │ Samsung         │
-- │ 86.99         │ 86.99         │ 86.99        │ Seagate         │
-- └───────────────┴───────────────┴──────────────┴─────────────────┘

-- 33 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.

sqlite> select max(p.precio) as "precio maximo", min(p.precio) as "precio minimo", avg(p.precio) as "precio medio", count(p.codigo), f.codigo from producto as p join fabricante as f on p.codigo_fabricante=f.codigo group by f.codigo;
-- ┌───────────────┬───────────────┬──────────────┬─────────────────┬────────┐
-- │ precio maximo │ precio minimo │ precio medio │ count(p.codigo) │ codigo │
-- ├───────────────┼───────────────┼──────────────┼─────────────────┼────────┤
-- │ 245.99        │ 202.0         │ 223.995      │ 2               │ 1      │
-- │ 559.0         │ 444.0         │ 501.5        │ 2               │ 2      │
-- │ 180.0         │ 59.99         │ 119.995      │ 2               │ 3      │
-- │ 150.99        │ 150.99        │ 150.99       │ 1               │ 4      │
-- │ 86.99         │ 86.99         │ 86.99        │ 1               │ 5      │
-- │ 755.0         │ 120.0         │ 437.5        │ 2               │ 6      │
-- │ 185.0         │ 185.0         │ 185.0        │ 1               │ 7      │
-- └───────────────┴───────────────┴──────────────┴─────────────────┴────────┘

-- 34 Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.

sqlite> select f.nombre, max(p.precio) as "precio maximo", min(p.precio) as "precio minimo", avg(p.precio) as "precio medio", count(p.codigo), f.codigo from producto as p join fabricante as f on p.codigo_fabricante=f.codigo  group by f.codigo having avg(p.precio) > 200;

-- ┌─────────┬───────────────┬───────────────┬──────────────┬─────────────────┬────────┐
-- │ nombre  │ precio maximo │ precio minimo │ precio medio │ count(p.codigo) │ codigo │
-- ├─────────┼───────────────┼───────────────┼──────────────┼─────────────────┼────────┤
-- │ Asus    │ 245.99        │ 202.0         │ 223.995      │ 2               │ 1      │
-- │ Lenovo  │ 559.0         │ 444.0         │ 501.5        │ 2               │ 2      │
-- │ Crucial │ 755.0         │ 120.0         │ 437.5        │ 2               │ 6      │
-- └─────────┴───────────────┴───────────────┴──────────────┴─────────────────┴────────┘

-- 35  Calcula el número de productos que tienen un precio mayor o igual a 180€.

sqlite> select count(p.codigo) from producto as p where p.precio >=180;

-- ┌─────────────────┐
-- │ count(p.codigo) │
-- ├─────────────────┤
-- │ 7               │
-- └─────────────────┘

-- 36 Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.

sqlite> select f.codigo,f.nombre, count(p.codigo) from producto as p join fabricante as f on p.codigo_fabricante=f.codigo  group by f.codigo having p.precio >=180;

-- ┌────────┬──────────┬─────────────────┐
-- │ codigo │  nombre  │ count(p.codigo) │
-- ├────────┼──────────┼─────────────────┤
-- │ 1      │ Asus     │ 2               │
-- │ 2      │ Lenovo   │ 2               │
-- │ 7      │ Gigabyte │ 1               │
-- └────────┴──────────┴─────────────────┘

-- 37 Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.

sqlite> select p.codigo_fabricante, avg(p.precio) from producto as p  group by p.codigo_fabricante;

-- ┌────────┬───────────────┐
-- │ codigo │ avg(p.precio) │
-- ├────────┼───────────────┤
-- │ 1      │ 223.995       │
-- │ 2      │ 501.5         │
-- │ 3      │ 119.995       │Devuelve el nombre del producto
-- │ 4      │ 150.99        │
-- │ 5      │ 86.99         │
-- │ 6      │ 437.5         │
-- │ 7      │ 185.0         │
-- └────────┴───────────────┘

-- 38 Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.

sqlite> select f.nombre, avg(p.precio) from producto as p join fabricante as f on f.codigo=p.codigo_fabricante group by f.codigo;

-- ┌─────────────────┬───────────────┐
-- │     nombre      │ avg(p.precio) │
-- ├─────────────────┼───────────────┤
-- │ Asus            │ 223.995       │
-- │ Lenovo          │ 501.5         │
-- │ Hewlett-Packard │ 119.995       │
-- │ Samsung         │ 150.99        │
-- │ Seagate         │ 86.99         │
-- │ Crucial         │ 437.5         │
-- │ Gigabyte        │ 185.0         │
-- └─────────────────┴───────────────┘

-- 39 Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.

sqlite> select f.nombre, avg(p.precio) from producto as p join fabricante as f on f.codigo=p.codigo_fabricante group by f.codigo having avg(p.precio) >= 150;

-- ┌──────────┬───────────────┐
-- │  nombre  │ avg(p.precio) │
-- ├──────────┼───────────────┤
-- │ Asus     │ 223.995       │
-- │ Lenovo   │ 501.5         │
-- │ Samsung  │ 150.99        │
-- │ Crucial  │ 437.5         │
-- │ Gigabyte │ 185.0         │
-- └──────────┴───────────────┘

-- 40 Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.

sqlite> select f.nombre from fabricante as f join producto as p on f.codigo=p.codigo_fabricante group by f.codigo having count(p.codigo) >= 2;

-- ┌─────────────────┐
-- │     nombre      │
-- ├─────────────────┤
-- │ Asus            │
-- │ Lenovo          │
-- │ Hewlett-Packard │
-- │ Crucial         │
-- └─────────────────┘

-- 41 Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.

sqlite> select f.nombre, count(p.codigo) from producto as p left join fabricante as f on f.codigo=p.codigo_fabricante group by f.codigo having avg(p.precio) >= 220;

-- ┌─────────┬─────────────────┐
-- │ nombre  │ count(p.codigo) │
-- ├─────────┼─────────────────┤
-- │ Asus    │ 2               │
-- │ Lenovo  │ 2               │
-- │ Crucial │ 2               │
-- └─────────┴─────────────────┘

-- 42 Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

sqlite> select f.nombre, count(p.codigo) from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante group by f.codigo having avg(p.precio) >= 220 or p.precio is null;

-- ┌─────────┬─────────────────┐
-- │ nombre  │ count(p.codigo) │
-- ├─────────┼─────────────────┤
-- │ Asus    │ 2               │
-- │ Lenovo  │ 2               │
-- │ Crucial │ 2               │
-- │ Huawei  │ 0               │
-- │ Xiaomi  │ 0               │
-- └─────────┴─────────────────┘

-- 43 Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.

sqlite> select f.nombre, sum(p.precio) from fabricante as f join producto as p on f.codigo=p.codigo_fabricante group by f.codigo having sum(p.precio) > 1000;
-- ┌────────┬───────────────┐
-- │ nombre │ sum(p.precio) │
-- ├────────┼───────────────┤
-- │ Lenovo │ 1003.0        │
-- └────────┴───────────────┘

-- 44 Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

sqlite> select p.nombre,max(p.precio) as precio, f.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante group by f.codigo;

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

-- 45 Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

sqlite> select p.nombre from producto as p , fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Lenovo");
-- ┌─────────────────────┐
-- │       nombre        │
-- ├─────────────────────┤
-- │ Portátil Yoga 520   │
-- │ Portátil Ideapd 320 │
-- └─────────────────────┘

-- 46 Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

sqlite> select * from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and p.precio in (SELECT max(p.precio) from fabricante as f, producto as p where f.codigo=p.codigo_fabricante and f.nombre in ("Lenovo"));

-- ┌────────┬───────────────────┬────────┬───────────────────┬────────┬────────┐
-- │ codigo │      nombre       │ precio │ codigo_fabricante │ codigo │ nombre │
-- ├────────┼───────────────────┼────────┼───────────────────┼────────┼────────┤
-- │ 8      │ Portátil Yoga 520 │ 559.0  │ 2                 │ 2      │ Lenovo │
-- └────────┴───────────────────┴────────┴───────────────────┴────────┴────────┘

-- 47 Lista el nombre del producto más caro del fabricante Lenovo.

sqlite> select p.nombre, max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Lenovo")
   ...> ;
-- ┌───────────────────┬───────────────┐
-- │      nombre       │ max(p.precio) │
-- ├───────────────────┼───────────────┤
-- │ Portátil Yoga 520 │ 559.0         │
-- └───────────────────┴───────────────┘

-- 48 Lista el nombre del producto más barato del fabricante Hewlett-Packard.

sqlite> select p.nombre, min(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Hewlett-Packard");

-- ┌───────────────────────────┬───────────────┐
-- │          nombre           │ min(p.precio) │
-- ├───────────────────────────┼───────────────┤
-- │ Impresora HP Deskjet 3720 │ 59.99         │
-- └───────────────────────────┴───────────────┘

-- 49 Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

sqlite> select * from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and p.precio >= (SELECT max(p.precio) from fabricante as f, producto as p where f.codigo=p.codigo_fabricante and f.nombre in ("Lenovo"));

-- ┌────────┬─────────────────────────┬────────┬───────────────────┬────────┬─────────┐
-- │ codigo │         nombre          │ precio │ codigo_fabricante │ codigo │ nombre  │
-- ├────────┼─────────────────────────┼────────┼───────────────────┼────────┼─────────┤
-- │ 5      │ GeForce GTX 1080 Xtreme │ 755.0  │ 6                 │ 6      │ Crucial │
-- │ 8      │ Portátil Yoga 520       │ 559.0  │ 2                 │ 2      │ Lenovo  │
-- └────────┴─────────────────────────┴────────┴───────────────────┴────────┴─────────┘

-- 50 Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

sqlite> select p.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ("Asus") and p.precio > (SELECT avg(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre in ("Asus"));

-- ┌────────────────────────┐
-- │         nombre         │
-- ├────────────────────────┤
-- │ Monitor 27 LED Full HD │
-- └────────────────────────┘

--  NO SE HAN PODIDO REALIZAR ESTAS CONSULTAS DEBIDO A LA IMPOSIBILIDAD DEL USO DE ANY Y ALL

-- 51 Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

-- 52 Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.

-- 53 Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).

-- 54 Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).

-- *********************************************************************************************************

-- 55 Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

sqlite> select distinct nombre from fabricante where codigo in (select codigo_fabricante from producto);

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

-- 56 Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

sqlite> select distinct nombre from fabricante where codigo not in (select codigo_fabricante from producto);

-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Huawei │
-- │ Xiaomi │
-- └────────┘


-- 57 Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

sqlite> select nombre from fabricante where exists (select codigo_fabricante from producto where fabricante.codigo=producto.codigo_fabricante and codigo is not null);
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

-- 58 Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

sqlite> select nombre from fabricante where not exists (select codigo_fabricante from producto where fabricante.codigo=producto.codigo_fabricante and codigo is not null);

-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Huawei │
-- │ Xiaomi │
-- └────────┘


-- 59 Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

sqlite> select f.nombre, p.nombre, p.precio from producto as p join fabricante as f on p.codigo_fabricante=f.codigo and p.precio in (SELECT max(p.precio) from fabricante as f join producto as p on f.codigo=p.codigo_fabricante group by f.codigo);

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

-- 60 Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

-- 61 Lista el nombre del producto más caro del fabricante Lenovo.

sqlite> select p.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante where f.nombre in ("Lenovo") and p.precio in (select max(p.precio) from producto as p join fabricante as f on f.codigo=p.codigo_fabricante where f.nombre in ("Lenovo"));

-- ┌───────────────────┐
-- │      nombre       │
-- ├───────────────────┤
-- │ Portátil Yoga 520 │
-- └───────────────────┘

-- 62 Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.

sqlite> select f.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante group by f.nombre having count(p.codigo) == (select count(p.codigo) from fabricante as f join producto as p on f.codigo=p.codigo_fabricante where f.nombre in ("Lenovo"));

-- ┌─────────────────┐
-- │     nombre      │
-- ├─────────────────┤
-- │ Asus            │
-- │ Crucial         │
-- │ Hewlett-Packard │
-- │ Lenovo          │
-- └─────────────────┘