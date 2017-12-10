#!/bin/bash
while inotifywait -e modify /var/www/masternodeprivkey/masternodeprivkey.txt; do
  IP=$(curl ipinfo.io/ip)
  USERNAME=$(pwgen -s 16 1)
  PASSWORD=$(pwgen -s 64 1)
  MASTERNODEPRIVKEY=$(</var/www/masternodeprivkey/masternodeprivkey.txt)
  echo "rpcuser=$USERNAME" > /root/pepecoin.conf
  echo "rpcpassword=$PASSWORD" >> /root/pepecoin.conf
  echo "server=1" >> /root/pepecoin.conf
  echo "listen=1" >> /root/pepecoin.conf
  echo "port=29387" >> /root/pepecoin.conf
  echo "rpcport=29376" >> /root/pepecoin.conf
  echo "addnode=seed1.freepepe.org" >> /root/pepecoin.conf
  echo "addnode=seed2.freepepe.org" >> /root/pepecoin.conf
  echo "addnode=seed3.freepepe.org" >> /root/pepecoin.conf
  echo "addnode=162.248.93.192:29377" >> /root/pepecoin.conf
  echo "maxconnections=16" >> /root/pepecoin.conf
  echo "masternodeprivkey=$MASTERNODEPRIVKEY" >> /root/pepecoin.conf
  echo "masternode=1" >> /root/pepecoin.conf
  echo "masternodeaddr=$IP:29387" >> /root/pepecoin.conf
  docker run -d --name pepecoinmasternode pepecoinmasternode
  docker cp /root/pepecoin.conf pepecoinmasternode:/root/.pepecoin/pepecoin.conf
  docker commit pepecoinmasternode pepecoinmasternode
  docker container rm pepecoinmasternode
  docker run -d --restart always -p 29387:29387 --name pepecoinmasternode pepecoinmasternode /root/.pepecoin/pepecoind -datadir=/root/.pepecoin -conf=/root/.pepecoin/pepecoin.conf
  cd /root/chainfile
  docker cp ./ pepecoinmasternode:/root/.pepecoin/
  docker stop pepecoinmasternode
  docker start pepecoinmasternode
  systemctl stop apache2
  systemctl disable apache2
  ufw delete allow 443/tcp
  break 
done
