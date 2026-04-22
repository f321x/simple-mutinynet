#!/bin/bash

set -e

cd /data

/electrumx-fork/generate_ssl_cert.sh

while true; do
    echo "Starting ElectrumX server..."
    /root/.local/bin/electrumx_server &
    SERVER_PID=$!

    echo "ElectrumX server started with PID $SERVER_PID."
    sleep 345600 # 4 days

    echo "Stopping ElectrumX server..."
    kill $SERVER_PID
    wait $SERVER_PID 2>/dev/null || true

    echo "Running electrumx_compact_history..."
    /root/.local/bin/electrumx_compact_history

    echo "Restarting..."
done

