#!/bin/sh

set -e

#===============================================================================
# Create certificate
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
