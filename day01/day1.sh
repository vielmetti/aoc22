#!/bin/sh
awk -f day1.awk < $1 | sort -n | tail -1
