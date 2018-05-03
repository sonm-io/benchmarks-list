sysbench_image="sonm/cpu-sysbench:latest"
dumb_image="sonm/dumb-bench:latest"
net_image="sonm/net-bandwidth:latest"

all: sysbench dumb

dumb: build/dumb push/dumb
sysbench: build/sysbench push/sysbench
net: build/net push/net

build/sysbench:
	docker build -t ${sysbench_image} ./cpu-sysbench/

push/sysbench:
	docker push ${sysbench_image}


build/dumb:
	docker build -t ${sysbench_image} ./dumb-bench/

push/dumb:
	docker push ${sysbench_image}

build/net:
	docker build -t ${net_image} ./net-bandwidth/

push/net:
	docker push ${net_image}
