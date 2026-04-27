#!/bin/bash
# Disk Usage Monitor
# Sends alert if disk usage exceeds 90%

THRESHOLD=90
USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is at ${USAGE}% - exceeds ${THRESHOLD}% threshold"
else
    echo "OK: Disk usage is at ${USAGE}%"
fi
