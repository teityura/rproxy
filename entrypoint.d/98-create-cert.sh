#!/bin/sh

set -e

#===============================================================================
# 証明書を作成
#===============================================================================

CERTFILE='/etc/letsencrypt/live/teityura.com/fullchain.pem'

if [ ! -e "$CERTFILE" ]; then
  certbot certonly \
    --standalone \
    -d teityura.com \
    -d git.teityura.com \
    -m teityura@gmail.com \
    --keep \
    --agree-tos \
    --non-interactive
    # --dry-run
fi

exit 0
