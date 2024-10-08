FROM alpine:3.19

RUN apk update && \
	apk add --no-cache nginx openssl && \
	mkdir /etc/nginx/ssl /www && \
	ln -s /dev/stdout /var/log/nginx/access.log && \
	openssl genrsa --out /etc/nginx/ssl/nginx.key 2048 && \
	openssl req -batch -new -key /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.csr && \
	openssl x509 -req -days 3650 -in /etc/nginx/ssl/nginx.csr \
	-signkey /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443/tcp

ENTRYPOINT ["nginx", "-g", "daemon off;"] 