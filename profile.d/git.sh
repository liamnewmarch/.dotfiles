# TODO copy most-used aliases from o-m-z

alias gam='git commit -a --amend --no-edit'
alias gd='git diff -- . ":(exclude)package-lock.json"'
alias gpuo='git push -u origin $(git rev-parse --abbrev-ref head)'
alias gsti='git status --ignored'

# These aliases require o-m-z, broken in bash
alias gt='glol --since=12pm'
alias gy='glol --since=yesterday.12pm --until=12pm'

github() {
  git clone --recurse-submodules git@github.com:${1}.git
}
