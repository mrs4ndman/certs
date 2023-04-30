#!/bin/bash

inp_file=$1

#$2 será equivalente al path de la lista

case $1 in
	[Mm]ake)
	echo "Creando directorios de la lista..."
	i=0
	while read line
	do
		if [ -d $line ]
		then
			echo "El directorio ya existe"
		else
			if [ ${#line[$i]} -gt 5 ]
			then
				echo "No puedo crearla, el directorio $line tiene más de 5 caracteres"
			fi
		
			mkdir $line
		fi
	done < $2
;;
	
	*|help)
		echo "Indica m/Make para saber como funciona el script"
;;

esac
