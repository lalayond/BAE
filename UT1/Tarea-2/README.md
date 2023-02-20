  <div align="center">

  # Estrategia y gestores de bases de datos
</div>
  <div align="justify">

Una base de datos se define como todo aquel programa capaz de almacenar una gran cantidad de datos, relaciones y estructurados los  pueden ser consultados.

Existe una gran variedad de bases de datos y la elección dependerá en gran medida de las necesidades del consumidor. Dentro de todas las disponibles encontramos: 

- MySQL

- SQLServer

- Oracle

- Microsoft Access

- PostgreSQL

- H2

- FireBird

- MongoDB

- Redis

- IBM Db2

A continuación se definirá cada una de las características de cada uno de estas bases de datos.

## <p>[<span style="color:white" > MySQL </span>](https://www.mysql.com/)</p>

<br>
<br>
<div align="center">
<img style="margin:3em" src="img/MySQL.png" width="300">
</div>
<br>
<br>

MySQL es un sistema de gestión de bases de datos relacional desarrollado bajo licencia dual: Licencia pública general/Licencia comercial por Oracle Corporation y está considerada como la base de datos de código abierto más popular del mundo,​ y una de las más populares en general junto a Oracle y Microsoft SQL Server, todo para entornos de desarrollo web.

Hay que tener en cuenta pues que el lenguaje soportado por MySQL es SQL, siendo este un lenguaje de consulta estructurado. Así pues las sentencias correspondientes a este son:

Sentencias DDL (Utilizadas para la creación de la base de datos y todos sus componentes):

- Alter procedure: Recompilar un procedimiento almacenado.

- Alter Table: Añadir o redefinir una columna, modificar la asignación de almacenamiento.

- Analyze: Recoger estadísticas de rendimiento sobre los objetos de la BD para utilizarlas en el optimizador basado en costes.

- Create Table: Crear una tabla.

- Create Index: Crear un índice.

- Drop Table: Eliminar una tabla.

- Drop Index: Eliminar un índice.

- Grant: Conceder privilegios o papeles, roles, a un usuario o a otro rol.

- Truncate: Eliminar todas las filas de una tabla.

- Revoke: Retirar los privilegios de un usuario o rol de la base de datos. 

Sentencias DML (utilizadas para insertar, borrar, modificar y consultar los datos de una base de datos):

- Insert:	Añadir filas de datos a una tabla.

- Delete: 	Eliminar filas de datos de una tabla.

- Update: 	Modificar los datos de una tabla.

- Select: 	Recuperar datos de una tabla.

- Commit: 	Confirmar como permamentes las modificaciones realizadas.

- Rollback: 	Deshacer todas las modificaciones realizadas desde la última confirmación. 


Las bases de datos pueden permitir ciertos procedimientos de los cuales esta cumple con los dos:

- Procesos de almacenamiento: permite guardar y reutilizar código. 

- Procesos de transacciones: permite agrupar sentencias en bloques, que van a ser ejecutados simultáneamente de tal forma que pueden ser evaluadas si alguna de estas falla pudiendo así remover los cambios sin alterar de forma alguna la propia base de datos. En este caso esto es posible gracias a las tablas InnoDB.

 Además se trata de una base de datos multiplataforma ya que permite su integración en diferentes SO pudiendo ser utiliado en prácticamente todos (Linux, UNIX y Windows).

## <p>[<span style="color:white"> SQLServer </span>](https://www.microsoft.com/es-es/sql-server/sql-server-downloads)
<br>
<br>
<div align="center">
<img style="margin:3em" src="img/SQLServer.jpg" width="300">
</div>
<br>
<br>
Microsoft SQL Server es un sistema de gestión de base de datos relacional, desarrollado por la empresa Microsoft. 

El lenguaje de consulta soportada por SQLServer es Transact-SQL. Así pues las sentencias utilizadas en este son: 

DDL:

- Alter
- Collations
- Create
- DROP
- DOSABLE TRIGGER
- ENABLE TRIGGER
- RENAME
- UPDATE STATISTICS
- TRUNCATE TABLE

DML:

- BULK INSERT
- DELETE
- INSERT
- MERGE
- READTEXT
- SELECT
- UPDATE

SQL Server además soporta procedimientos de almacenado así como transacciones al igual que los sistemas que utilizan SQL como lenguaje de consulta. Cuenta también con la característica de ser multiplataforma estando este disponible para Windows, GNU/Linux desde 2016 y desde 2017 para Docker.

## <p>[<span style="color:white"> Oracle </span>](https://www.oracle.com/es/)
<br>
<br>
<div align="center">
<img style="margin:3em" src="img/Oracle.png" width="300">
</div>
<br>
<br>
Oracle Database es un sistema de gestión de bases de datos relacionales (RDBMS, por sus siglas en inglés) de Oracle, el fabricante estadounidense de software y hardware. Como software de bases de datos, Oracle Database optimiza la gestión y seguridad de los conjuntos de datos creando esquemas estructurados a los que solo pueden acceder administradores autorizados.

Oracle soporta sentencias PL/SQL de tipo consulta, modificación , inserción y borrado. PL/SQL es una extensión de SQL que mantiene sus sentencias.

Además soporta sistemas de almacenamiento y transacciones (oracle es un sistema de bases de datos puramente transaccional). Por otro lado es multiplataforma, pudiendo utilizarse en Windows, Linux (Red Hat Enterprise y SuSe Enterprise) y Solaris.

## <p>[<span style="color:white"> Microsoft Access </span>](https://www.microsoft.com/es-es/microsoft-365/access)
<br>
<br>
<div align="center">
<img style="margin:3em" src="img/MicrosoftAccess.png" width="300">
</div>
<br>
<br>
Microsoft Access es un sistema de gestión de bases de datos incluido en las ediciones profesionales de la suite Microsoft Office, es el sucesor de Embedded Basic.

Access es un gestor de datos que utiliza los conceptos de bases de datos relacionales y pueden manejarse por medio de consultas e informes. Está adaptado para recopilar datos de otras utilidades como Excel, SharePoint, etc.

Microsoft Access soporta setencias SQL al igual que las anteriores, por lo que mantiene sus sentencias.

Así pues este soporta procesos de almacenados y transacciones, pero sin embargo no es multiplataforma, siendo el único sistema Windows.

## <p>[<span style="color:white"> PostgreSQL </span>](https://www.postgresql.org)

<div align="center">
<img style="margin:3em" src="img/PostgresSQL.png" width="300">
</div>

PostgreSQL, también llamado Postgres, es un sistema de gestión de bases de datos relacional orientado a objetos y de código abierto, publicado bajo la licencia PostgreSQL,​ similar a la BSD o la MIT. Está es además de código abierto.

PostgreSQL no tiene un gestor de errores (bugs), haciendo muy difícil conocer el estado de corrección de los mismos.

El lenguaje de consulta al igual que otros sistemas es SQL y por lo tanto usa sus setencias.

Además soporta sistermas de almacenamiento, transacciones y es multiplataforma ( puede ser utilizado en BSD, GNU/Linux, Mac OS X, Windows y Solaris).

## <p>[<span style="color:white"> H2 </span>](https://www.h2database.com/html/main.html)
<br>
<br>
<div align="center">
<img style="margin:3em" src="img/H2.png" width="300">
</div>
<br>
<br>
H2 es un sistema administrador de bases de datos relacionales programado en Java. Puede ser incorporado en aplicaciones Java o ejecutarse de modo cliente-servidor. Una de las características más importantes de H2 es que se puede integrar completamente en aplicaciones Java y acceder a la base de datos lanzando SQL directamente, sin tener que pasar por una conexión a través de sockets.

Así pues como se dice en el párrafo principal el lenguaje de consulta de H2 es SQL y por lo tanto utiliza sus sentencias. 

H2 soporta transacciones y almacenamiento y es multiplataforma, puediendo utilizarse en Windows XP o Vista, Mac OS X y Linux.

## <p>[<span style="color:white"> FireBird </span>](https://firebirdsql.org)
<br>
<br>
<div align="center">
<img style="margin:3em" src="img/Firebird.png" width="300">
</div>
<br>
<br>
Firebird es un sistema de administración de base de datos relacional (o RDBMS) de código abierto, basado en la versión 6 de Interbase, cuyo código fue liberado por Borland en 2000. Su código fue reescrito de C a C++. 

El lenguaje de consultas de FireBird es SQL por lo que este usará sus sentencias.

FireBird soporta almacanmiento y transacciones, así como también es multiplataforma, pudiendo usarse en Windows, Linux, MacOS, HP-UX, AIX, Solaris y más.

## <p>[<span style="color:white"> MongoDB </span>](https://www.mongodb.com)
<br>
<br>
<div align="center">
<img style="margin:3em" src="img/MongoDB.png" width="300">
</div>
<br>
<br>
MongoDB  es un sistema de base de datos NoSQL, orientado a documentos y de código abierto.

En lugar de guardar los datos en tablas, tal y como se hace en las bases de datos relacionales, MongoDB guarda estructuras de datos BSON con un esquema dinámico, haciendo que la integración de los datos en ciertas aplicaciones sea más fácil y rápida.

MongoDB es una base de datos adecuada para su uso en producción y con múltiples funcionalidades. Esta base de datos se utiliza mucho en la industria,​ contando con implantaciones en empresas como MTV Network,​ Craiglist,​ Foursquare.

MongoDB es un sistema NoSQL por lo que no usa filas y columnas habituales asociadas con la gestión de bases de datos relacionales. En su lugar, su arquitectura se basa en colecciones y documentos. La unidad básica de datos consiste en un conjunto de pares clave-valor.

Así pues soporta almacenamiento pero no transacciones. Por otro lado, al igual que muchas anteriores, es multiplataforma, pudiendo usarse en Windows, GNU/Linux, OS X y Solaris.

## <p>[<span style="color:white"> Redis </span>](https://redis.io)
<br>
<br>
<div align="center">
<img style="margin:3em" src="img/Redis.png" width="300">
</div>
<br>
<br>
Redis es un motor de base de datos en memoria, basado en el almacenamiento en tablas de hashes (clave/valor) pero que opcionalmente puede ser usada como una base de datos durable o persistente.

Redis no utiliza un lenguaje de consulta sino una estructura de comandos simples.

Así pues Redis soporta almacenamiento y transacciones así como tambien es multiplataforma, pudiendo ser utilizado en la mayoría de los sistemas POSIX como Linux, * BSD, OS X sin dependencias externas.


## <p>[<span style="color:white"> IBM Db2 </span>](https://www.ibm.com/es-es/db2)
<br>
<br>
<div align="center">
<img style="margin:3em" src="img/IBMDB2.png" width="300">
</div>
<br>
<br>
DB2 es una marca comercial, propiedad de IBM, bajo la cual se comercializa un sistema de gestión de base de datos.

IBM Db2 utiliza como lenguaje de consulta PL/SQL siendo sus setencias las pertenecientes a este (es decir, SQL).

Así pues admite transacciones y almacenamiento, siendo además multiplataforma, pudiendo usarse en un amplio conjunto de sistemas operativos, incluidos z/OS, IBM i, Linux, UNIX y Windows.



## Bibliografía:

https://es.wikipedia.org/wiki/MySQL

https://www.computerweekly.com/es/definicion/MySQL#:~:text=MySQL%20es%20un%20sistema%20de,incluyendo%20Linux%2C%20UNIX%20y%20Windows.

https://www.php.net/manual/es/mysqli.quickstart.stored-procedures.php#:~:text=Las%20bases%20de%20datos%20de,y%20ejecutar%20el%20procedimiento%20almacenado.

https://josejuansanchez.org/bd/unidad-11-teoria/index.html#:~:text=MySQL%20nos%20permite%20realizar%20transacciones,permite%20el%20uso%20de%20transacciones

https://www.computerweekly.com/es/definicion/MySQL#:~:text=MySQL%20es%20un%20sistema%20de,incluyendo%20Linux%2C%20UNIX%20y%20Windows

https://es.wikipedia.org/wiki/Microsoft_SQL_Server

https://blog.mdcloud.es/procedimientos-almacenados-sql-server/#:~:text=Los%20procedimientos%20almacenados%20de%20SQL%20se%20pueden%20usar%20en%20SQL,de%20consultas%20de%20Transact-SQL.

https://learn.microsoft.com/es-es/sql/relational-databases/logs/the-transaction-log-sql-server?view=sql-server-ver16

https://es.wikipedia.org/wiki/Microsoft_SQL_Server

https://www.ionos.es/digitalguide/hosting/cuestiones-tecnicas/oracle-database/#:~:text=Oracle%20Database%20es%20un%20sistema,estadounidense%20de%20software%20y%20hardware.

https://openwebinars.net/blog/oracle-pl-sql-sentencias/

https://elbauldelprogramador.com/introduccion-plsql-transacciones/#:~:text=Oracle%20es%20un%20sistema%20de,el%20conjunto%20de%20sentencias%20SQL.

https://jorgesanchez.net/manuales/abd/instalacion-oracle.html#:~:text=El%20SGBD%20comercial%20Oracle%20sólo,y%20SuSe%20Enterprise%20y%20Solaris.

https://es.wikipedia.org/wiki/Microsoft_Access

https://es.wikipedia.org/wiki/PostgreSQL

https://openwebinars.net/blog/que-es-postgresql/#:~:text=PostgreSQL%20es%20un%20sistema%20gestor,militar%20estadounidense%20con%20participación%20civil.


  </div>




  
