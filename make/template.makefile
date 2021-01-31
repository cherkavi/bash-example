OS := $(shell uname)
ENV := "production"

all: operation1 operation2 ## execute all

##@ Utilities
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-24s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

operation1: ## Add all hosts to host file
	@echo "operation #1"

operation2: ## Trust the development SSL certificate
ifeq ($(OS),Darwin)
	@echo "operation #2 Darwin OS"
else
	@echo "operation #2 non-Darwin OS"
endif



##@ Container management
start: ## Start all containers
	./docker-compose.sh up -d
stop: ## Stop all containers
	./docker-compose.sh stop
restart: stop start ## Restart all containers

rebuild: ## Rebuild all containers
	./docker-compose.sh pull mongo mongo_test redis fake_sftp_server api api_dump api_test &\
	./docker-compose.sh up -d --build --remove-orphans --force-recreate nginx php queue_worker dump_report_worker
rebuild-php: ## Rebuild PHP container
	./docker-compose.sh up -d --build --remove-orphans --force-recreate php
rebuild-nginx: ## Rebuild Nginx container
	./docker-compose.sh up -d --build --remove-orphans --force-recreate nginx
status: ## See the status of all running containers
	./docker-compose.sh ps