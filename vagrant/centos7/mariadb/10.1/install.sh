[ -z "${MYSQL_VERSION}" ] && MYSQL_VERSION="10.1"
sudo yum update -y

# https://downloads.mariadb.org/mariadb/repositories/
# See https://downloads.mariadb.org/mariadb/repositories/#mirror=limestone&distro=RedHat&distro_release=rhel7-amd64--rhel7&version=10.1
echo "[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/${MYSQL_VERSION}/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1" | sudo tee -a /etc/yum.repos.d/mariadb.repo
yum repolist enabled | grep -i maria
sudo yum install MariaDB-server MariaDB-client -y

sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

echo "export MYSQL_PS1=\"\\u@\"\`hostname\`\" > \"" | sudo tee /etc/profile.d/mysql.sh
