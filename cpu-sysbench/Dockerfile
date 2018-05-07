FROM ubuntu:18.04
RUN apt-get update && apt-get install -y sysbench && rm -rf /var/lib/apt/lists/*

ADD ./cmd.sh ./cmd.sh
ENTRYPOINT ["./cmd.sh"]
