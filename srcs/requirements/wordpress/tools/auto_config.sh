#!/bin/sh

cd /var/www/wordpress

if [ -f /var/www/wordpress/wp-config.php ]; then
    echo "wp-config deja existant"
else
    if ! wp core is-installed --allow-root --path=/var/www/wordpress; then

        wp config create    --allow-root --skip-check \
                            --dbname="${SQL_DATABASE}" \
                            --dbuser="${SQL_USER}" \
                            --dbpass="${SQL_PASSWORD}" \
                            --dbhost="mariadb:3306" \
                            --path='/var/www/wordpress'
        wp core install --allow-root --url="${DOMAIN_NAME}" --title=INCEPTION \
            --admin_user="${WORDPRESS_ADMIN_LOGIN}" \
            --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}"

        wp user create "${WORDPRESS_USER_LOGIN}" "${WORDPRESS_USER_EMAIL}" --role=author \
            --user_pass="${WORDPRESS_USER_PASSWORD}" --allow-root
    fi
fi

echo "Apres fi wp"

exec php-fpm8.2 -F
