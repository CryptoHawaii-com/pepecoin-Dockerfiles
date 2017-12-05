FROM ubuntu
MAINTAINER tnssfairchild (sfairchild@trinet-hi.com)
RUN /bin/bash -c 'apt-get -y update'
RUN /bin/bash -c 'apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev libgmp3-dev libdb-dev libdb++-dev libgmp3-dev git pwgen'
RUN /bin/bash -c 'git clone https://github.com/pepeteam/pepecoin.git'
RUN /bin/bash -c 'cd pepecoin/src && make -f /pepecoin/src/makefile.unix USE_UPNP=-1'
RUN /bin/bash -c 'mkdir -m755 /root/.pepecoin'
RUN /bin/bash -c 'cp -avr /pepecoin/src/pepecoind /root/.pepecoin/pepecoind'
RUN /bin/bash -c 'USERNAME=$(pwgen -s 16 1) && PASSWORD=$(pwgen -s 64 1) && cat <<EOF > /root/.pepecoin/pepecoin.conf \
rpcuser=$USERNAME\
rpcpassword=$PASSWORD\
server=1\
listen=1\
port=29377\
rpcport=29376\
addnode=seed1.freepepe.org\
addnode=seed2.freepepe.org\
addnode=seed3.freepepe.org\
addnode=162.248.93.192:29377\
litemode=1\
masternode=0\
EOF'


