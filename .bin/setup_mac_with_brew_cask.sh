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
brew tap weaveworks/tap
brew install make anyenv bash cfssl conftest direnv goodwithtech/r/dockle doctl weaveworks/tap/eksctl fzf gh ghq git helm hub hugo kind kubectx kustomize minikube mkcert neovim shellcheck starship tfenv tflint tig aquasecurity/trivy/trivy wget k9s
curl -fsL https://golang.org/dl/go1.15.6.linux-amd64.tar.gz | sudo tar -C /usr/local -xzf -

(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

kubectl krew install ctx ns iexec status neat view-secret images rolesum open-svc tree exec-as modify-secret view-serviceaccount-kubeconfig get-all node-shell ca-cert who-can df-pv resource-capacity fleet prompt ingress-nginx operator cert-manager deprecations

anyenv install --init
