<div align="center">

# Creación de un contenedor Docker con PostgreSQL

</div>

<div align="justify">

# Creación de un contendor sin persistencia

Para lanzar un contenedor Docker con PostgreSQL sin persistencia: 

    docker run -d --rm --name postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 postgres


<div align="center">

<img src="img/1.png">

</div>

# Conectarse ejecutando PostgreSQL usando psql

Para utilizar la herramienta psql

    docker run -it --rm --link postgres:postgres postgres psql -h postgres -U postgres

<div align="center">

<img src="img/2.png">

<div align="center">

</div>