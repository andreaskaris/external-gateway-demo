#!/bin/bash

interface=$1
source_subnet=$2
INTERFACE="${interface:-eth0}"
SOURCE_SUBNET="${source_subnet:-10.244.0.0/16}"

iptables -t nat -I POSTROUTING -o $INTERFACE -j MASQUERADE

tcpdump -nne -i $INTERFACE -Q in -l src net $SOURCE_SUBNET | while read line ; do 
  mac=$(echo "$line" | awk '{print $2}')
  ip=$(echo "$line" | awk '{print $10}')
  ip route add $ip/32 dev $INTERFACE 2>/dev/null
  ip route change $ip/32 dev $INTERFACE 2>/dev/null
  ip neigh add $ip lladdr $mac dev $INTERFACE 2>/dev/null
  ip neigh change $ip lladdr $mac dev $INTERFACE 2>/dev/null
done

sleep infinity
