#!/bin/sh
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
  echo "maxconnections=300" >> /root/pepecoin.conf
  echo "masternodeprivkey=$MASTERNODEPRIVKEY" >> /root/pepecoin.conf
  echo "masternode=1" >> /root/pepecoin.conf
  echo "masternopeaddr=$IP:29387" >> /root/pepecoin.conf
done
