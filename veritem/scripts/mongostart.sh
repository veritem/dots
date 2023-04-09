#!/bin/bash
set -e

docker run --name mongodb -d -p 27017:27017 mongodb/mongodb-community-server:latest