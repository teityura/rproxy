FROM nginx:1.26.1-alpine

RUN set -x && \
  apk --no-cache add tzdata certbot && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata

CMD ["nginx", "-g", "daemon off;"]
