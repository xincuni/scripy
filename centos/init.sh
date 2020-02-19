# /bin/bash

# 更新yum源
yum install -y wget
mkdir /tmp/yum.repo/ -p
mv /etc/yum.repos.d/* /tmp
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.rep
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
yum makecache fast

# 更新常用插件
yum install lrzsz nmap tree dos2unix nc telnet pip3 lsof ntpdate bash-completion bash-completion-extras -y
pip3 install -y glances

# 优化ssh链接优化
sed -i.bak 's@#UseDNS yes@UseDNS no@g;s@^GSSAPIAuthentication yes@GSSAPIAuthentication no@g' /etc/ssh/sshd_config
ystemctl restart sshd

# 优化命令行
echo "PS1='[\033[31m\u\033[0m@\033[34;36m\h\033[0m\033[32m \W\033[0m]\$ '" >> /etc/profile
source /etc/profile

echo "更新完成"

