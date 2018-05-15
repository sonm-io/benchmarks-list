#!/bin/bash

GPU_FORCE_64BIT_PTR=1
GPU_MAX_ALLOC_PERCENT=100
BENCH_TIME_SEC=80

# monkey-patching ᕕ( ಠ_ಠ )ᕗ
if [[ "$SONM_GPU_TYPE" -eq "NVIDIA" ]]; then
    ln -s /usr/local/nvidia/lib64/libnvidia-ml.so.1 /lib64/nvidia/libnvidia-ml.so
    export LD_LIBRARY_PATH=/usr/local/nvidia/lib64/:/lib64/nvidia/
fi

timeout --kill-after=5 --signal=SIGTERM ${BENCH_TIME_SEC} \
    /home/claymore/ethdcrminer64 -mode 1 -benchmark 1 > claymoreoutput.log

MH=0
NUMBERS=$(cat claymoreoutput.log | grep -a 'Total Speed' | grep -av '0.000 Mh/s')
if [[ -z "$NUMBERS" ]]; then
    MH=0
else
    MH=$(cat claymoreoutput.log | grep -a 'Total Speed' | grep -av '0.000 Mh/s' | cut -d ' ' -f 5  | numaverage -i)
fi

echo '{"results":{"gpu-eth-hashrate":{"result":'${MH}'}}}'
exit 0
