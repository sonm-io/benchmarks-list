#!/bin/bash

export BENCH_TIME_SEC=200
export GPU_FORCE_64BIT_PTR=1
export GPU_MAX_ALLOC_PERCENT=100

SOLS=0
case "$SONM_GPU_TYPE" in
    "NVIDIA" )
        SOLS=$(./nvidia.sh)
    ;;
    "RADEON" )
        SOLS=$(./radeon.sh)
    ;;
    * )
    echo "unknown GPU type"
    exit 1
esac

echo '{"results":{"gpu-cash-hashrate":{"result":'${SOLS}'}}}'
exit 0
