# Reverse Proxy on Docker

## add subdomain

```
cp nginx/conf.d/teityura.com.conf nginx/conf.d/xxx.teityura.com.conf
vim nginx/conf.d/xxx.teityura.com.conf
```

## check certonly

```
docker run --rm \
  -p 80:80 \
  -p 443:443 \
  -v $(pwd)/certbot/letsencrypt:/etc/letsencrypt \
  -v $(pwd)/certbot/letsencrypt:/var/lib/letsencrypt \
certbot/certbot \
  certonly \
  -d teityura.com \
  -d gitlab.teityura.com \
  -d xxx.teityura.com \
  -m teityura@gmail.com \
  --agree-tos \
  --standalone \
  --dry-run

openssl x509 -noout -text -in 'certbot/letsencrypt/live/teityura.com/fullchain.pem' | grep DNS
openssl x509 -noout -text -in 'certbot/letsencrypt/live/teityura.com/fullchain.pem' -dates
```

## deploy

```
docker-compose up -d
docker-compose ps
docker-compose logs -f

openssl s_client -host localhost -port 443 -servername teityura.com
openssl s_client -host localhost -port 443 -servername teityura.com | openssl x509 -noout -dates
```
