#!/bin/bash -x

pod=$(oc get pod -n gateway -o name -l app=external-gateway)
oc annotate --overwrite -n gateway $pod k8s.ovn.org/routing-namespaces=application
