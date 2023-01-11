#!/bin/bash

CONTAINS=`cat /home/user/.config/mimeapps.list | grep "application/pdf=atril.desktop;" | wc -l`

if [ $CONTAINS -eq 0 ]; then
        echo "application/pdf=atril.desktop;" >> /home/user/.config/mimeapps.list
elif [ $CONTAINS -gt 1 ]; then
        sed -i "/application\/pdf=atril.desktop;/d" /home/user/.config/mimeapps.list
        echo "application/pdf=atril.desktop;" >> /home/user/.config/mimeapps.list
fi