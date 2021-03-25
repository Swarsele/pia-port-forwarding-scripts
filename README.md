2021 UPDATE: This fork alone is no longer enough to get the port forwarding to work! Refer to https://forum.htpcguides.com/Thread-PIA-Next-Gen-Servers-and-Port-Forwarding-Automation for a very detailed guide to update your system.

# pia-portforwarding-scripts
PIA Port forwarding scripts

Fixed script for new PIA access, edited from Pull Requests. All credit goes to HTPCGuides, I simply fixed the script for recent updates. 
Use the script instead of original portforward.sh used in the guide.

For automatic start at reboot, also put in crontab (# crontab -e) (note: this is the same cronjob that is also used in the guide):

@reboot sleep 60 && /etc/openvpn/portforward.sh | while IFS= read -r line; do echo "$(date) $line"; done >> /var/log/pia_portforward.log 2>&1 #PIA Port Forward

For automatic rerun upon disconnect, I also put in an updated script for Monit (simply use it instead of vpnfix.txt that is used in the guide).

(you may need to vary sleep time depending on your sytem)
