#!/bin/bash
# Menú de bienvenida al usuario: No olvidar que la fecha es un valor de entrada.

usr=$(whoami)

echo "Tu nombre de usuario es $usr"

read -p "Quieres seguir usando este nombre de usuario o usar otro diferente (si no quieres uno nuevo pulsa enter):" new_name

if [ -z $new_name ]
then
	echo "Has decidido que tu nombre siga siendo $usr. Hoy es $1."
else
	echo "Entendido! Bienvenido $nombre. Hoy es $1."
fi
