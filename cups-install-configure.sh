#!/bin/bash

#Atualização de pacotes
echo "ATUALIZAR APT"
sudo apt update -y

#instalação do cups
echo "INSTALAR CUPS"
sudo apt install -y cups

#iniciar e habilitar serviço cups
echo "INICIAR E HABILITAR CUPS"
sudo systemctl start cups
sudo systemctl enable cups

#backup arquivo de configuração cups
echo "BACKUP CUPSD.CONF"
sudo cp /etc/cups/cupsd.conf /etc/cups/cupsd.conf.bkp

#substituindo arquivo de configuração cups
echo "SUBSTITUI ARQUIVO CUPSD.CONF"
sudo cat cupsd.conf > /etc/cups/cupsd.conf

#adicionar usuario real ao grupo lpadmin
echo "ADICIONA user AO GRUPO"
sudo usermod -aG lpadmin user

#reiniciar serviço cups
echo "REINICIAR SERVIÇO CUPS"
sudo systemctl restart cups
