[ -z "${MYSQL_VERSION}" ] && MYSQL_VERSION="57"
sudo yum update -y
sudo yum localinstall -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm
yum repolist enabled | grep percona
sudo yum install -y Percona-Server-server-${MYSQL_VERSION}
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
sudo yum install -y percona-toolkit
sudo yum install -y percona-xtrabackup
sudo yum install -y sysbench
curl -sLo gh-ost.tar.gz https://github.com/github/gh-ost/releases/download/v1.0.40/gh-ost-binary-linux-1.0.40-20170721063804.tar.gz
tar xvfz gh-ost.tar.gz
sudo mv gh-ost /usr/local/bin
