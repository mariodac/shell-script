#!/bin/bash

# desinstalação total
sudo rm -rf ~/.wine
sudo apt-get remove wine* --purge
sudo apt-get autoremove -y

# instalação
apt update -y
dpkg --add-architecture i386
apt install -y software-properties-common
apt -y install gnupg2 software-properties-common
wget -nc https://dl.winehq.org/wine-builds/winehq.key -P /opt
sudo apt-key add /opt/winehq.key
echo "deb https://dl.winehq.org/wine-builds/debian/ bullseye main ./"| sudo tee /etc/apt/sources.list.d/wine-obs.list
apt update -y
sudo apt install --install-recommends winehq-stable -y