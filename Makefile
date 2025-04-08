include .env

# запуск всех docker контейнеров
up: check-env docker-up echo-local-endpoints

# остановка всех docker контейнеров
down:
	docker compose down

build:
	docker compose build

# ВКОНТАКТЕ
up-vk-app:
	docker compose up -d --build vk_fastapi

down-vk-app:
	docker compose down vk_fastapi

logs-vk-app:
	docker compose logs -f vk_fastapi

restart-vk-app:
	docker compose restart vk_fastapi

# удаление старых volume и пересборка проекта
rebuild: down docker-rm-ch-volumes build

# сборка образов docker
docker-build: check-dc-version
	set COMPOSE_DOCKER_CLI_BUILD=1
	set DOCKER_BUILDKIT=1
	docker compose --progress=plain build

docker-up:
	docker compose up -d --wait

# запуск докер контейнеров, с локальной версией cism_data_platform pypi пакета
docker-up-local-data-platform:
	docker compose -f docker-compose.yml -f docker-compose.local_data_platform.yml up -d --wait

# проверка установки обязательных ENV переменных
check-env:
ifndef APP_NAME
$(error "In .env file not set APP_NAME variable")
endif

# эта команда упадет, если установлен древний docker-compose
check-dc-version:
	$(eval RESULT := $(shell docker compose config))

# просто вывод endpoints, для удобства
echo-local-endpoints:
	@echo "Aiflow | http://localhost:8080"
	@echo "ClickHouse Cluster (4 узла: 2 шарда, 2 реплики) | http://localhost:8123/play"
	@echo "clickhouse-node1:8123 | 9000"
	@echo "clickhouse-node2:8124 | 9001"
	@echo "clickhouse-node1:8125 | 9002"
	@echo "clickhouse-node1:8126 | 9003"
	@echo "clickhouse-node1:8126 | 9003"
	@echo "Kafka c веб-интерфейс Kafdrop | http://localhost:9010"
	@echo "RabbitMQ | http://localhost:15672"