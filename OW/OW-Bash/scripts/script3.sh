#!/bin/bash

lista=(uno dos tres)



lista[4]="cuatro"
lista[5]="cinco"

echo ${lista[*]}	 #Devuelve todos los valores de la lista, uno tras otro
echo ${#lista[*]}	 #Devuelve el recuento de ítems que hay en la lista, 5 en este caso
echo ${#lista[2]}	 #Devuelve la longitud del primer ítem (posición 1 en lista, 2ª en tot.)
