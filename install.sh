#!/bin/sh

set -e

# Create folders
mkdir -p ~/bin
mkdir -p ~/.oh-my-zsh/custom/themes

# Link files
ln -fs ~/.dotfiles/bin/ssh-copy-id ~/bin/ssh-copy-id
ln -fs ~/.dotfiles/git/.gitignore ~/.gitignore
ln -fs ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -fs ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -fs ~/.dotfiles/zsh/liam.zsh-theme ~/.oh-my-zsh/custom/themes
ln -fs ~/.dotfiles/zsh/.zshrc ~/.zshrc

echo 'Installing Oh-my-Zsh.'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ $(uname -s) = "" ]; then
  echo 'Installing Homebrew.'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
