#! /bin/bash

# Install erlang first
wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | apt-key add -

echo "deb https://packages.erlang-solutions.com/ubuntu bionic contrib" | tee /etc/apt/sources.list.d/rabbitmq.list

apt update
apt -y install erlang
