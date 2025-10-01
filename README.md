#### Сервисы для локальной разработки с помощью Docker Compose
- Aiflow | http://localhost:8080
- ClickHouse Cluster (4 узла: 2 шарда, 2 реплики) | http://localhost:8123/play 
- Kafka c веб-интерфейс Kafdrop | http://localhost:9010
- RabbitMQ | http://localhost:15672
- Elasticsearch c веб-интерфейс Kibana | http://localhost:5601
- Jupyter Notebook | http://localhost:8888
- Spark Master UI | http://localhost:8081
- Spark Application UI | http://localhost:4040
- Superset | http://localhost:8088
- MinIO | http://localhost:9001





#### Все контейнеры созданы в одной сети.

#### Добавить новый сервис:
- Создать папку с сервисом
- Добавить название папки в SERVICES файла Makefile

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

<div aligin='left' id="Postgres">
<details>
<summary align="left"> <strong>Postgres</strong></summary>

### Запуск (со сборкой) 
```shell
make build-postgres 
```

### Запуск (без сборки)
```shell
make up-postgres
```

### Остановка
```shell
make down-postgres
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


<br>

<div aligin='left' id="Elasticsearch ">
<details>
<summary align="left"> <strong>Elasticsearch </strong></summary>

### Запуск (со сборкой) 
```shell
make build-elasticsearch 
```

### Запуск (без сборки)
```shell
make up-elasticsearch
```

### Остановка
```shell
make down-elasticsearch
```
</details>
</div>

<br>

<div aligin='left' id="Jupyter Notebook PySpark ">
<details>
<summary align="left"> <strong>Jupyter Notebook with PySpark</strong></summary>

### Запуск (со сборкой) 
```shell
make build-spark-jupyter
```

### Запуск (без сборки)
```shell
make up-spark-jupyter
```

### Остановка
```shell
make down-spark-jupyter
```
</details>
</div>

<br>


<div aligin='left' id="Superset">
<details>
<summary align="left"> <strong>Superset</strong></summary>

### Запуск (со сборкой) 
```shell
make build-bi-superset
```

### Запуск (без сборки)
```shell
make up-bi-superset
```

### Остановка
```shell
make down-bi-superset
```
</details>
</div>

<br>

<div aligin='left' id="MinIO">
<details>
<summary align="left"> <strong>MinIO</strong></summary>

### Запуск (со сборкой) 
```shell
make build-minio
```

### Запуск (без сборки)
```shell
make up-minio
```

### Остановка
```shell
make down-minio
```
</details>
</div>

<br>

</details>
</div>


<br>

#### Единое удаление containers, images, volumes (очистка памяти Docker)
```shell
make docker-all-rm
```