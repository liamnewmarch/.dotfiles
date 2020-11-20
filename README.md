# 📁 .dotfiles

This repo contains my [dotfiles](https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments) – configuration files for various command line tools that I use.

There is an installer which automatically clones the repo to a `~/.dotfiles` folder in your home directory and interactively sets up symlinks and installs common tools. To use it follow the instructions below.

Where possible, shell-specific scripts were written with POSIX portability in mind. These are located in `files/.profile.d/` and have been tested with Zsh, Bash, and Bash in ‘sh’ POSIX compatibility mode. There are also some optional macOS-specific customisations in the install script – these will be skipped when running on other platforms.

Rather than add local customisations to your `~/.zshrc` or `.~/bashrc`, you are encouraged to create a `~/.profile.d/local.sh` file and add customisations and aliases there. This will be sourced automatically if it exists.

## cURL install (recommended)

The easiest way to get started is to run the following (you can find the [source of this script here](https://raw.githubusercontent.com/liamnewmarch/.dotfiles/master/docs/index.html)).

```
bash -c "$(curl -fsSL https://liamnewmarch.github.io/.dotfiles)"
```

__Note__ You’ll need cURL and Git to be installed.

## Git install

The script above is effectively a wrapper around the following commands. You can run them manually if you prefer.

```
git clone https://github.com/liamnewmarch/.dotfiles.git
.dotfiles/install.sh
```

__Note__ You’ll need Git to be installed.
