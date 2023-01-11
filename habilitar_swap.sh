#!/bin/bash

sudo fallocate -l 4G /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

CONTAINS=`cat /etc/fstab | grep "swapfile" | wc -l`
if [ $CONTAINS -eq 0 ]; then
    sudo echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab
elif [ $CONTAINS -gt 1 ]; then
    sed -i "/swapfile/d" /etc/fstab
    sudo echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab
fi
