!/bin/bash

sudo systemctl stop openvpn@openvpn.service
service openvpn stop
echo "$(date +"%F %T") openvpn stopped" >> /home/htpcguides/vpnfixlog.txt
service networking stop
echo "$(date +"%F %T") network stopped, starting network" >> /home/htpcguides/vpnfixlog.txt
service networking start
echo "$(date +"%F %T") network started, starting openvpn" >> /home/htpcguides/vpnfixlog.txt
service openvpn start
echo "$(date +"%F %T") openvpn started, connect to vpn" >> /home/htpcguides/vpnfixlog.txt
cd /etc/openvpn

sudo systemctl start openvpn@openvpn.service
sleep 15
/etc/openvpn/portforward.sh | while IFS= read -r line; do echo "$(date) $line"; done >> /home/htpcguides/vpnfixlog.txt 2>&1 #PIA Port Forward

echo "$(date +"%F %T") script completed" >> /home/htpcguides/vpnfixlog.txt
