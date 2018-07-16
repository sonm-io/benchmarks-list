#!/bin/bash

HASHES=0
case "$SONM_GPU_TYPE" in
    "NVIDIA" )
        HASHES=$(./nvidia.sh)
    ;;
    "RADEON" )
        HASHES=$(./radeon.sh)
    ;;
    * )
    HASHES=0
esac

echo '{"results":{"gpu-monero-hashrate":{"result":'${HASHES}'}}}'
exit 0
