#!/bin/bash

# Creo el directorio principal
mkdir -p ~/Estructura_Asimetrica/correo
mkdir -p ~/Estructura_Asimetrica/cliente

# Creo cartas del 1 al 100 en ambos directorios
for i in $(seq 1 100); do
    touch ~/Estructura_Asimetrica/correo/cartas_$i
    touch ~/Estructura_Asimetrica/cliente/cartas_$i
done

# Creo carteros del 1 al 10 solo en el directorio correo
for i in $(seq 1 10); do
    mkdir -p ~/Estructura_Asimetrica/correo/carteros_$i
done

# Print de cierre
echo "Estructura asimétrica creada"
