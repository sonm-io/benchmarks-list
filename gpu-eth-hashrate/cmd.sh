#!/bin/bash

GPU_FORCE_64BIT_PTR=1
GPU_MAX_ALLOC_PERCENT=100

/home/claymore/ethdcrminer64 -mode 1 -benchmark 1 > claymoreoutput.log &
sleep 80

MH=0
NUMBERS=$(cat claymoreoutput.log | grep -a 'Total Speed' | grep -av '0.000 Mh/s')
if [[ -z "$NUMBERS" ]]; then
    MH=0
else
    MH=$(cat claymoreoutput.log | grep -a 'Total Speed' | grep -av '0.000 Mh/s' | cut -d ' ' -f 5  | numaverage -i)
fi

echo '{"results":{"gpu-eth-hashrate":{"result":'${MH}'}}}'
exit 0
