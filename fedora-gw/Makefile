container:=$(shell docker ps | awk '$$NF=="gw" {print $$1}')

build:
	docker build -t fedora-gw  .

run:
	docker run --name gw -d --privileged --network kind -it fedora-gw

exec:
	docker exec -it $(container) /bin/bash

delete:
	docker stop $(container)
	docker rm $(container)

logs:
	docker logs -f ${container}
