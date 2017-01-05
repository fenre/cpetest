#!/bin/bash
echo "Restarting Network Manager"
sudo service network-manager restart
echo "Getting DHCP Lease Time"
sleep 3
lease=$(ls -alt /var/lib/NetworkManager/ | sed -n 2p | awk '{print $9}' ) && cat /var/lib/NetworkManager/$lease | grep dhcp-lease*
