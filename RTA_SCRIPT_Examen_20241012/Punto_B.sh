#!/bin/bash

# Detectar el disco de 10GB
DISCO=$(sudo fdisk -l | grep "10 GiB" | awk '{print $2}' | awk -F: '{print $1}')
echo "Particionando el disco: $DISCO"

# Crear particiones en el disco
sudo fdisk $DISCO <<EOF
n
p
1

+1G
n
p
2

+1G
n
p
3

+1G
n
e


n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n


p
w
EOF

echo "Particiones creadas en $DISCO"

# Formateo y monto cada partición en los directorios existentes

# Asigno las particiones a los puntos de montaje
# Particiones primarias
sudo mkfs.ext4 ${DISCO}1
sudo mount ${DISCO}1 /Examenes-UTN/alumno_1/parcial_1
echo "${DISCO}1 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mkfs.ext4 ${DISCO}2
sudo mount ${DISCO}2 /Examenes-UTN/alumno_1/parcial_2
echo "${DISCO}2 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mkfs.ext4 ${DISCO}3
sudo mount ${DISCO}3 /Examenes-UTN/alumno_1/parcial_3
echo "${DISCO}3 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab

# Particiones lógicas
sudo mkfs.ext4 ${DISCO}5
sudo mount ${DISCO}5 /Examenes-UTN/alumno_2/parcial_1
echo "${DISCO}5 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mkfs.ext4 ${DISCO}6
sudo mount ${DISCO}6 /Examenes-UTN/alumno_2/parcial_2
echo "${DISCO}6 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mkfs.ext4 ${DISCO}7
sudo mount ${DISCO}7 /Examenes-UTN/alumno_2/parcial_3
echo "${DISCO}7 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mkfs.ext4 ${DISCO}8
sudo mount ${DISCO}8 /Examenes-UTN/alumno_3/parcial_1
echo "${DISCO}8 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mkfs.ext4 ${DISCO}9
sudo mount ${DISCO}9 /Examenes-UTN/alumno_3/parcial_2
echo "${DISCO}9 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mkfs.ext4 ${DISCO}10
sudo mount ${DISCO}10 /Examenes-UTN/alumno_3/parcial_3
echo "${DISCO}10 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mkfs.ext4 ${DISCO}11
sudo mount ${DISCO}11 /Examenes-UTN/profesores
echo "${DISCO}11 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab

echo "Particiones formateadas y montadas de manera persistente."
