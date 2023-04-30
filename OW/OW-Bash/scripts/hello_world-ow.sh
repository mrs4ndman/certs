#!/bin/bash

set -u

username=$USER
dia=$(date +%D)
num1=6
num2=2

echo "Si eres el dueño de la cuenta, responde a esta pregunta: ¿Cuánto es 1 + 2?"
read answer

num3=$((num1 / num2))

if [[ $answer == "$num3" || $answer = "secreto" ]]
then
	echo "Bienvenido, $username. La fecha es la siguiente: ${dia} , y ha pasado la prueba del nº $num3. Hello World!"
else
	echo "INCORRECTO! Fuera de aquí, caballero"
fi

