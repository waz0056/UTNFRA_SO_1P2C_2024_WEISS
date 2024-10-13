#!/bin/bash

HASH=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')
sudo mkdir -p /datos/dir-home

# Creo grupo alumnos
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

# Creo usuarios y asignar grupos secundarios y claves
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$HASH" -d /datos/dir-home/alu1 p1c2_2024_A1
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$HASH" -d /datos/dir-home/alu2 p1c2_2024_A2
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$HASH" -d /datos/dir-home/alu3 p1c2_2024_A3
sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores -p "$HASH" -d /datos/dir-home/prof p1c2_2024_P1

# Ajustar permisos de las carpetas
sudo chown -R p1c2_2024_A1:p1c2_2024_gAlumno /Examenes-UTN/alumno_1
sudo chmod 750 /Examenes-UTN/alumno_1  # Dueño rwx, Grupo r-x, Otros ---

sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chmod 700 /Examenes-UTN/alumno_2  # Dueño rwx, Grupo ---, Otros ---

sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chmod 700 /Examenes-UTN/alumno_3  # Dueño rwx, Grupo ---, Otros ---

sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod 775 /Examenes-UTN/profesores  # Dueño rwx, Grupo rwx, Otros r-x

# Defino la ruta del archivo de validación
VALIDAR_FILE="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_WEISS/RTA_ARCHIVOS_Examen_20241012/validar.txt"

# Borro el archivo si ya existe
> $VALIDAR_FILE

# Usuario p1c2_2024_A1
echo "Usuario: p1c2_2024_A1, Carpeta: /Examenes-UTN/alumno_1" >> $VALIDAR_FILE
sudo -u p1c2_2024_A1 sh -c "cd /Examenes-UTN/alumno_1 && whoami" >> $VALIDAR_FILE
echo "-----------------------" >> $VALIDAR_FILE

# Usuario p1c2_2024_A2
echo "Usuario: p1c2_2024_A2, Carpeta: /Examenes-UTN/alumno_2" >> $VALIDAR_FILE
sudo -u p1c2_2024_A2 sh -c "cd /Examenes-UTN/alumno_2 && whoami" >> $VALIDAR_FILE
echo "-----------------------" >> $VALIDAR_FILE

# Usuario p1c2_2024_A3
echo "Usuario: p1c2_2024_A3, Carpeta: /Examenes-UTN/alumno_3" >> $VALIDAR_FILE
sudo -u p1c2_2024_A3 sh -c "cd /Examenes-UTN/alumno_3 && whoami" >> $VALIDAR_FILE
echo "-----------------------" >> $VALIDAR_FILE

# Usuario p1c2_2024_P1
echo "Usuario: p1c2_2024_P1, Carpeta: /Examenes-UTN/profesores" >> $VALIDAR_FILE
sudo -u p1c2_2024_P1 sh -c "cd /Examenes-UTN/profesores && whoami" >> $VALIDAR_FILE
echo "-----------------------" >> $VALIDAR_FILE

echo "Archivo de validación creado en $VALIDAR_FILE"
