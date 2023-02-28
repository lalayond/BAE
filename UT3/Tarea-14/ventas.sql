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

-- ┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬──────────────────────────────────────────────────────────────────────────┬────────────────┐
-- │ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                               comentarios                                │ codigo_cliente │
-- ├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────────────────┼────────────────┤
-- │ 14            │ 2009-01-02   │ 2009-01-02     │               │ Rechazado │ mal pago                                                                 │ 7              │
-- │ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                                 │ 9              │
-- │ 23            │ 2008-12-30   │ 2009-01-10     │               │ Rechazado │ El pedido fue anulado por el cliente                                     │ 5              │
-- │ 25            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada                         │ 1              │
-- │ 26            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto                 │ 3              │
-- │ 35            │ 2008-03-10   │ 2009-03-20     │               │ Rechazado │ Limite de credito superado                                               │ 4              │
-- │ 40            │ 2009-03-09   │ 2009-03-10     │ 2009-03-13    │ Rechazado │                                                                          │ 19             │
-- │ 46            │ 2009-04-03   │ 2009-03-04     │ 2009-03-05    │ Rechazado │                                                                          │ 23             │
-- │ 56            │ 2008-12-19   │ 2009-01-20     │               │ Rechazado │ El cliente a anulado el pedido el dia 2009-01-10                         │ 13             │
-- │ 65            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada                         │ 1              │
-- │ 66            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto                 │ 3              │
-- │ 74            │ 2009-01-14   │ 2009-01-22     │               │ Rechazado │ El pedido no llego el dia que queria el cliente por fallo del transporte │ 15             │
-- │ 81            │ 2009-01-18   │ 2009-01-24     │               │ Rechazado │ Los producto estaban en mal estado                                       │ 28             │
-- │ 101           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                                   │ 16             │
-- │ 105           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad                      │ 30             │
-- │ 120           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                                   │ 16             │
-- │ 125           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad                      │ 30             │
-- └───────────────┴──────────────┴────────────────┴───────────────┴───────────┴──────────────────────────────────────────────────────────────────────────┴────────────────┘

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

sqlite> select c.nombre_cliente ,e.nombre, e.apellido1, e.apellido2 from cliente as c join empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado;

-- ┌────────────────────────────────┬─────────────────┬────────────┬───────────┐
-- │         nombre_cliente         │     nombre      │ apellido1  │ apellido2 │
-- ├────────────────────────────────┼─────────────────┼────────────┼───────────┤
-- │ GoldFish Garden                │ Walter Santiago │ Sanchez    │ Lopez     │
-- │ Gardening Associates           │ Walter Santiago │ Sanchez    │ Lopez     │
-- │ Gerudo Valley                  │ Lorena          │ Paxton     │           │
-- │ Tendo Garden                   │ Lorena          │ Paxton     │           │
-- │ Lasas S.A.                     │ Mariano         │ López      │ Murcia    │
-- │ Beragua                        │ Emmanuel        │ Magaña     │ Perez     │
-- │ Club Golf Puerta del hierro    │ Emmanuel        │ Magaña     │ Perez     │
-- │ Naturagua                      │ Emmanuel        │ Magaña     │ Perez     │
-- │ DaraDistribuciones             │ Emmanuel        │ Magaña     │ Perez     │
-- │ Madrileña de riegos            │ Emmanuel        │ Magaña     │ Perez     │
-- │ Lasas S.A.                     │ Mariano         │ López      │ Murcia    │
-- │ Camunas Jardines S.L.          │ Mariano         │ López      │ Murcia    │
-- │ Dardena S.A.                   │ Mariano         │ López      │ Murcia    │
-- │ Jardin de Flores               │ Julian          │ Bellinelli │           │
-- │ Flores Marivi                  │ Felipe          │ Rosas      │ Marquez   │
-- │ Flowers, S.A                   │ Felipe          │ Rosas      │ Marquez   │
-- │ Naturajardin                   │ Julian          │ Bellinelli │           │
-- │ Golf S.A.                      │ José Manuel     │ Martinez   │ De la Osa │
-- │ Americh Golf Management SL     │ José Manuel     │ Martinez   │ De la Osa │
-- │ Aloha                          │ José Manuel     │ Martinez   │ De la Osa │
-- │ El Prat                        │ José Manuel     │ Martinez   │ De la Osa │
-- │ Sotogrande                     │ José Manuel     │ Martinez   │ De la Osa │
-- │ Vivero Humanes                 │ Julian          │ Bellinelli │           │
-- │ Fuenla City                    │ Felipe          │ Rosas      │ Marquez   │
-- │ Jardines y Mansiones Cactus SL │ Lucio           │ Campoamor  │ Martín    │
-- │ Jardinerías Matías SL          │ Lucio           │ Campoamor  │ Martín    │
-- │ Agrojardin                     │ Julian          │ Bellinelli │           │
-- │ Top Campo                      │ Felipe          │ Rosas      │ Marquez   │
-- │ Jardineria Sara                │ Felipe          │ Rosas      │ Marquez   │
-- │ Campohermoso                   │ Julian          │ Bellinelli │           │
-- │ france telecom                 │ Lionel          │ Narvaez    │           │
-- │ Musée du Louvre                │ Lionel          │ Narvaez    │           │
-- │ Tutifruti S.A                  │ Mariko          │ Kishi      │           │
-- │ Flores S.L.                    │ Michael         │ Bolton     │           │
-- │ The Magic Garden               │ Michael         │ Bolton     │           │
-- │ El Jardin Viviente S.L         │ Mariko          │ Kishi      │           │
-- └────────────────────────────────┴─────────────────┴────────────┴───────────┘

-- 18. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

sqlite> select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2 from cliente as c join empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado join pago as p on c.codigo_cliente=p.codigo_cliente group by c.codigo_cliente;

-- ┌────────────────────────────────┬─────────────────┬────────────┬───────────┐
-- │         nombre_cliente         │     nombre      │ apellido1  │ apellido2 │
-- ├────────────────────────────────┼─────────────────┼────────────┼───────────┤
-- │ GoldFish Garden                │ Walter Santiago │ Sanchez    │ Lopez     │
-- │ Gardening Associates           │ Walter Santiago │ Sanchez    │ Lopez     │
-- │ Gerudo Valley                  │ Lorena          │ Paxton     │           │
-- │ Tendo Garden                   │ Lorena          │ Paxton     │           │
-- │ Beragua                        │ Emmanuel        │ Magaña     │ Perez     │
-- │ Naturagua                      │ Emmanuel        │ Magaña     │ Perez     │
-- │ Camunas Jardines S.L.          │ Mariano         │ López      │ Murcia    │
-- │ Dardena S.A.                   │ Mariano         │ López      │ Murcia    │
-- │ Jardin de Flores               │ Julian          │ Bellinelli │           │
-- │ Flores Marivi                  │ Felipe          │ Rosas      │ Marquez   │
-- │ Golf S.A.                      │ José Manuel     │ Martinez   │ De la Osa │
-- │ Sotogrande                     │ José Manuel     │ Martinez   │ De la Osa │
-- │ Jardines y Mansiones Cactus SL │ Lucio           │ Campoamor  │ Martín    │
-- │ Jardinerías Matías SL          │ Lucio           │ Campoamor  │ Martín    │
-- │ Agrojardin                     │ Julian          │ Bellinelli │           │
-- │ Jardineria Sara                │ Felipe          │ Rosas      │ Marquez   │
-- │ Tutifruti S.A                  │ Mariko          │ Kishi      │           │
-- │ El Jardin Viviente S.L         │ Mariko          │ Kishi      │           │
-- └────────────────────────────────┴─────────────────┴────────────┴───────────┘

-- 19. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

sqlite> select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2 from cliente as c join empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado where c.codigo_cliente not in (select codigo_cliente from pago);                
-- ┌─────────────────────────────┬─────────────┬────────────┬───────────┐
-- │       nombre_cliente        │   nombre    │ apellido1  │ apellido2 │
-- ├─────────────────────────────┼─────────────┼────────────┼───────────┤
-- │ Lasas S.A.                  │ Mariano     │ López      │ Murcia    │
-- │ Club Golf Puerta del hierro │ Emmanuel    │ Magaña     │ Perez     │
-- │ DaraDistribuciones          │ Emmanuel    │ Magaña     │ Perez     │
-- │ Madrileña de riegos         │ Emmanuel    │ Magaña     │ Perez     │
-- │ Lasas S.A.                  │ Mariano     │ López      │ Murcia    │
-- │ Flowers, S.A                │ Felipe      │ Rosas      │ Marquez   │
-- │ Naturajardin                │ Julian      │ Bellinelli │           │
-- │ Americh Golf Management SL  │ José Manuel │ Martinez   │ De la Osa │
-- │ Aloha                       │ José Manuel │ Martinez   │ De la Osa │
-- │ El Prat                     │ José Manuel │ Martinez   │ De la Osa │
-- │ Vivero Humanes              │ Julian      │ Bellinelli │           │
-- │ Fuenla City                 │ Felipe      │ Rosas      │ Marquez   │
-- │ Top Campo                   │ Felipe      │ Rosas      │ Marquez   │
-- │ Campohermoso                │ Julian      │ Bellinelli │           │
-- │ france telecom              │ Lionel      │ Narvaez    │           │
-- │ Musée du Louvre             │ Lionel      │ Narvaez    │           │
-- │ Flores S.L.                 │ Michael     │ Bolton     │           │
-- │ The Magic Garden            │ Michael     │ Bolton     │           │
-- └─────────────────────────────┴─────────────┴────────────┴───────────┘

-- 20. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

sqlite> select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad from cliente as c join empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado join oficina as o on o.codigo_oficina=e.codigo_oficina; 

-- ┌────────────────────────────────┬─────────────────┬────────────┬───────────┬──────────────────────┐
-- │         nombre_cliente         │     nombre      │ apellido1  │ apellido2 │        ciudad        │
-- ├────────────────────────────────┼─────────────────┼────────────┼───────────┼──────────────────────┤
-- │ GoldFish Garden                │ Walter Santiago │ Sanchez    │ Lopez     │ San Francisco        │
-- │ Gardening Associates           │ Walter Santiago │ Sanchez    │ Lopez     │ San Francisco        │
-- │ Gerudo Valley                  │ Lorena          │ Paxton     │           │ Boston               │
-- │ Tendo Garden                   │ Lorena          │ Paxton     │           │ Boston               │
-- │ Lasas S.A.                     │ Mariano         │ López      │ Murcia    │ Madrid               │
-- │ Beragua                        │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
-- │ Club Golf Puerta del hierro    │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
-- │ Naturagua                      │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
-- │ DaraDistribuciones             │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
-- │ Madrileña de riegos            │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
-- │ Lasas S.A.                     │ Mariano         │ López      │ Murcia    │ Madrid               │
-- │ Camunas Jardines S.L.          │ Mariano         │ López      │ Murcia    │ Madrid               │
-- │ Dardena S.A.                   │ Mariano         │ López      │ Murcia    │ Madrid               │
-- │ Jardin de Flores               │ Julian          │ Bellinelli │           │ Sydney               │
-- │ Flores Marivi                  │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Flowers, S.A                   │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Naturajardin                   │ Julian          │ Bellinelli │           │ Sydney               │
-- │ Golf S.A.                      │ José Manuel     │ Martinez   │ De la Osa │ Barcelona            │
-- │ Americh Golf Management SL     │ José Manuel     │ Martinez   │ De la Osa │ Barcelona            │
-- │ Aloha                          │ José Manuel     │ Martinez   │ De la Osa │ Barcelona            │
-- │ El Prat                        │ José Manuel     │ Martinez   │ De la Osa │ Barcelona            │
-- │ Sotogrande                     │ José Manuel     │ Martinez   │ De la Osa │ Barcelona            │
-- │ Vivero Humanes                 │ Julian          │ Bellinelli │           │ Sydney               │
-- │ Fuenla City                    │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Jardines y Mansiones Cactus SL │ Lucio           │ Campoamor  │ Martín    │ Madrid               │
-- │ Jardinerías Matías SL          │ Lucio           │ Campoamor  │ Martín    │ Madrid               │
-- │ Agrojardin                     │ Julian          │ Bellinelli │           │ Sydney               │
-- │ Top Campo                      │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Jardineria Sara                │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Campohermoso                   │ Julian          │ Bellinelli │           │ Sydney               │
-- │ france telecom                 │ Lionel          │ Narvaez    │           │ Paris                │
-- │ Musée du Louvre                │ Lionel          │ Narvaez    │           │ Paris                │
-- │ Tutifruti S.A                  │ Mariko          │ Kishi      │           │ Sydney               │
-- │ Flores S.L.                    │ Michael         │ Bolton     │           │ San Francisco        │
-- │ The Magic Garden               │ Michael         │ Bolton     │           │ San Francisco        │
-- │ El Jardin Viviente S.L         │ Mariko          │ Kishi      │           │ Sydney               │
-- └────────────────────────────────┴─────────────────┴────────────┴───────────┴──────────────────────┘

-- 21. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

sqlite> select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad from cliente as c join empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado join oficina as o on o.codigo_oficina=e.codigo_oficina where c.codigo_cliente not in (select 
codigo_cliente from pago);
-- ┌─────────────────────────────┬─────────────┬────────────┬───────────┬──────────────────────┐
-- │       nombre_cliente        │   nombre    │ apellido1  │ apellido2 │        ciudad        │
-- ├─────────────────────────────┼─────────────┼────────────┼───────────┼──────────────────────┤
-- │ Lasas S.A.                  │ Mariano     │ López      │ Murcia    │ Madrid               │
-- │ Club Golf Puerta del hierro │ Emmanuel    │ Magaña     │ Perez     │ Barcelona            │
-- │ DaraDistribuciones          │ Emmanuel    │ Magaña     │ Perez     │ Barcelona            │
-- │ Madrileña de riegos         │ Emmanuel    │ Magaña     │ Perez     │ Barcelona            │
-- │ Lasas S.A.                  │ Mariano     │ López      │ Murcia    │ Madrid               │
-- │ Flowers, S.A                │ Felipe      │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Naturajardin                │ Julian      │ Bellinelli │           │ Sydney               │
-- │ Americh Golf Management SL  │ José Manuel │ Martinez   │ De la Osa │ Barcelona            │
-- │ Aloha                       │ José Manuel │ Martinez   │ De la Osa │ Barcelona            │
-- │ El Prat                     │ José Manuel │ Martinez   │ De la Osa │ Barcelona            │
-- │ Vivero Humanes              │ Julian      │ Bellinelli │           │ Sydney               │
-- │ Fuenla City                 │ Felipe      │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Top Campo                   │ Felipe      │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Campohermoso                │ Julian      │ Bellinelli │           │ Sydney               │
-- │ france telecom              │ Lionel      │ Narvaez    │           │ Paris                │
-- │ Musée du Louvre             │ Lionel      │ Narvaez    │           │ Paris                │
-- │ Flores S.L.                 │ Michael     │ Bolton     │           │ San Francisco        │
-- │ The Magic Garden            │ Michael     │ Bolton     │           │ San Francisco        │
-- └─────────────────────────────┴─────────────┴────────────┴───────────┴──────────────────────┘

-- 22. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

sqlite> select o.linea_direccion1, o.linea_direccion2 from oficina as o join empleado as e on o.codigo_oficina=e.codigo_oficina join cliente as c on c.codigo_empleado_rep_ventas=e.codigo_empleado where c.ciudad in ("Fuenlabrada") group by o.codigo_oficina;

-- ┌──────────────────────────────┬────────────────────┐
-- │       linea_direccion1       │  linea_direccion2  │
-- ├──────────────────────────────┼────────────────────┤
-- │ Bulevar Indalecio Prieto, 32 │                    │
-- │ 5-11 Wentworth Avenue        │ Floor #2           │
-- │ Francisco Aguirre, 32        │ 5º piso (exterior) │
-- └──────────────────────────────┴────────────────────┘

-- 23. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

sqlite> select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad from cliente as c join empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado join oficina as o on o.codigo_oficina=e.codigo_oficina;

-- ┌────────────────────────────────┬─────────────────┬────────────┬───────────┬──────────────────────┐
-- │         nombre_cliente         │     nombre      │ apellido1  │ apellido2 │        ciudad        │
-- ├────────────────────────────────┼─────────────────┼────────────┼───────────┼──────────────────────┤
-- │ GoldFish Garden                │ Walter Santiago │ Sanchez    │ Lopez     │ San Francisco        │
-- │ Gardening Associates           │ Walter Santiago │ Sanchez    │ Lopez     │ San Francisco        │
-- │ Gerudo Valley                  │ Lorena          │ Paxton     │           │ Boston               │
-- │ Tendo Garden                   │ Lorena          │ Paxton     │           │ Boston               │
-- │ Lasas S.A.                     │ Mariano         │ López      │ Murcia    │ Madrid               │
-- │ Beragua                        │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
-- │ Club Golf Puerta del hierro    │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
-- │ Naturagua                      │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
-- │ DaraDistribuciones             │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
-- │ Madrileña de riegos            │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
-- │ Lasas S.A.                     │ Mariano         │ López      │ Murcia    │ Madrid               │
-- │ Camunas Jardines S.L.          │ Mariano         │ López      │ Murcia    │ Madrid               │
-- │ Dardena S.A.                   │ Mariano         │ López      │ Murcia    │ Madrid               │
-- │ Jardin de Flores               │ Julian          │ Bellinelli │           │ Sydney               │
-- │ Flores Marivi                  │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Flowers, S.A                   │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Naturajardin                   │ Julian          │ Bellinelli │           │ Sydney               │
-- │ Golf S.A.                      │ José Manuel     │ Martinez   │ De la Osa │ Barcelona            │
-- │ Americh Golf Management SL     │ José Manuel     │ Martinez   │ De la Osa │ Barcelona            │
-- │ Aloha                          │ José Manuel     │ Martinez   │ De la Osa │ Barcelona            │
-- │ El Prat                        │ José Manuel     │ Martinez   │ De la Osa │ Barcelona            │
-- │ Sotogrande                     │ José Manuel     │ Martinez   │ De la Osa │ Barcelona            │
-- │ Vivero Humanes                 │ Julian          │ Bellinelli │           │ Sydney               │
-- │ Fuenla City                    │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Jardines y Mansiones Cactus SL │ Lucio           │ Campoamor  │ Martín    │ Madrid               │
-- │ Jardinerías Matías SL          │ Lucio           │ Campoamor  │ Martín    │ Madrid               │
-- │ Agrojardin                     │ Julian          │ Bellinelli │           │ Sydney               │
-- │ Top Campo                      │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Jardineria Sara                │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
-- │ Campohermoso                   │ Julian          │ Bellinelli │           │ Sydney               │
-- │ france telecom                 │ Lionel          │ Narvaez    │           │ Paris                │
-- │ Musée du Louvre                │ Lionel          │ Narvaez    │           │ Paris                │
-- │ Tutifruti S.A                  │ Mariko          │ Kishi      │           │ Sydney               │
-- │ Flores S.L.                    │ Michael         │ Bolton     │           │ San Francisco        │
-- │ The Magic Garden               │ Michael         │ Bolton     │           │ San Francisco        │
-- │ El Jardin Viviente S.L         │ Mariko          │ Kishi      │           │ Sydney               │
-- └────────────────────────────────┴─────────────────┴────────────┴───────────┴──────────────────────┘

-- 24. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

sqlite> select e.nombre as nombre_empleado, e.apellido1 as apellido1_empleado, e.apellido2 as apellido2_empleado, j.nombre as nombre_jefe, j.apellido1 as apellido1_jefe, j.apellido2 as apellido2_jefe from empleado as e join empleado as j on e.codigo_jefe=j.codigo_empleado;

-- ┌─────────────────┬────────────────────┬────────────────────┬─────────────┬────────────────┬────────────────┐
-- │ nombre_empleado │ apellido1_empleado │ apellido2_empleado │ nombre_jefe │ apellido1_jefe │ apellido2_jefe │
-- ├─────────────────┼────────────────────┼────────────────────┼─────────────┼────────────────┼────────────────┤
-- │ Ruben           │ López              │ Martinez           │ Marcos      │ Magaña         │ Perez          │
-- │ Alberto         │ Soria              │ Carrasco           │ Ruben       │ López          │ Martinez       │
-- │ Maria           │ Solís              │ Jerez              │ Ruben       │ López          │ Martinez       │
-- │ Felipe          │ Rosas              │ Marquez            │ Alberto     │ Soria          │ Carrasco       │
-- │ Juan Carlos     │ Ortiz              │ Serrano            │ Alberto     │ Soria          │ Carrasco       │
-- │ Carlos          │ Soria              │ Jimenez            │ Alberto     │ Soria          │ Carrasco       │
-- │ Mariano         │ López              │ Murcia             │ Carlos      │ Soria          │ Jimenez        │
-- │ Lucio           │ Campoamor          │ Martín             │ Carlos      │ Soria          │ Jimenez        │
-- │ Hilario         │ Rodriguez          │ Huertas            │ Carlos      │ Soria          │ Jimenez        │
-- │ Emmanuel        │ Magaña             │ Perez              │ Alberto     │ Soria          │ Carrasco       │
-- │ José Manuel     │ Martinez           │ De la Osa          │ Emmanuel    │ Magaña         │ Perez          │
-- │ David           │ Palma              │ Aceituno           │ Emmanuel    │ Magaña         │ Perez          │
-- │ Oscar           │ Palma              │ Aceituno           │ Emmanuel    │ Magaña         │ Perez          │
-- │ Francois        │ Fignon             │                    │ Alberto     │ Soria          │ Carrasco       │
-- │ Lionel          │ Narvaez            │                    │ Francois    │ Fignon         │                │
-- │ Laurent         │ Serra              │                    │ Francois    │ Fignon         │                │
-- │ Michael         │ Bolton             │                    │ Alberto     │ Soria          │ Carrasco       │
-- │ Walter Santiago │ Sanchez            │ Lopez              │ Michael     │ Bolton         │                │
-- │ Hilary          │ Washington         │                    │ Alberto     │ Soria          │ Carrasco       │
-- │ Marcus          │ Paxton             │                    │ Hilary      │ Washington     │                │
-- │ Lorena          │ Paxton             │                    │ Hilary      │ Washington     │                │
-- │ Nei             │ Nishikori          │                    │ Alberto     │ Soria          │ Carrasco       │
-- │ Narumi          │ Riko               │                    │ Nei         │ Nishikori      │                │
-- │ Takuma          │ Nomura             │                    │ Nei         │ Nishikori      │                │
-- │ Amy             │ Johnson            │                    │ Alberto     │ Soria          │ Carrasco       │
-- │ Larry           │ Westfalls          │                    │ Amy         │ Johnson        │                │
-- │ John            │ Walton             │                    │ Amy         │ Johnson        │                │
-- │ Kevin           │ Fallmer            │                    │ Alberto     │ Soria          │ Carrasco       │
-- │ Julian          │ Bellinelli         │                    │ Kevin       │ Fallmer        │                │
-- │ Mariko          │ Kishi              │                    │ Kevin       │ Fallmer        │                │
-- └─────────────────┴────────────────────┴────────────────────┴─────────────┴────────────────┴────────────────┘

-- 25. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

sqlite> select e.nombre as nombre_empleado, e.apellido1 as apellido1_empleado, e.apellido2 as apellido2_empleado, j.nombre as nombre_jefe, j.apellido1 as apellido1_jefe, j.apellido2 as apellido2_jefe, jj.nombre as nombre_jefe_jefe, jj.apellido1 as apellido1_jefe_jefe, jj.apellido2 as apellido2_jefe_jefe  from empleado as e join empleado as j on e.codigo_jefe=j.codigo_empleado join empleado as jj on jj.codigo_empleado=j.codigo_jefe;

-- ┌─────────────────┬────────────────────┬────────────────────┬─────────────┬────────────────┬────────────────┬──────────────────┬─────────────────────┬─────────────────────┐
-- │ nombre_empleado │ apellido1_empleado │ apellido2_empleado │ nombre_jefe │ apellido1_jefe │ apellido2_jefe │ nombre_jefe_jefe │ apellido1_jefe_jefe │ apellido2_jefe_jefe │
-- ├─────────────────┼────────────────────┼────────────────────┼─────────────┼────────────────┼────────────────┼──────────────────┼─────────────────────┼─────────────────────┤
-- │ Alberto         │ Soria              │ Carrasco           │ Ruben       │ López          │ Martinez       │ Marcos           │ Magaña              │ Perez               │
-- │ Maria           │ Solís              │ Jerez              │ Ruben       │ López          │ Martinez       │ Marcos           │ Magaña              │ Perez               │
-- │ Felipe          │ Rosas              │ Marquez            │ Alberto     │ Soria          │ Carrasco       │ Ruben            │ López               │ Martinez            │
-- │ Juan Carlos     │ Ortiz              │ Serrano            │ Alberto     │ Soria          │ Carrasco       │ Ruben            │ López               │ Martinez            │
-- │ Carlos          │ Soria              │ Jimenez            │ Alberto     │ Soria          │ Carrasco       │ Ruben            │ López               │ Martinez            │
-- │ Mariano         │ López              │ Murcia             │ Carlos      │ Soria          │ Jimenez        │ Alberto          │ Soria               │ Carrasco            │
-- │ Lucio           │ Campoamor          │ Martín             │ Carlos      │ Soria          │ Jimenez        │ Alberto          │ Soria               │ Carrasco            │
-- │ Hilario         │ Rodriguez          │ Huertas            │ Carlos      │ Soria          │ Jimenez        │ Alberto          │ Soria               │ Carrasco            │
-- │ Emmanuel        │ Magaña             │ Perez              │ Alberto     │ Soria          │ Carrasco       │ Ruben            │ López               │ Martinez            │
-- │ José Manuel     │ Martinez           │ De la Osa          │ Emmanuel    │ Magaña         │ Perez          │ Alberto          │ Soria               │ Carrasco            │
-- │ David           │ Palma              │ Aceituno           │ Emmanuel    │ Magaña         │ Perez          │ Alberto          │ Soria               │ Carrasco            │
-- │ Oscar           │ Palma              │ Aceituno           │ Emmanuel    │ Magaña         │ Perez          │ Alberto          │ Soria               │ Carrasco            │
-- │ Francois        │ Fignon             │                    │ Alberto     │ Soria          │ Carrasco       │ Ruben            │ López               │ Martinez            │
-- │ Lionel          │ Narvaez            │                    │ Francois    │ Fignon         │                │ Alberto          │ Soria               │ Carrasco            │
-- │ Laurent         │ Serra              │                    │ Francois    │ Fignon         │                │ Alberto          │ Soria               │ Carrasco            │
-- │ Michael         │ Bolton             │                    │ Alberto     │ Soria          │ Carrasco       │ Ruben            │ López               │ Martinez            │
-- │ Walter Santiago │ Sanchez            │ Lopez              │ Michael     │ Bolton         │                │ Alberto          │ Soria               │ Carrasco            │
-- │ Hilary          │ Washington         │                    │ Alberto     │ Soria          │ Carrasco       │ Ruben            │ López               │ Martinez            │
-- │ Marcus          │ Paxton             │                    │ Hilary      │ Washington     │                │ Alberto          │ Soria               │ Carrasco            │
-- │ Lorena          │ Paxton             │                    │ Hilary      │ Washington     │                │ Alberto          │ Soria               │ Carrasco            │
-- │ Nei             │ Nishikori          │                    │ Alberto     │ Soria          │ Carrasco       │ Ruben            │ López               │ Martinez            │
-- │ Narumi          │ Riko               │                    │ Nei         │ Nishikori      │                │ Alberto          │ Soria               │ Carrasco            │
-- │ Takuma          │ Nomura             │                    │ Nei         │ Nishikori      │                │ Alberto          │ Soria               │ Carrasco            │
-- │ Amy             │ Johnson            │                    │ Alberto     │ Soria          │ Carrasco       │ Ruben            │ López               │ Martinez            │
-- │ Larry           │ Westfalls          │                    │ Amy         │ Johnson        │                │ Alberto          │ Soria               │ Carrasco            │
-- │ John            │ Walton             │                    │ Amy         │ Johnson        │                │ Alberto          │ Soria               │ Carrasco            │
-- │ Kevin           │ Fallmer            │                    │ Alberto     │ Soria          │ Carrasco       │ Ruben            │ López               │ Martinez            │
-- │ Julian          │ Bellinelli         │                    │ Kevin       │ Fallmer        │                │ Alberto          │ Soria               │ Carrasco            │
-- │ Mariko          │ Kishi              │                    │ Kevin       │ Fallmer        │                │ Alberto          │ Soria               │ Carrasco            │
-- └─────────────────┴────────────────────┴────────────────────┴─────────────┴────────────────┴────────────────┴──────────────────┴─────────────────────┴─────────────────────┘

-- 26. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

sqlite> select c.nombre_cliente from cliente as c join pedido as p on c.codigo_cliente=p.codigo_cliente where fecha_entrega > fecha_esperada group by c.codigo_cliente;

-- ┌────────────────────────────────┐
-- │         nombre_cliente         │
-- ├────────────────────────────────┤
-- │ GoldFish Garden                │
-- │ Gardening Associates           │
-- │ Gerudo Valley                  │
-- │ Beragua                        │
-- │ Naturagua                      │
-- │ Camunas Jardines S.L.          │
-- │ Dardena S.A.                   │
-- │ Golf S.A.                      │
-- │ Sotogrande                     │
-- │ Jardines y Mansiones Cactus SL │
-- │ Jardinerías Matías SL          │
-- │ Jardineria Sara                │
-- │ Tutifruti S.A                  │
-- │ Flores S.L.                    │
-- │ El Jardin Viviente S.L         │
-- └────────────────────────────────┘

-- 27. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

sqlite> select distinct  p.gama from producto as p join detalle_pedido as d on d.codigo_producto=p.codigo_producto join pedido as pe on pe.codigo_pedido=d.codigo_pedido join cliente as c on c.codigo_cliente=pe.codigo_cliente;                        

-- ┌──────────────┐
-- │     gama     │
-- ├──────────────┤
-- │ Frutales     │
-- │ Ornamentales │
-- │ Aromáticas   │
-- │ Herramientas │
-- └──────────────┘

-- ## Consultas multitabla (LEFT JOIN, RIGHT JOIN)

-- 28. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

sqlite> select c.nombre_cliente from cliente as c left join pago as p on c.codigo_cliente=p.codigo_cliente where p.codigo_cliente is null;

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
-- │ Flores S.L.                 │
-- │ The Magic Garden            │
-- └─────────────────────────────┘

-- 29. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

sqlite> select c.nombre_cliente from cliente as c left join pedido as p on c.codigo_cliente=p.codigo_cliente where p.codigo_cliente is null;

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

-- 30. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

sqlite> select c.nombre_cliente from cliente as c left join pago as p on c.codigo_cliente=p.codigo_cliente left join pedido as pe on c.codigo_cliente=pe.codigo_cliente where pe.codigo_cliente is null;                         
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

-- 31. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

sqlite> select e.nombre, e.apellido1, e.apellido2 from empleado as e left join oficina as o on e.codigo_oficina=o.codigo_oficina where o.codigo_oficina is null;

-- 32. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

sqlite> select e.nombre, e.apellido1, e.apellido2 from empleado as e left join cliente as c on e.codigo_empleado=c.codigo_empleado_rep_ventas where c.codigo_empleado_rep_ventas is null;
-- ┌─────────────┬────────────┬───────────┐
-- │   nombre    │ apellido1  │ apellido2 │
-- ├─────────────┼────────────┼───────────┤
-- │ Marcos      │ Magaña     │ Perez     │
-- │ Ruben       │ López      │ Martinez  │
-- │ Alberto     │ Soria      │ Carrasco  │
-- │ Maria       │ Solís      │ Jerez     │
-- │ Juan Carlos │ Ortiz      │ Serrano   │
-- │ Carlos      │ Soria      │ Jimenez   │
-- │ Hilario     │ Rodriguez  │ Huertas   │
-- │ David       │ Palma      │ Aceituno  │
-- │ Oscar       │ Palma      │ Aceituno  │
-- │ Francois    │ Fignon     │           │
-- │ Laurent     │ Serra      │           │
-- │ Hilary      │ Washington │           │
-- │ Marcus      │ Paxton     │           │
-- │ Nei         │ Nishikori  │           │
-- │ Narumi      │ Riko       │           │
-- │ Takuma      │ Nomura     │           │
-- │ Amy         │ Johnson    │           │
-- │ Larry       │ Westfalls  │           │
-- │ John        │ Walton     │           │
-- │ Kevin       │ Fallmer    │           │
-- └─────────────┴────────────┴───────────┘

-- 33. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

sqlite> select e.nombre, e.apellido1, e.apellido2, o.* from empleado as e left join cliente as c on e.codigo_empleado=c.codigo_empleado_rep_ventas join oficina as o on e.codigo_oficina=o.codigo_oficina where c.codigo_empleado_rep_ventas is null;
-- ┌─────────────┬────────────┬───────────┬────────────────┬──────────────────────┬────────────┬───────────────────┬───────────────┬─────────────────┬──────────────────────────────┬─────────────────────┐
-- │   nombre    │ apellido1  │ apellido2 │ codigo_oficina │        ciudad        │    pais    │      region       │ codigo_postal │    telefono     │       linea_direccion1       │  linea_direccion2   │
-- ├─────────────┼────────────┼───────────┼────────────────┼──────────────────────┼────────────┼───────────────────┼───────────────┼─────────────────┼──────────────────────────────┼─────────────────────┤
-- │ Marcos      │ Magaña     │ Perez     │ TAL-ES         │ Talavera de la Reina │ España     │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
-- │ Ruben       │ López      │ Martinez  │ TAL-ES         │ Talavera de la Reina │ España     │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
-- │ Alberto     │ Soria      │ Carrasco  │ TAL-ES         │ Talavera de la Reina │ España     │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
-- │ Maria       │ Solís      │ Jerez     │ TAL-ES         │ Talavera de la Reina │ España     │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
-- │ Juan Carlos │ Ortiz      │ Serrano   │ TAL-ES         │ Talavera de la Reina │ España     │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
-- │ Carlos      │ Soria      │ Jimenez   │ MAD-ES         │ Madrid               │ España     │ Madrid            │ 28032         │ +34 91 7514487  │ Bulevar Indalecio Prieto, 32 │                     │
-- │ Hilario     │ Rodriguez  │ Huertas   │ MAD-ES         │ Madrid               │ España     │ Madrid            │ 28032         │ +34 91 7514487  │ Bulevar Indalecio Prieto, 32 │                     │
-- │ David       │ Palma      │ Aceituno  │ BCN-ES         │ Barcelona            │ España     │ Barcelona         │ 08019         │ +34 93 3561182  │ Avenida Diagonal, 38         │ 3A escalera Derecha │
-- │ Oscar       │ Palma      │ Aceituno  │ BCN-ES         │ Barcelona            │ España     │ Barcelona         │ 08019         │ +34 93 3561182  │ Avenida Diagonal, 38         │ 3A escalera Derecha │
-- │ Francois    │ Fignon     │           │ PAR-FR         │ Paris                │ Francia    │ EMEA              │ 75017         │ +33 14 723 4404 │ 29 Rue Jouffroy d'abbans     │                     │
-- │ Laurent     │ Serra      │           │ PAR-FR         │ Paris                │ Francia    │ EMEA              │ 75017         │ +33 14 723 4404 │ 29 Rue Jouffroy d'abbans     │                     │
-- │ Hilary      │ Washington │           │ BOS-USA        │ Boston               │ EEUU       │ MA                │ 02108         │ +1 215 837 0825 │ 1550 Court Place             │ Suite 102           │
-- │ Marcus      │ Paxton     │           │ BOS-USA        │ Boston               │ EEUU       │ MA                │ 02108         │ +1 215 837 0825 │ 1550 Court Place             │ Suite 102           │
-- │ Nei         │ Nishikori  │           │ TOK-JP         │ Tokyo                │ Japón      │ Chiyoda-Ku        │ 102-8578      │ +81 33 224 5000 │ 4-1 Kioicho                  │                     │
-- │ Narumi      │ Riko       │           │ TOK-JP         │ Tokyo                │ Japón      │ Chiyoda-Ku        │ 102-8578      │ +81 33 224 5000 │ 4-1 Kioicho                  │                     │
-- │ Takuma      │ Nomura     │           │ TOK-JP         │ Tokyo                │ Japón      │ Chiyoda-Ku        │ 102-8578      │ +81 33 224 5000 │ 4-1 Kioicho                  │                     │
-- │ Amy         │ Johnson    │           │ LON-UK         │ Londres              │ Inglaterra │ EMEA              │ EC2N 1HN      │ +44 20 78772041 │ 52 Old Broad Street          │ Ground Floor        │
-- │ Larry       │ Westfalls  │           │ LON-UK         │ Londres              │ Inglaterra │ EMEA              │ EC2N 1HN      │ +44 20 78772041 │ 52 Old Broad Street          │ Ground Floor        │
-- │ John        │ Walton     │           │ LON-UK         │ Londres              │ Inglaterra │ EMEA              │ EC2N 1HN      │ +44 20 78772041 │ 52 Old Broad Street          │ Ground Floor        │
-- │ Kevin       │ Fallmer    │           │ SYD-AU         │ Sydney               │ Australia  │ APAC              │ NSW 2010      │ +61 2 9264 2451 │ 5-11 Wentworth Avenue        │ Floor #2            │
-- └─────────────┴────────────┴───────────┴────────────────┴──────────────────────┴────────────┴───────────────────┴───────────────┴─────────────────┴──────────────────────────────┴─────────────────────┘

-- 34. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

sqlite> select e.nombre from empleado as e left join cliente as c on e.codigo_empleado=c.codigo_empleado_rep_ventas left join oficina as o on e.codigo_oficina=o.codigo_oficina where c.codigo_cliente is null and o.codigo_oficina is null;

-- 35. Devuelve un listado de los productos que nunca han aparecido en un pedido.

sqlite> select p.codigo_producto, p.nombre from producto as p left join detalle_pedido as d on p.codigo_producto=d.codigo_producto where d.codigo_pedido is null; 
-- ┌─────────────────┬─────────────────────────────────────────────────────────────┐
-- │ codigo_producto │                           nombre                            │
-- ├─────────────────┼─────────────────────────────────────────────────────────────┤
-- │ FR-104          │ Olea-Olivos                                                 │
-- │ FR-14           │ Calamondin Mini                                             │
-- │ FR-19           │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
-- │ FR-20           │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │
-- │ FR-21           │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │
-- │ FR-24           │ Albaricoquero Corbato                                       │
-- │ FR-25           │ Albaricoquero Moniqui                                       │
-- │ FR-26           │ Albaricoquero Kurrot                                        │
-- │ FR-27           │ Cerezo Burlat                                               │
-- │ FR-28           │ Cerezo Picota                                               │
-- │ FR-30           │ Ciruelo R. Claudia Verde                                    │
-- │ FR-32           │ Ciruelo Golden Japan                                        │
-- │ FR-35           │ Ciruelo Claudia Negra                                       │
-- │ FR-38           │ Higuera Verdal                                              │
-- │ FR-39           │ Higuera Breva                                               │
-- │ FR-44           │ Melocotonero Spring Crest                                   │
-- │ FR-46           │ Melocotonero Federica                                       │
-- │ FR-49           │ Parra Uva de Mesa                                           │
-- │ FR-5            │ Mandarino -Plantón joven                                    │
-- │ FR-50           │ Peral Castell                                               │
-- │ FR-51           │ Peral Williams                                              │
-- │ FR-52           │ Peral Conference                                            │
-- │ FR-55           │ Olivo Cipresino                                             │
-- │ FR-59           │ Albaricoquero                                               │
-- │ FR-61           │ Albaricoquero                                               │
-- │ FR-62           │ Albaricoquero                                               │
-- │ FR-63           │ Cerezo                                                      │
-- │ FR-65           │ Cerezo                                                      │
-- │ FR-68           │ Cerezo                                                      │
-- │ FR-70           │ Ciruelo                                                     │
-- │ FR-73           │ Granado                                                     │
-- │ FR-74           │ Granado                                                     │
-- │ FR-76           │ Granado                                                     │
-- │ FR-83           │ Higuera                                                     │
-- │ FR-88           │ Manzano                                                     │
-- │ FR-92           │ Melocotonero                                                │
-- │ FR-93           │ Melocotonero                                                │
-- │ FR-95           │ Melocotonero                                                │
-- │ FR-96           │ Membrillero                                                 │
-- │ FR-97           │ Membrillero                                                 │
-- │ FR-98           │ Membrillero                                                 │
-- │ FR-99           │ Membrillero                                                 │
-- │ OR-001          │ Arbustos Mix Maceta                                         │
-- │ OR-100          │ Mimosa Injerto CLASICA Dealbata                             │
-- │ OR-103          │ Mimosa Semilla Bayleyana                                    │
-- │ OR-105          │ Mimosa Semilla Espectabilis                                 │
-- │ OR-106          │ Mimosa Semilla Longifolia                                   │
-- │ OR-107          │ Mimosa Semilla Floribunda 4 estaciones                      │
-- │ OR-108          │ Abelia Floribunda                                           │
-- │ OR-109          │ Callistemom (Mix)                                           │
-- │ OR-110          │ Callistemom (Mix)                                           │
-- │ OR-111          │ Corylus Avellana \"Contorta\"                               │
-- │ OR-112          │ Escallonia (Mix)                                            │
-- │ OR-113          │ Evonimus Emerald Gayeti                                     │
-- │ OR-114          │ Evonimus Pulchellus                                         │
-- │ OR-117          │ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                │
-- │ OR-118          │ Hibiscus Syriacus \"Pink Giant\" Rosa                       │
-- │ OR-121          │ Lonicera Nitida \"Maigrum\"                                 │
-- │ OR-124          │ Prunus pisardii                                             │
-- │ OR-126          │ Weigelia \"Bristol Ruby\"                                   │
-- │ OR-131          │ Leptospermum formado PIRAMIDE                               │
-- │ OR-132          │ Leptospermum COPA                                           │
-- │ OR-133          │ Nerium oleander-CALIDAD \"GARDEN\"                          │
-- │ OR-134          │ Nerium Oleander Arbusto GRANDE                              │
-- │ OR-135          │ Nerium oleander COPA  Calibre 6/8                           │
-- │ OR-137          │ ROSAL TREPADOR                                              │
-- │ OR-138          │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
-- │ OR-142          │ Solanum Jazminoide                                          │
-- │ OR-143          │ Wisteria Sinensis  azul, rosa, blanca                       │
-- │ OR-144          │ Wisteria Sinensis INJERTADAS DECÃ"                          │
-- │ OR-145          │ Bougamvillea Sanderiana Tutor                               │
-- │ OR-148          │ Bougamvillea Sanderiana Espaldera                           │
-- │ OR-149          │ Bougamvillea Sanderiana Espaldera                           │
-- │ OR-151          │ Bougamvillea Sanderiana, 3 tut. piramide                    │
-- │ OR-153          │ Expositor Árboles clima mediterráneo                        │
-- │ OR-154          │ Expositor Árboles borde del mar                             │
-- │ OR-158          │ Brachychiton Acerifolius                                    │
-- │ OR-161          │ Cassia Corimbosa                                            │
-- │ OR-162          │ Cassia Corimbosa                                            │
-- │ OR-163          │ Chitalpa Summer Bells                                       │
-- │ OR-164          │ Erytrina Kafra                                              │
-- │ OR-166          │ Eucalyptus Citriodora                                       │
-- │ OR-167          │ Eucalyptus Ficifolia                                        │
-- │ OR-169          │ Hibiscus Syriacus  Var. Injertadas 1 Tallo                  │
-- │ OR-170          │ Lagunaria Patersonii                                        │
-- │ OR-171          │ Lagunaria Patersonii                                        │
-- │ OR-173          │ Morus Alba                                                  │
-- │ OR-175          │ Platanus Acerifolia                                         │
-- │ OR-178          │ Salix Babylonica  Pendula                                   │
-- │ OR-180          │ Tamarix  Ramosissima Pink Cascade                           │
-- │ OR-182          │ Tecoma Stands                                               │
-- │ OR-183          │ Tecoma Stands                                               │
-- │ OR-184          │ Tipuana Tipu                                                │
-- │ OR-185          │ Pleioblastus distichus-Bambú enano                          │
-- │ OR-187          │ Sasa palmata                                                │
-- │ OR-189          │ Phylostachys aurea                                          │
-- │ OR-190          │ Phylostachys aurea                                          │
-- │ OR-191          │ Phylostachys Bambusa Spectabilis                            │
-- │ OR-192          │ Phylostachys biseti                                         │
-- │ OR-194          │ Pseudosasa japonica (Metake)                                │
-- │ OR-195          │ Pseudosasa japonica (Metake)                                │
-- │ OR-197          │ Cedrus Deodara \"Feeling Blue\" Novedad                     │
-- │ OR-198          │ Juniperus chinensis \"Blue Alps\"                           │
-- │ OR-199          │ Juniperus Chinensis Stricta                                 │
-- │ OR-201          │ Juniperus squamata \"Blue Star\"                            │
-- │ OR-202          │ Juniperus x media Phitzeriana verde                         │
-- │ OR-212          │ Bismarckia Nobilis                                          │
-- │ OR-215          │ Brahea Armata                                               │
-- │ OR-216          │ Brahea Edulis                                               │
-- │ OR-219          │ Butia Capitata                                              │
-- │ OR-220          │ Butia Capitata                                              │
-- │ OR-221          │ Butia Capitata                                              │
-- │ OR-223          │ Chamaerops Humilis                                          │
-- │ OR-224          │ Chamaerops Humilis                                          │
-- │ OR-228          │ Chamaerops Humilis \"Cerifera\"                             │
-- │ OR-229          │ Chrysalidocarpus Lutescens -ARECA                           │
-- │ OR-230          │ Cordyline Australis -DRACAENA                               │
-- │ OR-231          │ Cycas Revoluta                                              │
-- │ OR-232          │ Cycas Revoluta                                              │
-- │ OR-233          │ Dracaena Drago                                              │
-- │ OR-235          │ Dracaena Drago                                              │
-- │ OR-238          │ Livistonia Decipiens                                        │
-- │ OR-239          │ Livistonia Decipiens                                        │
-- │ OR-242          │ Rhaphis Excelsa                                             │
-- │ OR-244          │ Sabal Minor                                                 │
-- │ OR-245          │ Sabal Minor                                                 │
-- │ OR-246          │ Trachycarpus Fortunei                                       │
-- │ OR-248          │ Washingtonia Robusta                                        │
-- │ OR-251          │ Zamia Furfuracaea                                           │
-- └─────────────────┴─────────────────────────────────────────────────────────────┘

-- 36. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

sqlite> select p.nombre, p.descripcion from producto as p left join detalle_pedido as d on p.codigo_producto=d.codigo_producto where d.codigo_producto is null;

-- ┌─────────────────────────────────────────────────────────────┬──────────────────────────────────────────────────────────────┐
-- │                           nombre                            │                         descripcion                          │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Olea-Olivos                                                 │ Existen dos hipótesis sobre el origen del olivo, una que pos │
-- │                                                             │ tula que proviene de las costas de Siria, Líbano e Israel y  │
-- │                                                             │ otra que considera que lo considera originario de Asia menor │
-- │                                                             │ . La llegada a Europa probablemente tuvo lugar de mano de lo │
-- │                                                             │ s Fenicios, en transito por Chipre, Creta, e Islas del Mar E │
-- │                                                             │ geo, pasando a Grecia y más tarde a Italia. Los primeros ind │
-- │                                                             │ icios de la presencia del olivo en las costas mediterráneas  │
-- │                                                             │ españolas coinciden con el dominio romano, aunque fueron pos │
-- │                                                             │ teriormente los árabes los que impulsaron su cultivo en Anda │
-- │                                                             │ lucía, convirtiendo a España en el primer país productor de  │
-- │                                                             │ aceite de oliva a nivel mundial.                             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Calamondin Mini                                             │ Se trata de un pequeño arbolito de copa densa, con tendencia │
-- │                                                             │  a la verticalidad, inerme o con cortas espinas. Sus hojas s │
-- │                                                             │ on pequeñas, elípticas de 5-10 cm de longitud, con los pecío │
-- │                                                             │ los estrechamente alados.Posee 1 o 2 flores en situación axi │
-- │                                                             │ lar, al final de las ramillas.Sus frutos son muy pequeños (3 │
-- │                                                             │ -3,5 cm de diámetro), con pocas semillas, esféricos u ovales │
-- │                                                             │ , con la zona apical aplanada; corteza de color naranja-roji │
-- │                                                             │ zo, muy fina y fácilmente separable de la pulpa, que es dulc │
-- │                                                             │ e, ácida y comestible..                                      │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Albaricoquero Corbato                                       │ árbol que puede pasar de los 6 m de altura, en la región med │
-- │                                                             │ iterránea con ramas formando una copa redondeada. La corteza │
-- │                                                             │  del tronco es pardo-violácea, agrietada; las ramas son roji │
-- │                                                             │ zas y extendidas cuando jóvenes y las ramas secundarias son  │
-- │                                                             │ cortas, divergentes y escasas. Las yemas latentes son frecue │
-- │                                                             │ ntes especialmente sobre las ramas viejas.                   │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Albaricoquero Moniqui                                       │ árbol que puede pasar de los 6 m de altura, en la región med │
-- │                                                             │ iterránea con ramas formando una copa redondeada. La corteza │
-- │                                                             │  del tronco es pardo-violácea, agrietada; las ramas son roji │
-- │                                                             │ zas y extendidas cuando jóvenes y las ramas secundarias son  │
-- │                                                             │ cortas, divergentes y escasas. Las yemas latentes son frecue │
-- │                                                             │ ntes especialmente sobre las ramas viejas.                   │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Albaricoquero Kurrot                                        │ árbol que puede pasar de los 6 m de altura, en la región med │
-- │                                                             │ iterránea con ramas formando una copa redondeada. La corteza │
-- │                                                             │  del tronco es pardo-violácea, agrietada; las ramas son roji │
-- │                                                             │ zas y extendidas cuando jóvenes y las ramas secundarias son  │
-- │                                                             │ cortas, divergentes y escasas. Las yemas latentes son frecue │
-- │                                                             │ ntes especialmente sobre las ramas viejas.                   │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cerezo Burlat                                               │ Las principales especies de cerezo cultivadas en el mundo so │
-- │                                                             │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │
-- │                                                             │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │
-- │                                                             │  son naturales del sureste de Europa y oeste de Asia. El cer │
-- │                                                             │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │
-- │                                                             │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │
-- │                                                             │ evado por los pájaros y las migraciones humanas. Fue uno de  │
-- │                                                             │ los frutales más apreciados por los griegos y con el Imperio │
-- │                                                             │  Romano se extendió a regiones muy diversas. En la actualida │
-- │                                                             │ d, el cerezo se encuentra difundido por numerosas regiones y │
-- │                                                             │  países del mundo con clima templado                         │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cerezo Picota                                               │ Las principales especies de cerezo cultivadas en el mundo so │
-- │                                                             │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │
-- │                                                             │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │
-- │                                                             │  son naturales del sureste de Europa y oeste de Asia. El cer │
-- │                                                             │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │
-- │                                                             │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │
-- │                                                             │ evado por los pájaros y las migraciones humanas. Fue uno de  │
-- │                                                             │ los frutales más apreciados por los griegos y con el Imperio │
-- │                                                             │  Romano se extendió a regiones muy diversas. En la actualida │
-- │                                                             │ d, el cerezo se encuentra difundido por numerosas regiones y │
-- │                                                             │  países del mundo con clima templado                         │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Ciruelo R. Claudia Verde                                    │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │
-- │                                                             │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │
-- │                                                             │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │
-- │                                                             │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │
-- │                                                             │ osas                                                         │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Ciruelo Golden Japan                                        │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │
-- │                                                             │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │
-- │                                                             │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │
-- │                                                             │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │
-- │                                                             │ osas                                                         │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Ciruelo Claudia Negra                                       │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │
-- │                                                             │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │
-- │                                                             │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │
-- │                                                             │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │
-- │                                                             │ osas                                                         │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Higuera Verdal                                              │ La higuera (Ficus carica L.) es un árbol típico de secano en │
-- │                                                             │  los países mediterráneos. Su rusticidad y su fácil multipli │
-- │                                                             │ cación hacen de la higuera un frutal muy apropiado para el c │
-- │                                                             │ ultivo extensivo.. Siempre ha sido considerado como árbol qu │
-- │                                                             │ e no requiere cuidado alguno una vez plantado y arraigado, l │
-- │                                                             │ imitándose el hombre a recoger de él los frutos cuando madur │
-- │                                                             │ an, unos para consumo en fresco y otros para conserva. Las ú │
-- │                                                             │ nicas higueras con cuidados culturales esmerados, en muchas  │
-- │                                                             │ comarcas, son las brevales, por el interés económico de su p │
-- │                                                             │ rimera cosecha, la de brevas.                                │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Higuera Breva                                               │ La higuera (Ficus carica L.) es un árbol típico de secano en │
-- │                                                             │  los países mediterráneos. Su rusticidad y su fácil multipli │
-- │                                                             │ cación hacen de la higuera un frutal muy apropiado para el c │
-- │                                                             │ ultivo extensivo.. Siempre ha sido considerado como árbol qu │
-- │                                                             │ e no requiere cuidado alguno una vez plantado y arraigado, l │
-- │                                                             │ imitándose el hombre a recoger de él los frutos cuando madur │
-- │                                                             │ an, unos para consumo en fresco y otros para conserva. Las ú │
-- │                                                             │ nicas higueras con cuidados culturales esmerados, en muchas  │
-- │                                                             │ comarcas, son las brevales, por el interés económico de su p │
-- │                                                             │ rimera cosecha, la de brevas.                                │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Melocotonero Spring Crest                                   │ Árbol caducifolio de porte bajo con corteza lisa, de color c │
-- │                                                             │ eniciento. Sus hojas son alargadas con el margen ligeramente │
-- │                                                             │  aserrado, de color verde brillante, algo más claras por el  │
-- │                                                             │ envés. El melocotonero está muy arraigado en la cultura asiá │
-- │                                                             │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │
-- │                                                             │ id japonés, nació del interior de un enorme melocotón que fl │
-- │                                                             │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │
-- │                                                             │ onfiere longevidad al ser humano, ya que formaba parte de la │
-- │                                                             │  dieta de sus dioses inmortales.                             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Melocotonero Federica                                       │ Árbol caducifolio de porte bajo con corteza lisa, de color c │
-- │                                                             │ eniciento. Sus hojas son alargadas con el margen ligeramente │
-- │                                                             │  aserrado, de color verde brillante, algo más claras por el  │
-- │                                                             │ envés. El melocotonero está muy arraigado en la cultura asiá │
-- │                                                             │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │
-- │                                                             │ id japonés, nació del interior de un enorme melocotón que fl │
-- │                                                             │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │
-- │                                                             │ onfiere longevidad al ser humano, ya que formaba parte de la │
-- │                                                             │  dieta de sus dioses inmortales.                             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Parra Uva de Mesa                                           │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Mandarino -Plantón joven                                    │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Peral Castell                                               │ Árbol piramidal, redondeado en su juventud, luego oval, que  │
-- │                                                             │ llega hasta 20 metros de altura y por término medio vive 65  │
-- │                                                             │ años.Tronco alto, grueso, de corteza agrietada, gris, de la  │
-- │                                                             │ cual se destacan con frecuencia placas lenticulares.Las rama │
-- │                                                             │ s se insertan formando ángulo agudo con el tronco (45º), de  │
-- │                                                             │ corteza lisa, primero verde y luego gris-violácea, con numer │
-- │                                                             │ osas lenticelas.                                             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Peral Williams                                              │ Árbol piramidal, redondeado en su juventud, luego oval, que  │
-- │                                                             │ llega hasta 20 metros de altura y por término medio vive 65  │
-- │                                                             │ años.Tronco alto, grueso, de corteza agrietada, gris, de la  │
-- │                                                             │ cual se destacan con frecuencia placas lenticulares.Las rama │
-- │                                                             │ s se insertan formando ángulo agudo con el tronco (45º), de  │
-- │                                                             │ corteza lisa, primero verde y luego gris-violácea, con numer │
-- │                                                             │ osas lenticelas.                                             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Peral Conference                                            │ Árbol piramidal, redondeado en su juventud, luego oval, que  │
-- │                                                             │ llega hasta 20 metros de altura y por término medio vive 65  │
-- │                                                             │ años.Tronco alto, grueso, de corteza agrietada, gris, de la  │
-- │                                                             │ cual se destacan con frecuencia placas lenticulares.Las rama │
-- │                                                             │ s se insertan formando ángulo agudo con el tronco (45º), de  │
-- │                                                             │ corteza lisa, primero verde y luego gris-violácea, con numer │
-- │                                                             │ osas lenticelas.                                             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Olivo Cipresino                                             │ Existen dos hipótesis sobre el origen del olivo, una que pos │
-- │                                                             │ tula que proviene de las costas de Siria, Líbano e Israel y  │
-- │                                                             │ otra que considera que lo considera originario de Asia menor │
-- │                                                             │ . La llegada a Europa probablemente tuvo lugar de mano de lo │
-- │                                                             │ s Fenicios, en transito por Chipre, Creta, e Islas del Mar E │
-- │                                                             │ geo, pasando a Grecia y más tarde a Italia. Los primeros ind │
-- │                                                             │ icios de la presencia del olivo en las costas mediterráneas  │
-- │                                                             │ españolas coinciden con el dominio romano, aunque fueron pos │
-- │                                                             │ teriormente los árabes los que impulsaron su cultivo en Anda │
-- │                                                             │ lucía, convirtiendo a España en el primer país productor de  │
-- │                                                             │ aceite de oliva a nivel mundial.                             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Albaricoquero                                               │ árbol que puede pasar de los 6 m de altura, en la región med │
-- │                                                             │ iterránea con ramas formando una copa redondeada. La corteza │
-- │                                                             │  del tronco es pardo-violácea, agrietada; las ramas son roji │
-- │                                                             │ zas y extendidas cuando jóvenes y las ramas secundarias son  │
-- │                                                             │ cortas, divergentes y escasas. Las yemas latentes son frecue │
-- │                                                             │ ntes especialmente sobre las ramas viejas.                   │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Albaricoquero                                               │ árbol que puede pasar de los 6 m de altura, en la región med │
-- │                                                             │ iterránea con ramas formando una copa redondeada. La corteza │
-- │                                                             │  del tronco es pardo-violácea, agrietada; las ramas son roji │
-- │                                                             │ zas y extendidas cuando jóvenes y las ramas secundarias son  │
-- │                                                             │ cortas, divergentes y escasas. Las yemas latentes son frecue │
-- │                                                             │ ntes especialmente sobre las ramas viejas.                   │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Albaricoquero                                               │ árbol que puede pasar de los 6 m de altura, en la región med │
-- │                                                             │ iterránea con ramas formando una copa redondeada. La corteza │
-- │                                                             │  del tronco es pardo-violácea, agrietada; las ramas son roji │
-- │                                                             │ zas y extendidas cuando jóvenes y las ramas secundarias son  │
-- │                                                             │ cortas, divergentes y escasas. Las yemas latentes son frecue │
-- │                                                             │ ntes especialmente sobre las ramas viejas.                   │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cerezo                                                      │ Las principales especies de cerezo cultivadas en el mundo so │
-- │                                                             │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │
-- │                                                             │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │
-- │                                                             │  son naturales del sureste de Europa y oeste de Asia. El cer │
-- │                                                             │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │
-- │                                                             │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │
-- │                                                             │ evado por los pájaros y las migraciones humanas. Fue uno de  │
-- │                                                             │ los frutales más apreciados por los griegos y con el Imperio │
-- │                                                             │  Romano se extendió a regiones muy diversas. En la actualida │
-- │                                                             │ d, el cerezo se encuentra difundido por numerosas regiones y │
-- │                                                             │  países del mundo con clima templado                         │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cerezo                                                      │ Las principales especies de cerezo cultivadas en el mundo so │
-- │                                                             │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │
-- │                                                             │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │
-- │                                                             │  son naturales del sureste de Europa y oeste de Asia. El cer │
-- │                                                             │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │
-- │                                                             │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │
-- │                                                             │ evado por los pájaros y las migraciones humanas. Fue uno de  │
-- │                                                             │ los frutales más apreciados por los griegos y con el Imperio │
-- │                                                             │  Romano se extendió a regiones muy diversas. En la actualida │
-- │                                                             │ d, el cerezo se encuentra difundido por numerosas regiones y │
-- │                                                             │  países del mundo con clima templado                         │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cerezo                                                      │ Las principales especies de cerezo cultivadas en el mundo so │
-- │                                                             │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │
-- │                                                             │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │
-- │                                                             │  son naturales del sureste de Europa y oeste de Asia. El cer │
-- │                                                             │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │
-- │                                                             │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │
-- │                                                             │ evado por los pájaros y las migraciones humanas. Fue uno de  │
-- │                                                             │ los frutales más apreciados por los griegos y con el Imperio │
-- │                                                             │  Romano se extendió a regiones muy diversas. En la actualida │
-- │                                                             │ d, el cerezo se encuentra difundido por numerosas regiones y │
-- │                                                             │  países del mundo con clima templado                         │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Ciruelo                                                     │ árbol de tamaño mediano que alcanza una altura máxima de 5-6 │
-- │                                                             │  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie │
-- │                                                             │ tada longitudinalmente. Produce ramas alternas, pequeñas, de │
-- │                                                             │ lgadas, unas veces lisas, glabras y otras pubescentes y vell │
-- │                                                             │ osas                                                         │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Granado                                                     │ pequeño árbol caducifolio, a veces con porte arbustivo, de 3 │
-- │                                                             │  a 6 m de altura, con el tronco retorcido. Madera dura y cor │
-- │                                                             │ teza escamosa de color grisáceo. Las ramitas jóvenes son más │
-- │                                                             │  o menos cuadrangulares o angostas y de cuatro alas, posteri │
-- │                                                             │ ormente se vuelven redondas con corteza de color café grisác │
-- │                                                             │ eo, la mayoría de las ramas, pero especialmente las pequeñas │
-- │                                                             │  ramitas axilares, son en forma de espina o terminan en una  │
-- │                                                             │ espina aguda; la copa es extendida.                          │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Granado                                                     │ pequeño árbol caducifolio, a veces con porte arbustivo, de 3 │
-- │                                                             │  a 6 m de altura, con el tronco retorcido. Madera dura y cor │
-- │                                                             │ teza escamosa de color grisáceo. Las ramitas jóvenes son más │
-- │                                                             │  o menos cuadrangulares o angostas y de cuatro alas, posteri │
-- │                                                             │ ormente se vuelven redondas con corteza de color café grisác │
-- │                                                             │ eo, la mayoría de las ramas, pero especialmente las pequeñas │
-- │                                                             │  ramitas axilares, son en forma de espina o terminan en una  │
-- │                                                             │ espina aguda; la copa es extendida.                          │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Granado                                                     │ pequeño árbol caducifolio, a veces con porte arbustivo, de 3 │
-- │                                                             │  a 6 m de altura, con el tronco retorcido. Madera dura y cor │
-- │                                                             │ teza escamosa de color grisáceo. Las ramitas jóvenes son más │
-- │                                                             │  o menos cuadrangulares o angostas y de cuatro alas, posteri │
-- │                                                             │ ormente se vuelven redondas con corteza de color café grisác │
-- │                                                             │ eo, la mayoría de las ramas, pero especialmente las pequeñas │
-- │                                                             │  ramitas axilares, son en forma de espina o terminan en una  │
-- │                                                             │ espina aguda; la copa es extendida.                          │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Higuera                                                     │ La higuera (Ficus carica L.) es un árbol típico de secano en │
-- │                                                             │  los países mediterráneos. Su rusticidad y su fácil multipli │
-- │                                                             │ cación hacen de la higuera un frutal muy apropiado para el c │
-- │                                                             │ ultivo extensivo.. Siempre ha sido considerado como árbol qu │
-- │                                                             │ e no requiere cuidado alguno una vez plantado y arraigado, l │
-- │                                                             │ imitándose el hombre a recoger de él los frutos cuando madur │
-- │                                                             │ an, unos para consumo en fresco y otros para conserva. Las ú │
-- │                                                             │ nicas higueras con cuidados culturales esmerados, en muchas  │
-- │                                                             │ comarcas, son las brevales, por el interés económico de su p │
-- │                                                             │ rimera cosecha, la de brevas.                                │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Manzano                                                     │ alcanza como máximo 10 m. de altura y tiene una copa globosa │
-- │                                                             │ . Tronco derecho que normalmente alcanza de 2 a 2,5 m. de al │
-- │                                                             │ tura, con corteza cubierta de lenticelas, lisa, adherida, de │
-- │                                                             │  color ceniciento verdoso sobre los ramos y escamosa y gris  │
-- │                                                             │ parda sobre las partes viejas del árbol. Tiene una vida de u │
-- │                                                             │ nos 60-80 años. Las ramas se insertan en ángulo abierto sobr │
-- │                                                             │ e el tallo, de color verde oscuro, a veces tendiendo a negru │
-- │                                                             │ zco o violáceo. Los brotes jóvenes terminan con frecuencia e │
-- │                                                             │ n una espina                                                 │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Melocotonero                                                │ Árbol caducifolio de porte bajo con corteza lisa, de color c │
-- │                                                             │ eniciento. Sus hojas son alargadas con el margen ligeramente │
-- │                                                             │  aserrado, de color verde brillante, algo más claras por el  │
-- │                                                             │ envés. El melocotonero está muy arraigado en la cultura asiá │
-- │                                                             │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │
-- │                                                             │ id japonés, nació del interior de un enorme melocotón que fl │
-- │                                                             │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │
-- │                                                             │ onfiere longevidad al ser humano, ya que formaba parte de la │
-- │                                                             │  dieta de sus dioses inmortales.                             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Melocotonero                                                │ Árbol caducifolio de porte bajo con corteza lisa, de color c │
-- │                                                             │ eniciento. Sus hojas son alargadas con el margen ligeramente │
-- │                                                             │  aserrado, de color verde brillante, algo más claras por el  │
-- │                                                             │ envés. El melocotonero está muy arraigado en la cultura asiá │
-- │                                                             │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │
-- │                                                             │ id japonés, nació del interior de un enorme melocotón que fl │
-- │                                                             │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │
-- │                                                             │ onfiere longevidad al ser humano, ya que formaba parte de la │
-- │                                                             │  dieta de sus dioses inmortales.                             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Melocotonero                                                │ Árbol caducifolio de porte bajo con corteza lisa, de color c │
-- │                                                             │ eniciento. Sus hojas son alargadas con el margen ligeramente │
-- │                                                             │  aserrado, de color verde brillante, algo más claras por el  │
-- │                                                             │ envés. El melocotonero está muy arraigado en la cultura asiá │
-- │                                                             │ tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C │
-- │                                                             │ id japonés, nació del interior de un enorme melocotón que fl │
-- │                                                             │ otaba río abajo.\r\nEn China se piensa que comer melocotón c │
-- │                                                             │ onfiere longevidad al ser humano, ya que formaba parte de la │
-- │                                                             │  dieta de sus dioses inmortales.                             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Membrillero                                                 │ arbolito caducifolio de 4-6 m de altura con el tronco tortuo │
-- │                                                             │ so y la corteza lisa, grisácea, que se desprende en escamas  │
-- │                                                             │ con la edad. Copa irregular, con ramas inermes, flexuosas, p │
-- │                                                             │ arduzcas, punteadas. Ramillas jóvenes tomentosas             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Membrillero                                                 │ arbolito caducifolio de 4-6 m de altura con el tronco tortuo │
-- │                                                             │ so y la corteza lisa, grisácea, que se desprende en escamas  │
-- │                                                             │ con la edad. Copa irregular, con ramas inermes, flexuosas, p │
-- │                                                             │ arduzcas, punteadas. Ramillas jóvenes tomentosas             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Membrillero                                                 │ arbolito caducifolio de 4-6 m de altura con el tronco tortuo │
-- │                                                             │ so y la corteza lisa, grisácea, que se desprende en escamas  │
-- │                                                             │ con la edad. Copa irregular, con ramas inermes, flexuosas, p │
-- │                                                             │ arduzcas, punteadas. Ramillas jóvenes tomentosas             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Membrillero                                                 │ arbolito caducifolio de 4-6 m de altura con el tronco tortuo │
-- │                                                             │ so y la corteza lisa, grisácea, que se desprende en escamas  │
-- │                                                             │ con la edad. Copa irregular, con ramas inermes, flexuosas, p │
-- │                                                             │ arduzcas, punteadas. Ramillas jóvenes tomentosas             │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Arbustos Mix Maceta                                         │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Mimosa Injerto CLASICA Dealbata                             │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │
-- │                                                             │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │
-- │                                                             │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │
-- │                                                             │ a). Arbol de follaje persistente muy usado en parques por su │
-- │                                                             │  atractiva floración amarilla hacia fines del invierno. Altu │
-- │                                                             │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │
-- │                                                             │ je perenne de tonos plateados, muy ornamental. Sus hojas son │
-- │                                                             │  de textura fina, de color verde y sus flores amarillas que  │
-- │                                                             │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │
-- │                                                             │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │
-- │                                                             │ mente curvada, con los bordes algo constreñidos entre las se │
-- │                                                             │ millas, que se disponen en el fruto longitudinalmente...     │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Mimosa Semilla Bayleyana                                    │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │
-- │                                                             │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │
-- │                                                             │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │
-- │                                                             │ a). Arbol de follaje persistente muy usado en parques por su │
-- │                                                             │  atractiva floración amarilla hacia fines del invierno. Altu │
-- │                                                             │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │
-- │                                                             │ je perenne de tonos plateados, muy ornamental. Sus hojas son │
-- │                                                             │  de textura fina, de color verde y sus flores amarillas que  │
-- │                                                             │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │
-- │                                                             │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │
-- │                                                             │ mente curvada, con los bordes algo constreñidos entre las se │
-- │                                                             │ millas, que se disponen en el fruto longitudinalmente...     │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Mimosa Semilla Espectabilis                                 │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │
-- │                                                             │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │
-- │                                                             │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │
-- │                                                             │ a). Arbol de follaje persistente muy usado en parques por su │
-- │                                                             │  atractiva floración amarilla hacia fines del invierno. Altu │
-- │                                                             │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │
-- │                                                             │ je perenne de tonos plateados, muy ornamental. Sus hojas son │
-- │                                                             │  de textura fina, de color verde y sus flores amarillas que  │
-- │                                                             │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │
-- │                                                             │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │
-- │                                                             │ mente curvada, con los bordes algo constreñidos entre las se │
-- │                                                             │ millas, que se disponen en el fruto longitudinalmente...     │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Mimosa Semilla Longifolia                                   │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │
-- │                                                             │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │
-- │                                                             │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │
-- │                                                             │ a). Arbol de follaje persistente muy usado en parques por su │
-- │                                                             │  atractiva floración amarilla hacia fines del invierno. Altu │
-- │                                                             │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │
-- │                                                             │ je perenne de tonos plateados, muy ornamental. Sus hojas son │
-- │                                                             │  de textura fina, de color verde y sus flores amarillas que  │
-- │                                                             │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │
-- │                                                             │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │
-- │                                                             │ mente curvada, con los bordes algo constreñidos entre las se │
-- │                                                             │ millas, que se disponen en el fruto longitudinalmente...     │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Mimosa Semilla Floribunda 4 estaciones                      │ Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, │
-- │                                                             │  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo │
-- │                                                             │ saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori │
-- │                                                             │ a). Arbol de follaje persistente muy usado en parques por su │
-- │                                                             │  atractiva floración amarilla hacia fines del invierno. Altu │
-- │                                                             │ ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla │
-- │                                                             │ je perenne de tonos plateados, muy ornamental. Sus hojas son │
-- │                                                             │  de textura fina, de color verde y sus flores amarillas que  │
-- │                                                             │ aparecen en racimos grandes. Florece de Enero a Marzo (Hemis │
-- │                                                             │ ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera │
-- │                                                             │ mente curvada, con los bordes algo constreñidos entre las se │
-- │                                                             │ millas, que se disponen en el fruto longitudinalmente...     │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Abelia Floribunda                                           │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Callistemom (Mix)                                           │ Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y │
-- │                                                             │  colgantes (de ahí lo de \"llorón\")..                       │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Callistemom (Mix)                                           │ Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y │
-- │                                                             │  colgantes (de ahí lo de \"llorón\")..                       │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Corylus Avellana \"Contorta\"                               │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Escallonia (Mix)                                            │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Evonimus Emerald Gayeti                                     │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Evonimus Pulchellus                                         │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                │ Por su capacidad de soportar podas, pueden ser fácilmente mo │
-- │                                                             │ ldeadas como bonsái en el transcurso de pocos años. Flores d │
-- │                                                             │ e muchos colores según la variedad, desde el blanco puro al  │
-- │                                                             │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │
-- │                                                             │ a 1 día, pero continuamente aparecen nuevas y la floración s │
-- │                                                             │ e prolonga durante todo el periodo de crecimiento vegetativo │
-- │                                                             │ .                                                            │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Hibiscus Syriacus \"Pink Giant\" Rosa                       │ Por su capacidad de soportar podas, pueden ser fácilmente mo │
-- │                                                             │ ldeadas como bonsái en el transcurso de pocos años. Flores d │
-- │                                                             │ e muchos colores según la variedad, desde el blanco puro al  │
-- │                                                             │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │
-- │                                                             │ a 1 día, pero continuamente aparecen nuevas y la floración s │
-- │                                                             │ e prolonga durante todo el periodo de crecimiento vegetativo │
-- │                                                             │ .                                                            │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Lonicera Nitida \"Maigrum\"                                 │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Prunus pisardii                                             │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Weigelia \"Bristol Ruby\"                                   │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Leptospermum formado PIRAMIDE                               │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Leptospermum COPA                                           │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Nerium oleander-CALIDAD \"GARDEN\"                          │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Nerium Oleander Arbusto GRANDE                              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Nerium oleander COPA  Calibre 6/8                           │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ ROSAL TREPADOR                                              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Solanum Jazminoide                                          │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Wisteria Sinensis  azul, rosa, blanca                       │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Wisteria Sinensis INJERTADAS DECÃ"                          │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Bougamvillea Sanderiana Tutor                               │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Bougamvillea Sanderiana Espaldera                           │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Bougamvillea Sanderiana Espaldera                           │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Bougamvillea Sanderiana, 3 tut. piramide                    │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Expositor Árboles clima mediterráneo                        │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Expositor Árboles borde del mar                             │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Brachychiton Acerifolius                                    │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cassia Corimbosa                                            │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cassia Corimbosa                                            │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Chitalpa Summer Bells                                       │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Erytrina Kafra                                              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Eucalyptus Citriodora                                       │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Eucalyptus Ficifolia                                        │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Hibiscus Syriacus  Var. Injertadas 1 Tallo                  │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Lagunaria Patersonii                                        │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Lagunaria Patersonii                                        │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Morus Alba                                                  │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Platanus Acerifolia                                         │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Salix Babylonica  Pendula                                   │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Tamarix  Ramosissima Pink Cascade                           │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Tecoma Stands                                               │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Tecoma Stands                                               │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Tipuana Tipu                                                │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Pleioblastus distichus-Bambú enano                          │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Sasa palmata                                                │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Phylostachys aurea                                          │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Phylostachys aurea                                          │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Phylostachys Bambusa Spectabilis                            │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Phylostachys biseti                                         │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Pseudosasa japonica (Metake)                                │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Pseudosasa japonica (Metake)                                │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cedrus Deodara \"Feeling Blue\" Novedad                     │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Juniperus chinensis \"Blue Alps\"                           │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Juniperus Chinensis Stricta                                 │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Juniperus squamata \"Blue Star\"                            │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Juniperus x media Phitzeriana verde                         │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Bismarckia Nobilis                                          │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Brahea Armata                                               │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Brahea Edulis                                               │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Butia Capitata                                              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Butia Capitata                                              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Butia Capitata                                              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Chamaerops Humilis                                          │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Chamaerops Humilis                                          │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Chamaerops Humilis \"Cerifera\"                             │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Chrysalidocarpus Lutescens -ARECA                           │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cordyline Australis -DRACAENA                               │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cycas Revoluta                                              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Cycas Revoluta                                              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Dracaena Drago                                              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Dracaena Drago                                              │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Livistonia Decipiens                                        │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Livistonia Decipiens                                        │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Rhaphis Excelsa                                             │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Sabal Minor                                                 │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Sabal Minor                                                 │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Trachycarpus Fortunei                                       │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Washingtonia Robusta                                        │                                                              │
-- ├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Zamia Furfuracaea                                           │                                                              │
-- └─────────────────────────────────────────────────────────────┴──────────────────────────────────────────────────────────────┘

-- 37. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

sqlite> select o.codigo_oficina from oficina as o left join (select distinct e.codigo_oficina from empleado as e join cliente as c on c.codigo_empleado_rep_ventas=e.codigo_empleado where c.codigo_cliente in  (select distinct c.codigo_cliente from cliente as 
c join pedido as p on c.codigo_cliente=p.codigo_cliente join detalle_pedido as d on p.codigo_pedido=d.codigo_pedido join producto as pr on pr.codigo_producto=d.codigo_producto where gama in ("Frutales"))) as e on o.codigo_oficina=e.codigo_oficina where e.codigo_oficina is null;

-- ┌────────────────┐
-- │ codigo_oficina │
-- ├────────────────┤
-- │ LON-UK         │
-- │ PAR-FR         │
-- │ TOK-JP         │
-- └────────────────┘

-- 38. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

sqlite> select distinct c.nombre_cliente from cliente as c join pedido as p on c.codigo_cliente=p.codigo_cliente left join pago as pa on pa.codigo_cliente=c.codigo_cliente where pa.codigo_cliente is null; 

-- ┌────────────────┐
-- │ nombre_cliente │
-- ├────────────────┤
-- │ Flores S.L.    │
-- └────────────────┘

-- 39. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

sqlite> select e.nombre, e.apellido1, e.apellido1, j.nombre, j.apellido1, j.apellido2 from empleado as e join empleado as j on e.codigo_jefe=j.codigo_empleado left join cliente as c on e.codigo_empleado=c.codigo_empleado_rep_ventas where c.codigo_empleado_rep_ventas is null;

-- ┌─────────────┬────────────┬────────────┬──────────┬────────────┬───────────┐
-- │   nombre    │ apellido1  │ apellido1  │  nombre  │ apellido1  │ apellido2 │
-- ├─────────────┼────────────┼────────────┼──────────┼────────────┼───────────┤
-- │ Ruben       │ López      │ López      │ Marcos   │ Magaña     │ Perez     │
-- │ Alberto     │ Soria      │ Soria      │ Ruben    │ López      │ Martinez  │
-- │ Maria       │ Solís      │ Solís      │ Ruben    │ López      │ Martinez  │
-- │ Juan Carlos │ Ortiz      │ Ortiz      │ Alberto  │ Soria      │ Carrasco  │
-- │ Carlos      │ Soria      │ Soria      │ Alberto  │ Soria      │ Carrasco  │
-- │ Hilario     │ Rodriguez  │ Rodriguez  │ Carlos   │ Soria      │ Jimenez   │
-- │ David       │ Palma      │ Palma      │ Emmanuel │ Magaña     │ Perez     │
-- │ Oscar       │ Palma      │ Palma      │ Emmanuel │ Magaña     │ Perez     │
-- │ Francois    │ Fignon     │ Fignon     │ Alberto  │ Soria      │ Carrasco  │
-- │ Laurent     │ Serra      │ Serra      │ Francois │ Fignon     │           │
-- │ Hilary      │ Washington │ Washington │ Alberto  │ Soria      │ Carrasco  │
-- │ Marcus      │ Paxton     │ Paxton     │ Hilary   │ Washington │           │
-- │ Nei         │ Nishikori  │ Nishikori  │ Alberto  │ Soria      │ Carrasco  │
-- │ Narumi      │ Riko       │ Riko       │ Nei      │ Nishikori  │           │
-- │ Takuma      │ Nomura     │ Nomura     │ Nei      │ Nishikori  │           │
-- │ Amy         │ Johnson    │ Johnson    │ Alberto  │ Soria      │ Carrasco  │
-- │ Larry       │ Westfalls  │ Westfalls  │ Amy      │ Johnson    │           │
-- │ John        │ Walton     │ Walton     │ Amy      │ Johnson    │           │
-- │ Kevin       │ Fallmer    │ Fallmer    │ Alberto  │ Soria      │ Carrasco  │
-- └─────────────┴────────────┴────────────┴──────────┴────────────┴───────────┘

-- ## Consultas resumen
-- 40. ¿Cuántos empleados hay en la compañía?

sqlite> select count(codigo_empleado) from empleado;   
-- ┌────────────────────────┐
-- │ count(codigo_empleado) │
-- ├────────────────────────┤
-- │ 31                     │
-- └────────────────────────┘

-- 41. ¿Cuántos clientes tiene cada país?

sqlite> select pais, count(codigo_cliente) from cliente group by pais;  

-- ┌────────────────┬───────────────────────┐
-- │      pais      │ count(codigo_cliente) │
-- ├────────────────┼───────────────────────┤
-- │ Australia      │ 2                     │
-- │ France         │ 2                     │
-- │ Spain          │ 27                    │
-- │ USA            │ 4                     │
-- │ United Kingdom │ 1                     │
-- └────────────────┴───────────────────────┘

-- 42. ¿Cuál fue el pago medio en 2009?

sqlite> select avg(total) from pago where fecha_pago regexp "^2009";

-- ┌──────────────────┐
-- │    avg(total)    │
-- ├──────────────────┤
-- │ 4504.07692307692 │
-- └──────────────────┘

-- 43. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.


sqlite> select estado, count(codigo_pedido) as numero_pedidos from pedido group by estado order by numero_pedidos desc; 

-- ┌───────────┬────────────────┐
-- │  estado   │ numero_pedidos │
-- ├───────────┼────────────────┤
-- │ Entregado │ 61             │
-- │ Pendiente │ 30             │
-- │ Rechazado │ 24             │
-- └───────────┴────────────────┘

-- 44. Calcula el precio de venta del producto más caro y más barato en una misma consulta.



-- 45. Calcula el número de clientes que tiene la empresa.

sqlite> select count(codigo_cliente) from cliente;
-- ┌───────────────────────┐
-- │ count(codigo_cliente) │
-- ├───────────────────────┤
-- │ 36                    │
-- └───────────────────────┘

-- 46. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

sqlite> select count(codigo_cliente) from cliente where ciudad in ("Madrid");

-- ┌───────────────────────┐
-- │ count(codigo_cliente) │
-- ├───────────────────────┤
-- │ 11                    │
-- └───────────────────────┘

-- 47. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

sqlite> select ciudad, count(codigo_cliente) from cliente where ciudad regexp "^M" group by ciudad;

-- ┌──────────────────────┬───────────────────────┐
-- │        ciudad        │ count(codigo_cliente) │
-- ├──────────────────────┼───────────────────────┤
-- │ Madrid               │ 11                    │
-- │ Miami                │ 2                     │
-- │ Montornes del valles │ 1                     │
-- └──────────────────────┴───────────────────────┘

-- 48. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

sqlite> select e.nombre, e.apellido1, e.apellido2, count(c.codigo_cliente) from empleado as e join cliente as c on e.codigo_empleado=c.codigo_empleado_rep_ventas group by e.codigo_empleado; 

-- ┌─────────────────┬────────────┬───────────┬─────────────────────────┐
-- │     nombre      │ apellido1  │ apellido2 │ count(c.codigo_cliente) │
-- ├─────────────────┼────────────┼───────────┼─────────────────────────┤
-- │ Felipe          │ Rosas      │ Marquez   │ 5                       │
-- │ Mariano         │ López      │ Murcia    │ 4                       │
-- │ Lucio           │ Campoamor  │ Martín    │ 2                       │
-- │ Emmanuel        │ Magaña     │ Perez     │ 5                       │
-- │ José Manuel     │ Martinez   │ De la Osa │ 5                       │
-- │ Lionel          │ Narvaez    │           │ 2                       │
-- │ Michael         │ Bolton     │           │ 2                       │
-- │ Walter Santiago │ Sanchez    │ Lopez     │ 2                       │
-- │ Lorena          │ Paxton     │           │ 2                       │
-- │ Julian          │ Bellinelli │           │ 5                       │
-- │ Mariko          │ Kishi      │           │ 2                       │
-- └─────────────────┴────────────┴───────────┴─────────────────────────┘

-- 49. Calcula el número de clientes que no tiene asignado representante de ventas.

sqlite> select count(c.codigo_cliente) from cliente as c left join empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado where e.codigo_empleado is null;

-- ┌─────────────────────────┐
-- │ count(c.codigo_cliente) │
-- ├─────────────────────────┤
-- │ 0                       │
-- └─────────────────────────┘

-- 50. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

sqlite> select c.nombre_cliente, max(pa.fecha_pago), min(pa.fecha_pago) from cliente as c join pago as pa on c.codigo_cliente=pa.codigo_cliente group by c.codigo_cliente;

-- ┌────────────────────────────────┬────────────────────┬────────────────────┐
-- │         nombre_cliente         │ max(pa.fecha_pago) │ min(pa.fecha_pago) │
-- ├────────────────────────────────┼────────────────────┼────────────────────┤
-- │ GoldFish Garden                │ 2008-12-10         │ 2008-11-10         │
-- │ Gardening Associates           │ 2009-02-19         │ 2009-01-16         │
-- │ Gerudo Valley                  │ 2007-01-08         │ 2007-01-08         │
-- │ Tendo Garden                   │ 2006-01-18         │ 2006-01-18         │
-- │ Beragua                        │ 2009-01-13         │ 2009-01-13         │
-- │ Naturagua                      │ 2009-01-06         │ 2009-01-06         │
-- │ Camunas Jardines S.L.          │ 2008-08-04         │ 2008-08-04         │
-- │ Dardena S.A.                   │ 2008-07-15         │ 2008-07-15         │
-- │ Jardin de Flores               │ 2009-02-15         │ 2009-01-15         │
-- │ Flores Marivi                  │ 2009-02-16         │ 2009-02-16         │
-- │ Golf S.A.                      │ 2009-03-06         │ 2009-03-06         │
-- │ Sotogrande                     │ 2009-03-26         │ 2009-03-26         │
-- │ Jardines y Mansiones Cactus SL │ 2008-03-18         │ 2008-03-18         │
-- │ Jardinerías Matías SL          │ 2009-02-08         │ 2009-02-08         │
-- │ Agrojardin                     │ 2009-01-13         │ 2009-01-13         │
-- │ Jardineria Sara                │ 2009-01-16         │ 2009-01-16         │
-- │ Tutifruti S.A                  │ 2007-10-06         │ 2007-10-06         │
-- │ El Jardin Viviente S.L         │ 2006-05-26         │ 2006-05-26         │
-- └────────────────────────────────┴────────────────────┴────────────────────┘

-- 51. Calcula el número de productos diferentes que hay en cada uno de los pedidos.

┌───────────────┬──────────┐
│ codigo_pedido │ cantidad │
├───────────────┼──────────┤
│ 1             │ FR-67    │
│ 1             │ OR-127   │
│ 1             │ OR-141   │
│ 1             │ OR-241   │
│ 1             │ OR-99    │
│ 2             │ FR-4     │
│ 2             │ FR-40    │
│ 2             │ OR-140   │
│ 2             │ OR-141   │
│ 2             │ OR-159   │
│ 2             │ OR-227   │
│ 2             │ OR-247   │
│ 3             │ FR-48    │
│ 3             │ OR-122   │
│ 3             │ OR-123   │
│ 3             │ OR-213   │
│ 3             │ OR-217   │
│ 3             │ OR-218   │
│ 4             │ FR-31    │
│ 4             │ FR-34    │
│ 4             │ FR-40    │
│ 4             │ OR-152   │
│ 4             │ OR-155   │
│ 4             │ OR-156   │
│ 4             │ OR-157   │
│ 4             │ OR-222   │
│ 8             │ FR-106   │
│ 8             │ FR-108   │
│ 8             │ FR-11    │
│ 9             │ AR-001   │
│ 9             │ AR-008   │
│ 9             │ FR-106   │
│ 9             │ FR-69    │
│ 10            │ FR-82    │
│ 10            │ FR-91    │
│ 10            │ OR-234   │
│ 11            │ AR-006   │
│ 11            │ OR-247   │
│ 12            │ AR-009   │
│ 13            │ 11679    │
│ 13            │ 21636    │
│ 13            │ FR-11    │
│ 14            │ FR-100   │
│ 14            │ FR-13    │
│ 15            │ FR-84    │
│ 15            │ OR-101   │
│ 15            │ OR-156   │
│ 15            │ OR-203   │
│ 16            │ 30310    │
│ 16            │ FR-36    │
│ 17            │ 11679    │
│ 17            │ 22225    │
│ 17            │ FR-37    │
│ 17            │ FR-64    │
│ 17            │ OR-136   │
│ 18            │ 22225    │
│ 18            │ FR-22    │
│ 18            │ OR-159   │
│ 19            │ 30310    │
│ 19            │ FR-23    │
│ 19            │ FR-75    │
│ 19            │ FR-84    │
│ 19            │ OR-208   │
│ 20            │ 11679    │
│ 20            │ 30310    │
│ 21            │ 21636    │
│ 21            │ FR-18    │
│ 21            │ FR-53    │
│ 22            │ OR-240   │
│ 23            │ AR-002   │
│ 23            │ FR-107   │
│ 23            │ FR-85    │
│ 23            │ OR-249   │
│ 24            │ 22225    │
│ 24            │ FR-1     │
│ 24            │ FR-23    │
│ 24            │ OR-241   │
│ 25            │ FR-77    │
│ 25            │ FR-9     │
│ 25            │ FR-94    │
│ 26            │ FR-15    │
│ 26            │ OR-188   │
│ 26            │ OR-218   │
│ 27            │ OR-101   │
│ 27            │ OR-102   │
│ 27            │ OR-186   │
│ 28            │ FR-11    │
│ 28            │ OR-213   │
│ 28            │ OR-247   │
│ 29            │ FR-82    │
│ 29            │ FR-9     │
│ 29            │ FR-94    │
│ 29            │ OR-129   │
│ 29            │ OR-160   │
│ 30            │ AR-004   │
│ 30            │ FR-108   │
│ 30            │ FR-12    │
│ 30            │ FR-72    │
│ 30            │ FR-89    │
│ 30            │ OR-120   │
│ 31            │ AR-009   │
│ 31            │ FR-102   │
│ 31            │ FR-4     │
│ 32            │ 11679    │
│ 32            │ 21636    │
│ 32            │ 22225    │
│ 32            │ OR-128   │
│ 32            │ OR-193   │
│ 33            │ FR-17    │
│ 33            │ FR-29    │
│ 33            │ OR-214   │
│ 33            │ OR-247   │
│ 34            │ FR-3     │
│ 34            │ FR-7     │
│ 34            │ OR-172   │
│ 34            │ OR-174   │
│ 35            │ 21636    │
│ 35            │ FR-47    │
│ 35            │ OR-165   │
│ 35            │ OR-181   │
│ 35            │ OR-225   │
│ 36            │ 30310    │
│ 36            │ FR-1     │
│ 36            │ OR-147   │
│ 36            │ OR-203   │
│ 36            │ OR-99    │
│ 37            │ FR-105   │
│ 37            │ FR-57    │
│ 37            │ OR-176   │
│ 38            │ 11679    │
│ 38            │ 21636    │
│ 39            │ 22225    │
│ 39            │ 30310    │
│ 40            │ AR-001   │
│ 40            │ AR-002   │
│ 41            │ AR-003   │
│ 41            │ AR-004   │
│ 42            │ AR-005   │
│ 42            │ AR-006   │
│ 43            │ AR-007   │
│ 44            │ AR-008   │
│ 45            │ AR-009   │
│ 45            │ AR-010   │
│ 46            │ FR-1     │
│ 46            │ FR-10    │
│ 47            │ FR-100   │
│ 47            │ FR-101   │
│ 48            │ FR-102   │
│ 48            │ FR-103   │
│ 48            │ OR-234   │
│ 48            │ OR-236   │
│ 48            │ OR-237   │
│ 49            │ OR-204   │
│ 49            │ OR-205   │
│ 49            │ OR-206   │
│ 50            │ OR-225   │
│ 50            │ OR-226   │
│ 50            │ OR-227   │
│ 51            │ OR-209   │
│ 51            │ OR-210   │
│ 51            │ OR-211   │
│ 52            │ FR-67    │
│ 53            │ FR-2     │
│ 53            │ FR-85    │
│ 53            │ FR-86    │
│ 53            │ OR-116   │
│ 54            │ 11679    │
│ 54            │ FR-100   │
│ 54            │ FR-18    │
│ 54            │ FR-79    │
│ 54            │ OR-116   │
│ 54            │ OR-123   │
│ 54            │ OR-168   │
│ 55            │ OR-115   │
│ 55            │ OR-213   │
│ 55            │ OR-227   │
│ 55            │ OR-243   │
│ 55            │ OR-247   │
│ 56            │ OR-129   │
│ 56            │ OR-130   │
│ 56            │ OR-179   │
│ 56            │ OR-196   │
│ 56            │ OR-207   │
│ 56            │ OR-250   │
│ 57            │ FR-69    │
│ 57            │ FR-81    │
│ 57            │ FR-84    │
│ 57            │ FR-94    │
│ 58            │ OR-102   │
│ 58            │ OR-139   │
│ 58            │ OR-172   │
│ 58            │ OR-177   │
│ 59            │ FR-67    │
│ 60            │ FR-67    │
│ 61            │ FR-67    │
│ 62            │ FR-67    │
│ 63            │ FR-67    │
│ 64            │ FR-67    │
│ 65            │ FR-67    │
│ 66            │ FR-67    │
│ 67            │ FR-67    │
│ 68            │ FR-67    │
│ 74            │ FR-67    │
│ 74            │ OR-227   │
│ 74            │ OR-247   │
│ 75            │ AR-006   │
│ 75            │ FR-87    │
│ 75            │ OR-157   │
│ 76            │ AR-009   │
│ 76            │ FR-79    │
│ 76            │ FR-87    │
│ 76            │ FR-94    │
│ 76            │ OR-196   │
│ 77            │ 22225    │
│ 77            │ 30310    │
│ 78            │ FR-53    │
│ 78            │ FR-85    │
│ 78            │ OR-157   │
│ 78            │ OR-208   │
│ 79            │ OR-240   │
│ 80            │ FR-11    │
│ 80            │ FR-36    │
│ 80            │ OR-136   │
│ 81            │ OR-208   │
│ 82            │ OR-227   │
│ 83            │ OR-208   │
│ 89            │ FR-108   │
│ 89            │ FR-3     │
│ 89            │ FR-42    │
│ 89            │ FR-66    │
│ 89            │ FR-87    │
│ 89            │ OR-157   │
│ 90            │ AR-001   │
│ 90            │ AR-002   │
│ 90            │ AR-003   │
│ 91            │ FR-100   │
│ 91            │ FR-101   │
│ 91            │ FR-102   │
│ 92            │ FR-108   │
│ 92            │ FR-11    │
│ 92            │ FR-12    │
│ 93            │ FR-54    │
│ 93            │ FR-58    │
│ 93            │ FR-60    │
│ 94            │ 11679    │
│ 94            │ FR-11    │
│ 94            │ FR-4     │
│ 95            │ FR-10    │
│ 95            │ FR-75    │
│ 95            │ FR-82    │
│ 96            │ FR-43    │
│ 96            │ FR-6     │
│ 96            │ FR-71    │
│ 96            │ FR-90    │
│ 97            │ FR-41    │
│ 97            │ FR-54    │
│ 97            │ OR-156   │
│ 98            │ FR-33    │
│ 98            │ FR-56    │
│ 98            │ FR-60    │
│ 98            │ FR-8     │
│ 98            │ FR-85    │
│ 99            │ OR-157   │
│ 99            │ OR-227   │
│ 100           │ FR-87    │
│ 100           │ FR-94    │
│ 101           │ AR-006   │
│ 101           │ AR-009   │
│ 102           │ 22225    │
│ 102           │ 30310    │
│ 103           │ FR-53    │
│ 103           │ OR-208   │
│ 104           │ FR-85    │
│ 104           │ OR-157   │
│ 105           │ OR-227   │
│ 105           │ OR-240   │
│ 106           │ AR-009   │
│ 106           │ OR-136   │
│ 107           │ 30310    │
│ 107           │ FR-11    │
│ 108           │ FR-53    │
│ 108           │ OR-208   │
│ 109           │ FR-22    │
│ 109           │ FR-36    │
│ 109           │ FR-45    │
│ 109           │ OR-104   │
│ 109           │ OR-119   │
│ 109           │ OR-125   │
│ 109           │ OR-130   │
│ 110           │ AR-010   │
│ 110           │ FR-1     │
│ 110           │ FR-16    │
│ 111           │ FR-67    │
│ 112           │ FR-67    │
│ 113           │ FR-67    │
│ 114           │ FR-67    │
│ 115           │ FR-67    │
│ 116           │ 21636    │
│ 116           │ AR-001   │
│ 116           │ AR-005   │
│ 116           │ FR-33    │
│ 116           │ OR-200   │
│ 117           │ FR-78    │
│ 117           │ FR-80    │
│ 117           │ OR-146   │
│ 117           │ OR-179   │
│ 118           │ FR-67    │
│ 119           │ FR-67    │
│ 120           │ FR-67    │
│ 121           │ FR-67    │
│ 122           │ FR-67    │
│ 123           │ FR-67    │
│ 124           │ FR-67    │
│ 125           │ FR-67    │
│ 126           │ FR-67    │
│ 127           │ FR-67    │
│ 128           │ AR-004   │
│ 128           │ OR-150   │
└───────────────┴──────────┘

-- 52. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

sqlite> select p.codigo_pedido, sum(d.precio_unidad) from pedido as p join detalle_pedido as d on p.codigo_pedido=d.codigo_pedido;
┌───────────────┬──────────────────────┐
│ codigo_pedido │ sum(d.precio_unidad) │
├───────────────┼──────────────────────┤
│ 1             │ 10482.0              │
└───────────────┴──────────────────────┘
sqlite> select p.codigo_pedido, sum(d.precio_unidad) from pedido as p join detalle_pedido as d on p.codigo_pedido=d.codigo_pedido group by p.codigo_pedido;

-- ┌───────────────┬──────────────────────┐
-- │ codigo_pedido │ sum(d.precio_unidad) │
-- ├───────────────┼──────────────────────┤
-- │ 1             │ 111.0                │
-- │ 2             │ 578.0                │
-- │ 3             │ 375.0                │
-- │ 4             │ 115.0                │
-- │ 8             │ 143.0                │
-- │ 9             │ 101.0                │
-- │ 10            │ 209.0                │
-- │ 11            │ 9.0                  │
-- │ 12            │ 1.0                  │
-- │ 13            │ 128.0                │
-- │ 14            │ 68.0                 │
-- │ 15            │ 39.0                 │
-- │ 16            │ 21.0                 │
-- │ 17            │ 75.0                 │
-- │ 18            │ 22.0                 │
-- │ 19            │ 69.0                 │
-- │ 20            │ 26.0                 │
-- │ 21            │ 26.0                 │
-- │ 22            │ 6.0                  │
-- │ 23            │ 98.0                 │
-- │ 24            │ 49.0                 │
-- │ 25            │ 129.0                │
-- │ 26            │ 75.0                 │
-- │ 27            │ 18.0                 │
-- │ 28            │ 827.0                │
-- │ 29            │ 249.0                │
-- │ 30            │ 133.0                │
-- │ 31            │ 51.0                 │
-- │ 32            │ 164.0                │
-- │ 33            │ 482.0                │
-- │ 34            │ 72.0                 │
-- │ 35            │ 52.0                 │
-- │ 36            │ 51.0                 │
-- │ 37            │ 88.0                 │
-- │ 38            │ 28.0                 │
-- │ 39            │ 24.0                 │
-- │ 40            │ 2.0                  │
-- │ 41            │ 2.0                  │
-- │ 42            │ 2.0                  │
-- │ 43            │ 1.0                  │
-- │ 44            │ 1.0                  │
-- │ 45            │ 2.0                  │
-- │ 46            │ 14.0                 │
-- │ 47            │ 24.0                 │
-- │ 48            │ 175.0                │
-- │ 49            │ 25.0                 │
-- │ 50            │ 112.0                │
-- │ 51            │ 108.0                │
-- │ 52            │ 70.0                 │
-- │ 53            │ 95.0                 │
-- │ 54            │ 72.0                 │
-- │ 55            │ 863.0                │
-- │ 56            │ 163.0                │
-- │ 57            │ 162.0                │
-- │ 58            │ 52.0                 │
-- │ 59            │ 70.0                 │
-- │ 60            │ 70.0                 │
-- │ 61            │ 70.0                 │
-- │ 62            │ 70.0                 │
-- │ 63            │ 70.0                 │
-- │ 64            │ 70.0                 │
-- │ 65            │ 70.0                 │
-- │ 66            │ 70.0                 │
-- │ 67            │ 70.0                 │
-- │ 68            │ 70.0                 │
-- │ 74            │ 142.0                │
-- │ 75            │ 33.0                 │
-- │ 76            │ 64.0                 │
-- │ 77            │ 24.0                 │
-- │ 78            │ 92.0                 │
-- │ 79            │ 6.0                  │
-- │ 80            │ 127.0                │
-- │ 81            │ 4.0                  │
-- │ 82            │ 64.0                 │
-- │ 83            │ 4.0                  │
-- │ 89            │ 128.0                │
-- │ 90            │ 3.0                  │
-- │ 91            │ 42.0                 │
-- │ 92            │ 144.0                │
-- │ 93            │ 52.0                 │
-- │ 94            │ 143.0                │
-- │ 95            │ 109.0                │
-- │ 96            │ 107.0                │
-- │ 97            │ 27.0                 │
-- │ 98            │ 124.0                │
-- │ 99            │ 74.0                 │
-- │ 100           │ 31.0                 │
-- │ 101           │ 2.0                  │
-- │ 102           │ 24.0                 │
-- │ 103           │ 12.0                 │
-- │ 104           │ 80.0                 │
-- │ 105           │ 70.0                 │
-- │ 106           │ 19.0                 │
-- │ 107           │ 112.0                │
-- │ 108           │ 12.0                 │
-- │ 109           │ 59.0                 │
-- │ 110           │ 53.0                 │
-- │ 111           │ 70.0                 │
-- │ 112           │ 70.0                 │
-- │ 113           │ 70.0                 │
-- │ 114           │ 70.0                 │
-- │ 115           │ 70.0                 │
-- │ 116           │ 28.0                 │
-- │ 117           │ 57.0                 │
-- │ 118           │ 70.0                 │
-- │ 119           │ 70.0                 │
-- │ 120           │ 70.0                 │
-- │ 121           │ 70.0                 │
-- │ 122           │ 70.0                 │
-- │ 123           │ 70.0                 │
-- │ 124           │ 70.0                 │
-- │ 125           │ 70.0                 │
-- │ 126           │ 70.0                 │
-- │ 127           │ 70.0                 │
-- │ 128           │ 3.0                  │
-- └───────────────┴──────────────────────┘

-- 53. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

sqlite> select codigo_producto, sum(cantidad) as cantidad from detalle_pedido group by codigo_producto order by cantidad desc limit 20;

-- ┌─────────────────┬──────────┐
-- │ codigo_producto │ cantidad │
-- ├─────────────────┼──────────┤
-- │ AR-009          │ 961      │
-- │ AR-008          │ 455      │
-- │ FR-17           │ 423      │
-- │ AR-006          │ 291      │
-- │ FR-67           │ 285      │
-- │ OR-247          │ 279      │
-- │ OR-157          │ 262      │
-- │ OR-227          │ 236      │
-- │ OR-208          │ 221      │
-- │ 30310           │ 220      │
-- │ OR-214          │ 212      │
-- │ FR-57           │ 203      │
-- │ OR-177          │ 150      │
-- │ AR-001          │ 135      │
-- │ FR-11           │ 131      │
-- │ AR-002          │ 128      │
-- │ OR-136          │ 127      │
-- │ FR-48           │ 120      │
-- │ FR-29           │ 120      │
-- │ FR-100          │ 114      │
-- └─────────────────┴──────────┘

-- 54. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. 
-- La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. 
-- El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

sqlite> select sum(p.precio_proveedor + d.cantidad) as base_imponible, sum(21* (p.precio_proveedor + d.cantidad)/100) as IVA, sum((21*(p.precio_proveedor + d.cantidad)/100) + (p.precio_proveedor + d.cantidad)) as total from producto as p join detalle_pedido as d on p.codigo_producto=d.codigo_producto;

-- ┌────────────────┬─────────┬──────────┐
-- │ base_imponible │   IVA   │  total   │
-- ├────────────────┼─────────┼──────────┤
-- │ 17661.0        │ 3708.81 │ 21369.81 │
-- └────────────────┴─────────┴──────────┘

-- 55. La misma información que en la pregunta anterior, pero agrupada por código de producto.

sqlite> select p.codigo_producto, (p.precio_proveedor + d.cantidad) as base_imponible, (21* (p.precio_proveedor + d.cantidad)/100) as IVA, ((21*(p.precio_proveedor + d.cantidad)/100) + (p.precio_proveedor + d.cantidad)) as total from producto as p join detalle_pedido as d on p.codigo_producto=d.codigo_producto group by p.codigo_producto;

-- ┌─────────────────┬────────────────┬───────┬────────┐
-- │ codigo_producto │ base_imponible │  IVA  │ total  │
-- ├─────────────────┼────────────────┼───────┼────────┤
-- │ 11679           │ 16.0           │ 3.36  │ 19.36  │
-- │ 21636           │ 25.0           │ 5.25  │ 30.25  │
-- │ 22225           │ 16.0           │ 3.36  │ 19.36  │
-- │ 30310           │ 23.0           │ 4.83  │ 27.83  │
-- │ AR-001          │ 80.0           │ 16.8  │ 96.8   │
-- │ AR-002          │ 110.0          │ 23.1  │ 133.1  │
-- │ AR-003          │ 5.0            │ 1.05  │ 6.05   │
-- │ AR-004          │ 10.0           │ 2.1   │ 12.1   │
-- │ AR-005          │ 3.0            │ 0.63  │ 3.63   │
-- │ AR-006          │ 180.0          │ 37.8  │ 217.8  │
-- │ AR-007          │ 9.0            │ 1.89  │ 10.89  │
-- │ AR-008          │ 450.0          │ 94.5  │ 544.5  │
-- │ AR-009          │ 290.0          │ 60.9  │ 350.9  │
-- │ AR-010          │ 4.0            │ 0.84  │ 4.84   │
-- │ FR-1            │ 9.0            │ 1.89  │ 10.89  │
-- │ FR-10           │ 13.0           │ 2.73  │ 15.73  │
-- │ FR-100          │ 16.0           │ 3.36  │ 19.36  │
-- │ FR-101          │ 15.0           │ 3.15  │ 18.15  │
-- │ FR-102          │ 15.0           │ 3.15  │ 18.15  │
-- │ FR-103          │ 21.0           │ 4.41  │ 25.41  │
-- │ FR-105          │ 60.0           │ 12.6  │ 72.6   │
-- │ FR-106          │ 11.0           │ 2.31  │ 13.31  │
-- │ FR-107          │ 67.0           │ 14.07 │ 81.07  │
-- │ FR-108          │ 26.0           │ 5.46  │ 31.46  │
-- │ FR-11           │ 90.0           │ 18.9  │ 108.9  │
-- │ FR-12           │ 18.0           │ 3.78  │ 21.78  │
-- │ FR-13           │ 58.0           │ 12.18 │ 70.18  │
-- │ FR-15           │ 29.0           │ 6.09  │ 35.09  │
-- │ FR-16           │ 37.0           │ 7.77  │ 44.77  │
-- │ FR-17           │ 424.0          │ 89.04 │ 513.04 │
-- │ FR-18           │ 25.0           │ 5.25  │ 30.25  │
-- │ FR-2            │ 5.0            │ 1.05  │ 6.05   │
-- │ FR-22           │ 5.0            │ 1.05  │ 6.05   │
-- │ FR-23           │ 12.0           │ 2.52  │ 14.52  │
-- │ FR-29           │ 126.0          │ 26.46 │ 152.46 │
-- │ FR-3            │ 61.0           │ 12.81 │ 73.81  │
-- │ FR-31           │ 18.0           │ 3.78  │ 21.78  │
-- │ FR-33           │ 20.0           │ 4.2   │ 24.2   │
-- │ FR-34           │ 48.0           │ 10.08 │ 58.08  │
-- │ FR-36           │ 17.0           │ 3.57  │ 20.57  │
-- │ FR-37           │ 12.0           │ 2.52  │ 14.52  │
-- │ FR-4            │ 26.0           │ 5.46  │ 31.46  │
-- │ FR-40           │ 13.0           │ 2.73  │ 15.73  │
-- │ FR-41           │ 18.0           │ 3.78  │ 21.78  │
-- │ FR-42           │ 18.0           │ 3.78  │ 21.78  │
-- │ FR-43           │ 12.0           │ 2.52  │ 14.52  │
-- │ FR-45           │ 20.0           │ 4.2   │ 24.2   │
-- │ FR-47           │ 61.0           │ 12.81 │ 73.81  │
-- │ FR-48           │ 127.0          │ 26.67 │ 153.67 │
-- │ FR-53           │ 9.0            │ 1.89  │ 10.89  │
-- │ FR-54           │ 32.0           │ 6.72  │ 38.72  │
-- │ FR-56           │ 22.0           │ 4.62  │ 26.62  │
-- │ FR-57           │ 210.0          │ 44.1  │ 254.1  │
-- │ FR-58           │ 59.0           │ 12.39 │ 71.39  │
-- │ FR-6            │ 21.0           │ 4.41  │ 25.41  │
-- │ FR-60           │ 28.0           │ 5.88  │ 33.88  │
-- │ FR-64           │ 22.0           │ 4.62  │ 26.62  │
-- │ FR-66           │ 44.0           │ 9.24  │ 53.24  │
-- │ FR-67           │ 66.0           │ 13.86 │ 79.86  │
-- │ FR-69           │ 87.0           │ 18.27 │ 105.27 │
-- │ FR-7            │ 35.0           │ 7.35  │ 42.35  │
-- │ FR-71           │ 27.0           │ 5.67  │ 32.67  │
-- │ FR-72           │ 29.0           │ 6.09  │ 35.09  │
-- │ FR-75           │ 26.0           │ 5.46  │ 31.46  │
-- │ FR-77           │ 71.0           │ 14.91 │ 85.91  │
-- │ FR-78           │ 14.0           │ 2.94  │ 16.94  │
-- │ FR-79           │ 20.0           │ 4.2   │ 24.2   │
-- │ FR-8            │ 22.0           │ 4.62  │ 26.62  │
-- │ FR-80           │ 26.0           │ 5.46  │ 31.46  │
-- │ FR-81           │ 42.0           │ 8.82  │ 50.82  │
-- │ FR-82           │ 61.0           │ 12.81 │ 73.81  │
-- │ FR-84           │ 14.0           │ 2.94  │ 16.94  │
-- │ FR-85           │ 60.0           │ 12.6  │ 72.6   │
-- │ FR-86           │ 10.0           │ 2.1   │ 12.1   │
-- │ FR-87           │ 41.0           │ 8.61  │ 49.61  │
-- │ FR-89           │ 49.0           │ 10.29 │ 59.29  │
-- │ FR-9            │ 27.0           │ 5.67  │ 32.67  │
-- │ FR-90           │ 60.0           │ 12.6  │ 72.6   │
-- │ FR-91           │ 94.0           │ 19.74 │ 113.74 │
-- │ FR-94           │ 35.0           │ 7.35  │ 42.35  │
-- │ OR-101          │ 6.0            │ 1.26  │ 7.26   │
-- │ OR-102          │ 26.0           │ 5.46  │ 31.46  │
-- │ OR-104          │ 28.0           │ 5.88  │ 33.88  │
-- │ OR-115          │ 14.0           │ 2.94  │ 16.94  │
-- │ OR-116          │ 11.0           │ 2.31  │ 13.31  │
-- │ OR-119          │ 14.0           │ 2.94  │ 16.94  │
-- │ OR-120          │ 9.0            │ 1.89  │ 10.89  │
-- │ OR-122          │ 36.0           │ 7.56  │ 43.56  │
-- │ OR-123          │ 15.0           │ 3.15  │ 18.15  │
-- │ OR-125          │ 7.0            │ 1.47  │ 8.47   │
-- │ OR-127          │ 45.0           │ 9.45  │ 54.45  │
-- │ OR-128          │ 107.0          │ 22.47 │ 129.47 │
-- │ OR-129          │ 90.0           │ 18.9  │ 108.9  │
-- │ OR-130          │ 24.0           │ 5.04  │ 29.04  │
-- │ OR-136          │ 19.0           │ 3.99  │ 22.99  │
-- │ OR-139          │ 83.0           │ 17.43 │ 100.43 │
-- │ OR-140          │ 53.0           │ 11.13 │ 64.13  │
-- │ OR-141          │ 28.0           │ 5.88  │ 33.88  │
-- │ OR-146          │ 20.0           │ 4.2   │ 24.2   │
-- │ OR-147          │ 11.0           │ 2.31  │ 13.31  │
-- │ OR-150          │ 19.0           │ 3.99  │ 22.99  │
-- │ OR-152          │ 7.0            │ 1.47  │ 8.47   │
-- │ OR-155          │ 8.0            │ 1.68  │ 9.68   │
-- │ OR-156          │ 25.0           │ 5.25  │ 30.25  │
-- │ OR-157          │ 46.0           │ 9.66  │ 55.66  │
-- │ OR-159          │ 16.0           │ 3.36  │ 19.36  │
-- │ OR-160          │ 18.0           │ 3.78  │ 21.78  │
-- │ OR-165          │ 11.0           │ 2.31  │ 13.31  │
-- │ OR-168          │ 10.0           │ 2.1   │ 12.1   │
-- │ OR-172          │ 34.0           │ 7.14  │ 41.14  │
-- │ OR-174          │ 38.0           │ 7.98  │ 45.98  │
-- │ OR-176          │ 46.0           │ 9.66  │ 55.66  │
-- │ OR-177          │ 162.0          │ 34.02 │ 196.02 │
-- │ OR-179          │ 5.0            │ 1.05  │ 6.05   │
-- │ OR-181          │ 44.0           │ 9.24  │ 53.24  │
-- │ OR-186          │ 44.0           │ 9.24  │ 53.24  │
-- │ OR-188          │ 24.0           │ 5.04  │ 29.04  │
-- │ OR-193          │ 21.0           │ 4.41  │ 25.41  │
-- │ OR-196          │ 11.0           │ 2.31  │ 13.31  │
-- │ OR-200          │ 13.0           │ 2.73  │ 15.73  │
-- │ OR-203          │ 17.0           │ 3.57  │ 20.57  │
-- │ OR-204          │ 58.0           │ 12.18 │ 70.18  │
-- │ OR-205          │ 18.0           │ 3.78  │ 21.78  │
-- │ OR-206          │ 9.0            │ 1.89  │ 10.89  │
-- │ OR-207          │ 7.0            │ 1.47  │ 8.47   │
-- │ OR-208          │ 23.0           │ 4.83  │ 27.83  │
-- │ OR-209          │ 58.0           │ 12.18 │ 70.18  │
-- │ OR-210          │ 111.0          │ 23.31 │ 134.31 │
-- │ OR-211          │ 117.0          │ 24.57 │ 141.57 │
-- │ OR-213          │ 242.0          │ 50.82 │ 292.82 │
-- │ OR-214          │ 220.0          │ 46.2  │ 266.2  │
-- │ OR-217          │ 66.0           │ 13.86 │ 79.86  │
-- │ OR-218          │ 44.0           │ 9.24  │ 53.24  │
-- │ OR-222          │ 90.0           │ 18.9  │ 108.9  │
-- │ OR-225          │ 80.0           │ 16.8  │ 96.8   │
-- │ OR-226          │ 45.0           │ 9.45  │ 54.45  │
-- │ OR-227          │ 118.0          │ 24.78 │ 142.78 │
-- │ OR-234          │ 56.0           │ 11.76 │ 67.76  │
-- │ OR-236          │ 84.0           │ 17.64 │ 101.64 │
-- │ OR-237          │ 65.0           │ 13.65 │ 78.65  │
-- │ OR-240          │ 5.0            │ 1.05  │ 6.05   │
-- │ OR-241          │ 30.0           │ 6.3   │ 36.3   │
-- │ OR-243          │ 53.0           │ 11.13 │ 64.13  │
-- │ OR-247          │ 374.0          │ 78.54 │ 452.54 │
-- │ OR-249          │ 34.0           │ 7.14  │ 41.14  │
-- │ OR-250          │ 11.0           │ 2.31  │ 13.31  │
-- │ OR-99           │ 34.0           │ 7.14  │ 41.14  │
-- └─────────────────┴────────────────┴───────┴────────┘

-- 56. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

sqlite> select p.codigo_producto, (p.precio_proveedor + d.cantidad) as base_imponible, (21* (p.precio_proveedor + d.cantidad)/100) as IVA, ((21*(p.precio_proveedor + d.cantidad)/100) + (p.precio_proveedor + d.cantidad)) as total from producto as p join detalle_pedido as d on p.codigo_producto=d.codigo_producto where p.codigo_producto regexp "^OR" group by p.codigo_producto;

-- ┌─────────────────┬────────────────┬───────┬────────┐
-- │ codigo_producto │ base_imponible │  IVA  │ total  │
-- ├─────────────────┼────────────────┼───────┼────────┤
-- │ OR-101          │ 6.0            │ 1.26  │ 7.26   │
-- │ OR-102          │ 26.0           │ 5.46  │ 31.46  │
-- │ OR-104          │ 28.0           │ 5.88  │ 33.88  │
-- │ OR-115          │ 14.0           │ 2.94  │ 16.94  │
-- │ OR-116          │ 11.0           │ 2.31  │ 13.31  │
-- │ OR-119          │ 14.0           │ 2.94  │ 16.94  │
-- │ OR-120          │ 9.0            │ 1.89  │ 10.89  │
-- │ OR-122          │ 36.0           │ 7.56  │ 43.56  │
-- │ OR-123          │ 15.0           │ 3.15  │ 18.15  │
-- │ OR-125          │ 7.0            │ 1.47  │ 8.47   │
-- │ OR-127          │ 45.0           │ 9.45  │ 54.45  │
-- │ OR-128          │ 107.0          │ 22.47 │ 129.47 │
-- │ OR-129          │ 90.0           │ 18.9  │ 108.9  │
-- │ OR-130          │ 24.0           │ 5.04  │ 29.04  │
-- │ OR-136          │ 19.0           │ 3.99  │ 22.99  │
-- │ OR-139          │ 83.0           │ 17.43 │ 100.43 │
-- │ OR-140          │ 53.0           │ 11.13 │ 64.13  │
-- │ OR-141          │ 28.0           │ 5.88  │ 33.88  │
-- │ OR-146          │ 20.0           │ 4.2   │ 24.2   │
-- │ OR-147          │ 11.0           │ 2.31  │ 13.31  │
-- │ OR-150          │ 19.0           │ 3.99  │ 22.99  │
-- │ OR-152          │ 7.0            │ 1.47  │ 8.47   │
-- │ OR-155          │ 8.0            │ 1.68  │ 9.68   │
-- │ OR-156          │ 25.0           │ 5.25  │ 30.25  │
-- │ OR-157          │ 46.0           │ 9.66  │ 55.66  │
-- │ OR-159          │ 16.0           │ 3.36  │ 19.36  │
-- │ OR-160          │ 18.0           │ 3.78  │ 21.78  │
-- │ OR-165          │ 11.0           │ 2.31  │ 13.31  │
-- │ OR-168          │ 10.0           │ 2.1   │ 12.1   │
-- │ OR-172          │ 34.0           │ 7.14  │ 41.14  │
-- │ OR-174          │ 38.0           │ 7.98  │ 45.98  │
-- │ OR-176          │ 46.0           │ 9.66  │ 55.66  │
-- │ OR-177          │ 162.0          │ 34.02 │ 196.02 │
-- │ OR-179          │ 5.0            │ 1.05  │ 6.05   │
-- │ OR-181          │ 44.0           │ 9.24  │ 53.24  │
-- │ OR-186          │ 44.0           │ 9.24  │ 53.24  │
-- │ OR-188          │ 24.0           │ 5.04  │ 29.04  │
-- │ OR-193          │ 21.0           │ 4.41  │ 25.41  │
-- │ OR-196          │ 11.0           │ 2.31  │ 13.31  │
-- │ OR-200          │ 13.0           │ 2.73  │ 15.73  │
-- │ OR-203          │ 17.0           │ 3.57  │ 20.57  │
-- │ OR-204          │ 58.0           │ 12.18 │ 70.18  │
-- │ OR-205          │ 18.0           │ 3.78  │ 21.78  │
-- │ OR-206          │ 9.0            │ 1.89  │ 10.89  │
-- │ OR-207          │ 7.0            │ 1.47  │ 8.47   │
-- │ OR-208          │ 23.0           │ 4.83  │ 27.83  │
-- │ OR-209          │ 58.0           │ 12.18 │ 70.18  │
-- │ OR-210          │ 111.0          │ 23.31 │ 134.31 │
-- │ OR-211          │ 117.0          │ 24.57 │ 141.57 │
-- │ OR-213          │ 242.0          │ 50.82 │ 292.82 │
-- │ OR-214          │ 220.0          │ 46.2  │ 266.2  │
-- │ OR-217          │ 66.0           │ 13.86 │ 79.86  │
-- │ OR-218          │ 44.0           │ 9.24  │ 53.24  │
-- │ OR-222          │ 90.0           │ 18.9  │ 108.9  │
-- │ OR-225          │ 80.0           │ 16.8  │ 96.8   │
-- │ OR-226          │ 45.0           │ 9.45  │ 54.45  │
-- │ OR-227          │ 118.0          │ 24.78 │ 142.78 │
-- │ OR-234          │ 56.0           │ 11.76 │ 67.76  │
-- │ OR-236          │ 84.0           │ 17.64 │ 101.64 │
-- │ OR-237          │ 65.0           │ 13.65 │ 78.65  │
-- │ OR-240          │ 5.0            │ 1.05  │ 6.05   │
-- │ OR-241          │ 30.0           │ 6.3   │ 36.3   │
-- │ OR-243          │ 53.0           │ 11.13 │ 64.13  │
-- │ OR-247          │ 374.0          │ 78.54 │ 452.54 │
-- │ OR-249          │ 34.0           │ 7.14  │ 41.14  │
-- │ OR-250          │ 11.0           │ 2.31  │ 13.31  │
-- │ OR-99           │ 34.0           │ 7.14  │ 41.14  │
-- └─────────────────┴────────────────┴───────┴────────┘

-- 57. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).



-- 58. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

-- ## Subconsultas
-- ### Con operadores básicos de comparación
-- 59. Devuelve el nombre del cliente con mayor límite de crédito.

sqlite> select nombre_cliente from cliente where limite_credito=(select max(limite_credito) from cliente); 

-- ┌────────────────┐
-- │ nombre_cliente │
-- ├────────────────┤
-- │ Tendo Garden   │
-- └────────────────┘

-- 60. Devuelve el nombre del producto que tenga el precio de venta más caro.

sqlite> select nombre from producto where precio_venta=(select max(precio_venta) from producto);

-- ┌───────────────────────┐
-- │        nombre         │
-- ├───────────────────────┤
-- │ Trachycarpus Fortunei │
-- └───────────────────────┘

-- 61. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se 
-- han vendido de cada producto a partir de los datos de la tabla detalle_pedido)

sqlite> select nombre from producto where codigo_producto=(select codigo_producto from detalle_pedido where cantidad=(select max(cantidad) from detalle_pedido));

-- ┌──────────────────────────────────┐
-- │              nombre              │
-- ├──────────────────────────────────┤
-- │ Thymus Citriodra (Tomillo limón) │
-- └──────────────────────────────────┘

-- 62. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).

sqlite> select c.nombre_cliente from cliente as c where limite_credito > (select total from pago where pago.codigo_cliente=c.codigo_cliente);

-- ┌────────────────────────────────┐
-- │         nombre_cliente         │
-- ├────────────────────────────────┤
-- │ GoldFish Garden                │
-- │ Gardening Associates           │
-- │ Tendo Garden                   │
-- │ Beragua                        │
-- │ Naturagua                      │
-- │ Camunas Jardines S.L.          │
-- │ Dardena S.A.                   │
-- │ Jardin de Flores               │
-- │ Golf S.A.                      │
-- │ Sotogrande                     │
-- │ Jardines y Mansiones Cactus SL │
-- │ Jardinerías Matías SL          │
-- │ Tutifruti S.A                  │
-- │ El Jardin Viviente S.L         │
-- └────────────────────────────────┘

-- 63. Devuelve el producto que más unidades tiene en stock.

sqlite> select nombre from producto group by nombre having sum(cantidad_en_stock)=(select sum(cantidad_en_stock) as cantidad from producto group by nombre order by cantidad desc limit 1);

-- ┌───────────────┐
-- │    nombre     │
-- ├───────────────┤
-- │ Albaricoquero │
-- └───────────────┘

-- 64. Devuelve el producto que menos unidades tiene en stock.

sqlite> select nombre from producto group by nombre having sum(cantidad_en_stock)=(select sum(cantidad_en_stock) as cantidad from producto group by nombre order by cantidad limit 1);      
-- ┌────────────────┐
-- │     nombre     │
-- ├────────────────┤
-- │ Dracaena Drago │
-- └────────────────┘

-- 65. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.

sqlite> select nombre, apellido1, apellido2, email from empleado where codigo_empleado=(select codigo_jefe from empleado where nombre in ("Alberto") and apellido1 in ("Soria"));

-- ┌────────┬───────────┬───────────┬──────────────────────┐
-- │ nombre │ apellido1 │ apellido2 │        email         │
-- ├────────┼───────────┼───────────┼──────────────────────┤
-- │ Ruben  │ López     │ Martinez  │ rlopez@jardineria.es │
-- └────────┴───────────┴───────────┴──────────────────────┘

-- ### Subconsultas con IN y NOT IN
-- 66. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

sqlite> select nombre, apellido1,puesto from empleado where codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);

-- ┌─────────────┬────────────┬───────────────────────┐
-- │   nombre    │ apellido1  │        puesto         │
-- ├─────────────┼────────────┼───────────────────────┤
-- │ Marcos      │ Magaña     │ Director General      │
-- │ Ruben       │ López      │ Subdirector Marketing │
-- │ Alberto     │ Soria      │ Subdirector Ventas    │
-- │ Maria       │ Solís      │ Secretaria            │
-- │ Juan Carlos │ Ortiz      │ Representante Ventas  │
-- │ Carlos      │ Soria      │ Director Oficina      │
-- │ Hilario     │ Rodriguez  │ Representante Ventas  │
-- │ David       │ Palma      │ Representante Ventas  │
-- │ Oscar       │ Palma      │ Representante Ventas  │
-- │ Francois    │ Fignon     │ Director Oficina      │
-- │ Laurent     │ Serra      │ Representante Ventas  │
-- │ Hilary      │ Washington │ Director Oficina      │
-- │ Marcus      │ Paxton     │ Representante Ventas  │
-- │ Nei         │ Nishikori  │ Director Oficina      │
-- │ Narumi      │ Riko       │ Representante Ventas  │
-- │ Takuma      │ Nomura     │ Representante Ventas  │
-- │ Amy         │ Johnson    │ Director Oficina      │
-- │ Larry       │ Westfalls  │ Representante Ventas  │
-- │ John        │ Walton     │ Representante Ventas  │
-- │ Kevin       │ Fallmer    │ Director Oficina      │
-- └─────────────┴────────────┴───────────────────────┘

-- 67. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

sqlite> select nombre_cliente from cliente where codigo_cliente not in (select codigo_cliente from pago);
┌─────────────────────────────┐
│       nombre_cliente        │
├─────────────────────────────┤
│ Lasas S.A.                  │
│ Club Golf Puerta del hierro │
│ DaraDistribuciones          │
│ Madrileña de riegos         │
│ Lasas S.A.                  │
│ Flowers, S.A                │
│ Naturajardin                │
│ Americh Golf Management SL  │
│ Aloha                       │
│ El Prat                     │
│ Vivero Humanes              │
│ Fuenla City                 │
│ Top Campo                   │
│ Campohermoso                │
│ france telecom              │
│ Musée du Louvre             │
│ Flores S.L.                 │
│ The Magic Garden            │
└─────────────────────────────┘

-- 68. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

sqlite> select nombre_cliente from cliente where codigo_cliente in (select codigo_cliente from pago);     

-- ┌────────────────────────────────┐
-- │         nombre_cliente         │
-- ├────────────────────────────────┤
-- │ GoldFish Garden                │
-- │ Gardening Associates           │
-- │ Gerudo Valley                  │
-- │ Tendo Garden                   │
-- │ Beragua                        │
-- │ Naturagua                      │
-- │ Camunas Jardines S.L.          │
-- │ Dardena S.A.                   │
-- │ Jardin de Flores               │
-- │ Flores Marivi                  │
-- │ Golf S.A.                      │
-- │ Sotogrande                     │
-- │ Jardines y Mansiones Cactus SL │
-- │ Jardinerías Matías SL          │
-- │ Agrojardin                     │
-- │ Jardineria Sara                │
-- │ Tutifruti S.A                  │
-- │ El Jardin Viviente S.L         │
-- └────────────────────────────────┘

-- 69. Devuelve un listado de los productos que nunca han aparecido en un pedido.

sqlite> select nombre from producto where codigo_producto not in (select codigo_producto from detalle_pedido);

-- ┌─────────────────────────────────────────────────────────────┐
-- │                           nombre                            │
-- ├─────────────────────────────────────────────────────────────┤
-- │ Olea-Olivos                                                 │
-- │ Calamondin Mini                                             │
-- │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
-- │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │
-- │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │
-- │ Albaricoquero Corbato                                       │
-- │ Albaricoquero Moniqui                                       │
-- │ Albaricoquero Kurrot                                        │
-- │ Cerezo Burlat                                               │
-- │ Cerezo Picota                                               │
-- │ Ciruelo R. Claudia Verde                                    │
-- │ Ciruelo Golden Japan                                        │
-- │ Ciruelo Claudia Negra                                       │
-- │ Higuera Verdal                                              │
-- │ Higuera Breva                                               │
-- │ Melocotonero Spring Crest                                   │
-- │ Melocotonero Federica                                       │
-- │ Parra Uva de Mesa                                           │
-- │ Mandarino -Plantón joven                                    │
-- │ Peral Castell                                               │
-- │ Peral Williams                                              │
-- │ Peral Conference                                            │
-- │ Olivo Cipresino                                             │
-- │ Albaricoquero                                               │
-- │ Albaricoquero                                               │
-- │ Albaricoquero                                               │
-- │ Cerezo                                                      │
-- │ Cerezo                                                      │
-- │ Cerezo                                                      │
-- │ Ciruelo                                                     │
-- │ Granado                                                     │
-- │ Granado                                                     │
-- │ Granado                                                     │
-- │ Higuera                                                     │
-- │ Manzano                                                     │
-- │ Melocotonero                                                │
-- │ Melocotonero                                                │
-- │ Melocotonero                                                │
-- │ Membrillero                                                 │
-- │ Membrillero                                                 │
-- │ Membrillero                                                 │
-- │ Membrillero                                                 │
-- │ Arbustos Mix Maceta                                         │
-- │ Mimosa Injerto CLASICA Dealbata                             │
-- │ Mimosa Semilla Bayleyana                                    │
-- │ Mimosa Semilla Espectabilis                                 │
-- │ Mimosa Semilla Longifolia                                   │
-- │ Mimosa Semilla Floribunda 4 estaciones                      │
-- │ Abelia Floribunda                                           │
-- │ Callistemom (Mix)                                           │
-- │ Callistemom (Mix)                                           │
-- │ Corylus Avellana \"Contorta\"                               │
-- │ Escallonia (Mix)                                            │
-- │ Evonimus Emerald Gayeti                                     │
-- │ Evonimus Pulchellus                                         │
-- │ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                │
-- │ Hibiscus Syriacus \"Pink Giant\" Rosa                       │
-- │ Lonicera Nitida \"Maigrum\"                                 │
-- │ Prunus pisardii                                             │
-- │ Weigelia \"Bristol Ruby\"                                   │
-- │ Leptospermum formado PIRAMIDE                               │
-- │ Leptospermum COPA                                           │
-- │ Nerium oleander-CALIDAD \"GARDEN\"                          │
-- │ Nerium Oleander Arbusto GRANDE                              │
-- │ Nerium oleander COPA  Calibre 6/8                           │
-- │ ROSAL TREPADOR                                              │
-- │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
-- │ Solanum Jazminoide                                          │
-- │ Wisteria Sinensis  azul, rosa, blanca                       │
-- │ Wisteria Sinensis INJERTADAS DECÃ"                          │
-- │ Bougamvillea Sanderiana Tutor                               │
-- │ Bougamvillea Sanderiana Espaldera                           │
-- │ Bougamvillea Sanderiana Espaldera                           │
-- │ Bougamvillea Sanderiana, 3 tut. piramide                    │
-- │ Expositor Árboles clima mediterráneo                        │
-- │ Expositor Árboles borde del mar                             │
-- │ Brachychiton Acerifolius                                    │
-- │ Cassia Corimbosa                                            │
-- │ Cassia Corimbosa                                            │
-- │ Chitalpa Summer Bells                                       │
-- │ Erytrina Kafra                                              │
-- │ Eucalyptus Citriodora                                       │
-- │ Eucalyptus Ficifolia                                        │
-- │ Hibiscus Syriacus  Var. Injertadas 1 Tallo                  │
-- │ Lagunaria Patersonii                                        │
-- │ Lagunaria Patersonii                                        │
-- │ Morus Alba                                                  │
-- │ Platanus Acerifolia                                         │
-- │ Salix Babylonica  Pendula                                   │
-- │ Tamarix  Ramosissima Pink Cascade                           │
-- │ Tecoma Stands                                               │
-- │ Tecoma Stands                                               │
-- │ Tipuana Tipu                                                │
-- │ Pleioblastus distichus-Bambú enano                          │
-- │ Sasa palmata                                                │
-- │ Phylostachys aurea                                          │
-- │ Phylostachys aurea                                          │
-- │ Phylostachys Bambusa Spectabilis                            │
-- │ Phylostachys biseti                                         │
-- │ Pseudosasa japonica (Metake)                                │
-- │ Pseudosasa japonica (Metake)                                │
-- │ Cedrus Deodara \"Feeling Blue\" Novedad                     │
-- │ Juniperus chinensis \"Blue Alps\"                           │
-- │ Juniperus Chinensis Stricta                                 │
-- │ Juniperus squamata \"Blue Star\"                            │
-- │ Juniperus x media Phitzeriana verde                         │
-- │ Bismarckia Nobilis                                          │
-- │ Brahea Armata                                               │
-- │ Brahea Edulis                                               │
-- │ Butia Capitata                                              │
-- │ Butia Capitata                                              │
-- │ Butia Capitata                                              │
-- │ Chamaerops Humilis                                          │
-- │ Chamaerops Humilis                                          │
-- │ Chamaerops Humilis \"Cerifera\"                             │
-- │ Chrysalidocarpus Lutescens -ARECA                           │
-- │ Cordyline Australis -DRACAENA                               │
-- │ Cycas Revoluta                                              │
-- │ Cycas Revoluta                                              │
-- │ Dracaena Drago                                              │
-- │ Dracaena Drago                                              │
-- │ Livistonia Decipiens                                        │
-- │ Livistonia Decipiens                                        │
-- │ Rhaphis Excelsa                                             │
-- │ Sabal Minor                                                 │
-- │ Sabal Minor                                                 │
-- │ Trachycarpus Fortunei                                       │
-- │ Washingtonia Robusta                                        │
-- │ Zamia Furfuracaea                                           │
-- └─────────────────────────────────────────────────────────────┘

-- 70. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

sqlite> select nombre, apellido1,apellido2, puesto, telefono from empleado, oficina where empleado.codigo_oficina=oficina.codigo_oficina and codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);

-- ┌─────────────┬────────────┬───────────┬───────────────────────┬─────────────────┐
-- │   nombre    │ apellido1  │ apellido2 │        puesto         │    telefono     │
-- ├─────────────┼────────────┼───────────┼───────────────────────┼─────────────────┤
-- │ Marcos      │ Magaña     │ Perez     │ Director General      │ +34 925 867231  │
-- │ Ruben       │ López      │ Martinez  │ Subdirector Marketing │ +34 925 867231  │
-- │ Alberto     │ Soria      │ Carrasco  │ Subdirector Ventas    │ +34 925 867231  │
-- │ Maria       │ Solís      │ Jerez     │ Secretaria            │ +34 925 867231  │
-- │ Juan Carlos │ Ortiz      │ Serrano   │ Representante Ventas  │ +34 925 867231  │
-- │ Carlos      │ Soria      │ Jimenez   │ Director Oficina      │ +34 91 7514487  │
-- │ Hilario     │ Rodriguez  │ Huertas   │ Representante Ventas  │ +34 91 7514487  │
-- │ David       │ Palma      │ Aceituno  │ Representante Ventas  │ +34 93 3561182  │
-- │ Oscar       │ Palma      │ Aceituno  │ Representante Ventas  │ +34 93 3561182  │
-- │ Francois    │ Fignon     │           │ Director Oficina      │ +33 14 723 4404 │
-- │ Laurent     │ Serra      │           │ Representante Ventas  │ +33 14 723 4404 │
-- │ Hilary      │ Washington │           │ Director Oficina      │ +1 215 837 0825 │
-- │ Marcus      │ Paxton     │           │ Representante Ventas  │ +1 215 837 0825 │
-- │ Nei         │ Nishikori  │           │ Director Oficina      │ +81 33 224 5000 │
-- │ Narumi      │ Riko       │           │ Representante Ventas  │ +81 33 224 5000 │
-- │ Takuma      │ Nomura     │           │ Representante Ventas  │ +81 33 224 5000 │
-- │ Amy         │ Johnson    │           │ Director Oficina      │ +44 20 78772041 │
-- │ Larry       │ Westfalls  │           │ Representante Ventas  │ +44 20 78772041 │
-- │ John        │ Walton     │           │ Representante Ventas  │ +44 20 78772041 │
-- │ Kevin       │ Fallmer    │           │ Director Oficina      │ +61 2 9264 2451 │
-- └─────────────┴────────────┴───────────┴───────────────────────┴─────────────────┘

-- 71. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

sqlite> select codigo_oficina from oficina where codigo_oficina not in 
(select codigo_oficina from empleado where codigo_empleado in 
(select codigo_empleado_rep_ventas from cliente where codigo_cliente in 
(select codigo_cliente from pedido where codigo_pedido in 
(select codigo_pedido from detalle_pedido where codigo_producto in 
(select codigo_producto from producto where gama in ("Frutales"))))));

-- ┌────────────────┐
-- │ codigo_oficina │
-- ├────────────────┤
-- │ LON-UK         │
-- │ PAR-FR         │
-- │ TOK-JP         │
-- └────────────────┘
-- 72. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

sqlite> select nombre_cliente from cliente where codigo_cliente in (select codigo_cliente from pedido) and codigo_cliente not in (select codigo_cliente from pago);

-- ┌────────────────┐
-- │ nombre_cliente │
-- ├────────────────┤
-- │ Flores S.L.    │
-- └────────────────┘

-- ## Subconsultas con EXISTS y NOT EXISTS
-- 73. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

sqlite> select nombre_cliente from cliente as c where not exists (select * from pago where c.codigo_cliente=pago.codigo_cliente);

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
-- │ Flores S.L.                 │
-- │ The Magic Garden            │
-- └─────────────────────────────┘

-- 74. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

sqlite> select nombre_cliente from cliente as c where exists (select * from pago where c.codigo_cliente=pago.codigo_cliente);     

-- ┌────────────────────────────────┐
-- │         nombre_cliente         │
-- ├────────────────────────────────┤
-- │ GoldFish Garden                │
-- │ Gardening Associates           │
-- │ Gerudo Valley                  │
-- │ Tendo Garden                   │
-- │ Beragua                        │
-- │ Naturagua                      │
-- │ Camunas Jardines S.L.          │
-- │ Dardena S.A.                   │
-- │ Jardin de Flores               │
-- │ Flores Marivi                  │
-- │ Golf S.A.                      │
-- │ Sotogrande                     │
-- │ Jardines y Mansiones Cactus SL │
-- │ Jardinerías Matías SL          │
-- │ Agrojardin                     │
-- │ Jardineria Sara                │
-- │ Tutifruti S.A                  │
-- │ El Jardin Viviente S.L         │
-- └────────────────────────────────┘

-- 75. Devuelve un listado de los productos que nunca han aparecido en un pedido.

sqlite> select p.codigo_producto,  p.nombre from producto as p where not exists (select * from detalle_pedido where p.codigo_producto=detalle_pedido.codigo_producto); 
-- ┌─────────────────┬─────────────────────────────────────────────────────────────┐
-- │ codigo_producto │                           nombre                            │
-- ├─────────────────┼─────────────────────────────────────────────────────────────┤
-- │ FR-104          │ Olea-Olivos                                                 │
-- │ FR-14           │ Calamondin Mini                                             │
-- │ FR-19           │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
-- │ FR-20           │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │
-- │ FR-21           │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │
-- │ FR-24           │ Albaricoquero Corbato                                       │
-- │ FR-25           │ Albaricoquero Moniqui                                       │
-- │ FR-26           │ Albaricoquero Kurrot                                        │
-- │ FR-27           │ Cerezo Burlat                                               │
-- │ FR-28           │ Cerezo Picota                                               │
-- │ FR-30           │ Ciruelo R. Claudia Verde                                    │
-- │ FR-32           │ Ciruelo Golden Japan                                        │
-- │ FR-35           │ Ciruelo Claudia Negra                                       │
-- │ FR-38           │ Higuera Verdal                                              │
-- │ FR-39           │ Higuera Breva                                               │
-- │ FR-44           │ Melocotonero Spring Crest                                   │
-- │ FR-46           │ Melocotonero Federica                                       │
-- │ FR-49           │ Parra Uva de Mesa                                           │
-- │ FR-5            │ Mandarino -Plantón joven                                    │
-- │ FR-50           │ Peral Castell                                               │
-- │ FR-51           │ Peral Williams                                              │
-- │ FR-52           │ Peral Conference                                            │
-- │ FR-55           │ Olivo Cipresino                                             │
-- │ FR-59           │ Albaricoquero                                               │
-- │ FR-61           │ Albaricoquero                                               │
-- │ FR-62           │ Albaricoquero                                               │
-- │ FR-63           │ Cerezo                                                      │
-- │ FR-65           │ Cerezo                                                      │
-- │ FR-68           │ Cerezo                                                      │
-- │ FR-70           │ Ciruelo                                                     │
-- │ FR-73           │ Granado                                                     │
-- │ FR-74           │ Granado                                                     │
-- │ FR-76           │ Granado                                                     │
-- │ FR-83           │ Higuera                                                     │
-- │ FR-88           │ Manzano                                                     │
-- │ FR-92           │ Melocotonero                                                │
-- │ FR-93           │ Melocotonero                                                │
-- │ FR-95           │ Melocotonero                                                │
-- │ FR-96           │ Membrillero                                                 │
-- │ FR-97           │ Membrillero                                                 │
-- │ FR-98           │ Membrillero                                                 │
-- │ FR-99           │ Membrillero                                                 │
-- │ OR-001          │ Arbustos Mix Maceta                                         │
-- │ OR-100          │ Mimosa Injerto CLASICA Dealbata                             │
-- │ OR-103          │ Mimosa Semilla Bayleyana                                    │
-- │ OR-105          │ Mimosa Semilla Espectabilis                                 │
-- │ OR-106          │ Mimosa Semilla Longifolia                                   │
-- │ OR-107          │ Mimosa Semilla Floribunda 4 estaciones                      │
-- │ OR-108          │ Abelia Floribunda                                           │
-- │ OR-109          │ Callistemom (Mix)                                           │
-- │ OR-110          │ Callistemom (Mix)                                           │
-- │ OR-111          │ Corylus Avellana \"Contorta\"                               │
-- │ OR-112          │ Escallonia (Mix)                                            │
-- │ OR-113          │ Evonimus Emerald Gayeti                                     │
-- │ OR-114          │ Evonimus Pulchellus                                         │
-- │ OR-117          │ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                │
-- │ OR-118          │ Hibiscus Syriacus \"Pink Giant\" Rosa                       │
-- │ OR-121          │ Lonicera Nitida \"Maigrum\"                                 │
-- │ OR-124          │ Prunus pisardii                                             │
-- │ OR-126          │ Weigelia \"Bristol Ruby\"                                   │
-- │ OR-131          │ Leptospermum formado PIRAMIDE                               │
-- │ OR-132          │ Leptospermum COPA                                           │
-- │ OR-133          │ Nerium oleander-CALIDAD \"GARDEN\"                          │
-- │ OR-134          │ Nerium Oleander Arbusto GRANDE                              │
-- │ OR-135          │ Nerium oleander COPA  Calibre 6/8                           │
-- │ OR-137          │ ROSAL TREPADOR                                              │
-- │ OR-138          │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
-- │ OR-142          │ Solanum Jazminoide                                          │
-- │ OR-143          │ Wisteria Sinensis  azul, rosa, blanca                       │
-- │ OR-144          │ Wisteria Sinensis INJERTADAS DECÃ"                          │
-- │ OR-145          │ Bougamvillea Sanderiana Tutor                               │
-- │ OR-148          │ Bougamvillea Sanderiana Espaldera                           │
-- │ OR-149          │ Bougamvillea Sanderiana Espaldera                           │
-- │ OR-151          │ Bougamvillea Sanderiana, 3 tut. piramide                    │
-- │ OR-153          │ Expositor Árboles clima mediterráneo                        │
-- │ OR-154          │ Expositor Árboles borde del mar                             │
-- │ OR-158          │ Brachychiton Acerifolius                                    │
-- │ OR-161          │ Cassia Corimbosa                                            │
-- │ OR-162          │ Cassia Corimbosa                                            │
-- │ OR-163          │ Chitalpa Summer Bells                                       │
-- │ OR-164          │ Erytrina Kafra                                              │
-- │ OR-166          │ Eucalyptus Citriodora                                       │
-- │ OR-167          │ Eucalyptus Ficifolia                                        │
-- │ OR-169          │ Hibiscus Syriacus  Var. Injertadas 1 Tallo                  │
-- │ OR-170          │ Lagunaria Patersonii                                        │
-- │ OR-171          │ Lagunaria Patersonii                                        │
-- │ OR-173          │ Morus Alba                                                  │
-- │ OR-175          │ Platanus Acerifolia                                         │
-- │ OR-178          │ Salix Babylonica  Pendula                                   │
-- │ OR-180          │ Tamarix  Ramosissima Pink Cascade                           │
-- │ OR-182          │ Tecoma Stands                                               │
-- │ OR-183          │ Tecoma Stands                                               │
-- │ OR-184          │ Tipuana Tipu                                                │
-- │ OR-185          │ Pleioblastus distichus-Bambú enano                          │
-- │ OR-187          │ Sasa palmata                                                │
-- │ OR-189          │ Phylostachys aurea                                          │
-- │ OR-190          │ Phylostachys aurea                                          │
-- │ OR-191          │ Phylostachys Bambusa Spectabilis                            │
-- │ OR-192          │ Phylostachys biseti                                         │
-- │ OR-194          │ Pseudosasa japonica (Metake)                                │
-- │ OR-195          │ Pseudosasa japonica (Metake)                                │
-- │ OR-197          │ Cedrus Deodara \"Feeling Blue\" Novedad                     │
-- │ OR-198          │ Juniperus chinensis \"Blue Alps\"                           │
-- │ OR-199          │ Juniperus Chinensis Stricta                                 │
-- │ OR-201          │ Juniperus squamata \"Blue Star\"                            │
-- │ OR-202          │ Juniperus x media Phitzeriana verde                         │
-- │ OR-212          │ Bismarckia Nobilis                                          │
-- │ OR-215          │ Brahea Armata                                               │
-- │ OR-216          │ Brahea Edulis                                               │
-- │ OR-219          │ Butia Capitata                                              │
-- │ OR-220          │ Butia Capitata                                              │
-- │ OR-221          │ Butia Capitata                                              │
-- │ OR-223          │ Chamaerops Humilis                                          │
-- │ OR-224          │ Chamaerops Humilis                                          │
-- │ OR-228          │ Chamaerops Humilis \"Cerifera\"                             │
-- │ OR-229          │ Chrysalidocarpus Lutescens -ARECA                           │
-- │ OR-230          │ Cordyline Australis -DRACAENA                               │
-- │ OR-231          │ Cycas Revoluta                                              │
-- │ OR-232          │ Cycas Revoluta                                              │
-- │ OR-233          │ Dracaena Drago                                              │
-- │ OR-235          │ Dracaena Drago                                              │
-- │ OR-238          │ Livistonia Decipiens                                        │
-- │ OR-239          │ Livistonia Decipiens                                        │
-- │ OR-242          │ Rhaphis Excelsa                                             │
-- │ OR-244          │ Sabal Minor                                                 │
-- │ OR-245          │ Sabal Minor                                                 │
-- │ OR-246          │ Trachycarpus Fortunei                                       │
-- │ OR-248          │ Washingtonia Robusta                                        │
-- │ OR-251          │ Zamia Furfuracaea                                           │
-- └─────────────────┴─────────────────────────────────────────────────────────────┘

-- 76. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

sqlite> select p.codigo_producto,  p.nombre from producto as p where exists (select * from detalle_pedido where p.codigo_producto=detalle_pedido.codigo_producto);     

-- ┌─────────────────┬─────────────────────────────────────────────────────────────┐
-- │ codigo_producto │                           nombre                            │
-- ├─────────────────┼─────────────────────────────────────────────────────────────┤
-- │ 11679           │ Sierra de Poda 400MM                                        │
-- │ 21636           │ Pala                                                        │
-- │ 22225           │ Rastrillo de Jardín                                         │
-- │ 30310           │ Azadón                                                      │
-- │ AR-001          │ Ajedrea                                                     │
-- │ AR-002          │ Lavándula Dentata                                           │
-- │ AR-003          │ Mejorana                                                    │
-- │ AR-004          │ Melissa                                                     │
-- │ AR-005          │ Mentha Sativa                                               │
-- │ AR-006          │ Petrosilium Hortense (Peregil)                              │
-- │ AR-007          │ Salvia Mix                                                  │
-- │ AR-008          │ Thymus Citriodra (Tomillo limón)                            │
-- │ AR-009          │ Thymus Vulgaris                                             │
-- │ AR-010          │ Santolina Chamaecyparys                                     │
-- │ FR-1            │ Expositor Cítricos Mix                                      │
-- │ FR-10           │ Limonero 2 años injerto                                     │
-- │ FR-100          │ Nectarina                                                   │
-- │ FR-101          │ Nogal                                                       │
-- │ FR-102          │ Olea-Olivos                                                 │
-- │ FR-103          │ Olea-Olivos                                                 │
-- │ FR-105          │ Olea-Olivos                                                 │
-- │ FR-106          │ Peral                                                       │
-- │ FR-107          │ Peral                                                       │
-- │ FR-108          │ Peral                                                       │
-- │ FR-11           │ Limonero 30/40                                              │
-- │ FR-12           │ Kunquat                                                     │
-- │ FR-13           │ Kunquat  EXTRA con FRUTA                                    │
-- │ FR-15           │ Calamondin Copa                                             │
-- │ FR-16           │ Calamondin Copa EXTRA Con FRUTA                             │
-- │ FR-17           │ Rosal bajo 1Âª -En maceta-inicio brotación                  │
-- │ FR-18           │ ROSAL TREPADOR                                              │
-- │ FR-2            │ Naranjo -Plantón joven 1 año injerto                        │
-- │ FR-22           │ Pitimini rojo                                               │
-- │ FR-23           │ Rosal copa                                                  │
-- │ FR-29           │ Cerezo Napoleón                                             │
-- │ FR-3            │ Naranjo 2 años injerto                                      │
-- │ FR-31           │ Ciruelo Santa Rosa                                          │
-- │ FR-33           │ Ciruelo Friar                                               │
-- │ FR-34           │ Ciruelo Reina C. De Ollins                                  │
-- │ FR-36           │ Granado Mollar de Elche                                     │
-- │ FR-37           │ Higuera Napolitana                                          │
-- │ FR-4            │ Naranjo calibre 8/10                                        │
-- │ FR-40           │ Manzano Starking Delicious                                  │
-- │ FR-41           │ Manzano Reineta                                             │
-- │ FR-42           │ Manzano Golden Delicious                                    │
-- │ FR-43           │ Membrillero Gigante de Wranja                               │
-- │ FR-45           │ Melocotonero Amarillo de Agosto                             │
-- │ FR-47           │ Melocotonero Paraguayo                                      │
-- │ FR-48           │ Nogal Común                                                 │
-- │ FR-53           │ Peral Blanq. de Aranjuez                                    │
-- │ FR-54           │ Níspero Tanaca                                              │
-- │ FR-56           │ Nectarina                                                   │
-- │ FR-57           │ Kaki Rojo Brillante                                         │
-- │ FR-58           │ Albaricoquero                                               │
-- │ FR-6            │ Mandarino 2 años injerto                                    │
-- │ FR-60           │ Albaricoquero                                               │
-- │ FR-64           │ Cerezo                                                      │
-- │ FR-66           │ Cerezo                                                      │
-- │ FR-67           │ Cerezo                                                      │
-- │ FR-69           │ Cerezo                                                      │
-- │ FR-7            │ Mandarino calibre 8/10                                      │
-- │ FR-71           │ Ciruelo                                                     │
-- │ FR-72           │ Ciruelo                                                     │
-- │ FR-75           │ Granado                                                     │
-- │ FR-77           │ Granado                                                     │
-- │ FR-78           │ Higuera                                                     │
-- │ FR-79           │ Higuera                                                     │
-- │ FR-8            │ Limonero -Plantón joven                                     │
-- │ FR-80           │ Higuera                                                     │
-- │ FR-81           │ Higuera                                                     │
-- │ FR-82           │ Higuera                                                     │
-- │ FR-84           │ Kaki                                                        │
-- │ FR-85           │ Kaki                                                        │
-- │ FR-86           │ Manzano                                                     │
-- │ FR-87           │ Manzano                                                     │
-- │ FR-89           │ Manzano                                                     │
-- │ FR-9            │ Limonero calibre 8/10                                       │
-- │ FR-90           │ Níspero                                                     │
-- │ FR-91           │ Níspero                                                     │
-- │ FR-94           │ Melocotonero                                                │
-- │ OR-101          │ Expositor Mimosa Semilla Mix                                │
-- │ OR-102          │ Mimosa Semilla Bayleyana                                    │
-- │ OR-104          │ Mimosa Semilla Cyanophylla                                  │
-- │ OR-115          │ Forsytia Intermedia \"Lynwood\"                             │
-- │ OR-116          │ Hibiscus Syriacus  \"Diana\" -Blanco Puro                   │
-- │ OR-119          │ Laurus Nobilis Arbusto - Ramificado Bajo                    │
-- │ OR-120          │ Lonicera Nitida                                             │
-- │ OR-122          │ Lonicera Pileata                                            │
-- │ OR-123          │ Philadelphus \"Virginal\"                                   │
-- │ OR-125          │ Viburnum Tinus \"Eve Price\"                                │
-- │ OR-127          │ Camelia japonica                                            │
-- │ OR-128          │ Camelia japonica ejemplar                                   │
-- │ OR-129          │ Camelia japonica ejemplar                                   │
-- │ OR-130          │ Callistemom COPA                                            │
-- │ OR-136          │ Nerium oleander ARBOL Calibre 8/10                          │
-- │ OR-139          │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │
-- │ OR-140          │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │
-- │ OR-141          │ Pitimini rojo                                               │
-- │ OR-146          │ Bougamvillea Sanderiana Tutor                               │
-- │ OR-147          │ Bougamvillea Sanderiana Tutor                               │
-- │ OR-150          │ Bougamvillea roja, naranja                                  │
-- │ OR-152          │ Expositor Árboles clima continental                         │
-- │ OR-155          │ Acer Negundo                                                │
-- │ OR-156          │ Acer platanoides                                            │
-- │ OR-157          │ Acer Pseudoplatanus                                         │
-- │ OR-159          │ Brachychiton Discolor                                       │
-- │ OR-160          │ Brachychiton Rupestris                                      │
-- │ OR-165          │ Erytrina Kafra                                              │
-- │ OR-168          │ Eucalyptus Ficifolia                                        │
-- │ OR-172          │ Lagunaria patersonii  calibre 8/10                          │
-- │ OR-174          │ Morus Alba  calibre 8/10                                    │
-- │ OR-176          │ Prunus pisardii                                             │
-- │ OR-177          │ Robinia Pseudoacacia Casque Rouge                           │
-- │ OR-179          │ Sesbania Punicea                                            │
-- │ OR-181          │ Tamarix  Ramosissima Pink Cascade                           │
-- │ OR-186          │ Sasa palmata                                                │
-- │ OR-188          │ Sasa palmata                                                │
-- │ OR-193          │ Phylostachys biseti                                         │
-- │ OR-196          │ Cedrus Deodara                                              │
-- │ OR-200          │ Juniperus horizontalis Wiltonii                             │
-- │ OR-203          │ Pinus Canariensis                                           │
-- │ OR-204          │ Pinus Halepensis                                            │
-- │ OR-205          │ Pinus Pinea -Pino Piñonero                                  │
-- │ OR-206          │ Thuja Esmeralda                                             │
-- │ OR-207          │ Tuja Occidentalis Woodwardii                                │
-- │ OR-208          │ Tuja orientalis \"Aurea nana\"                              │
-- │ OR-209          │ Archontophoenix Cunninghamiana                              │
-- │ OR-210          │ Beucarnea Recurvata                                         │
-- │ OR-211          │ Beucarnea Recurvata                                         │
-- │ OR-213          │ Bismarckia Nobilis                                          │
-- │ OR-214          │ Brahea Armata                                               │
-- │ OR-217          │ Brahea Edulis                                               │
-- │ OR-218          │ Butia Capitata                                              │
-- │ OR-222          │ Butia Capitata                                              │
-- │ OR-225          │ Chamaerops Humilis                                          │
-- │ OR-226          │ Chamaerops Humilis                                          │
-- │ OR-227          │ Chamaerops Humilis                                          │
-- │ OR-234          │ Dracaena Drago                                              │
-- │ OR-236          │ Jubaea Chilensis                                            │
-- │ OR-237          │ Livistonia Australis                                        │
-- │ OR-240          │ Phoenix Canariensis                                         │
-- │ OR-241          │ Phoenix Canariensis                                         │
-- │ OR-243          │ Rhaphis Humilis                                             │
-- │ OR-247          │ Trachycarpus Fortunei                                       │
-- │ OR-249          │ Washingtonia Robusta                                        │
-- │ OR-250          │ Yucca Jewel                                                 │
-- │ OR-99           │ Mimosa DEALBATA Gaulois Astier                              │
-- └─────────────────┴─────────────────────────────────────────────────────────────┘

-- ## Subconsultas correlacionadas

-- 77. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

sqlite> select distinct c.nombre_cliente, (select count(codigo_pedido) from pedido where pedido.codigo_cliente=c.codigo_cliente) from cliente as c, pedido as p where c.codigo_cliente=p.codigo_cliente  
   ...> ;

-- ┌────────────────────────────────┬──────────────────────────────────────────────────────────────┐
-- │         nombre_cliente         │ (select count(codigo_pedido) from pedido where pedido.codigo │
-- ├────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ Tendo Garden                   │ 5                                                            │
-- │ GoldFish Garden                │ 11                                                           │
-- │ Gardening Associates           │ 9                                                            │
-- │ Beragua                        │ 5                                                            │
-- │ Naturagua                      │ 5                                                            │
-- │ Dardena S.A.                   │ 5                                                            │
-- │ Camunas Jardines S.L.          │ 5                                                            │
-- │ Gerudo Valley                  │ 5                                                            │
-- │ Golf S.A.                      │ 5                                                            │
-- │ Sotogrande                     │ 5                                                            │
-- │ Jardines y Mansiones Cactus SL │ 5                                                            │
-- │ Jardin de Flores               │ 5                                                            │
-- │ Agrojardin                     │ 5                                                            │
-- │ Tutifruti S.A                  │ 5                                                            │
-- │ Jardinerías Matías SL          │ 5                                                            │
-- │ Flores Marivi                  │ 10                                                           │
-- │ Jardineria Sara                │ 10                                                           │
-- │ El Jardin Viviente S.L         │ 5                                                            │
-- │ Flores S.L.                    │ 5                                                            │
-- └────────────────────────────────┴──────────────────────────────────────────────────────────────┘

-- 78. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

sqlite> select c.nombre_cliente, coalesce((select sum(total) from pago where pago.codigo_cliente=c.codigo_cliente),0) from cliente as c;

-- ┌────────────────────────────────┬──────────────────────────────────────────────────────────────┐
-- │         nombre_cliente         │ coalesce((select sum(total) from pago where pago.codigo_clie │
-- ├────────────────────────────────┼──────────────────────────────────────────────────────────────┤
-- │ GoldFish Garden                │ 4000.0                                                       │
-- │ Gardening Associates           │ 10926.0                                                      │
-- │ Gerudo Valley                  │ 81849.0                                                      │
-- │ Tendo Garden                   │ 23794.0                                                      │
-- │ Lasas S.A.                     │ 0                                                            │
-- │ Beragua                        │ 2390.0                                                       │
-- │ Club Golf Puerta del hierro    │ 0                                                            │
-- │ Naturagua                      │ 929.0                                                        │
-- │ DaraDistribuciones             │ 0                                                            │
-- │ Madrileña de riegos            │ 0                                                            │
-- │ Lasas S.A.                     │ 0                                                            │
-- │ Camunas Jardines S.L.          │ 2246.0                                                       │
-- │ Dardena S.A.                   │ 4160.0                                                       │
-- │ Jardin de Flores               │ 12081.0                                                      │
-- │ Flores Marivi                  │ 4399.0                                                       │
-- │ Flowers, S.A                   │ 0                                                            │
-- │ Naturajardin                   │ 0                                                            │
-- │ Golf S.A.                      │ 232.0                                                        │
-- │ Americh Golf Management SL     │ 0                                                            │
-- │ Aloha                          │ 0                                                            │
-- │ El Prat                        │ 0                                                            │
-- │ Sotogrande                     │ 272.0                                                        │
-- │ Vivero Humanes                 │ 0                                                            │
-- │ Fuenla City                    │ 0                                                            │
-- │ Jardines y Mansiones Cactus SL │ 18846.0                                                      │
-- │ Jardinerías Matías SL          │ 10972.0                                                      │
-- │ Agrojardin                     │ 8489.0                                                       │
-- │ Top Campo                      │ 0                                                            │
-- │ Jardineria Sara                │ 7863.0                                                       │
-- │ Campohermoso                   │ 0                                                            │
-- │ france telecom                 │ 0                                                            │
-- │ Musée du Louvre                │ 0                                                            │
-- │ Tutifruti S.A                  │ 3321.0                                                       │
-- │ Flores S.L.                    │ 0                                                            │
-- │ The Magic Garden               │ 0                                                            │
-- │ El Jardin Viviente S.L         │ 1171.0                                                       │
-- └────────────────────────────────┴──────────────────────────────────────────────────────────────┘

-- 79. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

sqlite> select codigo_cliente, c.nombre_cliente from cliente as c where c.codigo_cliente=(select codigo_cliente from pedido where c.codigo_cliente=pedido.codigo_cliente and fecha_pedido regexp "^2008");

-- ┌────────────────┬────────────────────────────────┐
-- │ codigo_cliente │         nombre_cliente         │
-- ├────────────────┼────────────────────────────────┤
-- │ 1              │ GoldFish Garden                │
-- │ 4              │ Gerudo Valley                  │
-- │ 5              │ Tendo Garden                   │
-- │ 13             │ Camunas Jardines S.L.          │
-- │ 14             │ Dardena S.A.                   │
-- │ 15             │ Jardin de Flores               │
-- │ 16             │ Flores Marivi                  │
-- │ 26             │ Jardines y Mansiones Cactus SL │
-- │ 35             │ Tutifruti S.A                  │
-- │ 36             │ Flores S.L.                    │
-- │ 38             │ El Jardin Viviente S.L         │
-- └────────────────┴────────────────────────────────┘

-- 80. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas,
-- de aquellos clientes que no hayan realizado ningún pago.

sqlite> select c.codigo_cliente, c.nombre_cliente, e.nombre, e.apellido1, o.telefono from cliente as c, empleado as e, oficina as o where c.codigo_empleado_rep_ventas=e.codigo_empleado and o.codigo_oficina=e.codigo_oficina and c.codigo_cliente not in (select codigo_cliente from pago);
-- ┌────────────────┬─────────────────────────────┬─────────────┬────────────┬─────────────────┐
-- │ codigo_cliente │       nombre_cliente        │   nombre    │ apellido1  │    telefono     │
-- ├────────────────┼─────────────────────────────┼─────────────┼────────────┼─────────────────┤
-- │ 6              │ Lasas S.A.                  │ Mariano     │ López      │ +34 91 7514487  │
-- │ 8              │ Club Golf Puerta del hierro │ Emmanuel    │ Magaña     │ +34 93 3561182  │
-- │ 10             │ DaraDistribuciones          │ Emmanuel    │ Magaña     │ +34 93 3561182  │
-- │ 11             │ Madrileña de riegos         │ Emmanuel    │ Magaña     │ +34 93 3561182  │
-- │ 12             │ Lasas S.A.                  │ Mariano     │ López      │ +34 91 7514487  │
-- │ 17             │ Flowers, S.A                │ Felipe      │ Rosas      │ +34 925 867231  │
-- │ 18             │ Naturajardin                │ Julian      │ Bellinelli │ +61 2 9264 2451 │
-- │ 20             │ Americh Golf Management SL  │ José Manuel │ Martinez   │ +34 93 3561182  │
-- │ 21             │ Aloha                       │ José Manuel │ Martinez   │ +34 93 3561182  │
-- │ 22             │ El Prat                     │ José Manuel │ Martinez   │ +34 93 3561182  │
-- │ 24             │ Vivero Humanes              │ Julian      │ Bellinelli │ +61 2 9264 2451 │
-- │ 25             │ Fuenla City                 │ Felipe      │ Rosas      │ +34 925 867231  │
-- │ 29             │ Top Campo                   │ Felipe      │ Rosas      │ +34 925 867231  │
-- │ 31             │ Campohermoso                │ Julian      │ Bellinelli │ +61 2 9264 2451 │
-- │ 32             │ france telecom              │ Lionel      │ Narvaez    │ +33 14 723 4404 │
-- │ 33             │ Musée du Louvre             │ Lionel      │ Narvaez    │ +33 14 723 4404 │
-- │ 36             │ Flores S.L.                 │ Michael     │ Bolton     │ +1 650 219 4782 │
-- │ 37             │ The Magic Garden            │ Michael     │ Bolton     │ +1 650 219 4782 │
-- └────────────────┴─────────────────────────────┴─────────────┴────────────┴─────────────────┘
-- 81. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.

sqlite> select c.codigo_cliente, c.nombre_cliente, e.nombre, e.apellido1, o.ciudad from cliente as c, empleado as e, oficina as o where c.codigo_empleado_rep_ventas=e.codigo_empleado and o.codigo_oficina=e.codigo_oficina;

-- ┌────────────────┬────────────────────────────────┬─────────────────┬────────────┬──────────────────────┐
-- │ codigo_cliente │         nombre_cliente         │     nombre      │ apellido1  │        ciudad        │
-- ├────────────────┼────────────────────────────────┼─────────────────┼────────────┼──────────────────────┤
-- │ 1              │ GoldFish Garden                │ Walter Santiago │ Sanchez    │ San Francisco        │
-- │ 3              │ Gardening Associates           │ Walter Santiago │ Sanchez    │ San Francisco        │
-- │ 4              │ Gerudo Valley                  │ Lorena          │ Paxton     │ Boston               │
-- │ 5              │ Tendo Garden                   │ Lorena          │ Paxton     │ Boston               │
-- │ 6              │ Lasas S.A.                     │ Mariano         │ López      │ Madrid               │
-- │ 7              │ Beragua                        │ Emmanuel        │ Magaña     │ Barcelona            │
-- │ 8              │ Club Golf Puerta del hierro    │ Emmanuel        │ Magaña     │ Barcelona            │
-- │ 9              │ Naturagua                      │ Emmanuel        │ Magaña     │ Barcelona            │
-- │ 10             │ DaraDistribuciones             │ Emmanuel        │ Magaña     │ Barcelona            │
-- │ 11             │ Madrileña de riegos            │ Emmanuel        │ Magaña     │ Barcelona            │
-- │ 12             │ Lasas S.A.                     │ Mariano         │ López      │ Madrid               │
-- │ 13             │ Camunas Jardines S.L.          │ Mariano         │ López      │ Madrid               │
-- │ 14             │ Dardena S.A.                   │ Mariano         │ López      │ Madrid               │
-- │ 15             │ Jardin de Flores               │ Julian          │ Bellinelli │ Sydney               │
-- │ 16             │ Flores Marivi                  │ Felipe          │ Rosas      │ Talavera de la Reina │
-- │ 17             │ Flowers, S.A                   │ Felipe          │ Rosas      │ Talavera de la Reina │
-- │ 18             │ Naturajardin                   │ Julian          │ Bellinelli │ Sydney               │
-- │ 19             │ Golf S.A.                      │ José Manuel     │ Martinez   │ Barcelona            │
-- │ 20             │ Americh Golf Management SL     │ José Manuel     │ Martinez   │ Barcelona            │
-- │ 21             │ Aloha                          │ José Manuel     │ Martinez   │ Barcelona            │
-- │ 22             │ El Prat                        │ José Manuel     │ Martinez   │ Barcelona            │
-- │ 23             │ Sotogrande                     │ José Manuel     │ Martinez   │ Barcelona            │
-- │ 24             │ Vivero Humanes                 │ Julian          │ Bellinelli │ Sydney               │
-- │ 25             │ Fuenla City                    │ Felipe          │ Rosas      │ Talavera de la Reina │
-- │ 26             │ Jardines y Mansiones Cactus SL │ Lucio           │ Campoamor  │ Madrid               │
-- │ 27             │ Jardinerías Matías SL          │ Lucio           │ Campoamor  │ Madrid               │
-- │ 28             │ Agrojardin                     │ Julian          │ Bellinelli │ Sydney               │
-- │ 29             │ Top Campo                      │ Felipe          │ Rosas      │ Talavera de la Reina │
-- │ 30             │ Jardineria Sara                │ Felipe          │ Rosas      │ Talavera de la Reina │
-- │ 31             │ Campohermoso                   │ Julian          │ Bellinelli │ Sydney               │
-- │ 32             │ france telecom                 │ Lionel          │ Narvaez    │ Paris                │
-- │ 33             │ Musée du Louvre                │ Lionel          │ Narvaez    │ Paris                │
-- │ 35             │ Tutifruti S.A                  │ Mariko          │ Kishi      │ Sydney               │
-- │ 36             │ Flores S.L.                    │ Michael         │ Bolton     │ San Francisco        │
-- │ 37             │ The Magic Garden               │ Michael         │ Bolton     │ San Francisco        │
-- │ 38             │ El Jardin Viviente S.L         │ Mariko          │ Kishi      │ Sydney               │
-- └────────────────┴────────────────────────────────┴─────────────────┴────────────┴──────────────────────┘

-- 82. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

sqlite> select e.nombre,e.apellido1,e.apellido2,e.puesto,o.telefono from empleado as e, oficina as o where e.codigo_oficina=o.codigo_oficina and e.codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);      

-- ┌─────────────┬────────────┬───────────┬───────────────────────┬─────────────────┐
-- │   nombre    │ apellido1  │ apellido2 │        puesto         │    telefono     │
-- ├─────────────┼────────────┼───────────┼───────────────────────┼─────────────────┤
-- │ Marcos      │ Magaña     │ Perez     │ Director General      │ +34 925 867231  │
-- │ Ruben       │ López      │ Martinez  │ Subdirector Marketing │ +34 925 867231  │
-- │ Alberto     │ Soria      │ Carrasco  │ Subdirector Ventas    │ +34 925 867231  │
-- │ Maria       │ Solís      │ Jerez     │ Secretaria            │ +34 925 867231  │
-- │ Juan Carlos │ Ortiz      │ Serrano   │ Representante Ventas  │ +34 925 867231  │
-- │ Carlos      │ Soria      │ Jimenez   │ Director Oficina      │ +34 91 7514487  │
-- │ Hilario     │ Rodriguez  │ Huertas   │ Representante Ventas  │ +34 91 7514487  │
-- │ David       │ Palma      │ Aceituno  │ Representante Ventas  │ +34 93 3561182  │
-- │ Oscar       │ Palma      │ Aceituno  │ Representante Ventas  │ +34 93 3561182  │
-- │ Francois    │ Fignon     │           │ Director Oficina      │ +33 14 723 4404 │
-- │ Laurent     │ Serra      │           │ Representante Ventas  │ +33 14 723 4404 │
-- │ Hilary      │ Washington │           │ Director Oficina      │ +1 215 837 0825 │
-- │ Marcus      │ Paxton     │           │ Representante Ventas  │ +1 215 837 0825 │
-- │ Nei         │ Nishikori  │           │ Director Oficina      │ +81 33 224 5000 │
-- │ Narumi      │ Riko       │           │ Representante Ventas  │ +81 33 224 5000 │
-- │ Takuma      │ Nomura     │           │ Representante Ventas  │ +81 33 224 5000 │
-- │ Amy         │ Johnson    │           │ Director Oficina      │ +44 20 78772041 │
-- │ Larry       │ Westfalls  │           │ Representante Ventas  │ +44 20 78772041 │
-- │ John        │ Walton     │           │ Representante Ventas  │ +44 20 78772041 │
-- │ Kevin       │ Fallmer    │           │ Director Oficina      │ +61 2 9264 2451 │
-- └─────────────┴────────────┴───────────┴───────────────────────┴─────────────────┘

-- 83. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

sqlite> select o.ciudad, (select count(codigo_empleado) from empleado where empleado.codigo_oficina=o.codigo_oficina) as cantidad from oficina as o;                                                       

-- ┌──────────────────────┬──────────┐
-- │        ciudad        │ cantidad │
-- ├──────────────────────┼──────────┤
-- │ Barcelona            │ 4        │
-- │ Boston               │ 3        │
-- │ Londres              │ 3        │
-- │ Madrid               │ 4        │
-- │ Paris                │ 3        │
-- │ San Francisco        │ 2        │
-- │ Sydney               │ 3        │
-- │ Talavera de la Reina │ 6        │
-- │ Tokyo                │ 3        │
-- └──────────────────────┴──────────┘