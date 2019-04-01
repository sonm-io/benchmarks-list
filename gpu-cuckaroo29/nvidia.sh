#!/bin/bash

mkdir -p /lib64/nvidia/
ln -s /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1 /lib64/nvidia/libnvidia-ml.so
export LD_LIBRARY_PATH=/usr/local/nvidia/lib64/:/lib64/nvidia/

timeout --foreground --kill-after=5 --signal=SIGTERM ${BENCH_TIME_SEC} \
    /bminer -uri cuckaroo29://vybegallo.sonm:foo@grin29.f2pool.com:13654 \
    -logfile /miner.log > /dev/null 2>&1

if [[ ! -z $(cat miner.log | grep "Speed:" | awk '{print $6}') ]]; then
    NUMBERS=$(cat miner.log | grep "Speed:" | awk '{print $6}' | numaverage)
fi

GRAPHS=0
if [[ ! -z "$NUMBERS" ]]; then
    GRAPHS=$(echo "$NUMBERS * 100" | bc | numaverage -i)
fi

echo "$GRAPHS"
exit 0
