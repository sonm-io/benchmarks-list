FROM alpine:latest

RUN apk update && apk add iperf

ADD run.sh /run.sh
ENTRYPOINT "/run.sh"
