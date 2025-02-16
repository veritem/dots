#!/bin/bash
set -e

docker run -d -p 5432:5432 -v /etc/pg:/var/lib/postgresql/data  -e POSTGRES_HOST_AUTH_METHOD=trust postgres
