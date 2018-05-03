#!/bin/bash

PRIMES=50000
CPU_INFO=${SONM_CPU_COUNT:-1}

RESULT_SINGLE=0
RESULT_MULTI=0

# we always need result for single core
RESULT_SINGLE=$(sysbench --threads=1 cpu --cpu-max-prime=${PRIMES} run | grep "total number of events" | grep -oE "[0-9]+" | head -1)

if [[ "$CPU_INFO" -gt 1 ]]; then
    # if there is more than one core - perform multi-threaded measurement
    RESULT_MULTI=$(sysbench --threads=${CPU_INFO} cpu --cpu-max-prime=${PRIMES} run | grep "total number of events" | grep -oE "[0-9]+" | head -1)
else
    # if there is only one core assume that single- and multi-threaded results are equal
    RESULT_MULTI=${RESULT_SINGLE}
fi

echo '{"results":{"cpu-sysbench-single":{"result":'${RESULT_SINGLE}'},"cpu-sysbench-multi":{"result":'${RESULT_MULTI}'}}}'
exit 0
