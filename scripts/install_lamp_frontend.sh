#!/bin/bash

# Configuramos para mostrar los comandos y finalizar si hay error
set -ex

# Actualizamos los repositorios
apt update

# Actualizar los paquetes
apt upgrade -y

# Instalamos el servidor web Apache (-y sirve para instalar sin preguntar)
apt install apache2 -y

# Habilitamos el módulo rewrite
a2enmod rewrite

#copiamos el archivo de configuración de apache2
cp ../conf/000-default.conf /etc/apache2/sites-available

# Instalamos PHP y algunos módulos de PHP para Apache y MySQL
sudo apt install php libapache2-mod-php php-mysql -y

# Reiniciamos el servicio de Apache
systemctl restart apache2

# Copiamos el script de prueba de PHP en /var/www/html
cp ../php/index.php /var/www/html

# Modificamos el propietario y el grupo del archivo index.php
chown -R www-data:www-data /var/www/html