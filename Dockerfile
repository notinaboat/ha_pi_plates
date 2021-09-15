ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache --virtual .build-deps \
    python3-dev \
    gcc \
    make \
    linux-headers \
    musl \
    musl-dev \
    libc-dev \
    py3-pip \
 && apk add --no-cache \
    py3-six \
    python3 \
 && pip install wheel \
 && CFLAGS="-fcommon" pip install RPi.GPIO \
 && CFLAGS="-fcommon" pip install spidev \
 && pip install pi-plates \
 && apk del .build-deps

COPY relay_server.py http_server.py /
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
