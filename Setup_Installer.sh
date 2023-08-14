#!/bin/bash

sudo su
directory="/home/n0kk/Downloads"

echo "Instalando o VS Code!"
wget -P $directory https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64


search_term0="code"
result0=$(ls -la "$directory" | grep "$search_term")

dpkg -i $directory/$result0

echo "Instalando o Brave"
apt install curl

curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|tee /etc/apt/sources.list.d/brave-browser-release.list

apt update

apt install brave-browser

echo "Instalando o Spotify"

curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg

echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

apt-get update && sudo apt-get install spotify-client

echo "Instalando o Discord"

wget -P $directory  https://discord.com/api/download?platform=linux&format=deb

search_term="discord"
result=$(ls -la "$directory" | grep "$search_term")

dpkg -i $directory/$result

echo "Instalando o setup padrão do Kali"

apt update

apt full-upgrade -y

apt install -y kali-linux-everything 

echo "Instalando o Tor Browser"

apt install -y tor torbrowser-launcher

echo "Instalando os drivers da NVIDIA"
[ -f /var/run/reboot-required ] && sudo reboot -f

apt install -y nvidia-detect

nvidia-detect

apt install -y nvidia-driver nvidia-cuda-toolkit

apt install -y mesa-utils

apt install -y mesa-utils

echo "O desktop precisa ser reinicializado para finalizar as atualizações!"
read -p "Deseja reiniciar o sistema? [Y/N]: " resposta

if [ "$resposta" = "Y" ]; then
    echo "Reiniciando o sistema..."
    reboot -f
elif [ "$resposta" = "N" ]; then
    echo "Operação cancelada. O sistema não será reiniciado, mas o reboot ainda é necessário para finalizar a instalação dos componentes!"
else
    echo "Opção inválida. O sistema não será reiniciado."
fi

