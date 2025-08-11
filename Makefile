up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	docker compose -f ./srcs/docker-compose.yml down
	docker compose -f ./srcs/docker-compose.yml up --build -d

fclean:
	@docker ps -qa | xargs -r docker stop
	@docker ps -qa | xargs -r docker rm
	@docker images -qa | xargs -r docker rmi -f
	@docker volume ls -q | xargs -r docker volume rm
	@docker network ls -q | grep -vE '^(bridge|host|none)$$' | xargs -r docker network rm 2>/dev/null