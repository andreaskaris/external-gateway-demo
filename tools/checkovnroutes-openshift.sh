#!/bin/bash -x

for pod in $(oc get pods -n openshift-ovn-kubernetes -l app=ovnkube-master -o name); do
	oc exec -n openshift-ovn-kubernetes -it -c northd $pod -- ovn-nbctl lr-list >/dev/null 2>&1
	if [ "$?" == "0" ]; then
		echo "Routers are:"
		oc exec -n openshift-ovn-kubernetes -it -c northd $pod -- ovn-nbctl lr-list
		routers=$(oc exec -n openshift-ovn-kubernetes -it -c northd $pod -- ovn-nbctl lr-list | awk '{print $1}')
		for r in $routers ; do
	  		echo "=== Routes for router: $r ==="
	  		oc exec -n openshift-ovn-kubernetes -it -c northd $pod -- ovn-nbctl lr-route-list $r
		done
	fi
done
