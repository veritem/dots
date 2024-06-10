## Kitty config

set fish_greeting # Supresses the fish's intro message
set TERM xterm-256color
set EDITOR nvim


if status is-interactive
    # Commands to run in interactive sessions can go here
end

#### ALIASES ####
alias python="python3"
alias vim="nvim"
alias v="nvim"
alias ff="fzf --preview='cat {}'"
alias fn="nvim $(fzf --preview='cat {}')"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

#### END OF ALIASES ####

# pnpm

set -gx PNPM_HOME "/Users/veritem/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# rust

set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths # work around to make rust work
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

# deno
export DENO_INSTALL="/Users/veritem/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
