#!/bin/bash
echo $SERVER
sed -i "s/SERVER/$SERVER/g" /etc/shadowsocks/config.json
echo $PORT
sed -i "s/PORT/$PORT/g" /etc/shadowsocks/config.json
echo $PASSWORD
sed -i "s/PASSWORD/$PASSWORD/g" /etc/shadowsocks/config.json
echo $METHOD
sed -i "s/METHOD/$METHOD/g" /etc/shadowsocks/config.json
