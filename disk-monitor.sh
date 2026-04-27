!/bin/bash
# Description: Monitor disk usage and alert when a threshold is exceeded.
# Author: Harshavardhan Gonuguntla

# Configuration
THRESHOLD=90
MOUNT_POINT="/"

# Get the current usage percentage (numeric only)
USAGE=$(df "$MOUNT_POINT" --output=pcent | tail -1 | tr -dc '0-9')

# Safety check: Ensure USAGE is a valid number
if [[ ! "$USAGE" =~ ^[0-9]+$ ]]; then
    echo "Error: Could not retrieve disk usage data." >&2
    exit 1
fi

# Compare usage to threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage on $MOUNT_POINT is at ${USAGE}% (Threshold: ${THRESHOLD}%)"
    # Logic for email/alerts would go here in a production environment
else
    echo "Disk usage is healthy: ${USAGE}%"
fi
