set fish_greeting # suppresses the fish's intro message
set TERM xterm-256color

#### ALIASES ####
alias python="python3"
alias genpwd="~/dev/dots/scripts/genpwd.sh"
alias gcb="git branch | fzf --preview 'git show --color=always {-1}' --bind 'enter:become(git checkout {-1})' --height 40% --layout reverse"
alias unset 'set --erase'
# editor
set EDITOR nvim
alias vim nvim
alias vi nvim
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

# sst
fish_add_path /Users/veritem/.sst/bin

## For fnm
set -gx PATH "/Users/veritem/.local/state/fnm_multishells/14356_1722520823390/bin" $PATH;
set -gx FNM_MULTISHELL_PATH "/Users/veritem/.local/state/fnm_multishells/14356_1722520823390";
set -gx FNM_LOGLEVEL "info";
set -gx FNM_VERSION_FILE_STRATEGY "local";
set -gx FNM_COREPACK_ENABLED "false";
set -gx FNM_DIR "/Users/veritem/.local/share/fnm";
set -gx FNM_RESOLVE_ENGINES "false";
set -gx FNM_ARCH "arm64";
set -gx FNM_NODE_DIST_MIRROR "https://nodejs.org/dist";
set -gx PATH "$HOME/.govm/shim" $PATH

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/veritem/.opam/opam-init/init.fish' && source '/Users/veritem/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

source ~/.orbstack/shell/init2.fish 2>/dev/null || :

fzf --fish | source

## LLVM
set -g fish_user_paths /opt/homebrew/opt/llvm/bin $fish_user_paths
