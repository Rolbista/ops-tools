# oh-my-zsh plugins:
plugins=(git terraform kubectl kubectx aws)

alias k=kubectl
alias kctx=kubectx
alias knu=kubenodeusage
alias desc=describe
alias code=codium
alias pip=/usr/local/bin/pip3

function aws-clear() {
    aws-vault clear
    unset AWS_ACCESS_KEY_ID AWS_DEFAULT_REGION AWS_REGION AWS_SECRET_ACCESS_KEY AWS_SECURITY_TOKEN AWS_SESSION_EXPIRATION AWS_SESSION_TOKEN AWS_VAULT
}

#for fuzzy search integration with ctrl+R
source <(fzf --zsh)

export KUBE_EDITOR="codium -w"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
export HOMEBREW_NO_AUTO_UPDATE="true"
# local prefix for formulas in case of excessive MDM policies, unsupported and not recommended]
# use as a last resort (before finding a new job)
# export HOMEBREW_PREFIX="$HOME/.brew"
# export PATH="$HOME/.local/bin:$PATH"