#!/bin/bash


wget https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5.2/fusioninventory-agent_2.5.2-1_all.deb -P /tmp
sudo dpkg -i /tmp/fusioninventory-agent_2.5.2-1_all.deb


# SNMPV3
apt -y install dmidecode hwdata ucf hdparm

# WAKEONLAN
apt -y install libnet-write-perl ethtool
NAME_NETWORK=`nmcli connection | grep -m 1 "enp" | cut -s -d' ' -f9`
sudo ethtool -s "$NAME_NETWORK" wol g

apt --fix-broken install -y

# APONTAR O SERVIDOR DE SINCRONIZAÇÃO
sed -i 's,#server = http://server.domain.com/glpi/plugins/fusioninventory/,server = http://ip/glpi/plugins/fusioninventory/,g' /etc/fusioninventory/agent.cfg

# INVENTARIO DO EQUIPAMENTO
sudo systemctl enable fusioninventory-agent
sudo fusioninventory-agent
