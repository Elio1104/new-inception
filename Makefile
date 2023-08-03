BLACK		:= $(shell tput -Txterm setaf 0)
RED			:= $(shell tput -Txterm setaf 1)
GREEN		:= $(shell tput -Txterm setaf 2)
YELLOW		:= $(shell tput -Txterm setaf 3)
LIGHTPURPLE	:= $(shell tput -Txterm setaf 4)
PURPLE		:= $(shell tput -Txterm setaf 5)
BLUE		:= $(shell tput -Txterm setaf 6)
WHITE		:= $(shell tput -Txterm setaf 7)
RESET		:= $(shell tput -Txterm sgr0)

COMPOSE_FILE=srcs/docker-compose.yml
all: run

run: 
	@echo "$(BLUE)Building files for volumes ... $(RESET)"

	# Use the HOME environment variable, in makefile need to use two $$
	@mkdir -p $$HOME/data/wordpress
	@mkdir -p $$HOME/data/mysql
	@echo "$(BLUE)Building containers ... $(RESET)"

	# Use the new docker compose cli https://docs.docker.com/compose/reference/
	@docker compose -f $(COMPOSE_FILE) up --build

up:
	@echo "$(BLUE)Building files for volumes ... $(RESET)"

	# Dont use sudo for mkdir, it will run the command as root and so create at `/root/data/...`
	@mkdir -p $$HOME/data/wordpress
	@mkdir -p $$HOME/data/mysql
	@echo "$(BLUE)Building containers in background ... $(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d --build

list:	
	@echo "$(YELLOW)Listing all containers ... $(RESET)"
	 docker ps -a

list_volumes:
	@echo "$(PURPLE)Listing volumes ... $(RESET)"
	docker volume ls

clean: 	
	@echo "$(RED)Stopping containers ... $(RESET)"
	@docker compose -f $(COMPOSE_FILE) down
	@-docker stop `docker ps -qa`
	@-docker rm `docker ps -qa`
	@echo "$(RED)Deleting all images ... $(RESET)"
	@-docker rmi -f `docker images -qa`
	@echo "$(RED)Deleting all volumes ... $(RESET)"
	@-docker volume rm `docker volume ls -q`
	@echo "$(RED)Deleting all network ... $(RESET)"
	@-docker network rm `docker network ls -q`
	@echo "$(RED)Deleting all data ... $(RESET)"
	@sudo rm -rf $$HOME/data/wordpress
	@sudo rm -rf $$HOME/data/mysql
	@echo "$(RED)Deleting all $(RESET)"

.PHONY: run up list list_volumes clean
