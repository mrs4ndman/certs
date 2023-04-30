#!/bin/bash

num1=1
num2=2

num3=$((num1 + num2))
num4=$((num1 - num2))
num5=$((num1 * num2))
num6=$((num1 / num2))
num7=$((num1 % num2))

file="/root"

echo $num3 $num4 $num5 $num6 $num7

if [[ "$num1" -ne "$num2" ]]
then
	echo "$num1 y $num2 no son iguales"
else
	echo "$num1 y $num2 son iguales"
fi


if [ -d $file ]
then
	echo "$file existe y es un directorio"
else
	echo "$file no existe o no es un directorio"
fi


if [ -r $file ] && [ -x $file ]
then
	echo "OK! $file tiene permisos de lectura y de ejecución"
else
	echo "Ojo! $file no tiene permisos de lectura o de ejecución"
fi

