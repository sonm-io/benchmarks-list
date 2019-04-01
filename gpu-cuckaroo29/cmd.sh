#!/bin/bash

export BENCH_TIME_SEC=120
export GPU_FORCE_64BIT_PTR=1
export GPU_MAX_ALLOC_PERCENT=100

GRAPHS=0
case "$SONM_GPU_TYPE" in
    "NVIDIA" )
        GRAPHS=$(./nvidia.sh)
    ;;
    "RADEON" )
        GRAPHS=0
    ;;
    * )
    GRAPHS=0
esac

echo '{"results":{"gpu-cuckaroo29":{"result":'${GRAPHS}'}}}'
exit 0
