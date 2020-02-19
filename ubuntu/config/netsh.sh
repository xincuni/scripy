#!/usr/bin/bash

#得到旧网卡名字
oldname=`cat /etc/network/interfaces |awk '/auto/ {print $2}'|awk '/e.*/{print $1}'`
echo $oldname

#得到新的网卡名字
netname=`ip addr|awk '/BROADCAST/{print $2}'|awk '/^(e.*)/'|awk -F: '{print $1}'`
echo $netname

#替换旧的网络名字
sudo sed -i "s/$oldname/$netname/g" `grep $oldname -rl /etc/network/interfaces`

#添加mac地址配置
sudo sed -i "/iface $netname inet dhcp/a\pre-up ifconfig $netname hw ether 08:00:27:E5:86:8F" /etc/network/interfaces

#重启网卡
sudo /etc/init.d/networking  restart
