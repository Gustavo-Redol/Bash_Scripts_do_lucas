#!/bin/bash

dirpath="/home/n0kk/N0KK_Wordlists/dirbruteforce.txt"
filepath="/home/n0kk/N0KK_Wordlists/filebruteforce.txt"

echo "Iniciando o DirBTF"
echo ""

echo "Alvo: http://$1"
echo""

echo" Wordlists utilizadas:"
echo""
echo "File: "$filepath""
echo "Dir: "$dirpath""
echo""

echo "Aguarde o script finalizar o processo!"
echo ""
echo "Arquivos encontrados na raiz:"
echo""

for rootfile in $(cat "$filepath")
do
	anws0=$(curl -s -o /dev/null -H "User-Agent: Mozilla/5.0" -w "%{http_code}" "http://$1/$rootfile")
	
	if [ "$anws0" == 200 ]
	then
		echo "*	Arquivo encontrado: http://$1/$rootfile"

	fi
done

echo "" 

echo "Diretórios encontrados:"
echo ""

for dir in $(cat "$dirpath")
do
    # Verificar se o diretório existe
    anws1=$(curl -s -o /dev/null -H "User-Agent: Mozilla/5.0" -w "%{http_code}" "http://$1/$dir/")
    
    if [ "$anws1" == "200" ]
    then
        echo "+ Diretório encontrado: http://$1/$dir/"
	for file in $(cat "$filepath")
	do
		anws2=$(curl -s -o /dev/null -H "User-Agent: Mozilla/5.0" -w "%{http_code}" "http://$1/$dir/$file")
	
		if [ "$anws2" == 200 ]
		then
			echo "	* Arquivo encontrado: http://$1/$dir/$file"
		fi
	done
    fi
done

echo ""

echo "Script finalizado"
