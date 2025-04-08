#### Сервисы для локальной разработки с помощью Docker Compose
- Aiflow | http://localhost:8080
- ClickHouse Cluster (4 узла: 2 шарда, 2 реплики) | http://localhost:8123/play 
- Kafka c веб-интерфейс Kafdrop | http://localhost:9010
- RabbitMQ | http://localhost:15672

#### Все контейнеры созданы в одной сети.

## Все сервисы
### Запуск (со сборкой) всех сервисов
```shell
make build
```

### Запуск (без сборки) всех сервисов
```shell
make up
```

### Остановка всех сервисов
```shell
make down
```

### Единое удаление containers, images, volumes (очистка памяти Docker)
```shell
make docker-all-rm
```


## Отдельные запуски сервисов
## AIRFLOW
### Запуск (со сборкой) 
```shell
make build-airflow 
```

### Запуск (без сборки)
```shell
make up-airflow
```

### Остановка
```shell
make down-airflow
```

## CLICKHOUSE CLUSTER
### Запуск (со сборкой) 
```shell
make build-clickhouse-cluster 
```

### Запуск (без сборки)
```shell
make up-clickhouse-cluster
```

### Остановка
```shell
make down-clickhouse-cluster
```

## KAFKA
### Запуск (со сборкой) 
```shell
make build-kafka 
```

### Запуск (без сборки)
```shell
make up-kafka
```

### Остановка
```shell
make down-kafka
```

## RABBITMQ
### Запуск (со сборкой) 
```shell
make build-rabbitmq 
```

### Запуск (без сборки)
```shell
make up-rabbitmq
```

### Остановка
```shell
make down-rabbitmq
```