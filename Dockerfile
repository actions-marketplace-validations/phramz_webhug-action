FROM golang:1.13-alpine3.11 as base

RUN mkdir -p /code/build
WORKDIR /code

COPY . .
RUN apk add --no-cache build-base && make build

FROM alpine:3.11 as final

ARG RELEASE_VERSION
ENV RELEASE_VERSION=${RELEASE_VERSION}

COPY --from=base /code/webhug /usr/bin/webhug

ENTRYPOINT ["/usr/bin/webhug"]

