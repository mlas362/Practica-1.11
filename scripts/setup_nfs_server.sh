#!/bin/bash

# Configuramos para mostrar los comandos y finalizar si hay error
set -ex

# Importamos el archivo .env
source .env

# Actualizamos los repositorios
apt update

# Actualizar los paquetes
apt upgrade -y

# Instalamos el NFS Server
apt install nfs-kernel-server -y

# creamos el directorio que vamos a compartir
mkdir -p /var/www/html

# Modificamos el propietario y el grupo del directorio
chown www-data:www-data /var/www/html

# copiamos el archivo de configuracion
cp ../nfs/exports /etc/exports

# Reemplazamos el valor de la plantilla /etc/exports
sed -i "s#FRONTEND_NETWORK#$FRONTEND_NETWORK#" /etc/exports
# Reinciamos el servicio de NFS
systemctl restart nfs-kernel-server
