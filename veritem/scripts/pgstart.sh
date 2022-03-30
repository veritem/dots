#!/bin/bash

set -e

docker run -p 5432:5432 -v ~/dev/temp/pg:/var/lib/postgresql/data  -e POSTGRES_HOST_AUTH_METHOD=trust postgres
