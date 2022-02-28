ARG EMQX_VERSION
FROM emqx/emqx:${EMQX_VERSION} as source

FROM alpine:3.14

RUN apk add --no-cache \
    git \
    curl \
    bash \
    libc-dev \
    ncurses-dev \
    openssl-dev \
    coreutils \
    libstdc++ \
    jq

COPY --from=source /opt/emqx/ /opt/emqx
COPY --from=source /usr/bin/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
WORKDIR /opt/emqx

RUN adduser -D -u 1000 emqx \
    && echo "emqx ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

RUN chgrp -Rf emqx /opt/emqx && chmod -Rf g+w /opt/emqx \
    && chown -Rf emqx /opt/emqx

USER emqx

VOLUME ["/opt/emqx/log", "/opt/emqx/data"]

EXPOSE 1883 8081 8083 8084 8883 11883 18083 4369 4370 5369 6369 6370
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
CMD ["/opt/emqx/bin/emqx", "console"]
