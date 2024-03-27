FROM node:19-alpine


WORKDIR /app


COPY ./web/ /app

COPY ./docker/run.sh /app

RUN apk add -q --no-cache bash \
    && npm ci

ENTRYPOINT ["/bin/bash", "/app/run.sh"]
CMD ["start"]