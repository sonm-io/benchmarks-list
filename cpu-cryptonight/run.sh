#!/bin/bash

timeout --foreground --kill-after=5 --signal=SIGTERM 90 \
    /miner/xmrig -a cryptonight \
    --url xmr-eu1.nanopool.org:14444 \
    --user 489nQ2ip8MhbmiB9rkYAAaGVM8VsYWen3KpC1cWUjdsQgh7ErTEiYnC61EZZWgJQxx9AyyAHL51TJcmAhSEJvGA879BUvHG \
    --rig-id=sonmbench \
    --print-time=10 \
    --no-color \
    --log-file /miner.log > /dev/null 2>&1

HASHES=0
# cat xmr-cpu.log | grep 'speed 10s/60s/15m' | awk '{print $5}' | numaverage -i
NUMBERS=$(cat miner.log | grep 'speed 10s/60s/15m' | awk '{print $5}')
if [[ ! -z "$NUMBERS" ]]; then
    HASHES=$(cat miner.log | grep 'speed 10s/60s/15m' | awk '{print $5}' | numaverage -i)
fi

echo '{"results":{"cpu-cryptonight":{"result":'${HASHES}'}}}'
exit 0
