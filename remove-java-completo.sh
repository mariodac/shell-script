#!/bin/bash
#Remova todos os pacotes relacionados ao Java
dpkg-query -W -f='${binary:Package}\n' | grep -E -e '^(ia32-)?(sun|oracle)-java' -e '^openjdk-' -e '^icedtea' -e '^(default|gcj)-j(re|dk)' -e '^gcj-(.*)-j(re|dk)' -e '^java-common' | xargs sudo apt-get -y remove
sudo apt-get -y autoremove
#Limpar arquivos de configuração
dpkg -l | grep ^rc | awk '{print($2)}' | xargs sudo apt-get -y purge
#Remova a configuração Java e o diretório de cache
sudo bash -c 'ls -d /home/*/.java' | xargs sudo rm -rf
#Remova as JVMs instaladas manualmente
sudo rm -rf /usr/lib/jvm/*
#Remova as entradas Java, se ainda houver
for g in ControlPanel java java_vm javaws jcontrol jexec keytool mozilla-javaplugin.so orbd pack200 policytool rmid rmiregistry servertool tnameserv unpack200 appletviewer apt extcheck HtmlConverter idlj jar jarsigner javac javadoc javah javap jconsole jdb jhat jinfo jmap jps jrunscript jsadebugd jstack jstat jstatd native2ascii rmic schemagen serialver wsgen wsimport xjc xulrunner-1.9-javaplugin.so; do sudo update-alternatives --remove-all $g; done
#Procure por possíveis diretórios Java restantes
sudo apt update -y
sudo apt install locate -y
sudo updatedb
sudo locate -b '\pack200'