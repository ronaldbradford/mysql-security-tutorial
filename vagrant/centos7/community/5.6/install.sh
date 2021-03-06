[ -z "${MYSQL_VERSION}" ] && MYSQL_VERSION="56"
[ ! -z "$1" ] && MYSQL_VERSION="$1"
sudo yum update -y
sudo yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum-config-manager --disable mysql57-community
sudo yum-config-manager --enable mysql${MYSQL_VERSION}-community
yum repolist enabled | grep mysql
sudo yum install -y mysql-community-server
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
sudo ifup eth1

echo "[client]
prompt=`hostname` >" > ${HOME}/.my.cnf

sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y ngrep
sudo yum install -y wget unzip
wget https://dl.bintray.com/mcafee/mysql-audit-plugin/audit-plugin-mysql-5.6-1.1.5-742-linux-x86_64.zip
