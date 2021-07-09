container:=$(shell docker ps | awk '$$NF=="gw" {print $$1}')

build:
	docker build -t fedora-gw  .

run:
	docker run --name gw -d --privileged --network kind -it fedora-gw

exec:
	docker exec -it $(container) /bin/bash

get-ip:
	docker exec -it $(container) /bin/bash -c "ip a ls dev eth0"

get-neighbor-table:
	docker exec -it $(container) /bin/bash -c "ip r; ip neigh"

delete:
	docker stop $(container)
	docker rm $(container)

logs:
	docker logs -f ${container}
