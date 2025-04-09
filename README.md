#### Сервисы для локальной разработки с помощью Docker Compose
- Aiflow | http://localhost:8080
- ClickHouse Cluster (4 узла: 2 шарда, 2 реплики) | http://localhost:8123/play 
- Kafka c веб-интерфейс Kafdrop | http://localhost:9010
- RabbitMQ | http://localhost:15672

### Инициализация
Создаем .env файл. Локальная сеть по-умолчанию service_network.
<br>

```shell
cp .env.example .env
```
<br>

#### Все контейнеры созданы в одной сети.

## Запуск сервисов ⬇

<div aligin='left' id="all_services">
<details>
<summary align="left"> <strong>🔶 Все сервисы</strong></summary>

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


</details>
</div>
<br>

<div aligin='left' id="one_services">
<details>
<summary align="left"> <strong>🔷 Отдельные запуски сервисов</strong></summary>

<br>

<div aligin='left' id="Airflow">
<details>
<summary align="left"> <strong>Airflow</strong></summary>

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

</details>
</div>


<br>

<div aligin='left' id="ClickHouse_Cluster">
<details>
<summary align="left"> <strong>ClickHouse Cluster</strong></summary>

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

</details>
</div>


<br>

<div aligin='left' id="Kafka">
<details>
<summary align="left"> <strong>Kafka</strong></summary>

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

</details>
</div>


<br>

<div aligin='left' id="RabbitMQ">
<details>
<summary align="left"> <strong>RabbitMQ</strong></summary>

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
</details>
</div>

</details>
</div>

<br>

#### Единое удаление containers, images, volumes (очистка памяти Docker)
```shell
make docker-all-rm
```