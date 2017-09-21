[ -z "${MYSQL_VERSION}" ] && MYSQL_VERSION="10.1"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo dpkg -l | egrep -i 'mysql|percona|mariadb'
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386] http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.1/ubuntu xenial main'
sudo apt-get update -y
sudo apt-get install -y mariadb-server
systemctl status mariadb

echo "export MYSQL_PS1=\"\\u@\"\`hostname\`\" > \"" | sudo tee /etc/profile.d/mysql.sh
