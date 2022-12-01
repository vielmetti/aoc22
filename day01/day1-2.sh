#!/bin/sh
awk -f day1.awk < $1 | sort -n | tail -3 | awk '{ t+=$1 } END { print t }'
