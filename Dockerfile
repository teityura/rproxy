FROM nginx:1.19.2-alpine

RUN set -x && \
  apk --no-cache add tzdata certbot && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD sh -c 'crond -b -l 1 && \
  /usr/sbin/nginx -g "daemon off;"'
