#!/bin/sh

set -e

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

exec "$@"
