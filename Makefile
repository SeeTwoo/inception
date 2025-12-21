COMPOSE=docker compose -f srcs/docker-compose.yml --env-file srcs/.env

build:
	sudo $(COMPOSE) up --build -d

down:
	sudo $(COMPOSE) down -v

clean:
	sudo rm -rf /data/mariadb/*
	sudo rm -rf /data/wordpress/*
	sudo docker system prune -af

fclean: down clean

re: remove build

.PHONY: build down clean re
