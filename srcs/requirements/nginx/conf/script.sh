#!/bin/sh

echo "server{
        listen 443 ssl;
        listen [::]:443 ssl;
        server_name $DOMAIN_NAME;
        ssl_certificate $CERT;
        ssl_certificate_key $KEY;
        ssl_protocols TLSv1.3;
        root /var/www/wordpress;
        index index.php index.html;" > /etc/nginx/conf.d/nginx.conf && echo '
        location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
        }
}' >> /etc/nginx/conf.d/nginx.conf

nginx -g 'daemon off;'
