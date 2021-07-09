#!/bin/bash -x

for pod in $(oc get pods -n ovn-kubernetes -l name=ovnkube-master -o name); do
	echo "Routers are:"
	oc exec -n ovn-kubernetes -it -c ovn-northd $pod -- ovn-nbctl lr-list
	routers=$(oc exec -n ovn-kubernetes -it -c ovn-northd $pod -- ovn-nbctl lr-list | awk '{print $1}')
	for r in $routers ; do
		echo "=== Routes for router: $r ==="
		oc exec -n ovn-kubernetes -it -c ovn-northd $pod -- ovn-nbctl lr-route-list $r
	done
done
