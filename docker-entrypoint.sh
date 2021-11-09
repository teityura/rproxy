#!/bin/sh

set -e

#===============================================================================
# 証明書を作成
#===============================================================================

CERTFILE='/etc/letsencrypt/live/teityura.com/fullchain.pem'

if [ ! -e "$CERTFILE" ]; then
  certbot certonly \
    --standalone \
    --agree-tos \
    --non-interactive \
    --keep \
    -d teityura.com \
    --register-unsafely-without-email
fi

#===============================================================================
# ACMEを受けるディレクトリを作成
#===============================================================================

mkdir -p /var/www/html
chown nginx. /var/www/html

exec "$@"
