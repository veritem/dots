#!/bin/bash
set -e

docker rm -f $(docker ps -a -q)

docker run -d -p 27017:27017 --name test-mongo mongo:latest