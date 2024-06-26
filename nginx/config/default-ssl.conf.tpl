server {
    listen 80;
    server_name ${DOMAIN} www.${DOMAIN};

    location ~* /\.env$ {
        deny all;
    }

    location /.well-known/acme-challenge/ {
        root /vol/www/;

        proxy_set_header Connection 'keep-alive';
        proxy_set_header Cache-Control 'no-cache';
        proxy_set_header Content-Type 'text/event-stream';
        proxy_http_version 1.1;
        proxy_read_timeout 300;
        proxy_connect_timeout 300;
        proxy_send_timeout 300;
    }

    location / {
        return 301 https://$host$request_uri;

        proxy_http_version 1.1;
        proxy_read_timeout 300;
        proxy_connect_timeout 300;
        proxy_send_timeout 300;
    }
}

server {
    listen 443 ssl;
    server_name ${DOMAIN} www.${DOMAIN};

    ssl_certificate             /etc/letsencrypt/live/${DOMAIN}/fullchain.pem;
    ssl_certificate_key         /etc/letsencrypt/live/${DOMAIN}/privkey.pem;

    include                     /etc/nginx/options-ssl-nginx.conf;

    ssl_dhparam                 /vol/proxy/ssl-dhparams.pem;

    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

    location ~* /\.env$ {
        deny all;
    }

    location / {
        client_max_body_size    75M;

        root /etc/nginx/html;
        autoindex on;  
    }
}