FROM alpine:3.19

ARG DB_NAME DB_USER DB_PASSWD DB_ROOT_PASSWD

COPY ./conf/setup.sh /

RUN chmod +x /setup.sh && \
    mkdir /database /run/mysqld && \
    apk update && \
    apk add --no-cache mariadb mariadb-client && \
    chown -R mysql:mysql /database /run/mysqld && \
    ./setup.sh && rm -rf query.sql setup.sh

EXPOSE 3306/tcp

ENTRYPOINT [ "mysqld_safe", "--user=mysql", "--datadir=/database", "--port=3306", "--bind-address=0.0.0.0", "--skip-networking=0"]