set fish_greeting # suppresses the fish's intro message
set TERM xterm-256color

alias python="python3"
alias v="nvim"
alias scl="tmux attach -t school"
alias gcb="git branch | fzf --preview 'git show --color=always {-1}' --bind 'enter:become(git checkout {-1})' --height 40% --layout reverse"
alias unset 'set --erase'

set EDITOR nvim
alias vim nvim
alias vi nvim

# pnpm
set -gx PNPM_HOME "/Users/veritem/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths # work around to make rust work
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

# java
set -x JAVA_HOME (/usr/libexec/java_home -v 21)
set -x PATH $JAVA_HOME/bin $PATH

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

# set all man pages to open in neovim
set -gx MANPAGER "nvim +Man!"


set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx PATH $PATH $ANDROID_HOME/emulator
set -gx PATH $PATH $ANDROID_HOME/platform-tools

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/veritem/.opam/opam-init/init.fish' && source '/Users/veritem/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

fzf --fish | source

## LLVM
set -g fish_user_paths /opt/homebrew/opt/llvm/bin $fish_user_paths

set -gx PNPM_HOME "/Users/veritem/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

function vtmux --description "start tmux in current dir with nvim"
    # prevent nested tmux sessions
    if set -q TMUX
        echo "Already inside tmux; refusing to nest." >&2
        return 1
    end

    set -l dir (pwd)
    set -l session (basename "$dir")
    set -l window editor

    # create session if it doesn't exist
    if not tmux has-session -t "$session" 2>/dev/null
        tmux new-session -d -s "$session" -c "$dir" -n "$window"
    end

    # ensure window exists
    if not tmux list-windows -t "$session" -F '#{window_name}' | string match -q "$window"
        tmux new-window -t "$session" -c "$dir" -n "$window"
    end

    # ensure two panes
    set -l pane_count (tmux list-panes -t "$session:$window" | count)
    if test $pane_count -lt 2
        tmux split-window -h -t "$session:$window" -c "$dir"
        tmux send-keys -t "$session:$window.0" nvim C-m
        tmux select-pane -t "$session:$window.0"
    end

    tmux attach -t "$session"
end
