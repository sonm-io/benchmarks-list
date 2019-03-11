FROM sonm/monero-cpu@sha256:7742c178d546560058e2a596b97935f243c72cf26150feec6858e1ace6c45214

RUN apt-get update && \
    apt-get install -y num-utils && \
    rm -rf /var/lib/apt/lists/*

ADD run.sh /benchmark.sh

CMD ["/benchmark.sh"]
