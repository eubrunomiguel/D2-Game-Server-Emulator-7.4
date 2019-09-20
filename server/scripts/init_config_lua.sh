#!/bin/bash

IP=${PUBLIC_IP:-""}
HOST=${MYSQL_HOST:-""}
USER=${MYSQL_USER:-""}
PASS=${MYSQL_PASSWORD:-""}
DB=${MYSQL_DATABASE:-""}

CONFIG_IP=ip
CONFIG_SQL_DB=sql_db
CONFIG_SQL_HOST=sql_host
CONFIG_SQL_USER=sql_user
CONFIG_SQL_PASS=sql_pass

sed  -i "s/^$CONFIG_IP .*$/$CONFIG_IP=\"$IP\"/" config.lua
sed  -i "s/^$CONFIG_SQL_DB .*$/$CONFIG_SQL_DB=\"$DB\"/" config.lua
sed  -i "s/^$CONFIG_SQL_HOST .*$/$CONFIG_SQL_HOST=\"$HOST\"/" config.lua
sed  -i "s/^$CONFIG_SQL_USER .*$/$CONFIG_SQL_USER=\"$USER\"/" config.lua
sed  -i "s/^$CONFIG_SQL_PASS .*$/$CONFIG_SQL_PASS=\"$PASS\"/" config.lua

printf "Config.lua edited with the following information:\n"
printf "$CONFIG_IP=${IP} \n$CONFIG_SQL_DB=${DB} \n$CONFIG_SQL_HOST=${HOST} \n$CONFIG_SQL_USER=${USER} \n$CONFIG_SQL_PASS=${PASS}\n"