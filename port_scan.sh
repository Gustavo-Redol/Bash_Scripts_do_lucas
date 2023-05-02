#!/bin/bash

if [ "$1" == "" ]
then
	echo "DESEC SECURITY"
	echo "PortScan Project"
	echo "Developed by N0KK"
	echo " "
	echo "Modo de uso: $0 REDE PORTA"
	echo "Exemplo: $0 192.168.200"

else
for host in {1..254};
do
hping3 -S -p $2 -c 1 $1.$host 2> /dev/null | grep "flags=SA" | cut -d " " -f 2 | cut -d "=" -f 2;
done
fi

