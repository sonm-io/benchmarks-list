#!/bin/bash

/home/zcashamd/zecminer64 -benchmark 1 > /zecmineroutput.log 2>&1 &
sleep ${BENCH_TIME_SEC}

NUMBERS=$(cat /zecmineroutput.log | grep -oE "ZEC - Total Speed: [0-9]+" | grep -oE "[0-9]+")

SOLS=0
if [[ ! -z "$NUMBERS" ]]; then
    SOLS=$(cat /zecmineroutput.log | grep -oE "ZEC - Total Speed: [0-9]+" | grep -oE "[0-9]+" | numaverage -i)
fi

echo "$SOLS"
exit 0
