FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl gettext-base

COPY ./conf/script.sh /etc/nginx/script.sh

RUN chmod +x /etc/nginx/script.sh && openssl genpkey -algorithm RSA -out /etc/nginx/server.key &&  openssl req -new -key /etc/nginx/server.key -out /etc/nginx/server.csr -subj "/CN=localhost" &&  openssl x509 -req -days 365 -in /etc/nginx/server.csr -signkey /etc/nginx/server.key -out /etc/nginx/server.crt

EXPOSE 443

ENTRYPOINT ["/etc/nginx/script.sh"]
