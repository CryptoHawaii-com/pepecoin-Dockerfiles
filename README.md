# CryptoHawaii Pepe/Meme Coin Docker 

### Details:
Memetic Master Node - Ideally this is run on 2 CPU(s).

What the script does: 

Step 1 : Installs docker

Step 2 : Installs MN's from github : https://github.com/CryptoHawaii-com/memetic-mn-docker

This will create (1) master node and (1) seed node: 

1. Seeding server on port 29377
2. Masternode on port 29387

*all rewards goto you for helping out with the seeding. 

https://www.youtube.com/watch?v=yOjFrc1UXTc&feature=youtu.be

What you need to do:

1. Wallet - create master node - IP of your node:29477 
2. Fund the received address with 15,000 coins (it may or may not charge you) it'll be live after 15 confirmations. 
  - Send EXACTLY 15,000 coins - otherwise you will get errors. (our video walk through was wrong to send 15,010 coins)
3. Get config and input in the 1-time entry URL @ the IP of your server
   - After you input the key the website will never work again (if you make a mistake you'll have to reinstall)
4. Click on your MN to start receiving payments.

Notes : 

Help us out, sign the petition for Hawaii to allow Coinbase: http://cryptohawaii.com

If you want assistance email info@cryptohawaii.com


### Installation Instructions:

Required: Fresh install Ubuntu 16.04

ssh to server and run
 
```
bash -c "$(wget -O - https://raw.githubusercontent.com/CryptoHawaii-com/pepecoin-Dockerfiles/master/install.sh)"
```

Installation time takes approx 20 minutes, pepecoind will be compiled from the latest git pull, this part can be slow.
Once the installation is completed you will have 1 running docker container. The name of the container is "pepecoin"

`docker ps` 

output will look similar to this:

```f93f055fd7d7        pepecoin             "/bin/sh -c '/root..."   19 hours ago        Up 3 hours          0.0.0.0:29377->29377/tcp   pepecoin```

**Required** 

You must now activate your master node or manually stop the webserver.

Activating your master node is very simple. 
When generating your masternodeprivkey configuration you will need the following details:
We will be using port 29387 for the master node since 29377 is in use for the seed node

***serverip = your.server.ip.address***

***serverport = 29387***

Browse to your servers ip address with https://

`https://your.server.ip.address`

You will be prompted to accept the self signed cert and proceed.

Enter your masternodeprivkey exactly as your wallet outputs. *For more information on the wallet setup [http://cryptohawaii.com/memetic-masternode/](http://cryptohawaii.com/memetic-masternode/)*

Once you enter and submit your masternodeprivkey, your masternode docker container will start and the URL will destroyed. This means if you have entered the masternodeprivkey incorrectly, you will need to rebuild the entire node from scratch (start over).

check that both containers are now running

`docker ps`

output will look similar to this:
```
79edd506a5c3        pepecoinmasternode   "/root/.pepecoin/p..."   10 hours ago        Up 3 hours          0.0.0.0:29387->29387/tcp   pepecoinmasternode

f93f055fd7d7        pepecoin             "/bin/sh -c '/root..."   19 hours ago        Up 3 hours          0.0.0.0:29377->29377/tcp   pepecoin
```
*OPTIONAL: If you are not a master node STOP the webserver*

If you are not hosting a master node, you need to stop the webserver to secure the system.
ssh into your server and execute the following 2 commands.

`systemctl stop apache2`

and then

`systemctl disable apache2`

We hope you choose to run a master node.


### Command Line Usage

The following commands assume you have basic linux knowledge and have an ssh connection already established to your server. 
There are 2 docker containers running: *pepecoin* and *pepecoinmasternode*

**List running containers**

`docker ps`

**To enter a container**

`docker exec -it CONTAINERNAME bash`

where CONTAINERNAME is `pepecoin` or `pepecoinmasternode` (i.e. `docker exec -it pepecoinmasternode bash`)

you will see a new root prompt once in the container 
example output:
```
root@localhost:~# docker exec -it pepecoin bash
root@f93f055fd7d7:/#
```

**pepecoind commands in container**

Execute pepecoind commands within a container like this

`/root/.pepecoin/pepecoind COMMAND`

for example

`/root/.pepecoin/pepecoind getinfo`

All files are located in /root/.pepecoin on each node
pepecoin.conf is located /root/.pepecoin/pepcoin.conf

If you found this helpful don't be shy to donate:
MEME/PEPE : PWpvpjXvEuMEA42d1vGhZDMsoFCcHE9Aar
BTC : 1DMjyW6V5enMPhzDQBR9QeU3Rt8B6EFjUK
ZEN CASH : znUe52p5ZCrfFGLNBsJPgvdJMRcgeytoiQ2
LTC : LVh26vHmUirETSYmymkGJTCFyhNRACvuEL
ETH : 0x777ace7f2fbbbf29ad86d0a00e759953970393aa





 
