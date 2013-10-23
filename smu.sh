#!/bin/bash

#echo old mac address
oldmac=$(sudo ifconfig -v en1 | grep ether | awk '{print $2}')
echo "old mac address is $oldmac"

#disconnect from any wi-fi network
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -z

#produce random mac address
mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')

#change mac address
sudo ifconfig en1 lladdr $mac

#verify mac has changed
newmac=$(sudo ifconfig -v en1 | grep ether | awk '{print $2}')
echo "new mac address is $newmac"
exit
