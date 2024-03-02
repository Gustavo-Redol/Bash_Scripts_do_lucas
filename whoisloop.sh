#!/bin/bash

# Cria um arquivo para salvar os resultados
echo "ip - owner" > results.txt

# Lê cada IP do arquivo whoisloop.txt
for ip in $(cat whois.txt); do
    # Usa o comando whois e filtra a saída para pegar a linha do owner
    owner=$(whois $ip | grep -i 'owner:' | awk -F':' '{print $2}')

    # Imprime o IP e o owner no arquivo results.txt
    echo "$ip - $owner" >> results.txt
done

