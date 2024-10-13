#!/bin/bash

# Declaro variables con directorio raiz y nombre del archivo
DIRECTORIO=~/repogit/UTNFRA_SO_1P2C_2024_WEISS/RTA_ARCHIVOS_Examen_20241012
ARCHIVO=$DIRECTORIO/Filtro_Basico.txt

# Creo el directorio si no existe
mkdir -p "$DIRECTORIO"

# Obtengo el total de memoria RAM
MEMORIA_TOTAL=$(grep MemTotal /proc/meminfo)

# Obtengo el fabricante del chasis
FABRICANTE=$(sudo dmidecode -t chassis | grep "Manufacturer" | awk -F ': ' '{print $2}')

# Guardo la información en el archivo
echo "$MEMORIA_TOTAL" > "$ARCHIVO"
echo "Manufacturer: $FABRICANTE" >> "$ARCHIVO"

# Print de finalizacion
echo "Información guardada en $ARCHIVO"
