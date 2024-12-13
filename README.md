# Implantación de Wordpress en AWS utilizando una arquitectura de tres niveles

![Wordpress](capturas/captura1.png)

## Para realizar la arquitectura en tres niveles, vamos a necesitar un balanceador de carga funcionando como Proxy Inverso, dos máquinas frontend donde irá el wordpress, un servidor NFS y una máquina backend con mysql.


## 1 Realización script setup_nfs_server.sh

### Pasos:
0. Importamos el archivo .env

    ```bash
     source .env
     ```

1. Actualizamos los repositorios

    ```bash
    apt update
    ```

2. Instalamos el NFS Server

    ```bash
    apt install nfs-kernel-server -y
    ```

3. creamos el directorio que vamos a compartir

    ```bash
    mkdir -p /var/www/html -y
    ```
4. Modificamos el propietario y el grupo del directorio
    ```bash
    chown nobody:nogroup /var/www/html
    ```
5. copiamos el archivo de configuracion

   ```bash
    cp ../nfs/exports /etc/exports
    ```
6. Reemplazamos el valor de la plantilla /etc/exports

   ```bash
    sed -i "s#FRONTEND_NETWORK#$FRONTEND_NETWORK#" /etc/exports
    ```
7.  Reinciamos el servicio de NFS

    ```bash
    systemctl restart nfs-kernel-server
    ```
8. Creamos una carpeta nfs y dentro estará el exports con el siguiente   contenido

    ```bash
    /var/www/html 172.31.0.0/16(rw,sync,no_root_squash,no_subtree_check)
    ```
Esto permite las conexiones desde el servidor NFS a dicho rango de IPs para que puedan conectarse los frontales.


## 2 Realización script setup_nfs_client.sh
### Pasos:

1. Importamos el archivo .env
 
   ```bash
    source .env
   ```
2. Actualizamos los repositorios

    ```bash
    apt update
    ```
3. Instalamos el cliente NFS

    ```bash
    apt install nfs-common -y
    ```
4. configuramos la entrada para montar un directorio NFS en el sistema.

    ```bash
    sed -i "/LABEL=UEFI/a $NFS_SERVER_IP:/var/www/html /var/www/html  nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" /etc/fstab
    ```
5. recargamos la configuración del sistema

    ```bash
    systemctl daemon-reload
    ```
6. Hacemos el montaje

    ```bash
    mount $NFS_SERVER_IP:/var/www/html /var/www/html
    ```
El archivo setup_nfs_server.sh se ejecutaría en la servidor NFS y el setup_nfs_client.sh se ejecutaría en los dos frontales para que monten su directorio /var/www/html en el /var/www/html del servidor así permite a los clientes que accedan a la página poder descargar el mismo plugin por ejemplo en los diferentes Frontends.

![comprobacion](capturas/captura2.png)

Vemos como al hacer un df -h, en la IP del servidor NFS está montado el directorio /var/www/html

a parte de esto tendremos todos los scripts que ya teníamos hecho de la práctica anterior que son los instal_lamp_frontend, el instal_lamp_backend, deploy_wordpress_frontend y backend, el certificado Let's encrypt y el setup_loadbalancer

![comprobacion](capturas/captura3.png)
