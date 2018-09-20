#!/bin/sh

sleep 3
echo '{"results":{"cpu-sysbench-single":{"result":'$RANDOM'},"cpu-sysbench-ultra":{"result":'$RANDOM'},"cpu-sysbench-multi":{"result":'$RANDOM'},"net-download":{"result":'$RANDOM'},"net-upload":{"result":'$RANDOM'},"gpu-eth-hashrate":{"result":'$RANDOM'},"gpu-cash-hashrate":{"result":'$RANDOM'},"gpu-redshift":{"result":'$RANDOM'},"cpu-cryptonight":{"result":'$RANDOM'}}}'
