#!/bin/bash

i=5

# Bucle de cuenta atrás / puramente matemático.

echo "Cuenta atrás desde 5."

while (( i > 0))
do
	echo $i
	sleep 1
	((i--))
done

# Bucle infinito

while true
do
	echo "Soy un bucle infinito LOL"
	sleep 1
done

