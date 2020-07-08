#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "$0")"; pwd -P)"

vim_plugins=(
  tpope/vim-sensible
  ctrlpvim/ctrlp.vim
  dense-analysis/ale
  airblade/vim-gitgutter
  junegunn/goyo.vim
  Yggdroot/indentLine
  ntpeters/vim-better-whitespace
)

confirm() {
  read -r -p "${1:-Are you sure?} [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

github() {
  if [ -z "$1" ]; then
    echo 'Usage: github username/repo [path]'
    exit 1
  fi
  local path="${2:-'.'}/$(echo $1 | cut -d '/' -f2)"
  if [ -e "$path" ]; then
    echo "Path $path already exists, updating"
    git -C $path pull
  else
    git clone --depth 1 https://github.com/$1.git $path
  fi
}

is_macos() {
  [ "$(uname -s)" = 'Darwin' ]
}

if is_macos && [ -z "$(xcode-select -p)" ] && confirm 'Install Xcode command line tools?'; then
  xcode-select --install
fi

if confirm 'Link shell files?'; then
  echo '[1/3] Link ~/.profile and ~/.profile.d'
  ln -fs $DOTFILES_DIR/profile $HOME/.profile
  [ ! -d "$HOME/.profile.d" ] && ln -fs $DOTFILES_DIR/profile.d $HOME/.profile.d
  echo '[2/3] Link ~/.bashrc and ~/.bash_profile'
  ln -fs $DOTFILES_DIR/bash_profile $HOME/.bash_profile
  ln -fs $DOTFILES_DIR/bashrc $HOME/.bashrc
  echo '[3/3] Link ~/.zshrc'
  ln -fs $DOTFILES_DIR/zshrc $HOME/.zshrc
  echo 'Done'
fi

if confirm 'Install Oh my Zsh?'; then
  echo '[1/2] Install Oh my zsh'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  chsh -s $(which zsh)
  echo '[2/2] Link custom theme'
  ln -fs $DOTFILES_DIR/liam.zsh-theme $HOME/.oh-my-zsh/custom/themes
  echo 'Done'
fi

if is_macos && confirm 'Install Homebrew?'; then
  echo '[1/2] Installing Homebrew'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo '[2/2] Updating Homebrew'
  brew update
  echo 'Done'
fi

if is_macos && confirm 'Install Homebrew packages?'; then
  echo '[1/2] Installing ffmpeg, htop, imagemagick, node, python, tldr, tmux, tree and wget'
  brew install ffmpeg htop imagemagick node python tldr tmux tree wget
  echo '[2/2] Installing casks google-cloud-sdk imageoptim '
  brew cask install google-chrome google-cloud-sdk imageoptim iterm2 visual-studio-code
  echo 'Done'
fi

if confirm 'Link global gitignore?'; then
  echo '[1/1] Linking file'
  ln -fs $DOTFILES_DIR/gitignore $HOME/.gitignore
  echo 'Done'
fi

if confirm 'Link tmux config?'; then
  echo '[1/2] Installing tmux-themepack'
  github jimeh/tmux-themepack $HOME/.tmux/themes
  echo '[2/2] Linking file'
  ln -fs $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf
  echo 'Done'
fi

if confirm 'Link vimrc and install plugins?'; then
  let steps=$(( ${#vim_plugins[@]} + 1 ))
  for index in "${!vim_plugins[@]}"; do
    plugin="${vim_plugins[$index]}"
    echo "[$(( $index + 1 ))/${steps}] Install ${plugin}"
    github $plugin $HOME/.vim/pack/custom/start
  done
  echo "[${steps}/${steps}] Linking config file"
  ln -fs $DOTFILES_DIR/vimrc $HOME/.vimrc
fi

if is_macos && confirm 'Set custom macOS defaults?'; then
  if confirm '[1/14] Expand save and print dialogs?'; then
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
  fi
  if confirm '[2/14] Disable downloaded application quarantine?'; then
    defaults write com.apple.LaunchServices LSQuarantine -bool false
  fi
  if confirm '[3/14] Disable smart text features?'; then
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 15
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
  fi
  if confirm '[4/14] Enable tap to click?'; then
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  fi
  if confirm '[5/14] Apply Finder defaults?'; then
    defaults write com.apple.finder DisableAllAnimations -bool true
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    defaults write com.apple.finder FXPreferredViewStyle -string "Clmv"
    killall Finder
  fi
  if confirm '[6/14] Apply defaults for new volumes?'; then
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
    defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
    defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
    defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
  fi
  if confirm '[7/14] Apply Dock defaults?'; then
    defaults write com.apple.dock tilesize -int 32
    defaults write com.apple.dock show-process-indicators -bool true
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -float 0
    killall Dock
  fi
  if confirm '[8/14] Enable checking for updates but prevent download?'; then
    defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
    defaults write com.apple.SoftwareUpdate AutomaticDownload -int 0
    defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 0
    defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 0
  fi
  if confirm '[9/14] Disable swipe navigation in Google Chrome?'; then
    defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
    defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
  fi
  if confirm '[10/14] Disable Spotlight items?'; then
    defaults write com.apple.spotlight orderedItems -array \
      '{"enabled" = 1;"name" = "APPLICATIONS";}' \
      '{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
      '{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
      '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
      '{"enabled" = 0;"name" = "BOOKMARKS";}' \
      '{"enabled" = 0;"name" = "CONTACT";}' \
      '{"enabled" = 0;"name" = "DIRECTORIES";}' \
      '{"enabled" = 0;"name" = "DOCUMENTS";}' \
      '{"enabled" = 0;"name" = "EVENT_TODO";}' \
      '{"enabled" = 0;"name" = "FONTS";}' \
      '{"enabled" = 0;"name" = "IMAGES";}' \
      '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
      '{"enabled" = 0;"name" = "MENU_OTHER";}' \
      '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}' \
      '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
      '{"enabled" = 0;"name" = "MESSAGES";}' \
      '{"enabled" = 0;"name" = "MOVIES";}' \
      '{"enabled" = 0;"name" = "MUSIC";}' \
      '{"enabled" = 0;"name" = "PDF";}' \
      '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
      '{"enabled" = 0;"name" = "SOURCE";}' \
      '{"enabled" = 0;"name" = "SPREADSHEETS";}'
    killall mds > /dev/null 2>&1
    sudo mdutil -i on / > /dev/null
    sudo mdutil -E / > /dev/null
  fi
  if confirm '[11/14] Disable boot sound?'; then
    sudo nvram SystemAudioVolume=' '
  fi
  if confirm '[12/14] Enable AAC and AptX bluetooth codecs?'; then
    sudo defaults write bluetoothaudiod 'Enable AptX codec' -bool true
    sudo defaults write bluetoothaudiod 'Enable AAC codec' -bool true
  fi
  if confirm '[13/14] Increase sleep timeout to 15 minutes?'; then
    sudo pmset -a displaysleep 15 sleep 15 powernap 0 lidwake 1
  fi
  if confirm '[14/14] Enable HiDPI resolutions?'; then
    sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
  fi
  echo 'Done'
fi
