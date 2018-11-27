HOST_IP ?= $(shell ipconfig getifaddr en0)

.PHONY: down
down:
	docker-compose down -v --remove-orphans

.PHONY: up
up: down
	HOST_IP=${HOST_IP} docker-compose up
