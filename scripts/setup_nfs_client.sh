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

sed -i "/LABEL=UEFI/a $NFS_SERVER_IP:/var/www/html /var/www/html  nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" /etc/fstab

systemctl daemon-reload

# Hacemos el montaje 
mount $NFS_SERVER_IP:/var/www/html /var/www/html