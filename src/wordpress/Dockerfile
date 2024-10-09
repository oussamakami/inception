FROM alpine:3.19

ARG DB_HOST DB_NAME DB_USER DB_PASSWD

COPY ./conf/wp-config.php /www/

ADD https://wordpress.org/latest.zip latest.zip

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

RUN apk update && \
	apk add --no-cache php82-fpm php82-mysqli php82-phar php82-iconv php82-mbstring&& \
	unzip latest.zip && mv wordpress/* /www && \
	ln -s /dev/stderr /var/log/php82/error.log && \
	ln -s /dev/stderr /var/log/php82/access.log && \
	rm -rf latest.zip wordpress && \
	sed -i -e "s/\$DB_NAME/$DB_NAME/" -e "s/\$DB_USER/$DB_USER/" \
	-e "s/\$DB_PASSWD/$DB_PASSWD/" -e "s/\$DB_HOST/$DB_HOST/" \
	/www/wp-config.php && chmod +x /usr/local/bin/wp

COPY ./conf/www.conf /etc/php82/php-fpm.d/

EXPOSE 9000

# --path="paht/wordpress"
# wp core download --path="/www"
# wp core install --url="https://127.0.0.1" --title="Blog Title" --admin_user="admin" --admin_password="password" --admin_email="admin@example.com" --skip-email

ENTRYPOINT ["php-fpm82", "--allow-to-run-as-root", "-F"]