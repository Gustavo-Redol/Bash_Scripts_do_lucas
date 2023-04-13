#!/bin/bash

# Define o caminho do diretório
dir_path="/var/www/vhosts"

# Obtém a lista de diretórios e salva em um arquivo txt
ls -d $dir_path/*/ > domains.txt

# Remove o caminho base e o último caractere de cada linha do arquivo
sed -i "s|$dir_path/||g; s|/$||" domains.txt

for dir in $(cat domains.txt); do
    # Executa o comando e redireciona a saída para um arquivo de texto
    cat $dir/logs/access_ssl_log | cut -d ' ' -f1 | sort | uniq -c | sort -unr | awk '{ print $1 "," $2 }' > /var/www/vhosts/"$dir"/qtdipac_ssl_"$dir".csv
    # Pega os 5 primeiros resultados da segunda coluna do arquivo e salva em mostips.txt
    cat /var/www/vhosts/"$dir"/qtdipac_ssl_"$dir".csv | awk -F',' '{print $2}' | head -n 10 > /var/www/vhosts/"$dir"/mostips.txt

    # Escreve o cabeçalho em Final_Report.csv
    echo "Qtd, IP, Qtd, Rqst, Path" > /var/www/vhosts/"$dir"/Final_Report.csv
    # Adiciona as 10 primeiras linhas do arquivo qtdipac_ssl_"$dir".csv no arquivo Final_Report.csv
    echo "$(cat /var/www/vhosts/"$dir"/qtdipac_ssl_"$dir".csv | head -n 11 | tail -n +2)" >> /var/www/vhosts/"$dir"/Final_Report.csv

    for ip in $(cat $dir_path/$dir/mostips.txt); do
        echo "Processando endereço IP: $ip"
        cat $dir_path/$dir/logs/access_ssl_log | grep "$ip" | cut -d '"' -f2 | uniq -c | sort -unr > /var/www/vhosts/"$dir"/most_accss_"$ip"_"$dir".csv
        head -n1 $dir_path/$dir/most_accss_"$ip"_"$dir".csv > $dir_path/$dir/most_access_all.csv
        # Copia o conteúdo do arquivo most_access_all.csv para as colunas 3 e 4 do arquivo Final_Report.csv
        paste -d ',' /dev/null /dev/null $dir_path/$dir/most_access_all.csv | awk -F ',' '{print $1 "," $2 "," $3 "," $4}' | head -n 10 >> /var/www/vhosts/"$dir"/Final_Report.csv
    done
done
# Remove o arquivo txt com a lista de diretórios
rm domains.txt
