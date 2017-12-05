FROM ubuntu
MAINTAINER tnssfairchild (sfairchild@trinet-hi.com)
RUN /bin/bash -c 'apt-get -y update'
RUN /bin/bash -c 'apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev libgmp3-dev libdb-dev libdb++-dev libgmp3-dev git'
RUN /bin/bash -c 'git clone https://github.com/pepeteam/pepecoin.git'
RUN /bin/bash -c 'cd pepecoin/src && make -f /pepecoin/src/makefile.unix USE_UPNP=-1'

