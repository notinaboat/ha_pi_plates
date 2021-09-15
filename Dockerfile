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
    python3 \
 && pip install wheel \
 && CFLAGS="-fcommon" pip install RPi.GPIO \
 && pip install spidev \
 && pip install pi-plates

# && apk del .build-deps

#RUN pip install pi-plates

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
