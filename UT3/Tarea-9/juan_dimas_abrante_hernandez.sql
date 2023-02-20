sqlite> create table cientifico (
   ...> id text, 
   ...> nombre text, 
   ...> apellido1 text, 
   ...> apellido2 text,
   ...> primary key (id)
   ...> );

sqlite> create table proyecto (
   ...> id text, 
   ...> nombre text, 
   ...> horas int, 
   ...> primary key (id)
   ...> );

sqlite> create table cientifico_proyecto (
   ...> ref_cientifico text references cientifico(id),
   ...> ref_proyecto text references proyecto(id),
   ...> primary key (ref_cientifico,ref_proyecto)
   ...> );


-- Insert 

-- Sacar una relación completa de los científicos asignados a cada proyecto. Mostrar DNI, Nombre del científico, identificador del proyecto y nombre del proyecto.

SELECT c.dni, c.nombre, p.id, p.nombre FROM cientificos as c, proyecto as p, cientifico_proyecto as a WHERE c.dni=a.clave_cientifico and p.id=a.clave_proyecto;

-- Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el nombre).

select c.id,c.nombre, count(cp.ref_proyecto) from cientifico as c, proyecto as p, cientifico_proyecto as cp where c.id=cp.ref_cientifico and p.id=cp.ref_proyecto group by c.id;

-- Obtener el numero de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto).

SELECT p.id, p.nombre, count(cp.ref_cientifico) FROM proyecto as p, cientifico_proyecto as cp WHERE p.id=cp.ref_proyecto GROUP BY p.id;

-- Obtener el número de horas de dedicación de cada científico.

SELECT c.nombre, c.apellido1, c.apellido2, sum(p.horas) FROM cientifico as c, proyecto as p, cientifico_proyecto as cp WHERE c.id=cp.ref_cientifico and p.id=cp.ref_proyecto GROUP BY c.id;

-- Obtener el DNI y nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media a cada proyecto sea superior __ a un número de horas superior a 10, por ejemplo 11 horas__.

SELECT c.id, c.nombre FROM cientifico as c, proyecto as p, cientifico_proyecto as cp  WHERE c.id=cp.ref_cientifico and p.id=cp.ref_proyecto GROUP BY c.id HAVING count(p.id) > 1 and c.id in (SELECT c.id FROM cientifico as c, proyecto as p, cientifico_proyecto as cp WHERE c.id=cp.ref_cientifico and p.id=cp.ref_proyecto GROUP BY c.id HAVING avg(p.horas) > 10);
