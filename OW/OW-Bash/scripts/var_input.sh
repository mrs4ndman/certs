#!/bin/bash

echo "El script ejecutado es $0"
echo "El primer valor del argumento introducido es $1"
echo "El segundo valor del argumento introducido es $2"

echo "Recuento de valores: $*"
echo "Me has indicado un total de $# argumentos"

echo "Añada un argumento más, por favor:"
sleep 1

read x

read -p "Introduzca aquí el argumento:" y

echo "Lista final de argumentos: $@ $x $y"

