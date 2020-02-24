#!/bin/bash
set -eu

completions_dir=$(cd $(dirname $0); pwd)

#if [[ $(ghq --version) =~ ([0-9]+)\.([0-9]+)\.([0-9]+) ]]; then
#  ghq_version=${BASH_REMATCH[0]}
#  ghq_url=https://raw.githubusercontent.com/x-motemen/ghq/v$ghq_version/misc/zsh/_ghq
#  curl -fsSL -o $completions_dir/zsh/_ghq $ghq_url
#fi

#if [[ $(aws-vault --version) =~ ([0-9]+)\.([0-9]+)\.([0-9]+) ]]; then
#  aws_vault_version=${BASH_REMATCH[0]}
#  aws_vault_url=https://raw.githubusercontent.com/99designs/aws-vault/v$aws_vault_version/completions/zsh/_aws-vault
#  curl -fsSL -o $completions_dir/zsh/_aws-vault $aws_vault_url
#fi
