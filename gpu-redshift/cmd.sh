#!/bin/bash

TIME=$(/usr/redshift/bin/redshiftBenchmark /scene/vultures/Vultures.rs 2>&1 | grep "Time:")

if [[ -z "${TIME// }" ]]; then
	echo "{\"results\":{\"gpu-redshift\":{\"result\":0}}}"
else
	HH=$(echo $TIME | grep -oE [0-9]+h | grep -oE [0-9]+)
	MM=$(echo $TIME | grep -oE [0-9]+m | grep -oE [0-9]+)
	SS=$(echo $TIME | grep -oE [0-9]+s | grep -oE [0-9]+)
	RESULT=$(expr 1000000 / $(expr $HH \* 3600 + $MM \* 60 + $SS))
	echo "{\"results\":{\"gpu-redshift\":{\"result\":$RESULT}}}"
fi
