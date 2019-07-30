#! /bin/bash

# Install, run, and enable (run on start up) mysql-server on debian

set -e


# TODO check for if downloading version 8
if false; then
    pushd /tmp
    curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
    dpkg -i mysql-apt-config*
    apt-get update
    rm mysql-apt-config*
    popd
fi

apt-get install -y mysql-server
mysql_secure_installation

systemctl start mysql
systemctl enable mysql
