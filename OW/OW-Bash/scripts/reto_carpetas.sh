#!/bin/bash

dirs=(/root /etc/logrotate.d /tmp /home/mrsandman/testeito/troll)

case $1 in
	[Cc]heck)
	echo "Comprobemos si existe"
	i=0
		while [ while $i -lt ${#dirs[*]} ]
		do
			if [ -d ${dirs[$i]}]
			then
				echo "${dirs[$i]} existe"
			else	
				echo "${dirs[$i]} NO existe"
			fi
			((i++))
		done
	;;

	[M]ake)
	echo "Creando carpetas"
		for x in ${dirs[@]}
		do
			if [ -d $x ]
			then
				echo "El directorio $x ya existe"
			else
				echo "Creando el directorio"
				mkdir $x
			fi
		done
	;;
	
	*)
	echo "ERROR: No se ha indicado ni la opción Make ni Check: Se debe indicar una de las dos"

esac



