[ -r "$HOME/.profile" ] && . "$HOME/.profile"

# Oh my Zsh plugins
local plugins=(
    brew
    colored-man-pages
    docker
    docker-compose
    gcloud
    git
    gitignore
    man
    node
    npm
    osx
    pep8
    pip
    python
    tmux
    virtualenvwrapper
)

# Oh-my-Zsh specific variables
export HIST_STAMPS='yyyy-mm-dd'
export UPDATE_ZSH_DAYS=7
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME='liam'
export ZSH_TMUX_AUTOSTART='false'
export ZSH_TMUX_AUTOQUIT='false'

[ -n $IS_INTERACTIVE ] && [ -r $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# Disable auto `cd`
unsetopt autocd
