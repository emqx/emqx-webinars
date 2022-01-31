#!/bin/bash
# Compare private key and public key certificate

echo

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "$1 or $2 does not exist"
  echo "Usage: bash ${0} <key filename> <certificate filename>"
  exit 1
fi

keysum=$((openssl pkey -in $1 -pubout -outform pem) | sha256sum)
certsum=$((openssl x509 -in $2 -pubkey -noout -outform pem) | sha256sum)
read -ra akeysum <<<"$keysum"
echo "key  - ${1}: ${akeysum[0]}"
read -ra acertsum <<<"$certsum"
echo "cert - ${2}: ${acertsum[0]}"
if [ $akeysum[0] = $acertsum[0] ]; then
  echo "Result: OK"
else
  echo "Result: Fail - Not a valid certificate and private key pair"
fi

echo

