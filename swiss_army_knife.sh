#!/bin/bash
	
echo "################################"
echo "######## Developed by: N0KK ####"
echo "################################"

echo " "
echo " "

echo "#######################################################"
echo "######### Canivete Suíço (Script-Multi-Tool) ##########"
echo "#######################################################"

echo " "
echo " "

echo "Qual ferramenta você deseja utilizar?"
echo "1 - Whois"
echo "2 - Nslookup"
echo "3 - Dig IN MX"
echo " "
echo "Selecione um número:" 
read toolselect
echo " "

if [ "$toolselect" == "1" ]
then
	echo "Whois Tool Selecionada"
	echo " "
	echo "Insira o nome do arquivo que contém a lista para análise:"
	read path

	for domain in $(cat $path);
	do
		whois $domain | grep -E "domain:|nserver:" 	
	done

elif [ "$toolselect" == "2" ]
then
	echo "Nslookup Tool Selecionada"
	echo " "
	echo "Insira o nome do arquivo que contém a lista para análise:"
	read path

	for domain in $(cat $path);
	do
		nslookup $domain | grep -E "Name:|Address:" | grep -v "Address:	172.23.224.1#53"  

	done


elif [ "$toolselect" == "3" ] 	
then
	echo "Dig IN MX Tool Selecionada"
	echo " "
	echo "Insira o nome do arquivo que contém a lista para análise:"
	read path
	
	for domain in $(cat $path);
	do
		dig in mx $domain 

	done


else
	echo "OPÇÃO INVÁLIDA"

fi
