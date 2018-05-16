#!/bin/sh

set -ae

SERVER="138.68.91.1"
TIMEOUT="15s"
UPLOAD=0
DOWNLOAD=0

iperf -c ${SERVER} --tradeoff --format k --reportstyle C --time ${TIMEOUT} > report.txt 2>&1
ERR=$(cat report.txt | grep "connect failed" | wc -l)

if [[ "$ERR" -eq 0 ]]; then
    DOWNLOAD=$(cat report.txt | awk -F "," '{print $9}' | head -1)
    UPLOAD=$(cat report.txt | awk -F "," '{print $9}' | tail -1)
fi

echo '{"results":{"net-download":{"result":'${DOWNLOAD}'},"net-upload":{"result":'${UPLOAD}'}}}'
exit 0
