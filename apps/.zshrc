export ZSH="/home/veritem/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git docker zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

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
alias vim="nvim"
alias mysqlstart="~/dev/config/scripts/mysqlstart.sh"
alias mysqlrun="~/dev/config/scripts/mysqlrun.sh"
alias update="~/dev/config/scripts/update.sh"
alias python="python3"
eval "$(starship init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export GPG_TTY=$(tty)
export PATH="/home/veritem/.local/bin:$PATH"

export DENO_INSTALL="/home/veritem/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$PATH:/usr/local/go/bin

alias golangci-lint="$(go env GOPATH)/bin/golangci-lint"

# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set DISPLAY variable to the IP automatically assigned to WSL2
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
sudo /etc/init.d/dbus start &> /dev/null

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true