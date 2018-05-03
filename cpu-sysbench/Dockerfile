FROM ubuntu:17.10
RUN apt-get update && apt-get install -y sysbench && rm -rf /var/lib/apt/lists/*

ADD ./cmd.sh ./cmd.sh
ENTRYPOINT ["./cmd.sh"]
