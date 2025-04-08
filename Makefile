SERVICES = airflow clickhouse-cluster kafka rabbitmq

define SERVICE_INFO
	@echo "Доступные сервисы:"
	@echo "============================================"
	@echo "Airflow"
	@echo "		http://localhost:8080"
	@echo "ClickHouse Cluster (4 узла: 2 шарда, 2 реплики)"
	@echo "		http://localhost:8123/play"
	@echo "		clickhouse-node1:8123 | 9000"
	@echo "  	clickhouse-node2:8124 | 9001"
	@echo "  	clickhouse-node3:8125 | 9002"
	@echo "  	clickhouse-node4:8126 | 9003"
	@echo "Kafka с веб-интерфейсом Kafdrop"
	@echo "		http://localhost:9010"
	@echo "RabbitMQ"
	@echo "		http://localhost:15672"
	@echo "============================================"
endef

NETWORK = service_network

export COMPOSE_BAKE=false

.PHONY: all up down build ensure-network $(SERVICES)

# Создать сеть, если её нет
ensure-network:
	@if ! docker network inspect $(NETWORK) >/dev/null 2>&1; then \
		echo "Создание общей сети $(NETWORK)..."; \
		docker network create $(NETWORK); \
	else \
		echo "Сеть $(NETWORK) уже существует."; \
	fi

clean-network:
	@echo "Удаление сети $(NETWORK)..."
	@docker network rm $(NETWORK) 2>/dev/null || true

# Запуск всех сервисов с билдом
all: ensure-network build show-info

# Остановка всех сервисов
down:
	@echo "Остановка всех сервисов..."
	@for service in $(SERVICES); do \
		echo "Остановка $$service..."; \
		(cd $$service && docker compose down); \
	done

# Запуск всех сервисов с билдом
build: ensure-network
		@echo "Сборка и запуск всех сервисов..."
		@for service in $(SERVICES); do \
			echo "Сборка и запуск $$service..."; \
			(cd $$service && docker compose up -d --build); \
		done
		$(SERVICE_INFO)

# Запуск всех сервисов без билда
up:	ensure-network
		@echo "Запуск всех сервисов..."
		@for service in $(SERVICES); do \
			echo "Запуск $$service..."; \
			(cd $$service && docker compose up -d); \
		done

		$(SERVICE_INFO)

# Правила для отдельных сервисов
$(addprefix build-,$(SERVICES)): build-%: ensure-network
	@echo "Сборка и запуск $*..."
	@(cd $* && docker compose up -d --build)
	$(SERVICE_INFO)

# Правила для остановки отдельных сервисов
$(addprefix down-,$(SERVICES)): down-%:
	@echo "Остановка $*..."
	@(cd $* && docker compose down)

# Правила для запуска отдельных сервисов без билда
$(addprefix up-,$(SERVICES)): up-%: ensure-network
	@echo "Запуск $*..."
	@(cd $* && docker compose up -d)
	$(SERVICE_INFO)


docker-all-rm:
	@echo "Единое удаление контейнеров, образов и томов..."
	@for service in $(SERVICES); do \
		echo "Очистка для сервиса $$service..."; \
		(cd $$service && \
		docker-compose down --rmi all --volumes --remove-orphans || true); \
	done
	@echo "Удаление оставшихся docker-объектов..."
	@docker system prune -a --volumes --force || true