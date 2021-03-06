[ -z "${MYSQL_VERSION}" ] && MYSQL_VERSION="57"
[ ! -z "$1" ] && MYSQL_VERSION="$1"
sudo yum update -y
sudo yum install -y wget unzip
sudo yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum-config-manager --disable mysql57-community
sudo yum-config-manager --enable mysql${MYSQL_VERSION}-community
yum repolist enabled | grep mysql
sudo yum install -y mysql-community-server
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
sudo ifup eth1

echo "export MYSQL_PS1=\"\\u@\"\`hostname\`\" > \"" | sudo tee /etc/profile.d/mysql.sh

