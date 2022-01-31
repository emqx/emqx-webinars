#!/bin/bash
echo
if [ -f "$1" ]; then
    openssl crl2pkcs7 -nocrl -certfile "$1" | openssl pkcs7 -print_certs -noout
else
    echo "$1 does not exist"
    echo "Usage: bash $0 <certifcation file>"
fi
echo


