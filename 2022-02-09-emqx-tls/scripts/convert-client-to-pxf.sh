#!/bin/bash
# For two-way TLS.  Browwers may want the client certificate to be in pxf format
openssl pkcs12 -export -keypbe NONE -certpbe NONE -in client-fullchain.pem -inkey client.key -out client-fullchain.pxf

