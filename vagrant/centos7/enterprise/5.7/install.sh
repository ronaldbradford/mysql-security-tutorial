env
[ -z "${MYSQL_VERSION}" ] && MYSQL_VERSION="57"
[ ! -z "$1" ] && MYSQL_VERSION="$1"
sudo yum update -y
cd /vagrant/software
sudo yum install -y perl net-tools
sudo rpm -Uvh mysql-commercial-server-5.7.19-1.1.el7.x86_64.rpm mysql-commercial-client-5.7.19-1.1.el7.x86_64.rpm mysql-commercial-common-5.7.19-1.1.el7.x86_64.rpm mysql-commercial-libs-5.7.19-1.1.el7.x86_64.rpm mysql-commercial-libs-compat-5.7.19-1.1.el7.x86_64.rpm
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
