REM Converting client-fullchain.pem to client-fullchain.pxf

echo Converting client-fullchain.pem to client-fullchain.pxf

openssl pkcs12 -export -keypbe NONE -certpbe NONE -in client-fullchain.pem -inkey client.key -out client-fullchain.pfx
