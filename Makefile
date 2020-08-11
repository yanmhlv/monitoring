HOST_IP ?= $(shell ipconfig getifaddr en0)

.PHONY: docker-down
docker-down:
	HOST_IP=${HOST_IP} docker-compose down

.PHONY: docker-pull
docker-pull:
	HOST_IP=${HOST_IP} docker-compose pull

.PHONY: docker-up
docker-up: docker-pull docker-down
	HOST_IP=${HOST_IP} docker-compose up -d
