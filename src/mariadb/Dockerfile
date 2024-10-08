FROM alpine:3.19

COPY ./conf/setup.sh /

RUN chmod +x /setup.sh && \
    mkdir /database /run/mysqld && \
    apk update && \
    apk add --no-cache mariadb mariadb-client && \
    chown -R mysql:mysql /database /run/mysqld

EXPOSE 3306/tcp

ENTRYPOINT [ "./setup.sh" ]