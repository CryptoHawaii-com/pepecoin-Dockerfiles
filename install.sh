#Create 2 docker containers, 1 for pepecoind non master node, 1 for pepecoind masternode
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
docker run -d --restart always -p 29377:29377 --name pepecoin pepecoin


rm /root/pepecoin/src/Dockerfile
wget https://raw.githubusercontent.com/CryptoHawaii-com/pepecoin-Dockerfiles/master/pepecoinmasternode/Dockerfile
docker build -t "pepecoinmasternode" .

#SETUP WEB SERVER FOR MASTER NODE KEY
apt-get -y install apache2 php libapache2-mod-php php-mcrypt inotify-tools pwgen
systemctl start apache2
a2ensite default-ssl 
a2enmod ssl 
systemctl restart apache2 
ufw allow 443/tcp

#DOWNLOAD WEBFORM AND SCRIPT
rm -rf /var/www/html/index.html
cd /var/www/html
wget https://raw.githubusercontent.com/CryptoHawaii-com/pepecoin-Dockerfiles/master/webscript/index.html
wget https://raw.githubusercontent.com/CryptoHawaii-com/pepecoin-Dockerfiles/master/webscript/masternode.php
mkdir /var/www/masternodeprivkey
touch /var/www/masternodeprivkey/masternodeprivkey.txt
chown -R www-data.www-data /var/www/masternodeprivkey
chown -R www-data.www-data /var/www/html
cd /root
wget https://raw.githubusercontent.com/CryptoHawaii-com/pepecoin-Dockerfiles/master/scripts/masterprivactivate.sh
chmod 755 /root/masterprivactivate.sh
/root/masterprivactivate.sh
