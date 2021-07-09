build:
	docker build -t fedora-application .
	kind load docker-image "fedora-application" --name "ovn"

deploy:
	oc apply -f fedora-application.yaml

pin:
	oc patch deployment -n application fedora-deployment --patch '{"spec": {"template": {"spec": {"nodeSelector": {"kubernetes.io/hostname": "ovn-worker2"}}}}}'

unpin:
	oc patch deployment -n application fedora-deployment --type=json -p='[{"op": "remove", "path": "/spec/template/spec/nodeSelector"}]'
