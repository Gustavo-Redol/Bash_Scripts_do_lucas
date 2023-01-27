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
echo "1 - Whois - NameServers"
echo "2 - Nslookup"
echo "3 - Dig IN MX"
echo "4 - Instruções de uso"
echo " "
echo "Selecione um número:" 
read toolselect

dns=$(nslookup hostname | grep "Address:")

echo " "
if [ "$toolselect" == "1" ]
then
	echo "Whois Name Server Tool Selecionada"
	echo " "
	echo "Insira o nome do arquivo que contém a lista para análise:"
	read path
	
	echo " "
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
	
	echo " "
	for domain in $(cat $path);
	do
		nslookup $domain | grep -E "Name:|Address:" | grep -v "$dns"

	done


elif [ "$toolselect" == "3" ] 	
then
	echo "Dig IN MX Tool Selecionada"
	echo " "
	echo "Insira o nome do arquivo que contém a lista para análise:"
	read path
	
	echo " " 
	for domain in $(cat $path);
	do
		dig in mx $domain | grep -E "in mx|MX" | grep -v "; <<>> DiG 9.16.23-RH <<>>" |  grep -v ";" 

	done

elif [ "$toolselect" == "4" ]
then
	echo "Selecione uma das ferramentas para utilizá-la em uma lista de domínios ou servidores"
	echo "Após isso, escreva o nome do arquivo de texto que contém a lista formatada corretamente"
	echo " "
	echo "Exemplo:" 
	echo "Insira o nome do arquivo que contém a lista para análise:"
        echo "domains_list.txt"
	echo " "
	echo "Qualquer dúvida, entre em contato com o administrador!"
else
	echo "OPÇÃO INVÁLIDA"

fi
