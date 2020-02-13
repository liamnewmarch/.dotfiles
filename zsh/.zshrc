##
# $PATH
#

local pathdirs=(
    /bin
    /sbin
    /usr/bin
    /usr/sbin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/bin/g4bin
    /usr/local/git/current/bin
    $HOME/Library/Python/2.7/bin
    $HOME/Library/Python/3.7/bin
    $HOME/bin
)


##
# Oh My Zsh plugins
#

export plugins=(
    brew
    colored-man-pages
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
    zsh_reload
)


##
# Oh My Zsh preferences
#

export HIST_STAMPS="yyyy-mm-dd"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="liam"
export ZSH_TMUX_AUTOSTART="false"
export ZSH_TMUX_AUTOQUIT="false"


##
# Environmental preferences
#

# Reverse pathdirs and export as $PATH string
local pathdirs=($^pathdirs(N))
for dir in $pathdirs; do
    export PATH=$dir:$PATH
done


# Other exports
export EDITOR='vim'
export PYTHONDONTWRITEBYTECODE="true"
export UPDATE_ZSH_DAYS=7


##
# Custom aliases
#

alias chrome='open -a "Google Chrome"'
alias chrome-as='open -a "Google Chrome" --args --profile-directory'
alias dcd='docker-compose down'
alias dce='docker-compose exec'
alias dcm='docker-compose exec app python manage.py'
alias dcr='docker-compose run --rm'
alias dcu='docker-compose up'
alias defjam='docker exec -it defjam'
alias defjam-mysql='docker exec -it mysql mysql'
alias drm='docker container prune -f; docker image prune -f; docker volume prune -f'
alias gam='commit -a --amend --no-edit'
alias gd='git diff -- . ":(exclude)package-lock.json"'
alias goro="$HOME/Development/goro-cli/goro.py"
alias gpuo='git push -u origin $(git rev-parse --abbrev-ref head)'
alias grun='git run'
alias gsti='git status --ignored'
alias gt='glol --since=12pm'
alias gy='glol --since=yesterday.12pm --until=12pm'
alias p='project'
alias serve='python3 -m http.server'
alias tree='tree -I node_modules'
alias vi='vim'


##
# Custom functions
#

mkcd() {
  mkdir -p -- "$1"
  cd -P -- "$1"
}

svg64() {
  echo "data:image/svg+xml;base64,$(cat "$1" | base64)"
}

# Platform zshrc file
local platformrc="$HOME/.zshrc-$(uname)"
if [[ -s "$platformrc" ]]; then
  source "$platformrc"
fi

# Local zshrc file (this device only)
local localrc="$HOME/.zshrc-local"
if [[ -s "$localrc" ]]; then
  source "$localrc"
fi


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


##
# Oh my ZSH
#
source $ZSH/oh-my-zsh.sh
