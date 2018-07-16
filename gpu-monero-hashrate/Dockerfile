FROM sonm/opencl

RUN apt-get update && \
    apt-get install -y num-utils libhwloc-dev libssl-dev --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /miner/ && \
    mkdir -p /lib64/nvidia/

COPY ./*.sh /
COPY ./amd/ /miner/amd/
COPY ./nvidia/ /miner/nvidia/
CMD ["/cmd.sh"]
