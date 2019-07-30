#! /bin/bash

# Installs, runs, and enables rabbitmq

set -e

# Install erlang first
wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | apt-key add -

echo "deb https://packages.erlang-solutions.com/ubuntu bionic contrib" | tee /etc/apt/sources.list.d/rabbitmq.list

apt-get update
apt-get install -y erlang

# Now install rabbitmq
wget -O- https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc | apt-key add -
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -

echo "deb https://dl.bintray.com/rabbitmq/debian $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/rabbitmq.list
apt-get update
apt-get install -y rabbitmq-server

systemctl start rabbitmq-server
systemctl enable rabbitmq-server

# # https://www.rabbitmq.com/rabbitmqctl.8.html

# # To create a user, execute with root permissions
# rabbitmqctl add_user <username> <password>

# # To create a vhost (similar to apache vhost)
# rabbitmqctl add_vhost <vhost name>

# # To give a user access to a vhost
# rabbitmqctl set_permissions -p <vhost> <username> (see docs for specifying rest of permissions)
