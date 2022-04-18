#!/bin/bash

set -e

code --list-extensions | xargs -L 1 echo code --install-extension > extensions.txt


cat $HOME/Library/Application\ Support/Code/User/settings.json > settings.json
