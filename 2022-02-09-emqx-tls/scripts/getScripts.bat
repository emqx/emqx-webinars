@echo off
REM copy  script files from docker image /opt/emqx/etc/certsX   where X is %1
IF "%~1" == "" GOTO NO_INPUT

echo getting scripts from and keys from certs%1
echo on

docker cp emqxee_u:/opt/emqx/etc/certs%1/00-generate-root-ca.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/01-issue-inter-ca.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/02-issue-server-cert.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/03-issue-client-cert.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/cacerts_show.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/env-config.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/generate-certs.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/key-cert-verify.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/sclient-ssl.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/sclient-wss.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/sclient-https.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/show.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/trace.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/verify.sh .
docker cp emqxee_u:/opt/emqx/etc/certs%1/workflow.sh .

exit

:NO_INPUT
echo Error:   Missing input parameter
echo Usage:   %~nx0 num   Where num is the number of the certs directory
echo Example: %~nx0 2   Gets scripts from the certs2 directory





