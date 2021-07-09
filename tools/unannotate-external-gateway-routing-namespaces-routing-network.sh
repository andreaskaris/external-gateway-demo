#!/bin/bash -x

router_container=$(docker ps | awk '$NF=="gw" {print $1}')
router_container_ip=$(docker exec -it ${router_container} ip a ls dev eth0 | awk '/inet / {print $2}' | awk -F '/' '{print $1}')
pod=$(oc get pod -n gateway -o name -l app=external-gateway)

oc annotate --overwrite -n gateway $pod k8s.v1.cni.cncf.io/network-status-
oc annotate --overwrite -n gateway $pod k8s.ovn.org/routing-namespaces-
oc annotate --overwrite -n gateway $pod k8s.ovn.org/routing-network-

