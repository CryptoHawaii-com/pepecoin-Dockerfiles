FROM ubuntu
MAINTAINER tnssfairchild (sfairchild@trinet-hi.com)
RUN /bin/bash -c 'apt-get -y update && apt-get -y install pwgen'
RUN /bin/bash -c 'apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev libgmp3-dev libdb-dev libdb++-dev libgmp3-dev git'
RUN /bin/bash -c 'mkdir -m755 /root/.pepecoin'
COPY pepecoind /root/.pepecoin/pepecoind
RUN /bin/bash -c 'USERNAME=$(pwgen -s 16 1) && PASSWORD=$(pwgen -s 64 1) && \
echo "rpcuser=$USERNAME" > /root/.pepecoin/pepecoin.conf && \
echo "rpcpassword=$PASSWORD" >> /root/.pepecoin/pepecoin.conf  && \
echo "server=1" >> /root/.pepecoin/pepecoin.conf && \
echo "listen=1" >> /root/.pepecoin/pepecoin.conf && \
echo "port=29377" >> /root/.pepecoin/pepecoin.conf && \
echo "rpcport=29376" >> /root/.pepecoin/pepecoin.conf && \
echo "addnode=seed1.freepepe.org" >> /root/.pepecoin/pepecoin.conf && \
echo "addnode=seed2.freepepe.org" >> /root/.pepecoin/pepecoin.conf && \
echo "addnode=seed3.freepepe.org" >> /root/.pepecoin/pepecoin.conf && \
echo "addnode=162.248.93.192:29377" >> /root/.pepecoin/pepecoin.conf && \
echo "litemode=1" >> /root/.pepecoin/pepecoin.conf && \
echo "masternode=0" >> /root/.pepecoin/pepecoin.conf'
CMD /root/.pepecoin/pepecoind -datadir=/root/.pepecoin -conf=/root/.pepecoin/pepecoin.conf
