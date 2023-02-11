#!/bin/bash
if [ "$1" == "on" ]
then
	echo "#################################"
	echo "########## ANON JUMPER ##########"
	echo "#################################"
	echo "######## Developed by: N0KK #####"
	echo "#################################"
	echo " "
echo "Iniciando o anonjumper em conjunto com o anonsurf"
echo " "
anonsurf start
sleep 10m
echo " "
while true;
do
	echo "Realizando a troca de IP"
	echo ""
	anonsurf change
	sleep 10m
done
elif [ "$1" == "off" ]
then
	echo "Anon Jumper Stopped"
	echo " "
	anonsurf stop

else

        echo "#################################"
        echo "########## ANON JUMPER ##########"
        echo "#################################"
        echo "######## Developed by: N0KK #####"
        echo "#################################"
        echo "Para ativar o anon jumper: $0 on"
        echo "Para desativar o anon jumper: $0 off"

fi
