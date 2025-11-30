FROM debian:bookworm
RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y
COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/entrypoint.sh /
RUN chmod 755 entrypoint.sh
EXPOSE 3306
CMD ["./entrypoint.sh"]
