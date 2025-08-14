#!/bin/bash

# Check if files already exist
if [[ -f "server.key" && -f "server.crt" ]]; then
    echo "Certificate files already exist. Not generating new ones."
    exit 0
fi

# Generate private key
openssl genrsa -out "server.key" 2048

# Generate CSR with predefined values (headless, no prompts)
openssl req -new -key "server.key" -out "server.csr" \
  -subj "/C=US/ST=California/L=Los Angeles/O=MyCompany/OU=IT Department/CN=electrum-server.tld"

# Self-sign the certificate
openssl x509 -req -days 1825 -in "server.csr" -signkey "server.key" -out "server.crt"

# Set permissions (optional)
chmod 600 "server.key"
chmod 644 "server.crt"

echo "Keys and certificate generated"
