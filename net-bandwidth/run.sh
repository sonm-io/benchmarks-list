#!/bin/sh

UPLOAD=0
DOWNLOAD=0

TMP_DOWN=0
TMP_UP=0

for i in $(/usr/local/bin/python /test.py --list | head -4 | grep -v speedtest | cut -d ')' -f 1); do
    /usr/local/bin/python /test.py --json --bytes --server $i > data.json 2>&1
    ERR=$?
    if [[ $ERR == 0 ]]; then
	TMP_DOWN=$(cat /data.json | jq '.download' | cut -d '.' -f 1)
	TMP_UP=$(cat /data.json | jq '.upload' | cut -d '.' -f 1)

	if [[ $DOWNLOAD -lt $TMP_DOWN ]]; then
		DOWNLOAD=$TMP_DOWN
	fi

        if [[ $UPLOAD -lt $TMP_UP ]]; then
                UPLOAD=$TMP_UP
        fi
	mv data.json data.json.$i
    fi
done

echo '{"results":{"net-download":{"result":'${DOWNLOAD}'},"net-upload":{"result":'${UPLOAD}'}}}'
exit 0
