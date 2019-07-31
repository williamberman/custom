#! /bin/bash

set -e

# https://docs.docker.com/install/linux/docker-ce/ubuntu/
# Run the following with root priviledges

apt-get remove docker docker-engine docker.io containerd runc
apt-get update

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get install -y docker-ce docker-ce-cli containerd.io
