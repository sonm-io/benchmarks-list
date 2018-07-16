#!/bin/bash

export GPU_FORCE_64BIT_PTR=1
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_MAX_HEAP_SIZE=100
export GPU_SINGLE_ALLOC_PERCENT=100

timeout --kill-after=5 --signal=SIGTERM 110 /miner/amd/xmr-stak \
    -O foobar.com:1337 \
    -u notAnAddress \
    --currency monero7 -i 0 -p "" \
    -r sonm-benchmark \
    --benchmark 0 \
    --benchwait 5 \
    --benchwork 90 > /bench-amd.log 2>&1

NUMBERS=$(cat /bench-amd.log | grep 'Benchmark Total' | tail -1)

HASHES=0
if [[ ! -z "$NUMBERS" ]]; then
    HASHES=$(cat /bench-amd.log  | grep 'Benchmark Total' | tail -1 | cut -d' ' -f 6 | numaverage -i)
fi

echo "$HASHES"
exit 0
