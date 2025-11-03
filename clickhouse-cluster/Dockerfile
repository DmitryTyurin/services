FROM clickhouse/clickhouse-server:23.11.3.23

USER root

# Установка зависимостей
RUN apt-get update && \
    apt-get install -y python3 python3-pip git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Копируем requirements.txt в контейнер
COPY requirements.txt /requirements.txt

# Устанавливаем зависимости
RUN pip3 install --no-cache-dir --timeout 1000 --retries 5 -r /requirements.txt

# Копируем скрипты
COPY ./data/functions_py /var/lib/clickhouse/user_scripts
COPY ./data/functions_xml /etc/clickhouse-server

# Исправляем формат ВСЕХ .py файлов (конвертируем CRLF → LF)
RUN find /var/lib/clickhouse/user_scripts -name "*.py" -type f -exec python3 -c "
import sys
for filename in sys.argv[1:]:
    try:
        with open(filename, 'rb') as f:
            content = f.read()
        content = content.replace(b'\r\n', b'\n').replace(b'\r', b'\n')
        with open(filename, 'wb') as f:
            f.write(content)
        print(f'Fixed: {filename}')
    except Exception as e:
        print(f'Error processing {filename}: {e}')
" _ {} +

# Даем права на выполнение для ВСЕХ .py файлов
RUN find /var/lib/clickhouse/user_scripts -name "*.py" -type f -exec chmod +x {} \; && \
    chown -R clickhouse:clickhouse /var/lib/clickhouse/user_scripts/ && \
    chown -R clickhouse:clickhouse /etc/clickhouse-server/

USER clickhouse