sysbench_image="sonm/cpu-sysbench:latest"
dumb_image="sonm/dumb-bench:latest"
net_image="sonm/net-bandwidth:latest"
gpu_eth_image="sonm/gpu-eth-hashrate:latest"
gpu_cash_image="sonm/gpu-cash-hashrate:latest"
gpu_redshift="sonm/gpu-redshift:latest"
gpu_monero="sonm/gpu-monero-hashrate:latest"

all: sysbench net gpu-eth gpu-cash redshift monero

dumb: build/dumb push/dumb
sysbench: build/sysbench push/sysbench
net: build/net push/net
gpu-eth: build/gpu-eth push/gpu-eth
gpu-cash: build/gpu-cash push/gpu-cash
redshift: build/redshift push/redshift
monero: build/monero push/monero

build/sysbench:
	docker build -t ${sysbench_image} ./cpu-sysbench/

push/sysbench:
	docker push ${sysbench_image}

build/dumb:
	docker build -t ${dumb_image} ./dumb-bench/

push/dumb:
	docker push ${dumb_image}

build/net:
	docker build -t ${net_image} ./net-speedtest/

push/net:
	docker push ${net_image}

build/gpu-eth:
	docker build -t ${gpu_eth_image} ./gpu-eth-hashrate/

push/gpu-eth:
	docker push ${gpu_eth_image}

build/gpu-cash:
	docker build -t ${gpu_cash_image} ./gpu-cash-hashrate/

push/gpu-cash:
	docker push ${gpu_cash_image}

build/redshift:
	docker build -t ${gpu_redshift} ./gpu-redshift/

push/redshift:
	docker push ${gpu_redshift}

build/monero:
	docker build -t ${gpu_monero} ./gpu-monero-hashrate/

push/monero:
	docker push ${gpu_monero}
