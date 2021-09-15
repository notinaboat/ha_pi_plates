ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

#    musl \
#   musl-dev \

RUN apk add --no-cache --virtual .build-deps \
    python3-dev \
    gcc \
    make \
    linux-headers \
    libc-dev \
 && apk add --no-cache python3 \
 && apk del .build-deps

#RUN pip install pi-plates

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
