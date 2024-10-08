FROM alpine:3.19

ADD https://wordpress.org/latest.zip latest.zip

# COPY ./conf/wp-config.php /www/

RUN apk update && \
	apk add --no-cache php82-fpm php82-mysqli && mkdir /www && \
	unzip latest.zip && mv wordpress/* /www && \
	ln -s /dev/stderr /var/log/php82/error.log && \
	ln -s /dev/stderr /var/log/php82/access.log && \
	rm -rf latest.zip wordpress

	# sed -i -e "s/\$DB_NAME/$DB_NAME/" -e "s/\$DB_USER/$DB_USER/" \
	# -e "s/\$DB_PASSWD/$DB_PASSWD/" /www/wp-config.php

COPY ./conf/www.conf /etc/php82/php-fpm.d/

EXPOSE 9000

ENTRYPOINT ["php-fpm82", "--allow-to-run-as-root", "-F"]