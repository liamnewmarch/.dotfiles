##
# $PATH
#

local pathdirs=(
    $HOME/bin
    $HOME/Library/Python/3.7/bin
    $HOME/Library/Python/2.7/bin
    /usr/local/git/current/bin
    /usr/local/bin/g4bin
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
)


##
# Oh My Zsh plugins
#

local plugins=(
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
# Exports
#

export EDITOR='vim'
export HIST_STAMPS='yyyy-mm-dd'
export PATH=$(echo $pathdirs | tr ' ' ':')
export PYTHONDONTWRITEBYTECODE='true'
export UPDATE_ZSH_DAYS=7
export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME='liam'
export ZSH_TMUX_AUTOSTART='false'
export ZSH_TMUX_AUTOQUIT='false'


##
# Aliases
#

alias chrome='open -a "Google Chrome"'
alias chrome-as='open -a "Google Chrome" --args --profile-directory'
alias dcb='docker-compose build'
alias dcd='docker-compose down'
alias dce='docker-compose exec'
alias dcm='docker-compose exec app python manage.py'
alias dcr='docker-compose run --rm'
alias dcu='docker-compose up'
alias dcub='docker-compose up --build'
alias de='docker exec'
alias dei='docker exec -it'
alias dr='docker run --rm'
alias dri='docker run --rm -it'
alias drm='docker container prune -f; docker image prune -f; docker volume prune -f; docker network prune -f;'
alias gam='commit -a --amend --no-edit'
alias gd='git diff -- . ":(exclude)package-lock.json"'
alias gpuo='git push -u origin $(git rev-parse --abbrev-ref head)'
alias gsti='git status --ignored'
alias gt='glol --since=12pm'
alias gy='glol --since=yesterday.12pm --until=12pm'
alias ncdu='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
alias ping='prettyping --nolegend'
alias serve='python3 -m http.server'
alias top='htop'
alias tree='tree -I node_modules'
alias vi='vim'


##
# Functions
#

github() {
  git clone --recurse-submodules git@github.com:${1}.git
}

mkcd() {
  mkdir -p -- "$1"
  cd -P -- "$1"
}

svg64() {
  echo "data:image/svg+xml;base64,$(cat "$1" | base64)"
}


##
# Source optional configs
#

local platformrc="$HOME/.zshrc-$(uname)"
if [ -s "$platformrc" ]; then
  source "$platformrc"
fi

local localrc="$HOME/.zshrc-local"
if [ -s "$localrc" ]; then
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
# Source Oh my ZSH
#

source $ZSH/oh-my-zsh.sh
unsetopt autocd
