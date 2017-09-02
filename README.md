MySQL Security Tutorial
=======================

Implementing MySQL Security Features
https://www.percona.com/live/e17/sessions/implementing-mysql-security-features



Authentication Plugins
======================

SQL
---

  SELECT plugin_name FROM information_schema.plugins WHERE plugin_type='AUTHENTICATION';


PAM Authentication
------------------

  INSTALL PLUGIN auth_pam SONAME 'auth_pam.so';



About Authors
=============

Ronald Bradford and Colin Charles are both very seasoned database professionals.  They met while working at MySQL Inc, the original trademark owner of the MySQL database prior to acquisition by Sun Microsystems in 2008, and subsequently by Oracle Corporation in 2010.

More Information
----------------

Ronald Bradford [ronaldbradford.com](http://ronaldbradford.com/ "Ronald Bradford")  [@RonaldBradford](https://twitter.com/RonaldBradford)
Colin Charles [bytebot.net](http://www.bytebot.net/ "Colin Charles") [@bytebot](https://twitter.com/bytebot)
