

if status is-interactive
    # Commands to run in interactive sessions can go here
end


set fish_greeting # Disable default greeting message

alias nvim="/etc/nvim.appimage"
alias gts="/home/veritem/dev/gts/target/debug/gts"
alias air='/home/veritem/go/bin/air'
alias gum='git pull origin main'
alias dev='cd ~/dev'
alias new_repo='gh repo create'
alias cat='bat'
alias nwpd='openssl rand -base64 30'
alias ls="exa --icons"
alias la="exa -a --icons"
alias ll="exa --long --header -a --icons"
alias tree="exa --tree --icons"
alias pgstart='sudo service postgresql start'
alias pgrun='sudo -u postgres psql'
alias vim="/etc/nvim.appimage"
alias mysqlstart="~/dev/config/scripts/mysqlstart.sh"
alias mysqlrun="~/dev/config/scripts/mysqlrun.sh"
alias update="~/dev/config/scripts/update.sh"
alias pgstart="~/dev/config/scripts/pgstart.sh"
alias python="python3"
alias gcm="/home/veritem/dev/gcm/target/debug/gcm"
alias dutils="/home/veritem/dev/dutils/target/debug/dutils"

starship init fish | source
