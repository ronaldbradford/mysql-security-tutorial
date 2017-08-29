[ -z "${MYSQL_VERSION}" ] && MYSQL_VERSION="57"
sudo yum update -y
sudo yum localinstall -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm
yum repolist enabled | grep percona
sudo yum install -y Percona-Server-server-${MYSQL_VERSION}
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
