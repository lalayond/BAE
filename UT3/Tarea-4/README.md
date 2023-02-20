<div align="center">

<h1>Creación,inserción,modificación y consultas de una base de datos</h1>

</div>

<div align="justify">

<div>

<div align="center">
<img src="https://tuportaldelempleado.es/wp-content/uploads/empleados-logistica-1240x800.jpg" width="600px"/>
</div>

Dadas las siguientes tablas:

Empleado:
 - dni: texto
 - nombre: texto
 - apellido: texto
 > clave primaria(dni)
 > clave foranea(id)
 - ref_departamento: id_departamento

Departamento:
 - id entero
 - nombre: texto
 - presupuesto: entero
 > clave primaria(id)

Se pide realizar:
</div>

-- sentencia sql de creación de la/s tabla/s de la bbdd

CREATE TABLE departamento (
	id int,
	nombre text, 
	presupuesto int,
    PRIMARY KEY (id)
);

CREATE TABLE empleado (
	dni text, 
	nombre text, 
	apellido text, 
	id_departamento int REFERENCES departamento(id),
	PRIMARY KEY (dni)
);

-- sentencia sql para la inserción de datos



	INSERT INTO departamento VALUES (1,'Matemáticas',60000);
	INSERT INTO departamento VALUES (2,'Informática',70000);
	INSERT INTO departamento VALUES (3,'Biología',80000);
	INSERT INTO departamento VALUES (4,'Edafología',60000);
	INSERT INTO departamento VALUES (5,'Química',80000);
	INSERT INTO departamento VALUES (6,'Psicología',75000);
	INSERT INTO departamento VALUES (7,'Derecho',80000);
	INSERT INTO departamento VALUES (8,'Geología',60000);
	INSERT INTO departamento VALUES (9,'Ingeniería Química',70000);
	INSERT INTO departamento VALUES (10,'Ingeniería Industrial',60000);
	INSERT INTO departamento VALUES (12,'Ingeniería Informática',65000);

	INSERT INTO empleado VALUES ('00000012','Alberto','Vázquez',12);
	INSERT INTO empleado VALUES ('00000001','Pedro','Martín',10);
	INSERT INTO empleado VALUES ('00000002','Luis','Lopez',9);
	INSERT INTO empleado VALUES ('00000003','Dimas','Abrante',8);
	INSERT INTO empleado VALUES ('00000004','Paco','Perez',7);
	INSERT INTO empleado VALUES ('00000005','Noelia','López',6);
	INSERT INTO empleado VALUES ('00000006','Carlos','Garcia',5);
	INSERT INTO empleado VALUES ('00000007','Francisco','López',4);
	INSERT INTO empleado VALUES ('00000008','Peter','Hernandez',3);
	INSERT INTO empleado VALUES ('00000009','Juan','Perez',2);
	INSERT INTO empleado VALUES ('00000011','Esteban','Gonzalez',1);

-- Sentencia sql para cada una de las consultas especificadas.

--- 1. Obtener los apellidos de los empleados.

	SELECT apellido FROM empleado;

--- 2. Obtener los apellidos de los empleados sin repeticiones.

	SELECT DISTINCT apellido FROM empleado;

--- 3. Obtener todos los datos de los empleados que se apellidan López.

	SELECT * FROM empleado WHERE apellido="López";

--- 4. Obtener todos los datos de los empleados que se apellidan López y los que se apellidan Perez.

	SELECT * FROM empleado WHERE apellido in ("López","Perez");

--- 5 Obtener todos los datos de los empleados que trabajan para el departamento 10.

	SELECT * FROM empleado WHERE id_departamento=10;

--- 6 Obtener todos los datos de los empleados que trabajan para el departamento 8 y para el departamento 5.

	SELECT * FROM empleado WHERE id_departamento in (8,5);

--- 7 Obtener todos los datos de los empleados cuyo apellido comience por P.

	SELECT * FROM empleado WHERE apellido like "P%";

--- 8 Obtener el presupuesto total de todos los departamentos.

	SELECT sum(presupuesto) FROM departamento;

--- 9 Obtener el número de empleados en cada departamento.

	SELECT departamento.nombre,count(empleado.dni) FROM departamento,empleado WHERE empleado.id_departamento=departamento.id GROUP BY departamento.nombre;

--- 10 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.

	SELECT e.dni,e.nombre,e.apellido,d.id,d.nombre,d.presupuesto FROM empleado as e, departamento as d WHERE e.id_departamento=d.id; 

--- 11 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento.

	SELECT t1.nombre,t1.apellido,t2.nombre,t2.presupuesto FROM empleado as t1 JOIN departamento as t2 ON t1.id_departamento=t2.id;

--- 12 Obtener los nombres y apellido de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000 €.

	SELECT empleado.nombre, empleado.apellido FROM empleado, departamento WHERE empleado.id_departamento=departamento.id AND presupuesto>60000;

--- 13 Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.

	SELECT * FROM departamento WHERE presupuesto > (SELECT avg(presupuesto) as media FROM departamento);

--- 14 Obtener los nombres (únicamente los nombres) de los departamentos que tiene más de dos empleados.

	SELECT d.nombre FROM empleado as e, departamento as d WHERE d.id=e.id_departamento GROUP BY e.id_departamento HAVING count(e.dni)>2;

--- 15 Añadir un nuevo departamento: “Calidad”, con presupuesto de 40.000 € y código 11.

	INSERT INTO departamento VALUES (11,"Calidad",40000);

--- 16 Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI:00000000.

	INSERT INTO empleado VALUES ('00000000','Esther','Vázquez',11);

--- 17 Calcular un recorte presupuestario del 10 % a todos los departamentos.

	SELECT presupuesto-(10*(presupuesto/100)) FROM departamento;

--- 18 Despedir a todos los empleados que trabajan para el departamento de informática (código 2).

	DELETE FROM empleado WHERE id_departamento=2;

--- 19 Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 €.

	DELETE FROM empleado WHERE id_departamento in (SELECT id FROM departamento WHERE presupuesto>60000);

--- 20 Despedir a todos los empleados.

	DELETE FROM empleado

