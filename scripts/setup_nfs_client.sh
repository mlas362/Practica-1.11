#!/bin/bash

# Configuramos para mostrar los comandos y finalizar si hay error
set -ex

# Importamos el archivo .env
source .env

# Actualizamos los repositorios
apt update

# Actualizar los paquetes
apt upgrade -y

# Instalamos el cliente NFS
apt install nfs-common -y

# Hacemos el montaje 
mount $IP_NFS_SERVER:/var/www/html /var/www/html