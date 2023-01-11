#!/bin/bash

#Apaga spark, baixa e instala versão 2.7.5

rm -rf /opt/Spark
rm -rf /root/.Spark
rm -rf /home/user/.Spark
cd /tmp
wget http://download.igniterealtime.org/spark/spark_2_7_5.tar.gz
tar -zxvf spark_2_7_5.tar.gz -C /opt/