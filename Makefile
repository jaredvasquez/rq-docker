TAG=0.0.2
IMAGE=jaredv/rq-docker
STACK=rq-stack

image:
	docker build -t ${IMAGE}:${TAG} rq-docker/

latest:
	docker tag ${IMAGE}:${TAG} ${IMAGE}:latest 

all: image latest 

push: 
	docker push ${IMAGE}:${TAG} 
	docker push ${IMAGE}:latest

deploy-stack:
	docker stack deploy --compose-file rq-docker/docker-compose.yml ${STACK}

build-and-deploy: image deploy-stack

kill-stack:
	docker stack rm ${STACK}
