FROM debian:bookworm
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
wget \
php8.2 \
php8.2-fpm \
php8.2-mysqli \
mariadb-client
RUN mkdir -p run/php
RUN wget https://fr.wordpress.org/wordpress-6.8.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.8.2-fr_FR.tar.gz && rm wordpress-6.8.2-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY tools/auto_config.sh auto_config.sh
RUN chmod 755 auto_config.sh
EXPOSE 9000
ENTRYPOINT [ "./auto_config.sh" ]