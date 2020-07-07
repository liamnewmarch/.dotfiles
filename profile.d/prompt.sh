# Simple prompt
export PS1='
\t
\W
\$ '

export PS2='… '

# Simple color prompt
if [ -n "$IS_COLOR" ]; then
  export PS1="
\t
$(blue "\W")
$(blue "\$") "
  export PS2="$(blue "…") "
fi

# Fancy color prompt
if [ -n "$IS_COLOR" ]; then
  PROMPT_COMMAND=_prompt_command
fi

_prompt_command() {
  export PS1="
\t $(_prompt_error)
$(blue "\W") $(_prompt_git_branch)
$(blue "\$") "
}

_prompt_git_branch() {
  [ -z "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ] && return
  local branch="$(git symbolic-ref --short HEAD)"
  local modified="$(git status --porcelain | wc -l | tr -d '[:space:]')"
  printf "⌥ $(green "$branch")"
  [ $modified -gt 0 ] && printf " ($(red "$modified"))"
}

_prompt_error() {
  [ $? -ne 0 ] && printf "$(red '⨯')"
}
