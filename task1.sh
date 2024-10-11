#!/bin/bash
pid=$(ps all | grep -E '[b]ash infinite.sh' | awk '{print $3}' | head -n1)

if [[ -n "$pid" ]]; then
    kill -9 "$pid" && echo "Process $pid killed" || echo "Failed to kill process $pid"
else
    echo "No matching process found"
fi

