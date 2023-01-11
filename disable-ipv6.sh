#!/bin/bash


# backup arquivo /etc/sysctl.conf
cp /etc/sysctl.conf /etc/sysctl.conf.bkp
# linhas no final do arquivo /etc/sysctl.conf
echo -e "net.ipv6.conf.all.disable_ipv6 = 1\nnet.ipv6.conf.default.disable_ipv6 = 1\nnet.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
sudo sysctl -p
# backup arquivo /etc/default/grub
cp /etc/default/grub /etc/default/grub.bkp
# adicionado parametro no arquivo /etc/default/grub
sed -i 's,GRUB_CMDLINE_LINUX="",GRUB_CMDLINE_LINUX="ipv6.disable=1",g' /etc/default/grub
# atualizando o grub
sudo update-grub2
sudo reboot