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

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los 
-- pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- >__Nota__: Argumenta el camino para la solución.

sqlite> select codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega from pedido where fecha_entrega <= date(fecha_esperada, "-2 day");

-- ┌───────────────┬────────────────┬────────────────┬───────────────┐
-- │ codigo_pedido │ codigo_cliente │ fecha_esperada │ fecha_entrega │
-- ├───────────────┼────────────────┼────────────────┼───────────────┤
-- │ 2             │ 5              │ 2007-10-28     │ 2007-10-26    │
-- │ 24            │ 14             │ 2008-07-31     │ 2008-07-25    │
-- │ 30            │ 13             │ 2008-09-03     │ 2008-08-31    │
-- │ 36            │ 14             │ 2008-12-15     │ 2008-12-10    │
-- │ 53            │ 13             │ 2008-11-15     │ 2008-11-09    │
-- │ 89            │ 35             │ 2007-12-13     │ 2007-12-10    │
-- │ 91            │ 27             │ 2009-03-29     │ 2009-03-27    │
-- │ 93            │ 27             │ 2009-05-30     │ 2009-05-17    │
-- └───────────────┴────────────────┴────────────────┴───────────────┘

-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

sqlite> select * from pedido where estado="Rechazado" and fecha_esperada regexp '2009';
┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬──────────────────────────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                               comentarios                                │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────────────────┼────────────────┤
│ 14            │ 2009-01-02   │ 2009-01-02     │               │ Rechazado │ mal pago                                                                 │ 7              │
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                                 │ 9              │
│ 23            │ 2008-12-30   │ 2009-01-10     │               │ Rechazado │ El pedido fue anulado por el cliente                                     │ 5              │
│ 25            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada                         │ 1              │
│ 26            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto                 │ 3              │
│ 35            │ 2008-03-10   │ 2009-03-20     │               │ Rechazado │ Limite de credito superado                                               │ 4              │
│ 40            │ 2009-03-09   │ 2009-03-10     │ 2009-03-13    │ Rechazado │                                                                          │ 19             │
│ 46            │ 2009-04-03   │ 2009-03-04     │ 2009-03-05    │ Rechazado │                                                                          │ 23             │
│ 56            │ 2008-12-19   │ 2009-01-20     │               │ Rechazado │ El cliente a anulado el pedido el dia 2009-01-10                         │ 13             │
│ 65            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada                         │ 1              │
│ 66            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto                 │ 3              │
│ 74            │ 2009-01-14   │ 2009-01-22     │               │ Rechazado │ El pedido no llego el dia que queria el cliente por fallo del transporte │ 15             │
│ 81            │ 2009-01-18   │ 2009-01-24     │               │ Rechazado │ Los producto estaban en mal estado                                       │ 28             │
│ 101           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                                   │ 16             │
│ 105           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad                      │ 30             │
│ 120           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                                   │ 16             │
│ 125           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad                      │ 30             │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴──────────────────────────────────────────────────────────────────────────┴────────────────┘

-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

sqlite> select * from pedido where estado in ("Entregado") and fecha_entrega regexp "-01-";

-- ┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬────────────────────────────────────────────────────────┬────────────────┐
-- │ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                      comentarios                       │ codigo_cliente │
-- ├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼────────────────────────────────────────────────────────┼────────────────┤
-- │ 1             │ 2006-01-17   │ 2006-01-19     │ 2006-01-19    │ Entregado │ Pagado a plazos                                        │ 5              │
-- │ 13            │ 2009-01-12   │ 2009-01-14     │ 2009-01-15    │ Entregado │                                                        │ 7              │
-- │ 15            │ 2009-01-09   │ 2009-01-12     │ 2009-01-11    │ Entregado │                                                        │ 7              │
-- │ 16            │ 2009-01-06   │ 2009-01-07     │ 2009-01-15    │ Entregado │                                                        │ 7              │
-- │ 17            │ 2009-01-08   │ 2009-01-09     │ 2009-01-11    │ Entregado │ mal estado                                             │ 7              │
-- │ 18            │ 2009-01-05   │ 2009-01-06     │ 2009-01-07    │ Entregado │                                                        │ 9              │
-- │ 22            │ 2009-01-11   │ 2009-01-11     │ 2009-01-13    │ Entregado │                                                        │ 9              │
-- │ 32            │ 2007-01-07   │ 2007-01-19     │ 2007-01-27    │ Entregado │ Entrega tardia, el cliente puso reclamacion            │ 4              │
-- │ 55            │ 2008-12-10   │ 2009-01-10     │ 2009-01-11    │ Entregado │ Retrasado 1 dia por problemas de transporte            │ 14             │
-- │ 58            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                          │ 3              │
-- │ 64            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                          │ 1              │
-- │ 75            │ 2009-01-11   │ 2009-01-13     │ 2009-01-13    │ Entregado │ El pedido llego perfectamente                          │ 15             │
-- │ 79            │ 2009-01-12   │ 2009-01-13     │ 2009-01-13    │ Entregado │                                                        │ 28             │
-- │ 82            │ 2009-01-20   │ 2009-01-29     │ 2009-01-29    │ Entregado │ El pedido llego un poco mas tarde de la hora fijada    │ 28             │
-- │ 95            │ 2008-01-04   │ 2008-01-19     │ 2008-01-19    │ Entregado │                                                        │ 35             │
-- │ 100           │ 2009-01-10   │ 2009-01-15     │ 2009-01-15    │ Entregado │ El pedido llego perfectamente                          │ 16             │
-- │ 102           │ 2008-12-28   │ 2009-01-08     │ 2009-01-08    │ Entregado │ Pago pendiente                                         │ 16             │
-- │ 114           │ 2009-01-15   │ 2009-01-29     │ 2009-01-31    │ Entregado │ El envio llego dos dias más tarde debido al mal tiempo │ 36             │
-- │ 119           │ 2009-01-10   │ 2009-01-15     │ 2009-01-15    │ Entregado │ El pedido llego perfectamente                          │ 16             │
-- │ 121           │ 2008-12-28   │ 2009-01-08     │ 2009-01-08    │ Entregado │ Pago pendiente                                         │ 16             │
-- └───────────────┴──────────────┴────────────────┴───────────────┴───────────┴────────────────────────────────────────────────────────┴────────────────┘

-- 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

sqlite> select * from pago where forma_pago in ("PayPal") and fecha_pago regexp "2008" order by total desc; 

-- ┌────────────────┬────────────┬────────────────┬────────────┬─────────┐
-- │ codigo_cliente │ forma_pago │ id_transaccion │ fecha_pago │  total  │
-- ├────────────────┼────────────┼────────────────┼────────────┼─────────┤
-- │ 26             │ PayPal     │ ak-std-000020  │ 2008-03-18 │ 18846.0 │
-- │ 14             │ PayPal     │ ak-std-000015  │ 2008-07-15 │ 4160.0  │
-- │ 13             │ PayPal     │ ak-std-000014  │ 2008-08-04 │ 2246.0  │
-- │ 1              │ PayPal     │ ak-std-000001  │ 2008-11-10 │ 2000.0  │
-- │ 1              │ PayPal     │ ak-std-000002  │ 2008-12-10 │ 2000.0  │
-- └────────────────┴────────────┴────────────────┴────────────┴─────────┘

-- 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

sqlite> select distinct forma_pago from pago;

-- ┌───────────────┐
-- │  forma_pago   │
-- ├───────────────┤
-- │ PayPal        │
-- │ Transferencia │
-- │ Cheque        │
-- └───────────────┘

-- 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

sqlite> select * from producto where gama in ("Ornamentales") and cantidad_en_stock > 100 order by precio_venta desc;

-- ┌─────────────────┬──────────────────────────────────────────────┬──────────────┬─────────────┬──────────────────┬───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┬───────────────────┬──────────────┬──────────────────┐
-- │ codigo_producto │                    nombre                    │     gama     │ dimensiones │    proveedor     │                                                                                                                                                                                descripcion                                                                                                                                                                                │ cantidad_en_stock │ precio_venta │ precio_proveedor │
-- ├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
-- │ OR-115          │ Forsytia Intermedia \"Lynwood\"              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 7.0          │ 5.0              │
-- │ OR-116          │ Hibiscus Syriacus  \"Diana\" -Blanco Puro    │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. │ 120               │ 7.0          │ 5.0              │
-- │ OR-117          │ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. │ 120               │ 7.0          │ 5.0              │
-- │ OR-118          │ Hibiscus Syriacus \"Pink Giant\" Rosa        │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. │ 120               │ 7.0          │ 5.0              │
-- │ OR-112          │ Escallonia (Mix)                             │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- │ OR-113          │ Evonimus Emerald Gayeti                      │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- │ OR-114          │ Evonimus Pulchellus                          │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- │ OR-119          │ Laurus Nobilis Arbusto - Ramificado Bajo     │ Ornamentales │ 40-50       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- │ OR-120          │ Lonicera Nitida                              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- │ OR-121          │ Lonicera Nitida \"Maigrum\"                  │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- │ OR-122          │ Lonicera Pileata                             │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- │ OR-123          │ Philadelphus \"Virginal\"                    │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- │ OR-124          │ Prunus pisardii                              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- │ OR-125          │ Viburnum Tinus \"Eve Price\"                 │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- │ OR-126          │ Weigelia \"Bristol Ruby\"                    │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5.0          │ 4.0              │
-- └─────────────────┴──────────────────────────────────────────────┴──────────────┴─────────────┴──────────────────┴───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┴───────────────────┴──────────────┴──────────────────┘

-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

sqlite> select * from cliente where ciudad in ("Madrid") and codigo_empleado_rep_ventas in ("11","30");

-- ┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬───────────┬───────────┬───────────────────┬──────────────────┬────────┬────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
-- │ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │ telefono  │    fax    │ linea_direccion1  │ linea_direccion2 │ ciudad │ region │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
-- ├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼───────────┼───────────┼───────────────────┼──────────────────┼────────┼────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
-- │ 7              │ Beragua                     │ Jose            │ Bermejo           │ 654987321 │ 916549872 │ C/pintor segundo  │ Getafe           │ Madrid │ Madrid │ Spain │ 28942         │ 11                         │ 20000.0        │
-- │ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810  │ 919535678 │ C/sinesio delgado │ Madrid           │ Madrid │ Madrid │ Spain │ 28930         │ 11                         │ 40000.0        │
-- │ 9              │ Naturagua                   │ Guillermo       │ Rengifo           │ 689234750 │ 916428956 │ C/majadahonda     │ Boadilla         │ Madrid │ Madrid │ Spain │ 28947         │ 11                         │ 32000.0        │
-- │ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001 │ 916421756 │ C/azores          │ Fuenlabrada      │ Madrid │ Madrid │ Spain │ 28946         │ 11                         │ 50000.0        │
-- │ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045 │ 916689215 │ C/Lagañas         │ Fuenlabrada      │ Madrid │ Madrid │ Spain │ 28943         │ 11                         │ 20000.0        │
-- │ 15             │ Jardin de Flores            │ Javier          │ Villar            │ 654865643 │ 914538776 │ C/ Oña 34         │                  │ Madrid │ Madrid │ Spain │ 28950         │ 30                         │ 40000.0        │
-- │ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529 │ 916548735 │ Plaza Magallón 15 │                  │ Madrid │ Madrid │ Spain │ 28011         │ 30                         │ 5050.0         │
-- └────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴───────────┴───────────┴───────────────────┴──────────────────┴────────┴────────┴───────┴───────────────┴────────────────────────────┴────────────────┘

-- ## Consultas multitabla (JOIN´s).

-- 17. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.


-- 18. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
-- 19. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
-- 20. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
-- 21. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
-- 22. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
-- 23. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
-- 24. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
-- 25. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
-- 26. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
-- 27. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

-- ## Consultas multitabla (LEFT JOIN, RIGHT JOIN)

-- 28. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
-- 29. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
-- 30. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
-- 31. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
-- 32. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
-- 33. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
-- 34. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
-- 35. Devuelve un listado de los productos que nunca han aparecido en un pedido.
-- 36. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.
-- 37. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
-- 38. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
-- 39. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

-- ## Consultas resumen
-- 40. ¿Cuántos empleados hay en la compañía?
-- 41. ¿Cuántos clientes tiene cada país?
-- 42. ¿Cuál fue el pago medio en 2009?
-- 43. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
-- 44. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
-- 45. Calcula el número de clientes que tiene la empresa.
-- 46. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
-- 47. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
-- 48. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
-- 49. Calcula el número de clientes que no tiene asignado representante de ventas.
-- 50. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
-- 51. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
-- 52. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
-- 53. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
-- 54. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
-- 55. La misma información que en la pregunta anterior, pero agrupada por código de producto.
-- 56. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
-- 57. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
-- 58. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

-- ## Subconsultas
-- ### Con operadores básicos de comparación
-- 59. Devuelve el nombre del cliente con mayor límite de crédito.
-- 60. Devuelve el nombre del producto que tenga el precio de venta más caro.
-- 61. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
-- 62. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
-- 63. Devuelve el producto que más unidades tiene en stock.
-- 64. Devuelve el producto que menos unidades tiene en stock.
-- 65. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.

-- ### Subconsultas con IN y NOT IN
-- 66. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
-- 67. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
-- 68. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
-- 69. Devuelve un listado de los productos que nunca han aparecido en un pedido.
-- 70. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
-- 71. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
-- 72. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

-- ## Subconsultas con EXISTS y NOT EXISTS
-- 73. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

sqlite> select nombre_cliente from cliente where  not exists (select * from pedido where pedido.codigo_cliente=cliente.codigo_cliente);

-- ┌─────────────────────────────┐
-- │       nombre_cliente        │
-- ├─────────────────────────────┤
-- │ Lasas S.A.                  │
-- │ Club Golf Puerta del hierro │
-- │ DaraDistribuciones          │
-- │ Madrileña de riegos         │
-- │ Lasas S.A.                  │
-- │ Flowers, S.A                │
-- │ Naturajardin                │
-- │ Americh Golf Management SL  │
-- │ Aloha                       │
-- │ El Prat                     │
-- │ Vivero Humanes              │
-- │ Fuenla City                 │
-- │ Top Campo                   │
-- │ Campohermoso                │
-- │ france telecom              │
-- │ Musée du Louvre             │
-- │ The Magic Garden            │
-- └─────────────────────────────┘

-- 74. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
-- 75. Devuelve un listado de los productos que nunca han aparecido en un pedido.
-- 76. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

-- ## Subconsultas correlacionadas

-- 77. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
-- 78. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
-- 79. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
-- 80. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
-- 81. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
-- 82. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
-- 83. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
