-- create table

sqlite> .read create.sql

-- insert

sqlite> .read insert.sql

-- consultas

-- Consultas sobre una tabla
-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

sqlite> select codigo_oficina, ciudad from oficina;

-- ┌────────────────┬──────────────────────┐
-- │ codigo_oficina │        ciudad        │
-- ├────────────────┼──────────────────────┤
-- │ BCN-ES         │ Barcelona            │
-- │ BOS-USA        │ Boston               │
-- │ LON-UK         │ Londres              │
-- │ MAD-ES         │ Madrid               │
-- │ PAR-FR         │ Paris                │
-- │ SFC-USA        │ San Francisco        │
-- │ SYD-AU         │ Sydney               │
-- │ TAL-ES         │ Talavera de la Reina │
-- │ TOK-JP         │ Tokyo                │
-- └────────────────┴──────────────────────┘

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

sqlite> select ciudad, telefono from oficina where pais in ("España");

-- ┌──────────────────────┬────────────────┐
-- │        ciudad        │    telefono    │
-- ├──────────────────────┼────────────────┤
-- │ Barcelona            │ +34 93 3561182 │
-- │ Madrid               │ +34 91 7514487 │
-- │ Talavera de la Reina │ +34 925 867231 │
-- └──────────────────────┴────────────────┘

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

sqlite> select nombre, apellido1,apellido2,email from empleado where codigo_jefe in ("7");

-- ┌─────────┬───────────┬───────────┬──────────────────────────┐
-- │ nombre  │ apellido1 │ apellido2 │          email           │
-- ├─────────┼───────────┼───────────┼──────────────────────────┤
-- │ Mariano │ López     │ Murcia    │ mlopez@jardineria.es     │
-- │ Lucio   │ Campoamor │ Martín    │ lcampoamor@jardineria.es │
-- │ Hilario │ Rodriguez │ Huertas   │ hrodriguez@jardineria.es │
-- └─────────┴───────────┴───────────┴──────────────────────────┘

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

sqlite> select puesto, nombre, apellido1, apellido2, email from empleado where codigo_jefe is null;

-- ┌──────────────────┬────────┬───────────┬───────────┬──────────────────────┐
-- │      puesto      │ nombre │ apellido1 │ apellido2 │        email         │
-- ├──────────────────┼────────┼───────────┼───────────┼──────────────────────┤
-- │ Director General │ Marcos │ Magaña    │ Perez     │ marcos@jardineria.es │
-- └──────────────────┴────────┴───────────┴───────────┴──────────────────────┘

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

sqlite> select nombre, apellido1, apellido2, puesto from empleado where puesto not in ("Representante Ventas");

-- ┌──────────┬────────────┬───────────┬───────────────────────┐
-- │  nombre  │ apellido1  │ apellido2 │        puesto         │
-- ├──────────┼────────────┼───────────┼───────────────────────┤
-- │ Marcos   │ Magaña     │ Perez     │ Director General      │
-- │ Ruben    │ López      │ Martinez  │ Subdirector Marketing │
-- │ Alberto  │ Soria      │ Carrasco  │ Subdirector Ventas    │
-- │ Maria    │ Solís      │ Jerez     │ Secretaria            │
-- │ Carlos   │ Soria      │ Jimenez   │ Director Oficina      │
-- │ Emmanuel │ Magaña     │ Perez     │ Director Oficina      │
-- │ Francois │ Fignon     │           │ Director Oficina      │
-- │ Michael  │ Bolton     │           │ Director Oficina      │
-- │ Hilary   │ Washington │           │ Director Oficina      │
-- │ Nei      │ Nishikori  │           │ Director Oficina      │
-- │ Amy      │ Johnson    │           │ Director Oficina      │
-- │ Kevin    │ Fallmer    │           │ Director Oficina      │
-- └──────────┴────────────┴───────────┴───────────────────────┘

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles.

sqlite> select nombre_cliente from cliente where pais in ("España","Spain");

-- ┌────────────────────────────────┐
-- │         nombre_cliente         │
-- ├────────────────────────────────┤
-- │ Lasas S.A.                     │
-- │ Beragua                        │
-- │ Club Golf Puerta del hierro    │
-- │ Naturagua                      │
-- │ DaraDistribuciones             │
-- │ Madrileña de riegos            │
-- │ Lasas S.A.                     │
-- │ Camunas Jardines S.L.          │
-- │ Dardena S.A.                   │
-- │ Jardin de Flores               │
-- │ Flores Marivi                  │
-- │ Flowers, S.A                   │
-- │ Naturajardin                   │
-- │ Golf S.A.                      │
-- │ Americh Golf Management SL     │
-- │ Aloha                          │
-- │ El Prat                        │
-- │ Sotogrande                     │
-- │ Vivero Humanes                 │
-- │ Fuenla City                    │
-- │ Jardines y Mansiones Cactus SL │
-- │ Jardinerías Matías SL          │
-- │ Agrojardin                     │
-- │ Top Campo                      │
-- │ Jardineria Sara                │
-- │ Campohermoso                   │
-- │ Flores S.L.                    │

-- └────────────────────────────────┘
-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

sqlite> select distinct estado from pedido;

-- ┌───────────┐
-- │  estado   │
-- ├───────────┤
-- │ Entregado │
-- │ Rechazado │
-- │ Pendiente │
-- └───────────┘

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. 

sqlite> select distinct codigo_cliente from pago where fecha_pago regexp "^2008";

-- ┌────────────────┐
-- │ codigo_cliente │
-- ├────────────────┤
-- │ 1              │
-- │ 13             │
-- │ 14             │
-- │ 26             │
-- └────────────────┘

-- 9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

sqlite> select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_esperada < fecha_entrega ;

-- ┌───────────────┬────────────────┬────────────────┬───────────────┐
-- │ codigo_pedido │ codigo_cliente │ fecha_esperada │ fecha_entrega │
-- ├───────────────┼────────────────┼────────────────┼───────────────┤
-- │ 9             │ 1              │ 2008-12-27     │ 2008-12-28    │
-- │ 13            │ 7              │ 2009-01-14     │ 2009-01-15    │
-- │ 16            │ 7              │ 2009-01-07     │ 2009-01-15    │
-- │ 17            │ 7              │ 2009-01-09     │ 2009-01-11    │
-- │ 18            │ 9              │ 2009-01-06     │ 2009-01-07    │
-- │ 22            │ 9              │ 2009-01-11     │ 2009-01-13    │
-- │ 28            │ 3              │ 2009-02-17     │ 2009-02-20    │
-- │ 31            │ 13             │ 2008-09-30     │ 2008-10-04    │
-- │ 32            │ 4              │ 2007-01-19     │ 2007-01-27    │
-- │ 38            │ 19             │ 2009-03-06     │ 2009-03-07    │
-- │ 39            │ 19             │ 2009-03-07     │ 2009-03-09    │
-- │ 40            │ 19             │ 2009-03-10     │ 2009-03-13    │
-- │ 42            │ 19             │ 2009-03-23     │ 2009-03-27    │
-- │ 43            │ 23             │ 2009-03-26     │ 2009-03-28    │
-- │ 44            │ 23             │ 2009-03-27     │ 2009-03-30    │
-- │ 45            │ 23             │ 2009-03-04     │ 2009-03-07    │
-- │ 46            │ 23             │ 2009-03-04     │ 2009-03-05    │
-- │ 49            │ 26             │ 2008-07-22     │ 2008-07-30    │
-- │ 55            │ 14             │ 2009-01-10     │ 2009-01-11    │
-- │ 60            │ 1              │ 2008-12-27     │ 2008-12-28    │
-- │ 68            │ 3              │ 2009-02-17     │ 2009-02-20    │
-- │ 92            │ 27             │ 2009-04-30     │ 2009-05-03    │
-- │ 96            │ 35             │ 2008-04-12     │ 2008-04-13    │
-- │ 103           │ 30             │ 2009-01-20     │ 2009-01-24    │
-- │ 106           │ 30             │ 2009-05-15     │ 2009-05-20    │
-- │ 112           │ 36             │ 2009-04-06     │ 2009-05-07    │
-- │ 113           │ 36             │ 2008-11-09     │ 2009-01-09    │
-- │ 114           │ 36             │ 2009-01-29     │ 2009-01-31    │
-- │ 115           │ 36             │ 2009-01-26     │ 2009-02-27    │
-- │ 123           │ 30             │ 2009-01-20     │ 2009-01-24    │
-- │ 126           │ 30             │ 2009-05-15     │ 2009-05-20    │
-- │ 128           │ 38             │ 2008-12-10     │ 2008-12-29    │
-- └───────────────┴────────────────┴────────────────┴───────────────┘

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- >__Nota__: Argumenta el camino para la solución.
-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
-- 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
-- 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
-- 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
