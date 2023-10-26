# базовый образ
FROM ubuntu:22.04

# скопировать файлы программы в контейнер
COPY . .

# установить нужные библиотеки и обновить систему
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install -r requirements.txt

# настройка запуска Flask
ENV FLASK_APP=main
EXPOSE 8000
CMD flask run --host 0.0.0.0 --port 8000
