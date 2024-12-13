#!/bin/bash

# Configuramos para mostrar los comandos y finalizar si hay error
set -ex

# Importamos el archivo de variables
source .env

# Eliminamos descargas previas de WP-CLI
rm -rf /tmp/wp-cli.phar

# Descargamos WP-cli
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /tmp

# Le damos permisos de ejecución
chmod +x /tmp/wp-cli.phar

# Movemos el script WP-CLI al directorio /usr/local/bin
sudo mv /tmp/wp-cli.phar /usr/local/bin/wp

# Eliminamos instalaciones previas
rm -rf ${WORDPRESS_DIRECTORY}*

# Descargamos el codigo fuente de wordpress
wp core download \
  --locale=es_ES \
  --path=$WORDPRESS_DIRECTORY \
  --allow-root

 
# creamos el archivo de configuración 
wp config create \
  --dbname=$WORDPRESS_DB_NAME \
  --dbuser=$WORDPRESS_DB_USER \
  --dbpass=$WORDPRESS_DB_PASSWORD \
  --dbhost=$BACKEND_PRIVATE_IP \
  --path=$WORDPRESS_DIRECTORY \
  --allow-root

# Configuramos nuestro worpress
wp core install \
  --url=$LE_DOMAIN \
  --title=$WORDPRESS_TITULO \
  --admin_user=$WORDPRESS_USER \
  --admin_password=$WORDPRESS_PASSWORD \
  --admin_email=$ADMIN_EMAIL \
  --path=$WORDPRESS_DIRECTORY \
  --allow-root  

#Instalamos y activamos el theme mindscape
wp theme install mindscape --activate --path=$WORDPRESS_DIRECTORY --allow-root

# Instalamos un plugin
wp plugin install wps-hide-login --activate --path=$WORDPRESS_DIRECTORY --allow-root

# Configuramos el plugin de WHL
wp option update whl_page "$WORDPRESS_HIDE_LOGIN_URL" --path=$WORDPRESS_DIRECTORY --allow-root

# Configuramos los enlaces permanentes
wp rewrite structure '/%postname%/' \
  --path=/var/www/html \
  --allow-root

# Copiamos el archivo .htaccess
cp ../htaccess/.htaccess $WORDPRESS_DIRECTORY

# Configuramos la variable $_SERVER['HTTPS']
sed -i "/COLLATE/a \$_SERVER['HTTPS'] = 'on';" /var/www/html/wp-config.php

# Modificamos el propietario y el grupo del directorio /var/www/html
chown -R www-data:www-data /var/www/html/