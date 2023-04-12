#!/bin/bash

# Define o caminho do diretório
dir_path="/var/www/vhosts"

# Obtém a lista de diretórios e salva em um arquivo txt
ls -d $dir_path/*/ > domains.txt

# Remove o caminho base e o último caractere de cada linha do arquivo
sed -i "s|$dir_path/||g; s|/$||" domains.txt

for dir in $(cat domains.txt); do
    # Executa o comando e redireciona a saída para um arquivo de texto
    cat "$dir"/logs/access_ssl_log | cut -d ' ' -f1 | sort | uniq -c | sort -rn | awk '{ print $1 "," $2 }' > /var/www/vhosts/"$dir"/qtdipac_ssl_"$(date +%Y%m%d_%H%M%S)"_"$dir".csv
    # Pega os 5 primeiros resultados da segunda coluna do arquivo e salva em mostips.txt
    cat /var/www/vhosts/"$dir"/qtdipac_ssl_"$(date +%Y%m%d_%H%M%S)"_"$dir".csv | awk -F',' '{print $2}' | head -n 5 > /var/www/vhosts/"$dir"/mostips.txt

    # Define a variável dir_path para o diretório atual
    dir_path="$dir"
    echo "Qtd, iP, Qtd, Mtd, Path" > "$dir_path"/Qtd_Final_Report.csv
    for file in "$dir_path"/qtdipac_ssl_*; do
        awk -F, -v OFS=',' '{print $1 "," $2 ",," $3 "," $4}' "$file" | awk -F, -v OFS=',' 'NR>1{$3=$3 OFS $4; $4=$5; $5=""; print}' >> "$dir_path"/Qtd_Final_Report.csv
    done


    echo "Qtd, iP, Path" > "$dir_path"/Most_Access_Final_Report.csv
    for file in "$dir_path"/mostips.txt; do
        awk -F, -v OFS=',' '{print "," $1 ",," $2}' "$file" >> "$dir_path"/Most_Access_Final_Report.csv
    done

done

# Remove o arquivo txt com a lista de diretórios
rm domains.txt
