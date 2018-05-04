FROM nvidia/cuda:9.1-runtime-ubuntu16.04

ADD ./redshift.run ./cmd.sh ./ scene /

# apt-get install -y libglib2.0-0 libgl1-mesa-glx libfreetype6 pkg-config wget
RUN apt-get update && apt-get install -y libglib2.0-0 libgl1-mesa-glx libfreetype6 && rm -rf /var/lib/apt/lists/* && \
    echo accept | /redshift.run && rm -f /redshift.run

CMD ["/cmd.sh"]
