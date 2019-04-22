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
    $HOME/.gem/ruby/2.0.0/bin
    $HOME/bin
)


##
# Oh My Zsh plugins
#

plugins=(
    atom
    brew
    colored-man-pages
    git
    gitignore
    man
    node
    npm
    nvm
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
export GCLOUD_SDK="$HOME/.google/cloud-sdk"
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
export MOTD="$HOME/bin/motd"
export N_PREFIX="$HOME/.n"
export PYTHONDONTWRITEBYTECODE="true"
export UPDATE_ZSH_DAYS=7
export VIRTUAL_ENV_DISABLE_PROMPT=1
export ZSH="$HOME/.oh-my-zsh"


##
# Custom aliases
#

alias chrome='open -a "Google Chrome"'
alias chrome-as='open -a "Google Chrome" --args --profile-directory'
alias gam='commit -a --amend --no-edit'
alias gd='git diff -- . ":(exclude)package-lock.json"'
alias gpuo='git push -u origin $(git rev-parse --abbrev-ref head)'
alias grun='git run'
alias serve='python -m SimpleHTTPServer'
alias vi='vim'


##
# Sourced scripts
#

source '/usr/local/bin/virtualenvwrapper.sh'
source "$ZSH/oh-my-zsh.sh"
source "$GCLOUD_SDK/path.zsh.inc"
source "$GCLOUD_SDK/completion.zsh.inc"


##
# tmux prompt
#

if [[ -z "$TMUX" ]]; then
    read '?Start tmux? [y/N] ' yn
    case $yn in
        [Yy]*) tmux;;
        *) ;;
    esac
fi

