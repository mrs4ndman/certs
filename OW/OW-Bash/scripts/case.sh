#!/bin/bash

case $1 in

	[Ss]tart)
		echo "Iniciando el programa"
;;	[Ss]top)
		echo "Parando el programa"
;;	help | *)
		echo "Para usar el script, usa stop | start como opciones"
;;
esac

