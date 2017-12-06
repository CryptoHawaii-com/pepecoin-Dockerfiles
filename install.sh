#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt -y -o Acquire::ForceIPv4=true update
apt-get -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" upgrade
apt -y install apt-transport-https ca-certificates curl software-properties-common git
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt -y -o Acquire::ForceIPv4=true update
apt -y install docker-ce
systemctl start docker
systemctl enable docker
docker pull ubuntu

ufw default allow outgoing
ufw default deny incoming
ufw allow ssh/tcp
ufw limit ssh/tcp
ufw allow 29377/tcp
ufw logging on
ufw --force enable

apt -y install fail2ban
systemctl enable fail2ban
systemctl start fail2ban

apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev libgmp3-dev libdb-dev libdb++-dev libgmp3-dev
cd /root
git clone https://github.com/pepeteam/pepecoin.git
cd pepecoin/src
make -f makefile.unix USE_UPNP=-1


wget https://raw.githubusercontent.com/CryptoHawaii-com/pepecoin-Dockerfiles/master/pepecoin/Dockerfile
docker build -t "pepecoin" .
docker run -d -p 29377:29377 pepecoin


rm /root/pepecoin/src/Dockerfile
wget https://raw.githubusercontent.com/CryptoHawaii-com/pepecoin-Dockerfiles/master/pepecoinmasternode/Dockerfile
docker build -t "pepecoinmasternode" .

