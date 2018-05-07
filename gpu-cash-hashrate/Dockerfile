FROM sonm/opencl

ENV ZCASH_CUDA_VERSION="0.3.4b"
ENV ZCASH_AMD_VERSION="12.6"

RUN apt-get update && \
    apt-get install -y curl libcurl3 num-utils && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /home/zcashcuda && cd /home/zcashcuda && \
	curl -L -o cuda.tar.gz https://github.com/nanopool/ewbf-miner/releases/download/v${ZCASH_CUDA_VERSION}/Zec.miner.${ZCASH_CUDA_VERSION}.Linux.Bin.tar.gz && \
	tar xzvf cuda.tar.gz && \
    rm cuda.tar.gz  && \
    mkdir /home/zcashamd && cd /home/zcashamd && \
	curl -L -o amd.tar.gz https://github.com/nanopool/ClaymoreZECMiner/releases/download/v${ZCASH_AMD_VERSION}/Claymore.s.ZCash.AMD.GPU.Miner.v${ZCASH_AMD_VERSION}.-.LINUX.tar.gz && \
	tar xzvf amd.tar.gz && \
    rm amd.tar.gz && \
    mkdir -p /lib64/nvidia/

ADD ./*.sh /
CMD ["/cmd.sh"]
