#!/bin/bash

fichero=$1
pos=1

while read LINE
do
	echo "Línea $pos: $LINE"
	((pos++))

done < $fichero

palabras=`cat $fichero`
for palabra in $palabras
do 
	echo $palabra
done
