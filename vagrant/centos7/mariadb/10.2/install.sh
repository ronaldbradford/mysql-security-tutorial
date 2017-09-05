[ -z "${MYSQL_VERSION}" ] && MYSQL_VERSION="10.2"
sudo yum update -y

curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
yum repolist enabled | grep -i maria
sudo yum install -y MariaDB-server MariaDB-client
sudo yum install -y MariaDB-aws-key-management

sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

echo "export MYSQL_PS1=\"\\u@\"\`hostname\`\" > \"" | sudo tee /etc/profile.d/mysql.sh
