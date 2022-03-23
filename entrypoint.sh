#!/bin/sh -l

echo $7 > /secret/secret

flytectl -c $1 \ 
register files \ 
--project $2 \ 
--domain $3 \ 
--archive $4 \ 
--force --version $5 \ 
--admin.clientId $6 \ 
--admin.clientSecretLocation /secret/secret