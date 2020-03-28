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
alias cb='git checkout `git branch | fzf | sed -e "s/\* //g" | awk "{print \$1}"`'
alias browse='git browse'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kx='kubectx'
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:$HOME/Library/Python/3.7/bin:/usr/local/share/git-core/contrib/diff-highlight
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
pokemon umbreon

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kohei.ota/google-cloud-sdk/path.bash.inc' ]; then . '/Users/kohei.ota/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kohei.ota/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/kohei.ota/google-cloud-sdk/completion.bash.inc'; fi
export XDG_CONFIG_HOME="$HOME/.config"
alias checkout='git branch -a | fzf | xargs git checkout'
alias co='git branch -a | fzf | xargs git checkout'
export LANG="ja_JP.UTF-8"
eval $(thefuck --alias)

eval $(thefuck --alias)
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$GOPATH/src/k8s.io/kubernetes/third_party/etcd:${PATH}"
. $(pack completion)

function makisu_build() {
    makisu_version=${MAKISU_VERSION:-v0.1.12}
    cd ${@: -1}
    docker run -i --rm --net host \
        -v /var/run/docker.sock:/docker.sock \
        -e DOCKER_HOST=unix:///docker.sock \
        -v $(pwd):/makisu-context \
        -v /tmp/makisu-storage:/makisu-storage \
        gcr.io/makisu-project/makisu:$makisu_version build \
            --commit=explicit \
            --modifyfs=true \
            --load \
            ${@:1:${#@}-1} /makisu-context
    cd -
}
# source ~/enhancd/init.sh
source <(doctl completion bash)
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH=/Users/kohei.ota/istio-1.4.6/bin:$PATH
