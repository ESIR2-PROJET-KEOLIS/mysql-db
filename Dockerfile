FROM mysql:latest

ENV MYSQL_DATABASE=mydb \
    MYSQL_ROOT_PASSWORD=root \
    MYSQL_USER=user \
    MYSQL_PASSWORD=password

ADD BDD_traitement.sql /docker-entrypoint-initdb.d

EXPOSE 3306