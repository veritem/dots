#!/usr/bin/env bash

# https://stackoverflow.com/questions/62465835/docker-run-command-create-container-if-not-exists

docker run -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:latest
