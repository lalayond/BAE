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

</div>