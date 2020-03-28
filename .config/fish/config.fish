eval (direnv hook fish)

set -x GOPATH $HOME/.go
set -x PATH $HOME/.local/bin /usr/local/share/git-core/contrib/diff-highlight $GOPATH/bin $PATH

set -x DOCKER_BUILDKIT 1
set -x GIT_SSH_COMMAND "ssh -i ~/.ssh/id_ecdsa"
set -x LESS '-g -i -M -R -S -W -z-4 -x4'
set -x PAGER less
set -x LESS_TERMCAP_mb (printf "\e[01;31m")
set -x LESS_TERMCAP_md (printf "\e[01;31m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[01;47;33m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[01;32m")
# set -x EDITOR vim
set -x HOMEBREW_INSTALL_CLEANUP 1
pokemon umbreon

alias git='hub'
alias ls='ls -G'
alias ll='ls -alrtiG'
alias vi='nvim'
alias vim='nvim'
alias dm='docker-machine'
alias dc='docker-compose'
function git_branch
  echo (git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)/\1/p")
end
alias pull='git pull origin (git_branch)'
alias push='git push origin (git_branch)'
alias cb='git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'
alias browse='git browse'
status --is-interactive; and source (nodenv init -|psub)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kohei.ota/google-cloud-sdk/path.fish.inc' ]; . '/Users/kohei.ota/google-cloud-sdk/path.fish.inc'; end

# neovimの設定ファイル配置場所
set -gx XDG_CONFIG_HOME "$HOME/.config"
 
# pyenv関連設定
eval (pyenv init - | source)
eval (pyenv virtualenv-init - | source)
set -x PYENV_ROOT (pyenv root)

eval (starship init fish)
