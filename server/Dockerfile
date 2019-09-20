FROM debian:7
WORKDIR /app

RUN apt-get update && apt-get -y install autoconf build-essential pkg-config libboost-dev libgmp3-dev libxml2-dev liblua5.1-0-dev libmysqlclient-dev libcrypto++-dev ccache libboost-filesystem-dev libboost-regex-dev libboost-system-dev libboost-thread-dev libssl-dev lua5.1 liblua5.1-sql-mysql-dev libncurses5-dev
COPY source ./source
RUN cd source && sh autogen.sh && ./configure --enable-mysql && make -j $(nproc) && mv otserv ../

COPY world ./data/world
COPY data ./data
COPY config.lua .

COPY scripts ./scripts
RUN chmod +x ./scripts/*.sh

CMD ./otserv