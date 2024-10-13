#!/bin/bash

# Defino el path del archivo de salida
ARCHIVO="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_WEISS/RTA_ARCHIVOS_Examen_20241012/Filtro_Avanzado.txt"

# Obtengo la IP pública
IP_PUBLICA=$(curl -s ifconfig.me)

# Obtengo el nombre de usuario actual
USUARIO=$(whoami)

# Obtengo el hash del usuario
HASH_USUARIO=$(sudo grep $USUARIO /etc/shadow | awk -F ':' '{print $2}')

# Obtengo la URL del repositorio remoto
URL_REPOSITORIO=$(git -C /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_WEISS remote get-url origin)

# Guardo la información en el archivo
echo "Mi IP Pública es: $IP_PUBLICA" > $ARCHIVO
echo "Mi usuario es: $USUARIO" >> $ARCHIVO
echo "El Hash de mi Usuario es: $HASH_USUARIO" >> $ARCHIVO
echo "La URL de mi repositorio es: $URL_REPOSITORIO" >> $ARCHIVO

# Print de finalizacion
echo "Información guardada en $ARCHIVO"
