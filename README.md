# 📁 .dotfiles

A collection of config files for various command line tools including Z shell, Vim, Tmux and Git.

Also sets some of my preferred defaults for macOS, as well as offering to install Xcode CommandLineTools and Homebrew.

## Installer

All the fancy install scripts use cURL these days, if you trust me you can run the following command.

```
sh -c "$(curl -fsSL https://liamnewmarch.github.io/.dotfiles)"
```

You’ll need cURL and Git to be installed.

## Git install

The script above is a wrapper around the following commands. You can run them manually if you prefer.

```
git clone https://github.com/liamnewmarch/.dotfiles.git
cd .dotfiles
./install.sh
```
