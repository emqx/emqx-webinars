#!/bin/bash
## Common configurations
## TLS_DN_C:-SE
## TLS_DN_ST:-Stockholm
## TLS_DN_L:-Stockholm
## TLS_DN_O:-MyOrgName

## Root CA configurations
## CA_CN="MyRootCA"      Change in 00-generate-root-ca.sh
## TLS_DN_OU:-MyRootCA   Change default in 00-generate-root-ca.sh

## Intermediate CA configurations
## TLS_DN_OU:-MyIntermediateCA                      Change default in 01-issue-inter-ca.sh
## TLS_INTER_CA_CN:-MyIntermediateCA-${SUFFIX}      Change SUFFIX in 01-issue-inter-ca.sh

## Server configurations
## TLS_DN_OU:-MyService                  Change default in 02-issue-server-cert.sh
## TLS_SERVER_COMMON_NAME:-localhost

## Client configurations
## TLS_DN_OU:-MyServiceClient           Change default in 03-issue-client-cert.sh
## TLS_CLIENT_COMMON_NAME:-localhost


echo
if [ -z "$1" ]; then  # local
  echo "Setting local environment variables"
  export TLS_CLIENT_COMMON_NAME="172.17.0.1"
  export TLS_SERVER_DNS=localhost
elif [ "$1" = "cloud" ]; then # cloud
  echo "Setting cloud environment variables"
  export TLS_CLIENT_COMMON_NAME="82.183.17.84"
  export TLS_SERVER_DNS=s1ca4a52-internet-facing-e914c80af06e3daf.elb.eu-west-1.amazonaws.com
fi

set | grep TLS | grep -v _=
echo



