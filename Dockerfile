FROM node:8-alpine

RUN npm install -g artillery && \
    apk update --no-cache -q && \
    apk add jq bc bash

VOLUME /artillery
WORKDIR /artillery

COPY ./entrypoint.sh ./bin/

ENTRYPOINT ["./bin/entrypoint.sh"]
