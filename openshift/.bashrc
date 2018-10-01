### Linux ###

# Basic Environment variables
export HOME='/home/anand'
export EDITOR='vim'
export PAGER='less'
export GOPATH=$HOME/workspace/go-apps
export TILLER_NAMESPACE='tiller-code'
export PATH="${HOME}/bin:${HOME}/.kubectx:$GOPATH/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Aliases specific to being productive
alias ls='ls --color=auto'
alias c='clear'
alias g='git'
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'
alias s='stern'
alias h='helm'
alias r='redis-cli'
alias m='mc'
alias g=git
alias ga='git add'
alias gc='git commit -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch'
alias ggpull='git pull origin $(current_branch)'
alias ggpulr='git pull --rebase origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias gh='git h'
alias glog='git log --oneline --decorate --color --graph'
alias gloga='git log --oneline --decorate --color --graph --all'
alias grh='git reset HEAD'
alias grup='git remote update'
alias gst='git status'

function rand() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

# Bash completions
source <(kubectl completion bash)
source <(stern --completion=bash)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Bash prompt
KUBE_PS1_CTX_COLOR="yellow"
KUBE_PS1_SYMBOL_USE_IMG="true"
source ~/.kube-ps1/kube-ps1.sh
kubeon

# Custom variables specific for apps
FRONT50=http://spin-front50.spinnaker:8080
FIAT=http://spin-fiat.spinnaker:7003
ORCA=http://spin-orca.spinnaker:8083
ROSCO=http://spin-rosco.spinnaker:8087
IGOR=http://spin-igor.spinnaker:8088
REDIS=redis://spin-redis.spinnaker:6379
ECHO=http://spin-echo.spinnaker:8089
CLOUDDRIVER=http://spin-clouddriver.spinnaker:7002
DECK=http://spin-deck.spinnaker:9000
GATE=http://spin-gate.spinnaker:8084

# Get started
export PS1='$(kube_ps1) \n\u at \h in \w \$ '
cat $HOME/.om
if [ -f ~/complete-setup.sh ]
then
    echo "Run the complete-setup.sh file and you're all set!"
fi


