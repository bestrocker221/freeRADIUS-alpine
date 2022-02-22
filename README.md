# freeRADIUS-alpine
[![Build project](https://github.com/bestrocker221/freeRADIUS-alpine/actions/workflows/github-actions-demo.yml/badge.svg)](https://github.com/bestrocker221/freeRADIUS-alpine/actions/workflows/github-actions-demo.yml)

FreeRADIUS 3 built on alpine with MySQL 8

In this example i called `mysql.acme.com` the MySQL Container and certificates are signed with the CA.

# Security
- FreeRADIUS will connect to MySQL through encrypted TLS connections.
- MySQL is configured to accept only TLS 1.2 encrypted connections. A `radius` user is allowed to view the radius database
- FreeRADIUS will allow EAP-TTLS for outside clients

Everything travel encrypted.

Work in progress
