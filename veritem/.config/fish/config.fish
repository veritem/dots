## Kitty config

set fish_greeting # Supresses the fish's intro message
set TERM xterm-256color
set EDITOR nvim


if status is-interactive
    # Commands to run in interactive sessions can go here
end

#### ALIASES ####

alias mongostart="~/dev/config/veritem/scripts/mongostart.sh"
alias mysqlstart="~/dev/config/veritem/scripts/mysqlstart.sh"
alias mysqlrun="~/dev/config/veritem/scripts/mysqlrun.sh"
alias update="~/dev/config/veritem/scripts/update.sh"
alias pgstart="~/dev/config/veritem/scripts/pgstart.sh"
alias python="python3"
alias air="~/go/bin/air"
alias vim="nvim"
alias v="nvim"
alias vi="nvim"

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

source /Users/veritem/.docker/init-fish.sh || true # Added by Docker Desktop
eval "$(/opt/homebrew/bin/brew shellenv)"
