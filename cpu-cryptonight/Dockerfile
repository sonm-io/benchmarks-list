FROM sonm/monero-cpu@sha256:cbf601b22c90993c44a6415032471538f4e55fa53e8a2ed8e45bcf870350da52

RUN apt-get update && \
    apt-get install -y num-utils && \
    rm -rf /var/lib/apt/lists/*

ADD run.sh /benchmark.sh

CMD ["/benchmark.sh"]
