# Reverse Proxy on Docker

## git clone

```
mkdir -p ~/containers/
cd ~/containers/
git clone https://github.com/teityura/rproxy.git
cd rproxy/
```

## ドメインを変更する場合

```
find . -type f -not -path "./.git/*" -exec sed -i "s/teityura.com/hoge.com/g" '{}' \;
mv etc/letsencrypt/live/teityura.com etc/letsencrypt/live/hoge.com
mv etc/nginx/conf.d/teityura.com.conf etc/nginx/conf.d/hoge.com.conf
```

## サブドメインを追加する場合

```
サブドメインを追加したときに、追記予定
```

## docker-compose up -d

```
docker-compose up -d
```
