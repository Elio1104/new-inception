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
	@sudo mkdir -p /home/alondot/data/wordpress
	@sudo mkdir -p /home/alondot/data/mysql
	@echo "$(BLUE)Building containers ... $(RESET)"
	@docker compose -f $(COMPOSE_FILE) up --build

up:
	@echo "$(BLUE)Building files for volumes ... $(RESET)"
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
	@docker system prune -f --all --volumes
	@sudo rm -rf /home/alondot/data/wordpress
	@sudo rm -rf /home/alondot/data/mysql
	@echo "$(RED)Deleting all $(RESET)"

.PHONY: run up list list_volumes clean
