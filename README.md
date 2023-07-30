# freeRADIUS-alpine
[![Build project](https://github.com/bestrocker221/freeRADIUS-alpine/actions/workflows/github-actions-demo.yml/badge.svg)](https://github.com/bestrocker221/freeRADIUS-alpine/actions/workflows/github-actions-demo.yml)

FreeRADIUS 3 built on alpine with MySQL 8

In this example i called `mysql.acme.com` the MySQL Container and certificates are signed with the CA.

# Before deployment (IMPORTANT)
1. As of now, the `.env` file contains the passwords and configuration for freeRADIUS and SQL, remember to generate new ones.
2. Generate/import your own CA certificate and client certificates.

Note, this is a template, do not use as-is but generate your own crypto material.

# Security
- FreeRADIUS will connect to MySQL through encrypted TLS connections.
- MySQL is configured to accept only TLS 1.2 encrypted connections. A `radius` user is allowed to view the radius database
- FreeRADIUS will allow EAP-TTLS for outside clients

Everything travel encrypted.

Work in progress

## TODO
- add config option to setup MSCHAP towards AD
- add certificates generation script + tutorial

## Error with buildx - Docker-compose
export DOCKER_BUILDKIT=0 
export PROGRESS_NO_TRUNC=1
docker-compose  --verbose --progress=plain build

## Test locally
`eapol_test -a127.0.0.1 -p1812 -stest -ceapol-tls.conf -r0 -stesting123`

should return `SUCCESS`.
