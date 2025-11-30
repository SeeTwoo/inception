#!/bin/sh

set -e
echo "pre if"
if [ ! -d "/var/lib/mysql/mysql/${SQL_DATABASE}" ]; then
    chown -R mysql:mysql /var/lib/mysql
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
echo "install mysql ok"

cat << EOF > /tmp/init.sql
    CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOF

echo "script creer"
    exec mysqld_safe --init-file=/tmp/init.sql
else
    exec mysqld_safe
fi
echo "script entrypoint executer"