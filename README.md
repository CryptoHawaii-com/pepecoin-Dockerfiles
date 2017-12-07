# CryptoHawaii Pepe/Meme Coin Docker 
## automatic node installer 

Purpose: Install to 2 docker containers, 1 pepecoin blockchain seeder, 1 pepecoin masternode

Install:
Required: Fresh install Ubuntu 16.04

ssh to server and run
 
`bash -c "$(wget -O - https://raw.githubusercontent.com/CryptoHawaii-com/pepecoin-Dockerfiles/master/install.sh)"`

Installation time takes approx 20 minutes, pepecoind will be compiled from the latest git pull, this part can be slow.
Once the installation is completed you will have 1 running docker container. The name of the container is "pepecoin"

`docker ps` 

output will look similar to this:

```f93f055fd7d7        pepecoin             "/bin/sh -c '/root..."   19 hours ago        Up 3 hours          0.0.0.0:29377->29377/tcp   pepecoin```

Required: You must now activate your master node or manually stop the webserver.

Activating your master node is very simple. 
When generating your masternodeprivkey configuration you will need the following details:
We will be using port 29387 for the master node since 29377 is in use for the seed node

serverip = your.server.ip.address
serverport = 29387

Browse to your servers ip address with https://

`https://your.server.ip.address`

You will be prompted to accept the self signed cert and proceed.
Enter your masternodeprivkey exactly as your wallet outputs. **For more information on the wallet details [http://cryptohawaii.com/memetic-masternode/](http://cryptohawaii.com/memetic-masternode/)**
