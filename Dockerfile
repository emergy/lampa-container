FROM node:lts-alpine

ARG VERSION
ARG BUILD_DATE
ARG GIT_COMMIT

LABEL version=${VERSION}
LABEL build_date=${BUILD_DATE}
LABEL git_commit=${GIT_COMMIT}

RUN apk add --no-cache git && \
    git clone https://github.com/yumata/lampa-source.git /app && \
    chown -R node:node /app && \
    cd /app && \
    npm install

WORKDIR /app

EXPOSE 3000

CMD ["npm", "run", "start"]
