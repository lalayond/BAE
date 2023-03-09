<div align="center">

# Instalación de Bases de Datos Relacionales

</div>

## Instalación de MySQL

<div align="justify">

Para instalar MySQL se utilizarán los paquetes APT. Para ello primero debemos actualizar los paquetes, utilizando el siguiente comando: 

    sudo apt update

Se generará la siguiente salida: 

    [sudo] contraseña para dimas: 
    Obj:1 http://es.archive.ubuntu.com/ubuntu focal InRelease
    Obj:2 http://es.archive.ubuntu.com/ubuntu focal-updates InRelease              
    Obj:3 http://security.ubuntu.com/ubuntu focal-security InRelease               
    Obj:4 http://es.archive.ubuntu.com/ubuntu focal-backports InRelease            
    Obj:5 http://ppa.launchpad.net/linuxgndu/sqlitebrowser-testing/ubuntu focal InRelease
    Leyendo lista de paquetes... Hecho                      
    Creando árbol de dependencias       
    Leyendo la información de estado... Hecho
    Se pueden actualizar 51 paquetes. Ejecute «apt list --upgradable» para verlos

Una vez hecho esto instalamos mysql-server:

    sudo apt install mysql-server

Se obtendrá la siguiente salida: 

    ...
    done!
    update-alternatives: utilizando /var/lib/mecab/dic/ipadic-utf8 para proveer /var
    /lib/mecab/dic/debian (mecab-dictionary) en modo automático
    Configurando mysql-server-8.0 (8.0.32-0ubuntu0.20.04.2) ...
    update-alternatives: utilizando /etc/mysql/mysql.cnf para proveer /etc/mysql/my.
    cnf (my.cnf) en modo automático
    mysqld will log errors to /var/log/mysql/error.log
    mysqld is running as pid 16415
    Configurando mysql-server (8.0.32-0ubuntu0.20.04.2) ...
    Procesando disparadores para systemd (245.4-4ubuntu3.20) ...
    Procesando disparadores para man-db (2.9.1-1) ...
    Procesando disparadores para libc-bin (2.31-0ubuntu9.9) ...

A continuación no iniciamos como superusuario 

    sudo su

E iniciamos mysql-server

    mysql -u root

Donde aparecerá: 

    osboxes@osboxes:~$ sudo su
    root@osboxes:/home/osboxes# mysql -u root
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 8
    Server version: 8.0.32-0ubuntu0.20.04.2 (Ubuntu)

    Copyright (c) 2000, 2023, Oracle and/or its affiliates.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

Hecho esto, saldremos de mysql

    exit;

## Configuración de MySQL

A continuación se cambiará algunas de las configuraciones de MySQL:

    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'mynewpassword.';

Y para cambiar las opciones de seguridad: 

    sudo mysql_secure_installation

Una vez hecho esto nos pedirá configurar una serie de opciones donde además estableceremos al contrasña del root deseada.

# Creación de usuario

Para crear un nuevo usuario, deberemos de entrar a MySQL (como hemos hecho anteriormente) y lanzar la siguiente sentencia:

    CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password'

Una vez hecho esto, es necesario darle una serie de permisos al usuario para que pueda trabajar con la bases de datos. Para ello: 

    GRAN ALL PRIVILEGES ON * . * TO 'jdimas'@'localhost';

Una vez hecho esto, el usuario tendrá los mismos privilegios que el root (cuidado con esto). Así pues, para iniciar con el nuevo usuario será tan facil como: 

    mysql -u [username] -p

# Instalación de WorkBench

Por último, para poder trabajar con MySQL por medio de un interfaz gráfica utilizaremos WorkBench.

Existen diversas formas de instalación. No obstante en nuestro caso se ha utilizado snap: 

    snap install mysql-workbench-community

Una vez instalado, para inicializarlo solo habrá que escribir la siguiente linea: 

    mysql-workbench-community

</div>