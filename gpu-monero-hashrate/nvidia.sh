#!/bin/bash

# monkey-patching ᕕ( ಠ_ಠ )ᕗ
if [[ "$SONM_GPU_TYPE" -eq "NVIDIA" ]]; then
    ln -s /usr/local/nvidia/lib64/libnvidia-ml.so.1 /lib64/nvidia/libnvidia-ml.so
    export LD_LIBRARY_PATH=/usr/local/nvidia/lib64/:/lib64/nvidia/
fi

timeout --foreground --kill-after=10 --signal=SIGTERM 150 /miner/nvidia/xmrig-nvidia \
    -o xmr-eu1.nanopool.org:14444 \
    -u 489nQ2ip8MhbmiB9rkYAAaGVM8VsYWen3KpC1cWUjdsQgh7ErTEiYnC61EZZWgJQxx9AyyAHL51TJcmAhSEJvGA879BUvHG  \
    --user-agent sonm-benchmark --no-color 1> /bench-cuda.log 2>&1

NUMBERS=$(cat /bench-cuda.log | grep 'max: ' | cut -d' ' -f 10)
HASHES=0
if [[ ! -z "$NUMBERS" ]]; then
    HASHES=$(cat /bench-cuda.log | grep 'max: ' | cut -d' ' -f 10 | numaverage -i)
fi

echo "$HASHES"
exit 0
