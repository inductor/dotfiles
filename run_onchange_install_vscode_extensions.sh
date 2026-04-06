#!/bin/sh
extensions="
astro-build.astro-vscode
github.vscode-github-actions
golang.go
hashicorp.hcl
hashicorp.terraform
jamiewoodio.cisco
llvm-vs-code-extensions.lldb-dap
manishsencha.readme-preview
ms-azuretools.vscode-containers
ms-azuretools.vscode-docker
ms-vscode-remote.remote-containers
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode.cmake-tools
ms-vscode.cpp-devtools
ms-vscode.cpptools
ms-vscode.cpptools-extension-pack
ms-vscode.cpptools-themes
ms-vscode.makefile-tools
ms-vscode.remote-explorer
shopify.ruby-lsp
swiftlang.swift-vscode
tamasfe.even-better-toml
vapor.vapor-vscode
xdebug.php-debug
xdebug.php-pack
zobo.php-intellisense
"

for ext in $extensions; do
  code --install-extension "$ext" --force 2>/dev/null
done
