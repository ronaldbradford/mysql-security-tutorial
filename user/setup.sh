echo "[client]
prompt="\u@`hostname` > " | sudo tee -a /etc/skel/.my.cnf

sudo groupadd dba
#for NEWUSER in `echo "red blue green brown orange yellow pink black white magenta cyan indigo violet gray gold"`
for NEWUSER in `echo "red blue"`
do
  sudo useradd -N -g dba -G mysql -m ${NEWUSER}
  # -N seems to break this
  sudo -i -u ${NEWUSER} ssh-keygen -t rsa -f /home/${NEWUSER}/.ssh/id_rsa -N ''
done


GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION |
| GRANT PROXY ON ''@'' TO 'root'@'localhost' WITH GRANT OPTION

# TimTam#2017
CREATE USER red_superdba@localhost IDENTIFIED WITH 'mysql_native_password' AS '*911D7BCE0387DB32E997236168D00542ECB1C9F9' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT ALL PRIVILEGES ON *.* TO red_superdba@localhost WITH GRANT OPTION;

# Aussie#1770
CREATE USER red_dba@localhost IDENTIFIED WITH 'mysql_native_password' AS '*8EAFF04C6A57EA18E26CD763F36898464E515F9B' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE, CREATE, ALTER, DROP ON demo.* TO red_dba@localhost;


GRANT CREATE ROUTINE, CREATE VIEW, CREATE TEMPORARY TABLES, ALTER ROUTINE, SHOW VIEW, EXECUTE ON demo.* TO red_dba@localhost;
GRANT SHOW DATABASES ON *.* TO red_dba@localhost;

# Koala#1770
CREATE USER red_app@localhost IDENTIFIED WITH 'mysql_native_password' AS '*592FC5B183989C4B6C5FC49B909D7B6FBD992D4C' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT SELECT, INSERT, UPDATE, DELETE ON demo.* TO red_app@localhost;

Other application privileges may be
CREATE TEMPORARY TABLE, EXECUTE 

# Outback#1770
CREATE USER red_user@localhost IDENTIFIED WITH 'mysql_native_password' AS '*3D961736F2D76F665EF22CF4D325F43CE9370166' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT SELECT ON demo.* TO red_user@localhost;

