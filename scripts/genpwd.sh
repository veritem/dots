#!/bin/bash

LENGTH=${1:-16}

password=$(openssl rand -base64 48 | tr -dc 'a-zA-Z0-9!@#$%^&*()' | head -c $LENGTH)

printf $password
