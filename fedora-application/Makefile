build:
	docker build -t fedora-application .
	kind load docker-image "fedora-application" --name "ovn"

deploy:
	oc apply -f fedora-application.yaml
