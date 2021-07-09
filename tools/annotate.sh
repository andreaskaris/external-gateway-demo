#!/bin/bash -x

router_container=$(docker ps | awk '$NF=="gw" {print $1}')
router_container_ip=$(docker exec -it ${router_container} ip a ls dev eth0 | awk '/inet / {print $2}' | awk -F '/' '{print $1}')

oc annotate --overwrite namespace application k8s.ovn.org/routing-external-gws=${router_container_ip}
