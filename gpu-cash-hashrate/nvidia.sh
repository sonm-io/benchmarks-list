#!/bin/bash

# monkey-patching ᕕ( ಠ_ಠ )ᕗ
if [[ "$SONM_GPU_TYPE" -eq "NVIDIA" ]]; then
    ln -s /usr/local/nvidia/lib64/libnvidia-ml.so.1 /lib64/nvidia/libnvidia-ml.so
    export LD_LIBRARY_PATH=/usr/local/nvidia/lib64/:/lib64/nvidia/
fi

/home/zcashcuda/miner --server zec-eu1.nanopool.org --user t1NgEd9Wo6fqMt3cuVR5fTYyo2Gv3JT5RMB.sonm-worker/szwtdy@gmail.com --pass z --port 6666 --log 2 --logfile zcashminer.log > /dev/null 2>&1 &
sleep ${BENCH_TIME_SEC}

SOLS=0
NUMBERS=$(cat zcashminer.log | grep "Total speed:" | grep -oE "[0-9]+" | grep -v 0)
if [[ ! -z "$NUMBERS" ]]; then
    SOLS=$(cat zcashminer.log | grep "Total speed:" | grep -oE "[0-9]+" | grep -v 0 | numaverage -i)
fi

echo "$SOLS"
exit 0
