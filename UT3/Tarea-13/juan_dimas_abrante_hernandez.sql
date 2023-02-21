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

-- Nota: Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. 
--Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.

sqlite> select c.*, p.id as id_pedido, p.total, p.fecha from cliente as c left join pedido as p on p.id_cliente=c.id order by c.apellido1,c.apellido2,c.nombre;

-- ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┬───────────┬─────────┬────────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │ id_pedido │  total  │   fecha    │
-- ├────┼───────────┼───────────┼───────────┼─────────┼───────────┼───────────┼─────────┼────────────┤
-- │ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │ 1         │ 150.5   │ 2017-10-05 │
-- │ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │ 5         │ 948.5   │ 2017-09-10 │
-- │ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │           │         │            │
-- │ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 2         │ 270.65  │ 2016-09-10 │
-- │ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 15        │ 370.85  │ 2019-03-11 │
-- │ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 16        │ 2389.23 │ 2019-03-11 │
-- │ 3  │ Adolfo    │ Rubio     │ Flores    │ Sevilla │           │ 11        │ 75.29   │ 2016-08-17 │
-- │ 7  │ Pilar     │ Ruiz      │           │ Sevilla │ 300       │ 6         │ 2400.6  │ 2016-07-27 │
-- │ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4         │ 110.5   │ 2016-08-17 │
-- │ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9         │ 2480.4  │ 2016-10-10 │
-- │ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10        │ 250.45  │ 2015-06-27 │
-- │ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 3         │ 65.26   │ 2017-10-05 │
-- │ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 7         │ 5760.0  │ 2015-09-10 │
-- │ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 12        │ 3045.6  │ 2017-04-25 │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │           │         │            │
-- │ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13        │ 545.75  │ 2019-01-25 │
-- │ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14        │ 145.82  │ 2017-02-02 │
-- │ 4  │ Adrián    │ Suárez    │           │ Jaén    │ 300       │ 8         │ 1983.43 │ 2017-10-10 │
-- └────┴───────────┴───────────┴───────────┴─────────┴───────────┴───────────┴─────────┴────────────┘

-- 2. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.

sqlite> select c.*, p.id as id_pedido, p.total, p.fecha from comercial as c left join pedido as p on c.id=p.id_comercial order by c.apellido1,c.apellido2,c.nombre;

-- ┌────┬─────────┬───────────┬───────────┬───────────┬───────────┬─────────┬────────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id_pedido │  total  │   fecha    │
-- ├────┼─────────┼───────────┼───────────┼───────────┼───────────┼─────────┼────────────┤
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2         │ 270.65  │ 2016-09-10 │
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15        │ 370.85  │ 2019-03-11 │
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16        │ 2389.23 │ 2019-03-11 │
-- │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8         │ 1983.43 │ 2017-10-10 │
-- │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4         │ 110.5   │ 2016-08-17 │
-- │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9         │ 2480.4  │ 2016-10-10 │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1         │ 150.5   │ 2017-10-05 │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5         │ 948.5   │ 2017-09-10 │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10        │ 250.45  │ 2015-06-27 │
-- │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │           │         │            │
-- │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │           │         │            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3         │ 65.26   │ 2017-10-05 │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6         │ 2400.6  │ 2016-07-27 │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7         │ 5760.0  │ 2015-09-10 │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12        │ 3045.6  │ 2017-04-25 │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13        │ 545.75  │ 2019-01-25 │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14        │ 145.82  │ 2017-02-02 │
-- │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11        │ 75.29   │ 2016-08-17 │
-- └────┴─────────┴───────────┴───────────┴───────────┴───────────┴─────────┴────────────┘

-- 3. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.

sqlite> select c.* from cliente as c left join pedido as p on p.id_cliente=c.id where p.id is null;

-- ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
-- ├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
-- │ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
-- └────┴───────────┴───────────┴───────────┴─────────┴───────────┘

-- 4. Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.

sqlite> select c.* from comercial as c left join pedido as p on c.id=p.id_comercial where p.id is null;

-- ┌────┬─────────┬───────────┬───────────┬───────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
-- ├────┼─────────┼───────────┼───────────┼───────────┤
-- │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
-- │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
-- └────┴─────────┴───────────┴───────────┴───────────┘

-- 5. Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre.
-- En en listado deberá diferenciar de algún modo los clientes y los comerciales.

sqlite> select cl.*,c.* from cliente as cl full join pedido as p on cl.id=p.id_cliente full join comercial as c on c.id=p.id_comercial where p.id is null; 

-- ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬───────────┬───────────┬───────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
-- ├────┼───────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼───────────┼───────────┼───────────┤
-- │ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │    │         │           │           │           │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │    │         │           │           │           │
-- │    │           │           │           │         │           │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
-- │    │           │           │           │         │           │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
-- └────┴───────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴───────────┴───────────┴───────────┘

-- 6. ¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.

-- Consultas resumen

-- 1. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.

sqlite> select sum(total) as suma_total from pedido;  

-- ┌────────────┐
-- │ suma_total │
-- ├────────────┤
-- │ 20992.83   │
-- └────────────┘

-- 2. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.

sqlite> select avg(total) as media from pedido;

-- ┌─────────────┐
-- │    media    │
-- ├─────────────┤
-- │ 1312.051875 │
-- └─────────────┘

-- 3. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.

sqlite> select count(distinct id_comercial) as numero_comerciales from pedido;

-- ┌────────────────────┐
-- │ numero_comerciales │
-- ├────────────────────┤
-- │ 6                  │
-- └────────────────────┘

-- 4. Calcula el número total de clientes que aparecen en la tabla cliente.

sqlite> select count(id) as numero_clientes from cliente;

-- ┌─────────────────┐
-- │ numero_clientes │
-- ├─────────────────┤
-- │ 10              │
-- └─────────────────┘

-- 5. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.

sqlite> select max(total) as max_total from pedido;

-- ┌───────────┐
-- │ max_total │
-- ├───────────┤
-- │ 5760.0    │
-- └───────────┘

-- 6. Calcula cuál es la menor cantidad que aparece en la tabla pedido.

sqlite> select min(total) as min_total from pedido; 

-- ┌───────────┐
-- │ min_total │
-- ├───────────┤
-- │ 65.26     │
-- └───────────┘

-- 7. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.

sqlite> select ciudad, categoria from cliente group by ciudad having max(categoria);

-- ┌─────────┬───────────┐
-- │ ciudad  │ categoria │
-- ├─────────┼───────────┤
-- │ Almería │ 200       │
-- │ Cádiz   │ 100       │
-- │ Granada │ 225       │
-- │ Huelva  │ 200       │
-- │ Jaén    │ 300       │
-- │ Sevilla │ 300       │
-- └─────────┴───────────┘

-- 8. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día.
-- Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.

sqlite> select c.id, c.nombre,c.apellido1,c.apellido1,p.total, p.fecha from pedido as p join cliente as c on p.id_cliente=c.id group by fecha,id_cliente having max(total);

-- ┌────┬────────┬───────────┬───────────┬─────────┬────────────┐
-- │ id │ nombre │ apellido1 │ apellido1 │  total  │   fecha    │
-- ├────┼────────┼───────────┼───────────┼─────────┼────────────┤
-- │ 8  │ Pepe   │ Ruiz      │ Ruiz      │ 250.45  │ 2015-06-27 │
-- │ 2  │ Adela  │ Salas     │ Salas     │ 5760.0  │ 2015-09-10 │
-- │ 7  │ Pilar  │ Ruiz      │ Ruiz      │ 2400.6  │ 2016-07-27 │
-- │ 3  │ Adolfo │ Rubio     │ Rubio     │ 75.29   │ 2016-08-17 │
-- │ 8  │ Pepe   │ Ruiz      │ Ruiz      │ 110.5   │ 2016-08-17 │
-- │ 1  │ Aarón  │ Rivero    │ Rivero    │ 270.65  │ 2016-09-10 │
-- │ 8  │ Pepe   │ Ruiz      │ Ruiz      │ 2480.4  │ 2016-10-10 │
-- │ 6  │ María  │ Santana   │ Santana   │ 145.82  │ 2017-02-02 │
-- │ 2  │ Adela  │ Salas     │ Salas     │ 3045.6  │ 2017-04-25 │
-- │ 5  │ Marcos │ Loyola    │ Loyola    │ 948.5   │ 2017-09-10 │
-- │ 2  │ Adela  │ Salas     │ Salas     │ 65.26   │ 2017-10-05 │
-- │ 5  │ Marcos │ Loyola    │ Loyola    │ 150.5   │ 2017-10-05 │
-- │ 4  │ Adrián │ Suárez    │ Suárez    │ 1983.43 │ 2017-10-10 │
-- │ 6  │ María  │ Santana   │ Santana   │ 545.75  │ 2019-01-25 │
-- │ 1  │ Aarón  │ Rivero    │ Rivero    │ 2389.23 │ 2019-03-11 │
-- └────┴────────┴───────────┴───────────┴─────────┴────────────┘

-- 9. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.

sqlite> select c.id, c.nombre,c.apellido1,c.apellido1,p.total, p.fecha from pedido as p join cliente as c on p.id_cliente=c.id group by fecha,id_cliente having max(total) and total > 2000;

-- ┌────┬────────┬───────────┬───────────┬─────────┬────────────┐
-- │ id │ nombre │ apellido1 │ apellido1 │  total  │   fecha    │
-- ├────┼────────┼───────────┼───────────┼─────────┼────────────┤
-- │ 2  │ Adela  │ Salas     │ Salas     │ 5760.0  │ 2015-09-10 │
-- │ 7  │ Pilar  │ Ruiz      │ Ruiz      │ 2400.6  │ 2016-07-27 │
-- │ 8  │ Pepe   │ Ruiz      │ Ruiz      │ 2480.4  │ 2016-10-10 │
-- │ 2  │ Adela  │ Salas     │ Salas     │ 3045.6  │ 2017-04-25 │
-- │ 1  │ Aarón  │ Rivero    │ Rivero    │ 2389.23 │ 2019-03-11 │
-- └────┴────────┴───────────┴───────────┴─────────┴────────────┘

-- 10. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.

sqlite> select c.id,c.nombre,c.apellido1,c.apellido2,p.total from pedido as p join comercial as c on p.id_comercial=c.id where p.fecha in ("2016-08-17") group by c.id having max(p.total);

-- ┌────┬─────────┬───────────┬───────────┬───────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ total │
-- ├────┼─────────┼───────────┼───────────┼───────┤
-- │ 3  │ Diego   │ Flores    │ Salas     │ 110.5 │
-- │ 7  │ Antonio │ Vega      │ Hernández │ 75.29 │
-- └────┴─────────┴───────────┴───────────┴───────┘

-- 11. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. 
--Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.

sqlite> select c.id, c.nombre,c.apellido1,c.apellido2,count(p.id) as numero_pedidos from cliente as c join pedido as p on c.id=p.id_cliente group by c.id; 

-- ┌────┬────────┬───────────┬───────────┬────────────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ numero_pedidos │
-- ├────┼────────┼───────────┼───────────┼────────────────┤
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ 3              │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ 3              │
-- │ 3  │ Adolfo │ Rubio     │ Flores    │ 1              │
-- │ 4  │ Adrián │ Suárez    │           │ 1              │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ 2              │
-- │ 6  │ María  │ Santana   │ Moreno    │ 2              │
-- │ 7  │ Pilar  │ Ruiz      │           │ 1              │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ 3              │
-- └────┴────────┴───────────┴───────────┴────────────────┘

-- 12. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.

sqlite> select c.id, c.nombre,c.apellido1,c.apellido2,count(p.id) from cliente as c join pedido as p on c.id=p.id_cliente where p.fecha regexp "^2017" group by c.id; 

-- ┌────┬────────┬───────────┬───────────┬─────────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ count(p.id) │
-- ├────┼────────┼───────────┼───────────┼─────────────┤
-- │ 2  │ Adela  │ Salas     │ Díaz      │ 2           │
-- │ 4  │ Adrián │ Suárez    │           │ 1           │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ 2           │
-- │ 6  │ María  │ Santana   │ Moreno    │ 1           │
-- └────┴────────┴───────────┴───────────┴─────────────┘

-- 13. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. 
-- El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.

sqlite> select c.id,c.nombre,c.apellido1, p.total from cliente as c join pedido as p on c.id=p.id_cliente group by c.id having max(total); 

-- ┌────┬────────┬───────────┬─────────┐
-- │ id │ nombre │ apellido1 │  total  │
-- ├────┼────────┼───────────┼─────────┤
-- │ 1  │ Aarón  │ Rivero    │ 2389.23 │
-- │ 2  │ Adela  │ Salas     │ 5760.0  │
-- │ 3  │ Adolfo │ Rubio     │ 75.29   │
-- │ 4  │ Adrián │ Suárez    │ 1983.43 │
-- │ 5  │ Marcos │ Loyola    │ 948.5   │
-- │ 6  │ María  │ Santana   │ 545.75  │
-- │ 7  │ Pilar  │ Ruiz      │ 2400.6  │
-- │ 8  │ Pepe   │ Ruiz      │ 2480.4  │
-- └────┴────────┴───────────┴─────────┘

-- 14. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

sqlite> select total, substr(fecha,1,4) as anyo from pedido group by anyo having max(total);

-- ┌─────────┬──────┐
-- │  total  │ anyo │
-- ├─────────┼──────┤
-- │ 5760.0  │ 2015 │
-- │ 2480.4  │ 2016 │
-- │ 3045.6  │ 2017 │
-- │ 2389.23 │ 2019 │
-- └─────────┴──────┘

-- 15. Devuelve el número total de pedidos que se han realizado cada año.

sqlite> select count(id) as numero_pedidos, substr(fecha,1,4) as anyo from pedido group by anyo;  

-- ┌────────────────┬──────┐
-- │ numero_pedidos │ anyo │
-- ├────────────────┼──────┤
-- │ 2              │ 2015 │
-- │ 5              │ 2016 │
-- │ 6              │ 2017 │
-- │ 3              │ 2019 │
-- └────────────────┴──────┘

-- Subconsultas

-- Con operadores básicos de comparación

-- 1. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER
-- JOIN).

sqlite> select (c.nombre||" "||c.apellido1||" "||c.apellido2) as nombre_completo, p.* from cliente as c, pedido as p where c.id=p.id_cliente and nombre_completo in ("Adela Salas Díaz");

-- ┌──────────────────┬────┬────────┬────────────┬────────────┬──────────────┐
-- │ nombre_completo  │ id │ total  │   fecha    │ id_cliente │ id_comercial │
-- ├──────────────────┼────┼────────┼────────────┼────────────┼──────────────┤
-- │ Adela Salas Díaz │ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
-- │ Adela Salas Díaz │ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
-- │ Adela Salas Díaz │ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
-- └──────────────────┴────┴────────┴────────────┴────────────┴──────────────┘

-- 2. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)

sqlite> select count(p.id) as numero_pedidos from pedido as p, comercial as c where p.id_comercial=c.id and c.nombre in ("Daniel") and c.apellido1 in ("Sáez") and c.apellido2 in ("Vega");

-- ┌────────────────┐
-- │ numero_pedidos │
-- ├────────────────┤
-- │ 6              │
-- └────────────────┘

-- 3. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

sqlite> select c.*, max(p.total) as total from cliente as c, pedido as p where c.id=p.id_cliente and fecha regexp "^2019";

-- ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬─────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │  total  │
-- ├────┼────────┼───────────┼───────────┼─────────┼───────────┼─────────┤
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2389.23 │
-- └────┴────────┴───────────┴───────────┴─────────┴───────────┴─────────┘

-- 4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.

sqlite> select p.fecha, min(p.total) as total from pedido as p, cliente as c where p.id_cliente=c.id and c.nombre in ("Pepe") and c.apellido1 in ("Ruiz") and c.apellido2 in ("Santana");  
-- ┌────────────┬───────┐
-- │   fecha    │ total │
-- ├────────────┼───────┤
-- │ 2016-08-17 │ 110.5 │
-- └────────────┴───────┘

-- 5. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.

sqlite> select c.*,p.id,p.total,p.fecha from cliente as c join pedido as p on c.id=p.id_cliente where p.fecha regexp  "^2017" and total >= (select avg(total) from pedido where fecha regexp "^2017");

-- ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │
-- ├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┤
-- │ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │
-- └────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┘

-- Subconsultas con IN y NOT IN

-- 6. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

sqlite> select * from cliente where id not in (select id_cliente from pedido);

-- ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
-- ├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
-- │ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
-- └────┴───────────┴───────────┴───────────┴─────────┴───────────┘

-- 7. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).

sqlite> select * from comercial where id not in (select id_comercial from pedido);

-- ┌────┬─────────┬───────────┬───────────┬───────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
-- ├────┼─────────┼───────────┼───────────┼───────────┤
-- │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
-- │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
-- └────┴─────────┴───────────┴───────────┴───────────┘

-- Subconsultas con EXISTS y NOT EXISTS

-- 8. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT
-- EXISTS).

sqlite> select c.* from cliente as c where not exists (select id_cliente from pedido as p where c.id=p.id_cliente);       
-- ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
-- ├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
-- │ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
-- └────┴───────────┴───────────┴───────────┴─────────┴───────────┘

-- 9. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

sqlite> select c.* from comercial as c where not exists (select id_comercial from pedido as p where c.id=p.id_comercial);

-- ┌────┬─────────┬───────────┬───────────┬───────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
-- ├────┼─────────┼───────────┼───────────┼───────────┤
-- │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
-- │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
-- └────┴─────────┴───────────┴───────────┴───────────┘