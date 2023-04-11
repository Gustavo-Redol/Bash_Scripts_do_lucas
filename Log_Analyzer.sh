#!/bin/bash

# Define o caminho do diretório
dir_path="/var/www/vhosts"

# Obtém a lista de diretórios e salva em um arquivo txt
ls -d $dir_path/*/ > domains.txt

# Remove o caminho base e o último caractere de cada linha do arquivo
sed -i "s|$dir_path/||g; s|/$||" domains.txt

for dir in $(cat domains.txt); do
    # Executa o comando e redireciona a saída para um arquivo de texto
    cat $dir/logs/access_ssl_log | cut -d ' ' -f1 | sort | uniq -c | sort -unr | awk '{ print $1 "," $2 }' > /var/www/vhosts/logs_domains/$dir.csv
done

# Remove o arquivo txt com a lista de diretórios
rm domains.txt
