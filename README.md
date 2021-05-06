# 📁 Liam’s dotfiles

This repo contains my [dotfiles](https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments) – configuration files for setting up various command-line tools the way I like.

There are two installation methods depending on where you want to keep the source repo. The default `curl` installer clones this to `~/.dotfiles` in your home directory, but you can also follow the `git` instructions to install the project wherever you choose. Both methods will symlink the necessary files into your home folder.

Where possible, shell-specific scripts were written with POSIX portability in mind. These are located in `~/.profile.d/` and have been tested with Zsh, Bash, and Bash in ‘sh’ POSIX compatibility mode. There are also some optional macOS-specific customisations in the install script – these will be skipped when running on other platforms.

Rather than add local customisations to your `~/.zshrc` or `.~/bashrc`, you are encouraged to create a `~/.profile.d/local.sh` file and add per-machine customisations and aliases there.

## Using the `curl` installer (recommended)

*__Requirements:__ `curl`, `git`.*

The easiest way to get started is to run the following (you can find the [source of this script here](https://raw.githubusercontent.com/liamnewmarch/dotfiles/master/docs/index.html)).

```sh
bash -c "$(curl -fsSL https://liamnewmarch.github.io/dotfiles)"
```

__Experimental:__ You can change the default installation directory from `~/.dotfiles` to something else by setting `DOTFILES_DIR`.

```sh
DOTFILES_DIR="$HOME/path/to/dotfiles" bash -c "$(curl -fsSL https://liamnewmarch.github.io/dotfiles)"
```

## Manual install with `git`


The script above is effectively a wrapper around the following commands. You can run them manually if you prefer.

```
git clone https://github.com/liamnewmarch/dotfiles.git .dotfiles
.dotfiles/install.sh
```

*__Requirements:__ `git`.*
