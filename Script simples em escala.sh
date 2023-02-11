#!/bin/bash
comando=""
for x  in $(cat arquivo_com_lista_de_servidores_para_acesso);
do
    comando=`ssh $x 'comando_executado'`
    echo "$x" " " "$comando" >> saída_do_comando.txt
done
