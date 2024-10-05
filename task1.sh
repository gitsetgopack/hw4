#!/bin/bash
pid=$(ps all | grep -E '[bash] infinite.sh' | awk '{print $3}' | head -n1)
kill -9 $pid || echo "Failed to kill pid '$pid'"
