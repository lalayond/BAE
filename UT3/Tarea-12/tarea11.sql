-- Dadas las siguientes tablas : empleado:

--     codigo: entero
--     nif: texto
--     nombre: texto
--     apelllido1: texto
--     apelllido2: texto
--     codigo_departamento: entero

-- departamento

--     codigo: entero
--     nombre: texto
--     presupuesto: real

CREATE TABLE departamento (codigo int primary key,nombre text,presupuesto real,gastos int);
CREATE TABLE empleado (codigo int primary key,nif text,nombre text,apellido1 text,apellido2 text,codigo_departamento int references empleado(codigo));

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);

-- 1. Lista el primer apellido de todos los empleados.

sqlite> select apellido1 from empleado;

-- ┌───────────┐
-- │ apellido1 │
-- ├───────────┤
-- │ Rivero    │
-- │ Salas     │
-- │ Rubio     │
-- │ Suárez    │
-- │ Loyola    │
-- │ Santana   │
-- │ Ruiz      │
-- │ Ruiz      │
-- │ Gómez     │
-- │ Flores    │
-- │ Herrera   │
-- │ Salas     │
-- │ Sáez      │
-- └───────────┘

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.

sqlite> select distinct apellido1 from empleado;

-- ┌───────────┐
-- │ apellido1 │
-- ├───────────┤
-- │ Rivero    │
-- │ Salas     │
-- │ Rubio     │
-- │ Suárez    │
-- │ Loyola    │
-- │ Santana   │
-- │ Ruiz      │
-- │ Gómez     │
-- │ Flores    │
-- │ Herrera   │
-- │ Sáez      │
-- └───────────┘

-- 3. Lista todas las columnas de la tabla empleado.

sqlite> select * from empleado;

-- ┌────────┬───────────┬──────────────┬───────────┬──────────┬─────────────────────┐
-- │ codigo │    nif    │    nombre    │ apellido1 │ apellido │ codigo_departamento │
-- ├────────┼───────────┼──────────────┼───────────┼──────────┼─────────────────────┤
-- │ 1      │ 32481596F │ Aarón        │ Rivero    │ Gómez    │ 1                   │
-- │ 2      │ Y5575632D │ Adela        │ Salas     │ Díaz     │ 2                   │
-- │ 3      │ R6970642B │ Adolfo       │ Rubio     │ Flores   │ 3                   │
-- │ 4      │ 77705545E │ Adrián       │ Suárez    │          │ 4                   │
-- │ 5      │ 17087203C │ Marcos       │ Loyola    │ Méndez   │ 5                   │
-- │ 6      │ 38382980M │ María        │ Santana   │ Moreno   │ 1                   │
-- │ 7      │ 80576669X │ Pilar        │ Ruiz      │          │ 2                   │
-- │ 8      │ 71651431Z │ Pepe         │ Ruiz      │ Santana  │ 3                   │
-- │ 9      │ 56399183D │ Juan         │ Gómez     │ López    │ 2                   │
-- │ 10     │ 46384486H │ Diego        │ Flores    │ Salas    │ 5                   │
-- │ 11     │ 67389283A │ Marta        │ Herrera   │ Gil      │ 1                   │
-- │ 12     │ 41234836R │ Irene        │ Salas     │ Flores   │                     │
-- │ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero │                     │
-- └────────┴───────────┴──────────────┴───────────┴──────────┴─────────────────────┘

-- 4. Lista el nombre y los apellidos de todos los empleados.

sqlite> select nombre,apellido1,apellido2 from empleado;

-- ┌──────────────┬───────────┬───────────┐
-- │    nombre    │ apellido1 │ apellido2 │
-- ├──────────────┼───────────┼───────────┤
-- │ Aarón        │ Rivero    │ Gómez     │
-- │ Adela        │ Salas     │ Díaz      │
-- │ Adolfo       │ Rubio     │ Flores    │
-- │ Adrián       │ Suárez    │           │
-- │ Marcos       │ Loyola    │ Méndez    │
-- │ María        │ Santana   │ Moreno    │
-- │ Pilar        │ Ruiz      │           │
-- │ Pepe         │ Ruiz      │ Santana   │
-- │ Juan         │ Gómez     │ López     │
-- │ Diego        │ Flores    │ Salas     │
-- │ Marta        │ Herrera   │ Gil       │
-- │ Irene        │ Salas     │ Flores    │
-- │ Juan Antonio │ Sáez      │ Guerrero  │
-- └──────────────┴───────────┴───────────┘

-- 5. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.

sqlite> select codigo_departamento from empleado;

-- ┌─────────────────────┐
-- │ codigo_departamento │
-- ├─────────────────────┤
-- │ 1                   │
-- │ 2                   │
-- │ 3                   │
-- │ 4                   │
-- │ 5                   │
-- │ 1                   │
-- │ 2                   │
-- │ 3                   │
-- │ 2                   │
-- │ 5                   │
-- │ 1                   │
-- │                     │
-- │                     │
-- └─────────────────────┘

-- 6. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.

sqlite> select distinct codigo_departamento from empleado;
-- ┌─────────────────────┐
-- │ codigo_departamento │
-- ├─────────────────────┤
-- │ 1                   │
-- │ 2                   │
-- │ 3                   │
-- │ 4                   │
-- │ 5                   │
-- │                     │
-- └─────────────────────┘

-- 7. Lista el nombre y apellidos de los empleados en una única columna.

sqlite> select nombre||" "||apellido1||" "||coalesce(apellido2, "")  as nombre from empleado;

-- ┌────────────────────────────┐
-- │           nombre           │
-- ├────────────────────────────┤
-- │ Aarón Rivero Gómez         │
-- │ Adela Salas Díaz           │
-- │ Adolfo Rubio Flores        │
-- │ Adrián Suárez              │
-- │ Marcos Loyola Méndez       │
-- │ María Santana Moreno       │
-- │ Pilar Ruiz                 │
-- │ Pepe Ruiz Santana          │
-- │ Juan Gómez López           │
-- │ Diego Flores Salas         │
-- │ Marta Herrera Gil          │
-- │ Irene Salas Flores         │
-- │ Juan Antonio Sáez Guerrero │
-- └────────────────────────────┘

-- 8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en
-- mayúscula.
sqlite> select upper(nombre||" "||apellido1||" "||coalesce(apellido2, ""))  as nombre from empleado;

-- ┌────────────────────────────┐
-- │           nombre           │
-- ├────────────────────────────┤
-- │ AARóN RIVERO GóMEZ         │
-- │ ADELA SALAS DíAZ           │
-- │ ADOLFO RUBIO FLORES        │
-- │ ADRIáN SUáREZ              │
-- │ MARCOS LOYOLA MéNDEZ       │
-- │ MARíA SANTANA MORENO       │
-- │ PILAR RUIZ                 │
-- │ PEPE RUIZ SANTANA          │
-- │ JUAN GóMEZ LóPEZ           │
-- │ DIEGO FLORES SALAS         │
-- │ MARTA HERRERA GIL          │
-- │ IRENE SALAS FLORES         │
-- │ JUAN ANTONIO SáEZ GUERRERO │
-- └────────────────────────────┘


-- 9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en
-- minúscula.

sqlite> select lower(nombre||" "||apellido1||" "||coalesce(apellido2, ""))  as nombre from empleado;
-- ┌────────────────────────────┐
-- │           nombre           │
-- ├────────────────────────────┤
-- │ aarón rivero gómez         │
-- │ adela salas díaz           │
-- │ adolfo rubio flores        │
-- │ adrián suárez              │
-- │ marcos loyola méndez       │
-- │ maría santana moreno       │
-- │ pilar ruiz                 │
-- │ pepe ruiz santana          │
-- │ juan gómez lópez           │
-- │ diego flores salas         │
-- │ marta herrera gil          │
-- │ irene salas flores         │
-- │ juan antonio sáez guerrero │
-- └────────────────────────────┘

-- 10. Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una
-- mostrará únicamente los dígitos del nif y la otra la letra.

sqlite> select codigo, substr( nif, 1, 8) as nif_numbers, substr(nif,9,1) as nif_letter from empleado;

-- ┌────────┬─────────────┬────────────┐
-- │ codigo │ nif_numbers │ nif_letter │
-- ├────────┼─────────────┼────────────┤
-- │ 1      │ 32481596    │ F          │
-- │ 2      │ Y5575632    │ D          │
-- │ 3      │ R6970642    │ B          │
-- │ 4      │ 77705545    │ E          │
-- │ 5      │ 17087203    │ C          │
-- │ 6      │ 38382980    │ M          │
-- │ 7      │ 80576669    │ X          │
-- │ 8      │ 71651431    │ Z          │
-- │ 9      │ 56399183    │ D          │
-- │ 10     │ 46384486    │ H          │
-- │ 11     │ 67389283    │ A          │
-- │ 12     │ 41234836    │ R          │
-- │ 13     │ 82635162    │ B          │
-- └────────┴─────────────┴────────────┘

-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular
-- este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se
-- han generado (columna gastos). Tenga en cuenta que en algunos casos pueden existir valores negativos.
-- Utilice un alias apropiado para la nueva columna columna que está calculando.

sqlite> select nombre, (presupuesto-gastos) as presupuesto_actual from departamento;

-- ┌──────────────────┬────────────────────┐
-- │      nombre      │ presupuesto_actual │
-- ├──────────────────┼────────────────────┤
-- │ Desarrollo       │ 114000.0           │
-- │ Sistemas         │ 129000.0           │
-- │ Recursos Humanos │ 255000.0           │
-- │ Contabilidad     │ 107000.0           │
-- │ I+D              │ -5000.0            │
-- │ Proyectos        │ 0.0                │
-- │ Publicidad       │ -1000.0            │
-- └──────────────────┴────────────────────┘

-- 12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.

sqlite> select nombre, (presupuesto-gastos) as presupuesto_actual from departamento order by presupuesto_actual;

-- ┌──────────────────┬────────────────────┐
-- │      nombre      │ presupuesto_actual │
-- ├──────────────────┼────────────────────┤
-- │ I+D              │ -5000.0            │
-- │ Publicidad       │ -1000.0            │
-- │ Proyectos        │ 0.0                │
-- │ Contabilidad     │ 107000.0           │
-- │ Desarrollo       │ 114000.0           │
-- │ Sistemas         │ 129000.0           │
-- │ Recursos Humanos │ 255000.0           │
-- └──────────────────┴────────────────────┘

-- 13. Lista el nombre de todos los departamentos ordenados de forma ascendente.

sqlite> select nombre from departamento order by nombre;

-- ┌──────────────────┐
-- │      nombre      │
-- ├──────────────────┤
-- │ Contabilidad     │
-- │ Desarrollo       │
-- │ I+D              │
-- │ Proyectos        │
-- │ Publicidad       │
-- │ Recursos Humanos │
-- │ Sistemas         │
-- └──────────────────┘

-- 14. Lista el nombre de todos los departamentos ordenados de forma desscendente.

sqlite> select nombre from departamento order by nombre desc;

-- ┌──────────────────┐
-- │      nombre      │
-- ├──────────────────┤
-- │ Sistemas         │
-- │ Recursos Humanos │
-- │ Publicidad       │
-- │ Proyectos        │
-- │ I+D              │
-- │ Desarrollo       │
-- │ Contabilidad     │
-- └──────────────────┘

-- 15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en
-- cuenta en primer lugar sus apellidos y luego su nombre.

sqlite> select nombre, apellido1,apellido2 from empleado order by apellido1,apellido2,nombre;

-- ┌──────────────┬───────────┬───────────┐
-- │    nombre    │ apellido1 │ apellido2 │
-- ├──────────────┼───────────┼───────────┤
-- │ Diego        │ Flores    │ Salas     │
-- │ Juan         │ Gómez     │ López     │
-- │ Marta        │ Herrera   │ Gil       │
-- │ Marcos       │ Loyola    │ Méndez    │
-- │ Aarón        │ Rivero    │ Gómez     │
-- │ Adolfo       │ Rubio     │ Flores    │
-- │ Pilar        │ Ruiz      │           │
-- │ Pepe         │ Ruiz      │ Santana   │
-- │ Adela        │ Salas     │ Díaz      │
-- │ Irene        │ Salas     │ Flores    │
-- │ María        │ Santana   │ Moreno    │
-- │ Adrián       │ Suárez    │           │
-- │ Juan Antonio │ Sáez      │ Guerrero  │
-- └──────────────┴───────────┴───────────┘

-- 16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.

sqlite> select nombre, presupuesto from departamento order by presupuesto desc limit 3;

-- ┌──────────────────┬─────────────┐
-- │      nombre      │ presupuesto │
-- ├──────────────────┼─────────────┤
-- │ I+D              │ 375000.0    │
-- │ Recursos Humanos │ 280000.0    │
-- │ Sistemas         │ 150000.0    │
-- └──────────────────┴─────────────┘

-- 17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.

sqlite> select nombre, presupuesto from departamento order by presupuesto limit 3;

-- ┌──────────────┬─────────────┐
-- │    nombre    │ presupuesto │
-- ├──────────────┼─────────────┤
-- │ Proyectos    │ 0.0         │
-- │ Publicidad   │ 0.0         │
-- │ Contabilidad │ 110000.0    │
-- └──────────────┴─────────────┘

-- 18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.

sqlite> select nombre, gastos from departamento order by gastos desc limit 2;

-- ┌──────────────────┬────────┐
-- │      nombre      │ gastos │
-- ├──────────────────┼────────┤
-- │ I+D              │ 380000 │
-- │ Recursos Humanos │ 25000  │
-- └──────────────────┴────────┘


-- 19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.

sqlite> select nombre, gastos from departamento order by gastos limit 2;

-- ┌────────────┬────────┐
-- │   nombre   │ gastos │
-- ├────────────┼────────┤
-- │ Proyectos  │ 0      │
-- │ Publicidad │ 1000   │
-- └────────────┴────────┘

-- 20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir
-- en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.

sqlite> select * from empleado limit 5 offset 2;

-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 3      │ R6970642B │ Adolfo │ Rubio     │ Flores    │ 3                   │
-- │ 4      │ 77705545E │ Adrián │ Suárez    │           │ 4                   │
-- │ 5      │ 17087203C │ Marcos │ Loyola    │ Méndez    │ 5                   │
-- │ 6      │ 38382980M │ María  │ Santana   │ Moreno    │ 1                   │
-- │ 7      │ 80576669X │ Pilar  │ Ruiz      │           │ 2                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘

-- 21. Devuelve una lista con el nombre de los departamentos y el presupuesto,
--  de aquellos que tienen un presupuesto mayor o igual a 150000 euros.

sqlite> select nombre, presupuesto from departamento where presupuesto >= 150000;

-- ┌──────────────────┬─────────────┐
-- │      nombre      │ presupuesto │
-- ├──────────────────┼─────────────┤
-- │ Sistemas         │ 150000.0    │
-- │ Recursos Humanos │ 280000.0    │
-- │ I+D              │ 375000.0    │
-- └──────────────────┴─────────────┘

-- 22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000
-- euros de gastos.

sqlite> select nombre, gastos from departamento where gastos < 5000;

-- ┌──────────────┬────────┐
-- │    nombre    │ gastos │
-- ├──────────────┼────────┤
-- │ Contabilidad │ 3000   │
-- │ Proyectos    │ 0      │
-- │ Publicidad   │ 1000   │
-- └──────────────┴────────┘

-- 23. Devuelve una lista con el nombre de los departamentos y el presupesto, 
-- de aquellos que tienen un presupuesto entre 100_000 y 200_000 euros. Sin utilizar el operador BETWEEN.

sqlite> select nombre, presupuesto from departamento where presupuesto > 100000 and presupuesto < 200000;

-- ┌──────────────┬─────────────┐
-- │    nombre    │ presupuesto │
-- ├──────────────┼─────────────┤
-- │ Desarrollo   │ 120000.0    │
-- │ Sistemas     │ 150000.0    │
-- │ Contabilidad │ 110000.0    │
-- └──────────────┴─────────────┘

-- 24. Devuelve una lista con el nombre de los departamentos que no tienen un 
-- presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.

sqlite> select nombre, presupuesto from departamento where presupuesto < 100000 or presupuesto > 200000;

-- ┌──────────────────┬─────────────┐
-- │      nombre      │ presupuesto │
-- ├──────────────────┼─────────────┤
-- │ Recursos Humanos │ 280000.0    │
-- │ I+D              │ 375000.0    │
-- │ Proyectos        │ 0.0         │
-- │ Publicidad       │ 0.0         │
-- └──────────────────┴─────────────┘

-- 25. Devuelve una lista con el nombre de los departamentos 
-- que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.

sqlite> select nombre, presupuesto from departamento where presupuesto between 100000 and  200000;

-- ┌──────────────┬─────────────┐
-- │    nombre    │ presupuesto │
-- ├──────────────┼─────────────┤
-- │ Desarrollo   │ 120000.0    │
-- │ Sistemas     │ 150000.0    │
-- │ Contabilidad │ 110000.0    │
-- └──────────────┴─────────────┘

-- 26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.

sqlite> select nombre, presupuesto from departamento where presupuesto not between 100000 and  200000;

-- ┌──────────────────┬─────────────┐
-- │      nombre      │ presupuesto │
-- ├──────────────────┼─────────────┤
-- │ Recursos Humanos │ 280000.0    │
-- │ I+D              │ 375000.0    │
-- │ Proyectos        │ 0.0         │
-- │ Publicidad       │ 0.0         │
-- └──────────────────┴─────────────┘

-- 27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.

sqlite> select nombre,gastos,presupuesto from departamento where gastos > presupuesto;

-- ┌────────────┬────────┬─────────────┐
-- │   nombre   │ gastos │ presupuesto │
-- ├────────────┼────────┼─────────────┤
-- │ I+D        │ 380000 │ 375000.0    │
-- │ Publicidad │ 1000   │ 0.0         │
-- └────────────┴────────┴─────────────┘

-- 28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.

sqlite> select nombre,gastos,presupuesto from departamento where gastos < presupuesto;

-- ┌──────────────────┬────────┬─────────────┐
-- │      nombre      │ gastos │ presupuesto │
-- ├──────────────────┼────────┼─────────────┤
-- │ Desarrollo       │ 6000   │ 120000.0    │
-- │ Sistemas         │ 21000  │ 150000.0    │
-- │ Recursos Humanos │ 25000  │ 280000.0    │
-- │ Contabilidad     │ 3000   │ 110000.0    │
-- └──────────────────┴────────┴─────────────┘

-- 29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.

sqlite> select nombre,gastos,presupuesto from departamento where gastos =  presupuesto;

-- ┌───────────┬────────┬─────────────┐
-- │  nombre   │ gastos │ presupuesto │
-- ├───────────┼────────┼─────────────┤
-- │ Proyectos │ 0      │ 0.0         │
-- └───────────┴────────┴─────────────┘

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.

sqlite> select * from empleado where apellido2 is null;

-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 4      │ 77705545E │ Adrián │ Suárez    │           │ 4                   │
-- │ 7      │ 80576669X │ Pilar  │ Ruiz      │           │ 2                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘

-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.

sqlite> select * from empleado where apellido2 is not null;

-- ┌────────┬───────────┬──────────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │    nombre    │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼──────────────┼───────────┼───────────┼─────────────────────┤
-- │ 1      │ 32481596F │ Aarón        │ Rivero    │ Gómez     │ 1                   │
-- │ 2      │ Y5575632D │ Adela        │ Salas     │ Díaz      │ 2                   │
-- │ 3      │ R6970642B │ Adolfo       │ Rubio     │ Flores    │ 3                   │
-- │ 5      │ 17087203C │ Marcos       │ Loyola    │ Méndez    │ 5                   │
-- │ 6      │ 38382980M │ María        │ Santana   │ Moreno    │ 1                   │
-- │ 8      │ 71651431Z │ Pepe         │ Ruiz      │ Santana   │ 3                   │
-- │ 9      │ 56399183D │ Juan         │ Gómez     │ López     │ 2                   │
-- │ 10     │ 46384486H │ Diego        │ Flores    │ Salas     │ 5                   │
-- │ 11     │ 67389283A │ Marta        │ Herrera   │ Gil       │ 1                   │
-- │ 12     │ 41234836R │ Irene        │ Salas     │ Flores    │                     │
-- │ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero  │                     │
-- └────────┴───────────┴──────────────┴───────────┴───────────┴─────────────────────┘

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.

sqlite> select * from empleado where apellido2 in ("López");

-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 9      │ 56399183D │ Juan   │ Gómez     │ López     │ 2                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘

-- 33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.

sqlite> select * from empleado where apellido2="Díaz" or apellido2="Moreno";

-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 2      │ Y5575632D │ Adela  │ Salas     │ Díaz      │ 2                   │
-- │ 6      │ 38382980M │ María  │ Santana   │ Moreno    │ 1                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘

-- 34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.

sqlite> select * from empleado where apellido2 in ("Díaz","Moreno");

-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 2      │ Y5575632D │ Adela  │ Salas     │ Díaz      │ 2                   │
-- │ 6      │ 38382980M │ María  │ Santana   │ Moreno    │ 1                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘

-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.

sqlite> select nombre,apellido1,apellido2,nif from empleado where codigo_departamento=3;

-- ┌────────┬───────────┬───────────┬───────────┐
-- │ nombre │ apellido1 │ apellido2 │    nif    │
-- ├────────┼───────────┼───────────┼───────────┤
-- │ Adolfo │ Rubio     │ Flores    │ R6970642B │
-- │ Pepe   │ Ruiz      │ Santana   │ 71651431Z │
-- └────────┴───────────┴───────────┴───────────┘

-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.

sqlite> select nombre,apellido1,apellido2,nif from empleado where codigo_departamento in (2,4,5);

-- ┌────────┬───────────┬───────────┬───────────┐
-- │ nombre │ apellido1 │ apellido2 │    nif    │
-- ├────────┼───────────┼───────────┼───────────┤
-- │ Adela  │ Salas     │ Díaz      │ Y5575632D │
-- │ Adrián │ Suárez    │           │ 77705545E │
-- │ Marcos │ Loyola    │ Méndez    │ 17087203C │
-- │ Pilar  │ Ruiz      │           │ 80576669X │
-- │ Juan   │ Gómez     │ López     │ 56399183D │
-- │ Diego  │ Flores    │ Salas     │ 46384486H │
-- └────────┴───────────┴───────────┴───────────┘

--CONSULTAS MULTITABLA

-- 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.

sqlite> select e.codigo,e.nif,e.apellido1,e.apellido2,d.codigo,d.nombre,d.presupuesto,d.gastos from empleado as e join departamento as d on e.codigo_departamento=d.codigo;

-- ┌────────┬───────────┬───────────┬───────────┬────────┬──────────────────┬─────────────┬────────┐
-- │ codigo │    nif    │ apellido1 │ apellido2 │ codigo │      nombre      │ presupuesto │ gastos │
-- ├────────┼───────────┼───────────┼───────────┼────────┼──────────────────┼─────────────┼────────┤
-- │ 1      │ 32481596F │ Rivero    │ Gómez     │ 1      │ Desarrollo       │ 120000.0    │ 6000   │
-- │ 2      │ Y5575632D │ Salas     │ Díaz      │ 2      │ Sistemas         │ 150000.0    │ 21000  │
-- │ 3      │ R6970642B │ Rubio     │ Flores    │ 3      │ Recursos Humanos │ 280000.0    │ 25000  │
-- │ 4      │ 77705545E │ Suárez    │           │ 4      │ Contabilidad     │ 110000.0    │ 3000   │
-- │ 5      │ 17087203C │ Loyola    │ Méndez    │ 5      │ I+D              │ 375000.0    │ 380000 │
-- │ 6      │ 38382980M │ Santana   │ Moreno    │ 1      │ Desarrollo       │ 120000.0    │ 6000   │
-- │ 7      │ 80576669X │ Ruiz      │           │ 2      │ Sistemas         │ 150000.0    │ 21000  │
-- │ 8      │ 71651431Z │ Ruiz      │ Santana   │ 3      │ Recursos Humanos │ 280000.0    │ 25000  │
-- │ 9      │ 56399183D │ Gómez     │ López     │ 2      │ Sistemas         │ 150000.0    │ 21000  │
-- │ 10     │ 46384486H │ Flores    │ Salas     │ 5      │ I+D              │ 375000.0    │ 380000 │
-- │ 11     │ 67389283A │ Herrera   │ Gil       │ 1      │ Desarrollo       │ 120000.0    │ 6000   │
-- └────────┴───────────┴───────────┴───────────┴────────┴──────────────────┴─────────────┴────────┘

-- 2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento 
-- (en orden alfabético) y en segundo lugar por los apellidos y el nombre de los empleados.

sqlite> select e.codigo,e.nif,e.apellido1,e.apellido2,d.codigo,d.nombre,d.presupuesto,d.gastos from empleado as e join departamento as d on e.codigo_departamento=d.codigo order by d.nombre,e.apellido1,e.apellido2,e.nombre;

-- ┌────────┬───────────┬───────────┬───────────┬────────┬──────────────────┬─────────────┬────────┐
-- │ codigo │    nif    │ apellido1 │ apellido2 │ codigo │      nombre      │ presupuesto │ gastos │
-- ├────────┼───────────┼───────────┼───────────┼────────┼──────────────────┼─────────────┼────────┤
-- │ 4      │ 77705545E │ Suárez    │           │ 4      │ Contabilidad     │ 110000.0    │ 3000   │
-- │ 11     │ 67389283A │ Herrera   │ Gil       │ 1      │ Desarrollo       │ 120000.0    │ 6000   │
-- │ 1      │ 32481596F │ Rivero    │ Gómez     │ 1      │ Desarrollo       │ 120000.0    │ 6000   │
-- │ 6      │ 38382980M │ Santana   │ Moreno    │ 1      │ Desarrollo       │ 120000.0    │ 6000   │
-- │ 10     │ 46384486H │ Flores    │ Salas     │ 5      │ I+D              │ 375000.0    │ 380000 │
-- │ 5      │ 17087203C │ Loyola    │ Méndez    │ 5      │ I+D              │ 375000.0    │ 380000 │
-- │ 3      │ R6970642B │ Rubio     │ Flores    │ 3      │ Recursos Humanos │ 280000.0    │ 25000  │
-- │ 8      │ 71651431Z │ Ruiz      │ Santana   │ 3      │ Recursos Humanos │ 280000.0    │ 25000  │
-- │ 9      │ 56399183D │ Gómez     │ López     │ 2      │ Sistemas         │ 150000.0    │ 21000  │
-- │ 7      │ 80576669X │ Ruiz      │           │ 2      │ Sistemas         │ 150000.0    │ 21000  │
-- │ 2      │ Y5575632D │ Salas     │ Díaz      │ 2      │ Sistemas         │ 150000.0    │ 21000  │
-- └────────┴───────────┴───────────┴───────────┴────────┴──────────────────┴─────────────┴────────┘

-- 3. Devuelve un listado con el identificador y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.

sqlite> select d.codigo,d.nombre from  departamento as d join empleado as e on d.codigo=e.codigo_departamento group by d.codigo;

-- ┌────────┬──────────────────┐
-- │ codigo │      nombre      │
-- ├────────┼──────────────────┤
-- │ 1      │ Desarrollo       │
-- │ 2      │ Sistemas         │
-- │ 3      │ Recursos Humanos │
-- │ 4      │ Contabilidad     │
-- │ 5      │ I+D              │
-- └────────┴──────────────────┘

-- 4. Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto actual del que dispone, solamente de aquellos departamentos que tienen empleados. 
-- El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).

sqlite> select d.codigo,d.nombre,(d.presupuesto-d.gastos) as "presupuesto actual" from departamento as d join empleado as e on d.codigo=e.codigo_departamento group by d.codigo;

-- ┌────────┬──────────────────┬────────────────────┐
-- │ codigo │      nombre      │ presupuesto actual │
-- ├────────┼──────────────────┼────────────────────┤
-- │ 1      │ Desarrollo       │ 114000.0           │
-- │ 2      │ Sistemas         │ 129000.0           │
-- │ 3      │ Recursos Humanos │ 255000.0           │
-- │ 4      │ Contabilidad     │ 107000.0           │
-- │ 5      │ I+D              │ -5000.0            │
-- └────────┴──────────────────┴────────────────────┘

-- 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.

sqlite> select d.nombre from departamento as d join empleado as e on d.codigo=e.codigo_departamento where e.nif in ("38382980M");

-- ┌────────────┐
-- │   nombre   │
-- ├────────────┤
-- │ Desarrollo │
-- └────────────┘

-- 6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.

sqlite> select d.nombre from departamento as d join empleado as e on d.codigo=e.codigo_departamento where e.nombre in ("Pepe") and apellido1 in ("Ruiz") and apellido2 in ("Santana");

-- ┌──────────────────┐
-- │      nombre      │
-- ├──────────────────┤
-- │ Recursos Humanos │
-- └──────────────────┘

-- 7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.

sqlite> select e.codigo,e.nif,e.nombre,e.apellido1,e.apellido2 from departamento as d join empleado as e on d.codigo=e.codigo_departamento where d.nombre in ("I+D") order by e.nombre;

-- ┌────────┬───────────┬────────┬───────────┬───────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │
-- ├────────┼───────────┼────────┼───────────┼───────────┤
-- │ 10     │ 46384486H │ Diego  │ Flores    │ Salas     │
-- │ 5      │ 17087203C │ Marcos │ Loyola    │ Méndez    │
-- └────────┴───────────┴────────┴───────────┴───────────┘

-- 8. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.

sqlite> select e.codigo,e.nif,e.nombre,e.apellido1,e.apellido2 from departamento as d join empleado as e on d.codigo=e.codigo_departamento where d.nombre in ("I+D","Sistemas","Contabilidad") order by e.nombre;

-- ┌────────┬───────────┬────────┬───────────┬───────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │
-- ├────────┼───────────┼────────┼───────────┼───────────┤
-- │ 2      │ Y5575632D │ Adela  │ Salas     │ Díaz      │
-- │ 4      │ 77705545E │ Adrián │ Suárez    │           │
-- │ 10     │ 46384486H │ Diego  │ Flores    │ Salas     │
-- │ 9      │ 56399183D │ Juan   │ Gómez     │ López     │
-- │ 5      │ 17087203C │ Marcos │ Loyola    │ Méndez    │
-- │ 7      │ 80576669X │ Pilar  │ Ruiz      │           │
-- └────────┴───────────┴────────┴───────────┴───────────┘

-- 9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.

sqlite> select e.nombre from departamento as d join empleado as e on d.codigo=e.codigo_departamento where presupuesto not between 100000 and 200000;

-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Adolfo │
-- │ Marcos │
-- │ Pepe   │
-- │ Diego  │
-- └────────┘

-- 10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.

sqlite> select distinct d.nombre from departamento as d join empleado as e on d.codigo=e.codigo_departamento where e.apellido2 is null;

-- ┌──────────────┐
-- │    nombre    │
-- ├──────────────┤
-- │ Contabilidad │
-- │ Sistemas     │
-- └──────────────┘

--CONSULTAS EXTERNAS

-- 1. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
-- Este listado también debe incluir los empleados que no tienen ningún departamento asociado.

sqlite> select e.codigo,e.nif,e.nombre,e.apellido1,e.apellido2,d.codigo,d.nombre,d.presupuesto,d.gastos from empleado as e left join departamento as d on e.codigo_departamento=d.codigo;

-- ┌────────┬───────────┬──────────────┬───────────┬───────────┬────────┬──────────────────┬─────────────┬────────┐
-- │ codigo │    nif    │    nombre    │ apellido1 │ apellido2 │ codigo │      nombre      │ presupuesto │ gastos │
-- ├────────┼───────────┼──────────────┼───────────┼───────────┼────────┼──────────────────┼─────────────┼────────┤
-- │ 1      │ 32481596F │ Aarón        │ Rivero    │ Gómez     │ 1      │ Desarrollo       │ 120000.0    │ 6000   │
-- │ 2      │ Y5575632D │ Adela        │ Salas     │ Díaz      │ 2      │ Sistemas         │ 150000.0    │ 21000  │
-- │ 3      │ R6970642B │ Adolfo       │ Rubio     │ Flores    │ 3      │ Recursos Humanos │ 280000.0    │ 25000  │
-- │ 4      │ 77705545E │ Adrián       │ Suárez    │           │ 4      │ Contabilidad     │ 110000.0    │ 3000   │
-- │ 5      │ 17087203C │ Marcos       │ Loyola    │ Méndez    │ 5      │ I+D              │ 375000.0    │ 380000 │
-- │ 6      │ 38382980M │ María        │ Santana   │ Moreno    │ 1      │ Desarrollo       │ 120000.0    │ 6000   │
-- │ 7      │ 80576669X │ Pilar        │ Ruiz      │           │ 2      │ Sistemas         │ 150000.0    │ 21000  │
-- │ 8      │ 71651431Z │ Pepe         │ Ruiz      │ Santana   │ 3      │ Recursos Humanos │ 280000.0    │ 25000  │
-- │ 9      │ 56399183D │ Juan         │ Gómez     │ López     │ 2      │ Sistemas         │ 150000.0    │ 21000  │
-- │ 10     │ 46384486H │ Diego        │ Flores    │ Salas     │ 5      │ I+D              │ 375000.0    │ 380000 │
-- │ 11     │ 67389283A │ Marta        │ Herrera   │ Gil       │ 1      │ Desarrollo       │ 120000.0    │ 6000   │
-- │ 12     │ 41234836R │ Irene        │ Salas     │ Flores    │        │                  │             │        │
-- │ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero  │        │                  │             │        │
-- └────────┴───────────┴──────────────┴───────────┴───────────┴────────┴──────────────────┴─────────────┴────────┘

-- 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.

sqlite> select e.codigo,e.nif,e.nombre,e.apellido1,e.apellido2 from empleado as e left join departamento as d on e.codigo_departamento=d.codigo where d.codigo is null;

-- ┌────────┬───────────┬──────────────┬───────────┬───────────┐
-- │ codigo │    nif    │    nombre    │ apellido1 │ apellido2 │
-- ├────────┼───────────┼──────────────┼───────────┼───────────┤
-- │ 12     │ 41234836R │ Irene        │ Salas     │ Flores    │
-- │ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero  │
-- └────────┴───────────┴──────────────┴───────────┴───────────┘

-- 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.

sqlite> select d.codigo,d.nombre,d.presupuesto,d.gastos from departamento  as d left join empleado as e on e.codigo_departamento=d.codigo where e.codigo is null;

-- ┌────────┬────────────┬─────────────┬────────┐
-- │ codigo │   nombre   │ presupuesto │ gastos │
-- ├────────┼────────────┼─────────────┼────────┤
-- │ 6      │ Proyectos  │ 0.0         │ 0      │
-- │ 7      │ Publicidad │ 0.0         │ 1000   │
-- └────────┴────────────┴─────────────┴────────┘

-- 4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
-- El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. 
-- Ordene el listado alfabéticamente por el nombre del departamento

-- 5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. 
-- Ordene el listado alfabéticamente por el nombre del departamento.

-- Consultas resumen

-- 1. Calcula la suma del presupuesto de todos los departamentos.

sqlite> select sum(presupuesto) as "total presupuesto" from departamento ;

-- ┌───────────────────┐
-- │ total presupuesto │
-- ├───────────────────┤
-- │ 1035000.0         │
-- └───────────────────┘

-- 2. Calcula la media del presupuesto de todos los departamentos.

sqlite> select avg(presupuesto) as "Presupuesto medio" from departamento ;
-- ┌───────────────────┐
-- │ Presupuesto medio │
-- ├───────────────────┤
-- │ 147857.142857143  │
-- └───────────────────┘

-- 3. Calcula el valor mínimo del presupuesto de todos los departamentos.

sqlite> select min(presupuesto) as "Presupuesto mínimo" from departamento;
-- ┌────────────────────┐
-- │ Presupuesto mínimo │
-- ├────────────────────┤
-- │ 0.0                │
-- └────────────────────┘

-- 4. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor
-- presupuesto.

sqlite> select nombre, min(presupuesto) as "presupuesto" from departamento;
-- ┌───────────┬─────────────┐
-- │  nombre   │ presupuesto │
-- ├───────────┼─────────────┤
-- │ Proyectos │ 0.0         │
-- └───────────┴─────────────┘

-- 5. Calcula el valor máximo del presupuesto de todos los departamentos.

sqlite> select max(presupuesto) as "Presupuesto máximo" from departamento;

-- ┌────────────────────┐
-- │ Presupuesto máximo │
-- ├────────────────────┤
-- │ 375000.0           │
-- └────────────────────┘

-- 6. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.

sqlite> select nombre, max(presupuesto) as "presupuesto" from departamento;

-- ┌────────┬─────────────┐
-- │ nombre │ presupuesto │
-- ├────────┼─────────────┤
-- │ I+D    │ 375000.0    │
-- └────────┴─────────────┘

-- 7. Calcula el número total de empleados que hay en la tabla empleado.

sqlite> select count(codigo) as "Total de empleados" from empleado;

-- ┌────────────────────┐
-- │ Total de empleados │
-- ├────────────────────┤
-- │ 13                 │
-- └────────────────────┘

-- 8. Calcula el número de empleados que no tienen NULL en su segundo apellido.

sqlite> select count(codigo) as "Total de empleados" from empleado where apellido2 is not null;

-- ┌────────────────────┐
-- │ Total de empleados │
-- ├────────────────────┤
-- │ 11                 │
-- └────────────────────┘

-- 9. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.ç

sqlite> select d.nombre, count(e.codigo) from departamento as d join empleado as e on e.codigo_departamento=d.codigo group by d.codigo;

-- ┌──────────────────┬─────────────────┐
-- │      nombre      │ count(e.codigo) │
-- ├──────────────────┼─────────────────┤
-- │ Desarrollo       │ 3               │
-- │ Sistemas         │ 3               │
-- │ Recursos Humanos │ 2               │
-- │ Contabilidad     │ 1               │
-- │ I+D              │ 2               │
-- └──────────────────┴─────────────────┘

-- 10. Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.

sqlite> select d.nombre, count(e.codigo) as empleados from departamento as d left join empleado as e on e.codigo_departamento=d.codigo group by d.codigo having empleados > 2;
-- ┌────────────┬───────────┐
-- │   nombre   │ empleados │
-- ├────────────┼───────────┤
-- │ Desarrollo │ 3         │
-- │ Sistemas   │ 3         │
-- └────────────┴───────────┘

-- 11. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.

sqlite> select d.nombre, count(e.codigo) from departamento as d left join empleado as e on e.codigo_departamento=d.codigo group by d.codigo;

-- ┌──────────────────┬─────────────────┐
-- │      nombre      │ count(e.codigo) │
-- ├──────────────────┼─────────────────┤
-- │ Desarrollo       │ 3               │
-- │ Sistemas         │ 3               │
-- │ Recursos Humanos │ 2               │
-- │ Contabilidad     │ 1               │
-- │ I+D              │ 2               │
-- │ Proyectos        │ 0               │
-- │ Publicidad       │ 0               │
-- └──────────────────┴─────────────────┘

-- 12. Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.

sqlite> select d.nombre, count(e.codigo) from departamento as d join empleado as e on e.codigo_departamento=d.codigo where d.presupuesto > 200000 group by d.codigo;

-- ┌──────────────────┬─────────────────┐
-- │      nombre      │ count(e.codigo) │
-- ├──────────────────┼─────────────────┤
-- │ Recursos Humanos │ 2               │
-- │ I+D              │ 2               │
-- └──────────────────┴─────────────────┘

-- ## Subconsultas

-- ### Con operadores básicos de comparación

-- 1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).

sqlite> select e.nif,e.nombre,e.apellido1,e.apellido2 from departamento as d, empleado as e where e.codigo_departamento=d.codigo and d.nombre in ("Sistemas");

-- ┌───────────┬────────┬───────────┬───────────┐
-- │    nif    │ nombre │ apellido1 │ apellido2 │
-- ├───────────┼────────┼───────────┼───────────┤
-- │ Y5575632D │ Adela  │ Salas     │ Díaz      │
-- │ 80576669X │ Pilar  │ Ruiz      │           │
-- │ 56399183D │ Juan   │ Gómez     │ López     │
-- └───────────┴────────┴───────────┴───────────┘

-- 2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.

sqlite> select nombre,presupuesto from departamento where presupuesto in (select max(presupuesto) from departamento); 
-- ┌────────┬─────────────┐
-- │ nombre │ presupuesto │
-- ├────────┼─────────────┤
-- │ I+D    │ 375000.0    │
-- └────────┴─────────────┘

-- 3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.

sqlite> select nombre,presupuesto from departamento where presupuesto in (select min(presupuesto) from departamento) limit 1; 

-- ┌───────────┬─────────────┐
-- │  nombre   │ presupuesto │
-- ├───────────┼─────────────┤
-- │ Proyectos │ 0.0         │
-- └───────────┴─────────────┘

-- ### Subconsultas con IN y NOT IN

-- 4. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).

sqlite> select distinct nombre from departamento where codigo in (select codigo_departamento from empleado);
-- ┌──────────────────┐
-- │      nombre      │
-- ├──────────────────┤
-- │ Desarrollo       │
-- │ Sistemas         │
-- │ Recursos Humanos │
-- │ Contabilidad     │
-- │ I+D              │
-- └──────────────────┘

-- 5. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).

sqlite> select distinct nombre from departamento where codigo not in (select e.codigo_departamento from empleado as e join departamento as d on d.codigo=e.codigo_departamento);

-- ┌────────────┐
-- │   nombre   │
-- ├────────────┤
-- │ Proyectos  │
-- │ Publicidad │
-- └────────────┘

-- ### Subconsultas con EXISTS y NOT EXISTS

-- 6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

sqlite> select distinct nombre from departamento where  exists (select 1 from empleado where empleado.codigo_departamento=departamento.codigo );

-- ┌──────────────────┐
-- │      nombre      │
-- ├──────────────────┤
-- │ Desarrollo       │
-- │ Sistemas         │
-- │ Recursos Humanos │
-- │ Contabilidad     │
-- │ I+D              │
-- └──────────────────┘

-- 7. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

sqlite> select distinct nombre from departamento where not  exists (select 1 from empleado where empleado.codigo_departamento=departamento.codigo );

-- ┌────────────┐
-- │   nombre   │
-- ├────────────┤
-- │ Proyectos  │
-- │ Publicidad │
-- └────────────┘