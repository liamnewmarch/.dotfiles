##
# $PATH
#

pathdirs=(
    /bin
    /sbin
    /usr/bin
    /usr/sbin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/bin/g4bin
    $HOME/.n/bin
    $HOME/.gem/ruby/2.0.0/bin
    $HOME/homebrew/bin
    $HOME/npm-global/bin
    $HOME/bin
)


##
# Oh My Zsh plugins
#

plugins=(
    atom
    bower
    brew
    brew-cask
    catimg
    colored-man-pages
    git
    github
    gitignore
    grunt
    gulp
    man
    node
    npm
    osx
    pep8
    pip
    python
    sudo
    tmux
    zsh_reload
)


##
# Oh My Zsh preferences
#

HIST_STAMPS="yyyy-mm-dd"
ZSH_THEME="liam"
ZSH_TMUX_AUTOCONNECT="true"
ZSH_TMUX_AUTOSTART="false"


##
# Environmental preferences
#

# Reverse pathdirs and export as $PATH string
pathdirs=($^pathdirs(N))
for dir in $pathdirs; do
    export PATH=$dir:$PATH
done

# Other exports
export EDITOR='vim'
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
export MOTD="$HOME/bin/motd"
export N_PREFIX="$HOME/.n"
export PYTHONDONTWRITEBYTECODE="true"
export UPDATE_ZSH_DAYS=7
export VIRTUAL_ENV_DISABLE_PROMPT=1
export ZSH=$HOME/.oh-my-zsh


##
# Custom aliases
#

alias chrome='open -a "Google Chrome"'
alias chrome-as='open -a "Google Chrome" --args --profile-directory'
alias gpuo='git push -u origin $(git rev-parse --abbrev-ref head)'
alias grun='git run'
alias serve='python -m SimpleHTTPServer'
alias vi='vim'


##
# Sourced scripts
#

# Virtualenv wrapper
source '/usr/local/bin/virtualenvwrapper.sh'

# Google Cloud SDK
GOOGLE_CLOUD_SDK="$HOME/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
source "$GOOGLE_CLOUD_SDK/path.zsh.inc"
source "$GOOGLE_CLOUD_SDK/completion.zsh.inc"

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# If tmux is not running
if [[ -z "$TMUX" ]]; then
    read '?Start tmux? [Y/n] ' yn
    case $yn in
        [Nn]*) ;; # Quit
        *) tmux;; # Run tmux
    esac
fi
