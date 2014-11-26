#!/bin/bash

#BROKER=4
sed -e "s/broker.id=0/broker.id=$BROKER/;s/#host.name=localhost/host.name=knode$BROKER/;s/zookeeper.connect=localhost:2181/zookeeper.connect=znode:2181/" server.properties > tmp.properties
sed 's/??/\
/g' tmp.properties > server.properties
rm tmp.properties
