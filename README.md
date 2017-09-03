MySQL Security Tutorial
=======================

Supporting information for [Implementing MySQL Security Features](https://www.percona.com/live/e17/sessions/implementing-mysql-security-features) at the Percona Live Europe 2017 Conference.

Vagrant Commands
================

    $ cd vagrant/centos7/[community|enterprise|percona|mariadb]/[version]
    $ vagrant up
    $ vagrant ssh

A very simple install.sh script is available in each sub-directory to show the minimum needs of software for each variant/version.



Validation Commands
===================

    $ mysql -Ne "SELECT @@version, @@version_comment"

Authentication Plugins
======================

SQL
---

    SELECT plugin_name FROM information_schema.plugins WHERE plugin_type='AUTHENTICATION';
    SELECT /* Use 5.6 */ host, user, password, plugin, authentication_string, password_expired FROM mysql.user;


PAM Authentication
------------------

    INSTALL PLUGIN auth_pam SONAME 'auth_pam.so';



About Authors
=============

Ronald Bradford and Colin Charles are both very seasoned database professionals.  They met while working at MySQL Inc, the original trademark owner of the MySQL database prior to acquisition by Sun Microsystems in 2008, and subsequently by Oracle Corporation in 2010.

More Information
----------------

* Ronald Bradford [ronaldbradford.com](http://ronaldbradford.com/ "Ronald Bradford")  [@RonaldBradford](https://twitter.com/RonaldBradford)
* Colin Charles [bytebot.net](http://www.bytebot.net/ "Colin Charles") [@bytebot](https://twitter.com/bytebot)
