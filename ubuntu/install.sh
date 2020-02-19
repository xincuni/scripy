##!/bin/bash

PATHTHIS=`pwd`

pingget=$( ping 114.114.114.114 -c 2|grep "ttl=")
if [ -n "$pingget" ]; then
    echo "Network unobstructed!!! "
    bash $PATHTHIS/config/softinstall.sh
    echo "config complete!!!"
else
    echo "Network failure"
    netname=`ip addr|awk '/BROADCAST/{print $2}'|awk '/^(e.*)/'|awk -F: '{print $1}'`
    echo $netname
    sudo ifconfig $netname down
    sudo ifconfig $netname up
    pingbaidu=$( ping www.baidu.com -c 2|grep "ttl=")
    if [ -n "$pingbaidu" ]; then
        bash $PATHTHIS/config/softinstall.sh
        echo "config complete!!!"
    else
        echo "network error!!!"
        echo "If you are using a wireless network,then the virtual machine can use the bridge mode to surf the Internet"
        echo "If you have some cable, then use the NAT mode to access the Internet"
    fi
fi 

sh ./.jetbrain.sh
