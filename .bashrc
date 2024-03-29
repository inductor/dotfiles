eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval "$(starship init bash)"
eval "$(direnv hook bash)"
alias git=hub
alias ls='ls -G'
alias ll='ls -alrtiG'
alias vi='nvim'
alias vim='nvim'
alias dm='docker-machine'
alias dc='docker-compose'
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export CLOUDSDK_PYTHON=python3
git_branch() {
  echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
alias pull='git pull origin $(git_branch)'
alias push='git push origin $(git_branch)'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kx='kubectx'
export PATH="$PATH:/usr/local/share/git-core/contrib/diff-highlight:$HOME/go/bin:/usr/local/go/bin:${KREW_ROOT:-$HOME/.krew}/bin"
eval "$(anyenv init -)"
eval "$(nodenv init -)"
function ghql() {
  local selected_file=$(ghq list --full-path | fzf --query "$LBUFFER")
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      echo ${selected_file}
      cd ${selected_file}
    fi
  fi
}
bind -x '"\C-e": ghql'
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi
export LESS='-g -i -M -R -S -W -z-4 -x4'
export PAGER=less
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
# pokemon umbreon
export XDG_CONFIG_HOME="$HOME/.config"
. <(doctl completion bash)
. <(kubectl completion bash)
. <(eksctl completion bash)

export DIGITALOCEAN_TOKEN=your_token
export SPACES_ACCESS_KEY_ID=your_id
export SPACES_SECRET_ACCESS_KEY=your_key
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GOPATH=$HOME/go
source <(kubectl completion bash)
. <(eksctl completion bash)
. <($HOME/.poetry/bin/poetry completions bash)
. <(kind completion bash)
