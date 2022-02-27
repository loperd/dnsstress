FROM golang:1.17-alpine3.15

WORKDIR /app

RUN set -xe \
    && go version \
    && apk add --no-cache --virtual build-dependencies git \
    && git clone https://github.com/DataDog/dnsstress.git . \
    && apk del build-dependencies

RUN go build && cp dnsstress /usr/local/bin/dnsstress

ENTRYPOINT ["/usr/local/bin/dnsstress"]
CMD ["--help"]