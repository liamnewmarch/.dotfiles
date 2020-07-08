[ -z "$DOTFILES_BASH_INIT" ] && \
[ -r "$HOME/.profile" ] && \
. "$HOME/.profile"

DOTFILES_BASH_INIT=1

shopt -s checkwinsize
