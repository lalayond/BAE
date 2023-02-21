--Create Tables

sqlite> create table cliente ( id int primary key, nombre text, apellido1 text, apellido2 text, ciudad text, categoria int );
sqlite> create table comercial ( id int primary key , nombre text, apellido1 text, apellido2 text, categoria real );
sqlite> create table pedido ( id int primary key, total real, fecha text, id_cliente int references cliente(id), id_comercial int references comercial(id));

--Insert

.read inset.sql

-- Consultas sobre una tabla

-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.

sqlite> select * from pedido order by fecha desc;

-- ┌────┬─────────┬────────────┬────────────┬──────────────┐
-- │ id │  total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼─────────┼────────────┼────────────┼──────────────┤
-- │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
-- │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
-- │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
-- │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
-- │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
-- │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
-- │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
-- │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
-- │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
-- │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
-- │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
-- │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
-- │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
-- │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
-- │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
-- │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
-- └────┴─────────┴────────────┴────────────┴──────────────┘

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.

sqlite> select * from pedido order by total desc limit 2; 

-- ┌────┬────────┬────────────┬────────────┬──────────────┐
-- │ id │ total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼────────┼────────────┼────────────┼──────────────┤
-- │ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
-- │ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
-- └────┴────────┴────────────┴────────────┴──────────────┘

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

sqlite> select distinct id_cliente from pedido;

-- ┌────────────┐
-- │ id_cliente │
-- ├────────────┤
-- │ 5          │
-- │ 1          │
-- │ 2          │
-- │ 8          │
-- │ 7          │
-- │ 4          │
-- │ 3          │
-- │ 6          │
-- └────────────┘

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

sqlite> select * from pedido where fecha regexp "^2017" and total > 500;

-- ┌────┬─────────┬────────────┬────────────┬──────────────┐
-- │ id │  total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼─────────┼────────────┼────────────┼──────────────┤
-- │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
-- │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
-- │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
-- └────┴─────────┴────────────┴────────────┴──────────────┘

-- 5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

sqlite> select nombre, apellido1, apellido2 from comercial where categoria between 0.05 and 0.11;

-- ┌─────────┬───────────┬───────────┐
-- │ nombre  │ apellido1 │ apellido2 │
-- ├─────────┼───────────┼───────────┤
-- │ Diego   │ Flores    │ Salas     │
-- │ Antonio │ Vega      │ Hernández │
-- │ Alfredo │ Ruiz      │ Flores    │
-- └─────────┴───────────┴───────────┘

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

sqlite> select max(categoria) as "mayor comision" from comercial; 

-- ┌────────────────┐
-- │ mayor comision │
-- ├────────────────┤
-- │ 0.15           │
-- └────────────────┘

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

sqlite> select id, nombre, apellido1 from cliente where apellido2 is not null order by apellido1, nombre;

-- ┌────┬───────────┬───────────┐
-- │ id │  nombre   │ apellido1 │
-- ├────┼───────────┼───────────┤
-- │ 5  │ Marcos    │ Loyola    │
-- │ 9  │ Guillermo │ López     │
-- │ 1  │ Aarón     │ Rivero    │
-- │ 3  │ Adolfo    │ Rubio     │
-- │ 8  │ Pepe      │ Ruiz      │
-- │ 2  │ Adela     │ Salas     │
-- │ 10 │ Daniel    │ Santana   │
-- │ 6  │ María     │ Santana   │
-- └────┴───────────┴───────────┘

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.

sqlite> select nombre from cliente where nombre regexp "^A.*n$|^P" order by nombre;

-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Aarón  │
-- │ Adrián │
-- │ Pepe   │
-- │ Pilar  │
-- └────────┘

-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.

sqlite> select nombre from cliente where nombre not regexp "^A" order by nombre;

-- ┌───────────┐
-- │  nombre   │
-- ├───────────┤
-- │ Daniel    │
-- │ Guillermo │
-- │ Marcos    │
-- │ María     │
-- │ Pepe      │
-- │ Pilar     │
-- └───────────┘

-- 10. Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.

sqlite> select distinct nombre from comercial where nombre regexp "el$|o$";

-- ┌─────────┐
-- │ nombre  │
-- ├─────────┤
-- │ Daniel  │
-- │ Diego   │
-- │ Antonio │
-- │ Manuel  │
-- │ Alfredo │
-- └─────────┘

-- Consultas multitabla
-- Nota: Resuelva todas las consultas utilizando las cláusulas INNER JOIN.

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

sqlite> select distinct c.id, c.nombre, c.apellido1, c.apellido2 from cliente as c join pedido as p on c.id=p.id_cliente order by nombre;

-- ┌────┬────────┬───────────┬───────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │
-- ├────┼────────┼───────────┼───────────┤
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │
-- │ 2  │ Adela  │ Salas     │ Díaz      │
-- │ 3  │ Adolfo │ Rubio     │ Flores    │
-- │ 4  │ Adrián │ Suárez    │           │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │
-- │ 6  │ María  │ Santana   │ Moreno    │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │
-- │ 7  │ Pilar  │ Ruiz      │           │
-- └────┴────────┴───────────┴───────────┘

-- 2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. 
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

sqlite> select c.*, p.id, p.total, p.fecha, p.id_comercial from cliente as c join pedido as p on c.id=p.id_cliente; 

-- ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬──────────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_comercial │
-- ├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼──────────────┤
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 2            │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 5            │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 1            │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 3            │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 2            │
-- │ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 1            │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 1            │
-- │ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 6            │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 3            │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 2            │
-- │ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 7            │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 1            │
-- │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 1            │
-- │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 1            │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 5            │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 5            │
-- └────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴──────────────┘

-- 3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales.
-- El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

sqlite> select c.*, p.id, p.total, p.fecha, p.id_cliente from comercial as c join pedido as p on c.id=p.id_comercial order by c.nombre;

-- ┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │
-- ├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┤
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │
-- │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2019-03-11 │ 1          │
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2019-03-11 │ 1          │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2015-09-10 │ 2          │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2017-04-25 │ 2          │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2017-02-02 │ 6          │
-- │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │
-- │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2016-10-10 │ 8          │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2017-09-10 │ 5          │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2015-06-27 │ 8          │
-- │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │
-- └────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┘

-- 4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.

sqlite> select cl.*,p.id,p.total,p.fecha,c.* from cliente as cl join pedido as p on cl.id=p.id_cliente join comercial as c on c.id=p.id_comercial;

-- ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────┬─────────┬───────────┬───────────┬───────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
-- ├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────┼─────────┼───────────┼───────────┼───────────┤
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
-- │ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
-- │ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
-- └────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────┴─────────┴───────────┴───────────┴───────────┘

-- 5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

sqlite> select c.* from cliente as c join pedido as p on c.id=p.id_cliente where fecha regexp "^2017" and total between 300 and 1000;

-- ┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
-- ├────┼────────┼───────────┼───────────┼─────────┼───────────┤
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
-- └────┴────────┴───────────┴───────────┴─────────┴───────────┘

-- 6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.

sqlite> select distinct c.nombre, c.apellido1, c.apellido2 from comercial as c join pedido as p on c.id=p.id_comercial join cliente as cl on cl.id=p.id_cliente where cl.nombre in ("María") and cl.apellido1 in ("Santana") and cl.apellido2 in ("Moreno"); 

-- ┌────────┬───────────┬───────────┐
-- │ nombre │ apellido1 │ apellido2 │
-- ├────────┼───────────┼───────────┤
-- │ Daniel │ Sáez      │ Vega      │
-- └────────┴───────────┴───────────┘

-- 7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

sqlite> select distinct cl.nombre from cliente as cl join pedido as p on cl.id=p.id_cliente join comercial as c on c.id=p.id_comercial; 

-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Marcos │
-- │ Aarón  │
-- │ Adela  │
-- │ Pepe   │
-- │ Pilar  │
-- │ Adrián │
-- │ Adolfo │
-- │ María  │
-- └────────┘
