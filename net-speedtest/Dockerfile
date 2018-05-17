FROM python:alpine

RUN apk update && apk add jq

ADD ./run.sh ./test.py /

ENTRYPOINT "/run.sh"
