#!/bin/bash


lista=(Pedro Juan Elena Oscar Alberto Ana)

for i in ${lista[@]}
do
	echo $i
done

##Solo nombres que empiezan por A

for i in ${lista[@]}
do
	if [[ $i == A* ]]
	then
		echo
		echo $i
	fi
done


