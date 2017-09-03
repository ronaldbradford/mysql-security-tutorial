MySQL Security Tutorial
=======================

Supporting information for [Implementing MySQL Security Features](https://www.percona.com/live/e17/sessions/implementing-mysql-security-features) 
tutorial presented at the [Percona Live Europe 2017](https://www.percona.com/live/e17/) conference.

All examples can be run localling using the open source products [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/).
Each product can be installed on Mac, Windows and Linux desktops. Refer to production documentation

Installing Examples
===================

You can view the examples from this tutorial at https://github.com/ronaldbradford/mysql-security-tutorial/

To get a release of these examples without using a git client:

    $ wget //TDB RELEASE
    $ unzip //TBD RELEASE
    $ cd mysql-security-tutorial.

To get the most current version of examples:

    $ git clone https://github.com/ronaldbradford/mysql-security-tutorial.git
    $ cd mysql-security-tutorial

Vagrant Commands
================

Vagrant enables you to quickly provision a Virtual Machines (VM) to demonstrate the different MySQL variants and versions. 
Vagrant can use different products to create VMs. In these examples VirtualBox is used for convinence.

To launch a VM:

    $ #cd vagrant/centos7/[community|enterprise|percona|mariadb]/[version]
    $ cd vagrant/centos7/community/5.7
    $ vagrant up
    $ vagrant ssh

A very simple install.sh script is available in each sub-directory to show the minimum needs of software for each variant/version so that you can simply reproduce this.
It is recommended that you use a configuration management and provisioning product, for example Ansible.

These environments are configured to use 1GB of RAM per VM. Depending on your amount of available memory you may be you may be able to run multiple environments concurrenctly.

Validation Commands
===================

In each VM the following commands can be used for validation of the environment.

    $ rpm -qa | egrep -i 'mysql|percona|maria'
    $ mysql --version
    $ mysql -uroot -p -Ne "SELECT @@version, @@version_comment"
    $ mysql -uroot -p -e "SELECT USER(), CURRENT_USER()"

Depending on your environment and position in examples you may be required to MySQL password to run these mysql client commands.  
During this tutorial we will attempt to standardize on one simple MySQL 'root' passsword that is described in the presentation slides.

NOTE: Do not specify a MySQL password on the command line. During this tutorial we provide examples on how to perform this command securely.


Identifying VMs
---------------

Each VM will have a unique hostname.  This also matches the output from `vagrant status` and 'VBoxManage list vms` commands.
The mysql client prompts can be configured also to match this for convinence.

    $ echo "[client]
      prompt=`hostname` >" > ${HOME}/.my.cnf

5.7 Default Initial Password
----------------------------

    $ MYSQL_PWD=`sudo grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log |tail -1 | cut -d: -f4- | tr -d ' '`
    $ mysql -uroot -p${MYSQL_PWD}


mysql.user in versions
----------------------

    $ SELECT /* 5.5 */ host, user, password, plugin, authentication_string FROM mysql.user;
    $ SELECT /* 5.6 */ host, user, password, plugin, authentication_string, password_expired FROM mysql.user;
    $ SELECT /* 5.7 */ host, user,           plugin, authentication_string, password_expired, password_last_changed, password_lifetime, account_locked FROM mysql.user;


Authentication Plugins
======================

SQL
---

    SELECT plugin_name FROM information_schema.plugins WHERE plugin_type='AUTHENTICATION';
    SELECT /* Use 5.6 */ host, user, password, plugin, authentication_string, password_expired FROM mysql.user;


PAM Authentication
------------------

    INSTALL PLUGIN auth_pam SONAME 'auth_pam.so';


Vagrant Commands
================

    $ cd /path/to/vagrant/env
    $ vagrant destroy -f


About Authors
=============

Ronald Bradford and Colin Charles are both very seasoned database professionals.  They met while working at MySQL Inc, the original trademark owner of the MySQL database prior to acquisition by Sun Microsystems in 2008, and subsequently by Oracle Corporation in 2010.

More Information
----------------

* Ronald Bradford [ronaldbradford.com](http://ronaldbradford.com/ "Ronald Bradford")  [@RonaldBradford](https://twitter.com/RonaldBradford)
* Colin Charles [bytebot.net](http://www.bytebot.net/ "Colin Charles") [@bytebot](https://twitter.com/bytebot)
