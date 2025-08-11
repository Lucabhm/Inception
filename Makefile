up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	docker compose -f ./srcs/docker-compose.yml down
	docker compose -f ./srcs/docker-compose.yml up --build -d

fclean:
	docker stop $(docker ps -qa)
	docker rm $(docker ps -aq)
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)