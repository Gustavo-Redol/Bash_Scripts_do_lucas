#!/bin/bash
echo "#################"
echo "# CentralServer #"
echo "#################"

echo " "

echo "####################"
echo "# Qmail Log FIlter #"
echo "####################"

echo ""

echo "Digite o remetente:"
echo " "
read remet
echo ""

echo "Dgite o destinatário:"
read dest

echo " "

echo "Buscando trocas de mensagens entre as contas $remet e $dest!"

echo " "

logs64=$(cat /var/log/qmail/4000* current | tai64nlocal);
logsconv=$(/etc/admin/maillog/convert.pl vadmin $logs64);
echo "Trechos de log encontrador entre $remet e $dest: "
echo ""
echo "$logsconv"
