#!/bin/bash

if [ "$1" == "" ]
then
        echo "################################"
        echo "###### Complete Host Scanner ###"
        echo "################################"
        echo "######## Developed by: N0KK ####"
        echo "################################"
        echo "Modo de uso: $0 <ALVO>"
        echo "Exemplo: $0 192.168.0"

else
        echo "################################"
        echo "## Ccomplete Host Scanner ######"
        echo "################################"
        echo "######## Developed by: N0KK ####"
        echo "################################"

        echo""
        echo"Selecione o tipo de Scan:"
	echo "1) Stealth Scan"   
        echo "2) Flood Scan"
	echo "3) Complete Scan"

	read -p "Enter a value: " select
	path='/home/n0kk/Nmap_results'	
	case $select in
		1)
			echo "Stealth Scan starting on host $1"
			for source in $(cat nmap_ports.txt); do
			nmap -sS -Pn -T 1 --open -g $source --top-ports=500 -oG $path/$1_$source.txt $1 > /dev/null
			echo "Scan Complete from source $source"
			done
			;;
		2)
			echo "Flood Scan starting on host $1"
			nmap -sT -Pn -D RND:100 --open --top-ports=200 -oG $path/$1_Scan.txt $1 > /dev/null
			echo "Scan Complete from source $source"
			;;
		3)
			echo "Complete Scan starting on host $1"
			for source in $(cat nmap_ports.txt); do
			nmap -A -p- --open -g $source -oG $path/$1_Scan.txt $1 > /dev/null
			done
			echo "Scan Complete from source $source!"
			;;
	esac
fi
