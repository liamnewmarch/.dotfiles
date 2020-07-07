# This file contains shell agnostic customisations. It is designed
# to be read by Zsh, Bash and Bourne shell (sh) so shell specific
# syntax shoud be avoided!
#
# The customisations themselves can be found in ~/.profile.d/
#
# Bash customisations can be found in ~/.bashrc
# Zsh customisations can be found in ~/.zshrc
#
# To enable a script, add it to the list below. Scripts should be
# added alphabetically except where necessary (e.g. the two override
# scripts `platform` and `local`) and should work independentally of
# one another where possible (scripts depending on `color` being a
# notable exception).

profiled=(
  bin
  color
  docker
  git
  grep
  ls
  mkcd
  motd
  ncdu
  npm
  prompt
  python
  tmux
  top
  tree
  vim
  platform # Overrides for this machine’s platform (darwin, linux, etc)
  local    # Overrides for this machine (gitignored)
)

# Some platform variables that are used by the profile.d scripts
export PLATFORM="$(uname -s | tr '[:upper:]' '[:lower:]')"
export IS_COLOR="$(tput colors > /dev/null 2>&1 && [ "$(tput colors)" -gt 2 ] && echo 1)"
export IS_INTERACTIVE="$([[ $- == *i* ]] && echo 1)"
export IS_MACOS="$([ "$PLATFORM" = "darwin" ] && echo 1)"
export IS_LINUX="$([ "$PLATFORM" = "linux" ] && echo 1)"

# Source each script
for file in ${profiled[@]}; do
  [ -r "$HOME/.profile.d/$file.sh" ] && . "$HOME/.profile.d/$file.sh"
done

# Show message of the day
[ -n "$IS_INTERACTIVE" ] && [ "$(command -v motd)" ] && motd

unset profiled
