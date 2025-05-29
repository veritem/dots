#!/bin/bash 

set -e

# if brew is not installed
if [ ! -d "/opt/homebrew" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# setup brew depenancies
brew bundle check || brew bundle install

# move neovim conf into the right directory
