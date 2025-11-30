FROM debian:bookworm

RUN mkdir -p /etc/nginx/ssl

RUN apt update && apt upgrade && apt install nginx -y && apt install vim -y && apt install curl -y && apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/st+IDF/L=PARIS/0=42/CN=sle-nogu.42.fr/UID=sle-nogu"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]