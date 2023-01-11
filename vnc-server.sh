#!/bin/bash

### BEGIN INIT INFO
# Provides:          vnc-server
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start vnc-server at boot time
# Description:       Enable service provided by vnc-server
### END INIT INFO

status() {
VNC=`ps -A | grep x11vnc | wc -l`
if [ $VNC -lt 1 ]; then
echo "VNC-SERVER PARADO"
else
echo "VNC-SERVER RODANDO"
fi
}
start() {
echo "Iniciando VNC-Server..."
x11vnc -env FD_XDM=1 -display :0 -forever -rfbauth /root/.vncpasswd	
echo "[OK]"
}
stop() {
echo "Desligando VNC-Server..."
killall x11vnc
echo "[OK"]
}
case "$1" in
start) start
;;
stop) stop
;;
restart) stop; start
;;
status) status
;;
*) echo "Uso correto: (start|stop|restart|status)"
;;
esac
