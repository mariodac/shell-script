#!/bin/bash

arq=
if [ $(uname -m) == "x86_64" ]; then
    arq=\ \(x86\)
fi
ARQUIVO1=/opt/mais-brilho.py
ARQUIVO2=/opt/menos-brilho.py
ATALHO_MAIS=/home/usuario/desktop/MAIS_BRILHO.desktop
ATALHO_MENOS=/home/usuario/desktop/MENOS_BRILHO.desktop
# VERIFICA SE ARQUIVO NÃO EXISTE E FAZ A COPIA
if [ ! -f "$ARQUIVO1" ]; then
	echo "Arquivo não existe"
    sudo cp /mnt/servidor/mais-brilho.py /opt/
else
# SE EXISTIR COMPARA ARQUIVOS SE FOREM DIFERENTES DELETE E ATUALIZA O ARQUIVO
	echo "Arquivo existe"
    cmp -s "$ARQUIVO1" /mnt/servidor/mais-brilho.py
    if [ $? -eq 1 ]; then
    	echo "Arquivo diferentes"
        sudo rm "$ARQUIVO1"
        sudo cp /mnt/servidor/mais-brilho.py /opt/
    fi      
fi

if [ ! -f "$ARQUIVO2" ]; then
	echo "Arquivo não existe"
    sudo cp /mnt/servidor/menos-brilho.py /opt/
else
	echo "Arquivo existe"
    cmp -s "$ARQUIVO2" /mnt/servidor/menos-brilho.py
    if [ $? -eq 1 ]; then
    	echo "Arquivo diferentes"
        sudo rm "$ARQUIVO2"
        sudo cp /mnt/servidor/menos-brilho.py /opt/
    fi      
fi

if [ ! -f "$ATALHO_MENOS" ]; then
	echo "Arquivo não existe"
    sudo cp /mnt/servidor/MENOS_BRILHO.desktop /home/usuario/desktop/
else
	echo "Arquivo existe"
    cmp -s "$ATALHO_MENOS" /mnt/servidor/MENOS_BRILHO.desktop
    if [ $? -eq 1 ]; then
    	echo "Arquivo diferentes"
        sudo rm "$ATALHO_MENOS"
        sudo cp /mnt/servidor/MENOS_BRILHO.desktop /home/usuario/desktop/
    fi
fi

if [ ! -f "$ATALHO_MAIS" ]; then
	echo "Arquivo não existe"
    sudo cp /mnt/servidor/MAIS_BRILHO.desktop /home/usuario/desktop/
else
	echo "Arquivo existe"
    cmp -s "$ATALHO_MAIS" /mnt/servidor/MAIS_BRILHO.desktop
    if [ $? -eq 1 ]; then
    	echo "Arquivo diferentes"
        sudo rm "$ATALHO_MAIS"
        sudo cp /mnt/servidor/MAIS_BRILHO.desktop /home/usuario/desktop/
    fi
fi