#!/bin/bash

# Configuramos para mostrar los comandos y finalizar si hay error
set -ex

# Importamos el archivo .env
source .env

# Actualizamos los repositorios
apt update

# Actualizar los paquetes
apt upgrade -y

# Instalamos mysql server
apt install mysql-server -y

# Configuramos el archivo /etc/mysql/mysql.conf/mysqld.cnf
sed -i "s/127.0.0.1/$BACKEND_PRIVATE_IP/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Reiniciamos el servicio mysql
systemctl restart mysql