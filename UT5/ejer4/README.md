<div align="center">

# Creación de un contenedor Docker con PostgreSQL

</div>

<div align="justify">

## Creación de un contendor sin persistencia

Para lanzar un contenedor Docker con PostgreSQL sin persistencia: 

    sudo docker run -d --rm --name postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 postgres


<div align="center">

<img src="img/1.png">

</div>

## Conectarse ejecutando PostgreSQL usando psql

Para utilizar la herramienta psql

    sudo docker run -it --rm --link postgres:postgres postgres psql -h postgres -U postgres

<div align="center">

<img src="img/2.png">

</div>

## Conectar el conectenedor que está ejecutando PostgreSQL usando psql

Para conectarnos a PostgresSQL utilizando la herramiento psql: 

    sudo docker run -it --rm --link postgres:postgres postgres psql -h postgres -U postgres

<div align="center">

<img src="img/3.png">

</div>


## Conectarse con el contenedor que está ejecutando PostrgreSQL usando adminer

A través del siguiente comando se puede crear un contenedor Adminer para utilizar una interfasz web que nos permite conectar con PostgreSQL

    sudo docker run -d --rm  --link postgres:db -p 8080:8080 adminer

<div align="center">

<img src="img/4.png">

</div>

</div>