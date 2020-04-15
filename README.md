# pia-portforwarding-scripts
PIA Port forwarding scripts

Fixed script for new PIA access, edited from Pull Requests. All credit goes to HTPCGuides, I simply fixed the script for recent updates.

For automatic start, also put in crontab (# crontab -e):

@reboot sleep 60 && /etc/openvpn/portforward.sh | while IFS= read -r line; do echo "$(date) $line"; done >> /var/log/pia_portforward.log 2>&1 #PIA Port Forward


(you may need to vary sleep time depending on your sytem
