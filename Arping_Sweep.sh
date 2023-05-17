#!/bin/bash

if [ "$1" == "" ]
then
        echo "################################"
        echo "########## PING SWEEP ##########"
        echo "################################"
        echo "######## Developed by: N0KK ####"
        echo "################################"
        echo "Modo de uso: $0 REDE"
        echo "Exemplo: $0 192.168.0"

else
        echo "################################"
        echo "########## PING SWEEP ##########"
        echo "################################"
        echo "######## Developed by: N0KK ####"
        echo "################################"

 
read -p "Digite o final do primeiro IP do range: " frst
read -p "Digite o final do último IP do range: " lst

        for host in $(seq $frst $lst) 
do
       arping -c1 $1.$host -w 1| grep "60 bytes" |cut -d " " -f 5 | sed 's/.$//';
done
fi

