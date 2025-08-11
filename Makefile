up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	docker compose -f ./srcs/docker-compose.yml down
	docker compose -f ./srcs/docker-compose.yml up --build -d