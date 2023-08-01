FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx \
openssl \
&& rm -rf /var/lib/apt/lists/*

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/ssl/alondot.crt \
        -keyout /etc/ssl/alondot.key \
        -subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=19 School/OU=alondot/CN=alondot/"

RUN mkdir -p /run/nginx		
COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]