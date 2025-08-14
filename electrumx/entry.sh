#!/bin/bash

mv generate_ssl_cert.sh /data

cd /data

./generate_ssl_cert.sh

exec /root/.local/bin/electrumx_server
