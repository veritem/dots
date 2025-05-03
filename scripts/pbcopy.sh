#!/bin/bash

# pipe astuff you want to save on system clipboard from an sshed machined
printf "\033]52;c;%s\007" "$(base64 | tr -d '\n')"
