#!/bin/bash
CAFILE="$PWD/ca.pem"

if [ "$1" = cloud ]; then
  HOST="s1ca4a52-internet-facing-e914c80af06e3daf.elb.eu-west-1.amazonaws.com"
else
  HOST="localhost"
fi

HOSTPORT=$HOST":8084"


if [ -f "$CAFILE" ]; then
   set -x
   openssl s_client  -CAfile $CAFILE -verify_hostname $HOST -tlsextdebug -state -debug -connect $HOSTPORT
   { set +x; } 2>/dev/null
else
    set -x
    echo "Root CA file not found: $CAFILE"
    openssl s_client  -verify_hostname $HOST -tlsextdebug -state -debug -connect $HOSTPORT
    { set +x; } 2>/dev/null
fi
