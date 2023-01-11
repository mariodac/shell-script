#!/bin/bash

VNC=`ps | grep x11vnc | wc -l`

if [ $VNC -lt 1 ]; then
	echo "VNC parado"
	#/etc/init.d/vnc-server start
else
	echo "VNC RODANDO"