#!/bin/bash
# Compare private key and public key certificate

echo
if [ -z "$1" ]; then
  echo "Usage: bash ${0} <CERT FILENAME>"
  echo "<CERT FILENAME> is the base filename of the cert and key pair"
  echo "There should be a <CERT FILENAME>.pem and a <CERT FILENAME>.key"
  exit 1
fi

keysum=$((openssl pkey -in ${1}.key -pubout -outform pem) | sha256sum)
certsum=$((openssl x509 -in ${1}.pem -pubkey -noout -outform pem) | sha256sum)
read -ra akeysum <<<"$keysum"
echo "key  - ${1}.key: ${akeysum[0]}"
read -ra acertsum <<<"$certsum"
echo "cert - ${1}.pem: ${acertsum[0]}"
if [ $akeysum[0] = $acertsum[0] ]; then
  echo "Result: OK"
else
  echo "Result: Fail - Not a valid certificate and private key pair"
fi

echo

