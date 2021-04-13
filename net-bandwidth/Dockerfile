FROM python:3.7-slim-stretch

RUN apt update && apt install jq -y

ADD ./run.sh ./speedtest.py /

ENTRYPOINT "/run.sh"
