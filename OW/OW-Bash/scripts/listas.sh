#!/bin/bash

lista=(uno dos tres)


lista[3]="cuatro"

echo "La lista contiene los valores: ${lista[*]}"

echo "La lista contiene un número ${#lista[*]} de ítems"

echo "El segundo valor de la lista tiene ${#lista[1]} caracteres"

if [ $? -eq 0 ]
then
	echo "El comando anterior ha finalizado correctamente"
else
	echo "El comando anterior ha fallado :("
fi

