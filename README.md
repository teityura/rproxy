# Reverse Proxy on Docker

## add subdomain

```
cp conf.d/teityura.com.conf conf.d/xxx.teityura.com.conf
vim conf.d/xxx.teityura.com.conf
```

## deploy

```
docker-compose up -d
docker-compose ps
docker-compose logs -f

openssl s_client -host localhost -port 443 -servername teityura.com
openssl s_client -host localhost -port 443 -servername teityura.com | openssl x509 -noout -dates
```

## check cert

```
openssl x509 -noout -text \
  -in /var/lib/docker/volumes/rproxy_letsencrypt/_data/live/teityura.com/cert.pem | grep DNS

openssl x509 -noout -text \
  -in /var/lib/docker/volumes/rproxy_letsencrypt/_data/live/teityura.com/cert.pem -dates
```

## check crond

```
tail -f /var/lib/docker/volumes/rproxy_log/_data/crond.log
```
