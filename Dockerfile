FROM golang:1.13.6-alpine3.11

RUN mkdir -p /go/src/github.com/h8ck3r/gcrawl

WORKDIR /go/src/github.com/h8ck3r/gcrawl

ENTRYPOINT /bin/ash