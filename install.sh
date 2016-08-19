#!/bin/sh

set -e

standard_install=(
  xcode
  zsh
  bin
  brew
  git
  node
  python
  tmux
  vim
)

function confirm_install() {
  install=$1
  while true; do
    read -p "Run install script for $install? (y/n) " response
    case $response in
      [Yy]* )
        source "$HOME/.dotfiles/$install/install.sh"
        echo "End of $install install script."
        break;;
      [Nn]* )
        break;;
      * )
        echo 'Please answer yes or no.';;
    esac
  done
}

if [[ -z "$1" ]]; then
  # Standard installation.
  for install in "${standard_install[@]}"; do
    confirm_install "$install"
  done
  exit 0
else
  # Install one thing.
  confirm_install "$1"
  exit 0
fi
