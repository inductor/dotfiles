#!/usr/bin/env bash
# brew cask install google-chrome docker discord visual-studio-code
if [ -f /etc/lsb-release ]; then
    echo 'Ubuntu detected. Installing dependency.'
    sudo apt-get update && sudo apt-get install -y build-essential locales-all git
    sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
    sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
fi
brew tap instrumenta/instrumenta
brew install make anyenv bash bash-completion cfssl conftest direnv goodwithtech/r/dockle doctl eksctl fzf gh ghq git helm hub hugo kind kubectx kustomize minikube mkcert neovim shellcheck starship datawire/blackbird/telepresence tfenv tflint tig aquasecurity/trivy/trivy wget k9s

anyenv install --init
