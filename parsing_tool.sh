#!/bin/bash

echo "DESEC SECURITY"
echo "Parsing_HTML Project"
echo "Developed by N0KK"
echo " "
echo " "
echo "#####################"
echo "# Parsing HTML Tool #"
echo "#####################"
echo "Insira o domínio alvo:"
read url
echo " "
echo "Realizando o download do index.html"
echo " "
wget -O $url.txt $url
echo " "
echo "Download do index.html finalizado!"
echo "Iniciando análise:"
echo " "
cat $url.txt | grep "href" | cut -d "/" -f3 | grep "\." | cut -d '"' -f 1 | grep -v "l" > filtrada_$url.txt
echo" "
echo "Estas são as URLs presentes no index de $url:"
echo " "
echo "Links na página de: $url "
echo " "
cat filtrada_$url.txt


