#!/bin/bash

NAME_DISP_AUDIO=`cat /proc/asound/modules | wc -l`
if [ $NAME_DISP_AUDIO -eq 1 ]; then
    NAME_DISP_AUDIO=`cat /proc/asound/modules | cut -s -d' ' -f 3`
    NAME_DISP_AUDIO="blacklist ${NAME_DISP_AUDIO}"
	echo $NAME_DISP_AUDIO > /etc/modprobe.d/fbdev-blacklist.conf
	#echo "Possui dispositivo"
else
	echo "Sem dispositivo de audio"
fi