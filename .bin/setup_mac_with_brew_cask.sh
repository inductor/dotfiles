#!/usr/bin/env bash
# brew cask install google-chrome docker discord visual-studio-code
if [ -f /etc/lsb-release ]; then
    echo 'Ubuntu detected. Installing dependency.'
    sudo apt-get update && sudo apt-get install -y --no-install-recommends locales-all build-essential manpages-dev glibc-doc linux-doc git jq gdb debconf-utils fakeroot devscripts
    sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
    sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
    sudo apt purge -y --autoremove apport apport-symptoms fwupd nano netplan.io popularity-contest unattended-upgrades update-manager-core
fi
brew tap instrumenta/instrumenta
brew tap  weaveworks/tap
brew install make anyenv bash bash-completion cfssl conftest direnv goodwithtech/r/dockle doctl weaveworks/tap/eksctl fzf gh ghq git helm hub hugo kind kubectx kustomize minikube mkcert neovim shellcheck starship datawire/blackbird/telepresence tfenv tflint tig aquasecurity/trivy/trivy wget k9s
curl -fsL https://golang.org/dl/go1.15.6.linux-amd64.tar.gz | sudo tar -C /usr/local -xzf -

anyenv install --init
