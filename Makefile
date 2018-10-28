TAG=0.0.1
IMAGE='jaredv/rq-docker'
STACK='rq-stack'

build-and-deploy: image deploy-stack

image:
	docker build -t ${IMAGE}:${TAG} rq-docker/

latest:
	docker build -t ${IMAGE}:latest .

deploy-stack:
	docker stack deploy --compose-file rq-docker/docker-compose.yml ${STACK}

kill-stack:
	docker stack rm ${STACK}
