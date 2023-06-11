set fish_greeting # Supresses the fish's intro message
set TERM xterm-256color
set EDITOR nvim
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths # work around to make rust work
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

if status is-interactive
    # Commands to run in interactive sessions can go here
end

#### ALIASES ####
alias v='nvim'

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias dev='cd ~/dev'

alias ls='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias tree='exa -aT --color=always --group-directories-first'
alias cat='bat'

#### Git abbreviations ####

abbr g 'git'

abbr ga 'git add'
abbr gaa 'git add --all'
abbr gapa 'git add --patch'
abbr gau 'git add --update'
abbr gav 'git add --verbose'
abbr gap 'git apply'
abbr gapt 'git apply --3way'

abbr gb 'git branch'
abbr gba 'git branch -a'
abbr gbd 'git branch -d'
abbr gbdf 'git branch -d -f'
abbr gbD 'git branch -D'
abbr gbDf 'git branch -D -f'
abbr gbnm 'git branch --no-merged'
abbr gbr 'git branch --remote'

abbr gbl 'git blame -b -w'

abbr gbs 'git bisect'
abbr gbsb 'git bisect bad'
abbr gbsg 'git bisect good'
abbr gbsr 'git bisect reset'
abbr gbss 'git bisect start'

abbr gc 'git commit -v'
abbr gci 'git commit --allow-empty -v -m\'chore: initial commit\''
abbr gc! 'git commit -v --amend'
abbr gcn 'git commit -v --no-edit'
abbr gcn! 'git commit -v --amend --no-edit'
abbr gca 'git commit -a -v'
abbr gca! 'git commit -a -v --amend'
abbr gcan! 'git commit -a -v --no-edit --amend'
abbr gcans! 'git commit -a -v -s --no-edit --amend'
abbr gcam 'git commit -a -m'
abbr gcas 'git commit -a -s'
abbr gcasm 'git commit -a -s -m'
abbr gcsm 'git commit -s -m'
abbr gcm 'git commit -m'
abbr gcs 'git commit -S'

abbr gcf 'git config --list'

abbr gcl 'git clone --recurse-submodules'

abbr gclean 'git clean -id'

abbr gco 'git checkout'
abbr gcob 'git checkout -b'
abbr gcom 'git checkout (git_main_branch)'
abbr gcod 'git checkout (git_develop_branch)'
abbr gcof 'git checkout (git_feature_prepend)/'
abbr gcoh 'git checkout hotfix/'
abbr gcor 'git checkout release/'
abbr gcos 'git checkout support/'
abbr gcors 'git checkout --recurse-submodules'

abbr gcount 'git shortlog -sn'

abbr gcp 'git cherry-pick'
abbr gcpa 'git cherry-pick --abort'
abbr gcpc 'git cherry-pick --continue'

abbr gd 'git diff'
abbr gdca 'git diff --cached'
abbr gdcw 'git diff --cached --word-diff'
abbr gdct 'git diff --staged'
abbr gdt 'git diff-tree --no-commit-id --name-only -r'
# abbr gdnolock 'git diff ":(exclude)package-lock.json" ":(exclude)*.lock"'
abbr gdup 'git diff @{upstream}'
# abbr gdv 'git diff -w $@ | view -'

abbr gdct 'git describe --tags (git rev-list --tags --max-count=1)'

abbr gf 'git fetch'
abbr gfa 'git fetch --all --prune'
abbr gfo 'git fetch origin'

abbr gl 'git log'
abbr gls 'git log --stat'
abbr glsp 'git log --stat -p'
abbr glg 'git log --graph'
abbr glgda 'git log --graph --decorate --all'
abbr glgm 'git log --graph --max-count=10'
abbr glo 'git log --oneline --decorate'
abbr glog 'git log --oneline --decorate --graph'
abbr gloga 'git log --oneline --decorate --graph --all'
# abbr glol
# abbr glols
# abbr glod
# abbr glods
# abbr glola

# gm: git merge
abbr gm 'git merge'
abbr gmom 'git merge origin/(git_main_branch)'
abbr gmum 'git merge upstream/(git_main_branch)'
abbr gma 'git merge --abort'

# gmtl: git mergetool
abbr gmtl 'git mergetool --no-prompt'
abbr gmtlvim 'git mergetool --no-prompt --tool=vimdiff'

# gp: git push
abbr gp 'git push'
abbr gpd 'git push --dry-run'
abbr gpf 'git push --force-with-lease'
abbr gpf! 'git push --force'
abbr gpt 'git push --tags'
abbr gptf 'git push --tags --force-with-lease'
abbr gptf! 'git push --tags --force'
abbr gpoat 'git push origin --all && git push origin --tags'
abbr gpoatf! 'git push origin --all --force-with-lease && git push origin --tags --force-with-lease'
abbr gpoatf! 'git push origin --all --force && git push origin --tags --force'
abbr gpv 'git push -v'

# gpl: git pull
abbr gpl 'git pull'
abbr gplo 'git pull origin'
abbr gplom 'git pull origin master'
abbr gplu 'git pull upstream'
abbr gplum 'git pull upstream master'

# gr: git remote
abbr gr 'git remote -v'
abbr gra 'git remote add'
abbr grau 'git remote add upstream'
abbr grrm 'git remote remove'
abbr grmv 'git remote rename'
abbr grset 'git remote set-url'
abbr gru 'git remote update'
abbr grv 'git remote -v'
abbr grvv 'git remote -vvv'

# grb: git rebase
abbr grb 'git rebase'
abbr grba 'git rebase --abort'
abbr grbc 'git rebase --continue'
abbr grbd 'git rebase (git_develop_branch)'
abbr grbi 'git rebase -i'
abbr grbom 'git rebase origin/(git_main_branch)'
abbr grbo 'git rebase --onto'
abbr grbs 'git rebase --skip'

# grev: git revert
abbr grev 'git revert'

# grs: git reset
abbr grs 'git reset'
abbr grs! 'git reset --hard'
abbr grsh 'git reset HEAD'
abbr grsh! 'git reset HEAD --hard'
abbr grsoh 'git reset origin/(git_current_branch)'
abbr grsoh! 'git reset origin/(git_current_branch) --hard'
abbr gpristine 'git reset --hard && git clean -dffx'
abbr grs- 'git reset --'

# grm: git rm
abbr grm 'git rm'
abbr grmc 'git rm --cached'

# grst: git restore
abbr grst 'git restore'
abbr grsts 'git restore --source'
abbr grstst 'git restore --staged'

# grt: git return
abbr grt 'cd "(git rev-parse --show-toplevel || echo .)"'

# gs: git status
abbr gs 'git status'
abbr gss 'git status -s'
abbr gsb 'git status -sb'

# gshow: git show
abbr gshow 'git show'
abbr gshowps 'git show --pretty=short --show-signature'

# gst: git stash
abbr gst 'git stash'
abbr gsta 'git stash apply'
abbr gstc 'git stash clear'
abbr gstd 'git stash drop'
abbr gstl 'git stash list'
abbr gstp 'git stash pop'
abbr gstshow 'git stash show --text'
abbr gstall 'git stash --all'
abbr gsts 'git stash save'

# gsu: git submodule
abbr gsu 'git submodule update'

# gsw: git switch
abbr gsw 'git switch'
abbr gswc 'git switch -c'
abbr gswm 'git switch (git_main_branch)'
abbr gswd 'git switch (git_develop_branch)'

# gt: git tag
abbr gt 'git tag'
abbr gts 'git tag -s'
abbr gta 'git tag -a'
abbr gtas 'git tag -a -s'
# gtl

# gwch: git whatchanged
abbr gwch 'git whatchanged -p --abbrev-commit --pretty=medium'

# gwt: git worktree
abbr gwt 'git worktree'
abbr gwta 'git worktree add'
abbr gwtls 'git worktree list'
abbr gwtmv 'git worktree move'
abbr gwtrm 'git worktree remove'

# gam: git am
abbr gam 'git am'
abbr gamc 'git am --continue'
abbr gams 'git am --skip'
abbr gama 'git am --abort'
abbr gamscp 'git am --show-current-patch'

function git_main_branch -d 'Detect name of main branch of current git repository'
	# heuristic to return the name of the main branch
	command git rev-parse --git-dir &> /dev/null || return
	for ref in refs/{heads,remotes/{origin,upstream}}/{main,master,trunk}
	  if command git show-ref -q --verify $ref
		echo (string split -r -m1 -f2 / $ref)
		return
	  end
	end
	echo main
  end

  function git_current_branch -d 'Detect name of current branch of current git repository'
	echo (git branch --show-current)
  end

### end git abbreviations ####

alias mongostart="~/dev/config/veritem/scripts/mongostart.sh"
alias mysqlstart="~/dev/config/veritem/scripts/mysqlstart.sh"
alias mysqlrun="~/dev/config/veritem/scripts/mysqlrun.sh"
alias update="~/dev/config/veritem/scripts/update.sh"
alias pgstart="~/dev/config/veritem/scripts/pgstart.sh"
alias python="python3"
alias air="~/go/bin/air"
#### END ALIASES ####


### Abbr 

abbr -a ec 'echo HELLO'

## end abbr 

set -gx PNPM_HOME "/Users/veritem/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

export DENO_INSTALL="/Users/veritem/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

starship init fish | source
eval "$(/opt/homebrew/bin/brew shellenv)"

source /Users/veritem/.docker/init-fish.sh || true # Added by Docker Desktop
