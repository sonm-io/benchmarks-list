#!/bin/sh

UPLOAD=0
DOWNLOAD=0

/usr/local/bin/python /test.py --json --bytes > data.json 2>&1
ERR=$?

if [[ $ERR == 0 ]]; then
    DOWNLOAD=$(cat /data.json | jq '.download' | cut -d '.' -f 1)
    UPLOAD=$(cat /data.json | jq '.upload' | cut -d '.' -f 1)
fi

echo '{"results":{"net-download":{"result":'${DOWNLOAD}'},"net-upload":{"result":'${UPLOAD}'}}}'
exit 0
