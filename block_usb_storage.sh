#!/bin/bash

sudo modprobe -r usb_storage
sudo modprobe -r uas
cd /lib/modules/`uname -r`/kernel/drivers/usb/storage/
mv usb-storage.ko usb-storage.ko.blacklist

