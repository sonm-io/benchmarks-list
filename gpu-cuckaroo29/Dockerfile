FROM sonm/bminer:15.3.1

RUN apt-get update \
    && apt-get install num-utils bc -y \
    && rm -rf /var/lib/apt/lists/*

COPY cmd.sh nvidia.sh /

ENTRYPOINT ["/cmd.sh"]
