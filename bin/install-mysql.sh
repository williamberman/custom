#! /bin/bash

# Run with root privileges
# Install, run, and enable (run on start up) mysql-server on debian

set -e


# TODO check for if downloading version 8
if false; then
    pushd /tmp
    curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
    dpkg -i mysql-apt-config*
    # For some reason the signing key is expired and needs to be readded.
    # It may be searched for on keys.gnupg.net by prefixing the lower bytes
    # with 0x
    # apt-key adv --keyserver keys.gnupg.net --recv-keys 5072E1F5
    apt-get update
    rm mysql-apt-config*
    popd
fi

apt-get install -y mysql-server
mysql_secure_installation

systemctl start mysql
systemctl enable mysql

# To create and use a database,
# CREATE DATABASE <database name>;
# USE <database name>;

# # https://linuxize.com/post/how-to-create-mysql-user-accounts-and-grant-privileges/
#
# # To create user. Execute the following in mysql.
# CREATE USER '<username>'@'<hostname>' IDENTIFIED BY '<password>';
#
# # For the hostname, use "localhost" to only be able to connect locally and "%" to connect from any host
#
# # The user has to be given specific permissions on given databases
#
# # i.e.
# GRANT permission1, permission2 ON database_name.table_name TO 'database_user'@'localhost';
#
# # For the common task of granting all permissions on a given database,
# # Do not quote the <database name>.* portion
# GRANT ALL PRIVILEGES on <database name>.* to '<username>'@'<hostname>';
