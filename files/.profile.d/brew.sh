# Homebrew paths (from `brew doctor`)
HOMEBREW_PATHS='/usr/local/bin /usr/local/etc /usr/local/sbin /usr/local/share /usr/local/share/doc'

alias brew-update='brew_update'

brew_update() {
  # First check with brew doctor
  printf '%s\n' "$(white 'Running') $(magenta 'brew doctor')"
  brew doctor

  # If there was a non-zero exit status offer to fix paths
  # shellcheck disable=SC2181
  if [ $? -ne 0 ]; then
    while true; do
      printf '\n%s\n' "$(yellow 'Warning:') $(white 'non-zero exit status from') $(magenta 'brew doctor')"
      printf 'Attempt to fix homebrew paths? [Y/n] '
      read -r yn
      case $yn in
        [Yy]*|'' )
          # Warn the user we need to use sudo
          printf '%s\n' "$(white 'Claiming ownership of paths in') $(blue "/usr/local/") (requires sudo)"
          echo "$HOMEBREW_PATHS" | xargs -n 1 sudo chown -R "$(whoami)"
          echo "$HOMEBREW_PATHS" | xargs -n 1 chmod u+w
          break
          ;;
        [Nn]*|* )
          printf '%s\n' "$(red 'Aborted')"
          exit 0
          ;;
      esac
    done
  fi

  # Run the main brew update command
  printf '\n%s\n' "$(white 'Running') $(magenta 'brew upgrade')"
  brew upgrade

  # Clean up after with brew cleanup
  printf '%s\n' "$(white 'Running') $(magenta 'brew cleanup')"
  brew cleanup --prune=all -s

  # We done
  printf '%s\n' "$(green 'Success')"
}
