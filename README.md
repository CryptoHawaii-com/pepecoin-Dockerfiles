# CryptoHawaii Pepe/Meme Coin Docker 
## automating crypto currency nodes 

Purpose: Install to 2 docker containers, 1 pepecoin blockchain seeder, 1 pepecoin masternode

Install:
Required: Fresh install Ubuntu 16.04

ssh to server and run
 
`bash -c "$(wget -O - https://raw.githubusercontent.com/CryptoHawaii-com/pepecoin-Dockerfiles/master/install.sh)"`

Installation time takes approx 20 minutes, pepecoind will be compiled from the latest git pull, this part can be slow.
Once the installation is completed you will have 1 running docker container. The name of the container is "pepecoin"

`docker ps` will show you it running

```f93f055fd7d7        pepecoin             "/bin/sh -c '/root..."   19 hours ago        Up 3 hours          0.0.0.0:29377->29377/tcp   pepecoin```
