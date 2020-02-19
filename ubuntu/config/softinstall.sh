#/bin/bash
# 这是软件配置文档

THISPATH=`dirname $0`
#echo $THISPATH

# # 更换国内源（使用的是阿里的源）
# sourcesfile=/etc/apt/sources.list.old
# if [ ! -e "$sourcesfile" ]; then
#     echo 'backups sources.list'
#     sudo cp /etc/apt/sources.list /etc/apt/sources.list.old
#     sudo cp $THISPATH/sources.list /etc/apt/sources.list
# fi


# 软件更新
sudo apt -y  update   # 更新源
sudo dpkg --configure -a
sudo apt -y  upgrade  # 更新已安装的包
sudo apt -y  dist-upgrade  # 升级系统
# 注意以上安装过程中出现的安装选项，直接回车或者选择yes即可
sudo apt-get -y  autoremove
sudo apt -y autoclean

# 安装python2
sudo apt -y install python
sudo mv /usr/bin/python /tmp

sudo ln -s /usr/bin/python3 /usr/bin/python

# 安装pip
sudo apt install -y python3-pip
sudo apt install -y python-pip

# 安装虚拟环境对应的包
sudo pip3 install -i https://pypi.douban.com/simple  virtualenv

sudo pip3 install -i https://pypi.douban.com/simple virtualenvwrapper
sudo pip2 install -i https://pypi.douban.com/simple virtualenvwrapper


# 配置虚拟环境
envdir="$HOME/.virtualenvs"
if [ ! -d "$envdir" ]; then
    mkdir "$envdir"
else
    echo "$envdir is already exist !!!"
fi

grep -q "WORKON_HOME" ~/.bashrc
if [ $? -ne 0 ]; then
    echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
    echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
fi

sh ~/.bashrc
# 创建虚拟环境
. /usr/local/bin/virtualenvwrapper.sh
mkvirtualenv -p /usr/bin/python3 py3env
mkvirtualenv -p /usr/bin/python2 envpy2
deactivate

# 安装 Redis
sudo apt -y install redis-server
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf

# 安装MySQL
sudo apt install -y mysql-server
$HOME/.virtualenvs/py3env/bin/pip install pymysql
$HOME/.virtualenvs/py3env/bin/python $THISPATH/mysqlconfig.py 
sudo /etc/init.d/mysql stop
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
grep -q 'default-character-set' /etc/mysql/mysql.conf.d/mysqld.cnf
if [ $? -ne 0 ]; then
    sudo sed -i "/nice/a\[client]\ndefault-character-set=utf8\n" /etc/mysql/mysql.conf.d/mysqld.cnf
    sudo sed -i "/server-key/a\character_set_server=utf8" /etc/mysql/mysql.conf.d/mysqld.cnf
fi
sudo /etc/init.d/mysql start
sudo /etc/init.d/mysql restart

# 安装MongoDB
sudo apt -y install mongodb

# 查看是否存在vim
vimtest=`which vim`
if [ -n $vimtest ]; then
    sudo apt -y install vim
fi

# 配置vim
    # 下载vim插件
    vundledir="$HOME/.vim/bundle/Vundle.vim"
    if [ ! -e "$vundledir" ]; then
        echo "DownLoad Vundle.vim ..." 
        git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    fi
    yes "" | vim +PlugInstall +qall
    
    cd $HOME/.vim/bundle/YouCompleteMe
    
    # 安装扩展
    sudo apt -y install git cmake  clang  python3-dev
    
    # 编译安装YouCompleteMe
    ./install.sh --clang-completer --system-libclang

# 配置开机启动界面
motdfile="/etc/motd"
if [ ! -e "$motdfile" ]; then
    sudo cp $THISPATH/motd /etc/motd
fi

# 安装拓展包
sudo apt-get -y install lrzsz sl fortune fortune-zh cowsay lolcat screen

grep -q "cowsay" $HOME/.bashrc
if [ $? -ne 0 ]; then
    echo "fortune-zh |cowsay -f elephant|lolcat" >> $HOME/.bashrc
fi

echo "All software installation completed !!!"
