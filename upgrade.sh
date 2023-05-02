#!/bin/bash

echo "Iniciando o upgrade do desktop!"
echo ""

apt update
if [ $? -ne 0 ]; then
    echo ""
    echo "Erro ao atualizar a lista de pacotes"
    exit 1
fi

apt upgrade -y
if [ $? -ne 0 ]; then
    echo ""
    echo "Erro ao atualizar os pacotes"
    exit 1
fi

apt dist-upgrade -y
if [ $? -ne 0 ]; then
    echo ""
    echo "Erro ao executar a atualização de distribuição"
    exit 1
fi

apt full-upgrade -y
if [ $? -ne 0 ]; then
    echo ""
    echo "Erro ao executar a atualização completa do sistema"
    exit 1
fi

apt autoclean -y
if [ $? -ne 0 ]; then
    echo ""
    echo "Erro ao executar a limpeza dos pacotes antigos"
    exit 1
fi

apt autoremove -y
if [ $? -ne 0 ]; then
    echo ""
    echo "Erro ao executar a remoção dos pacotes desnecessários"
    exit 1
fi

echo ""
echo "Upgrade finalizado"
