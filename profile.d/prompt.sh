# Simple prompt
export PS1='\n\t\n\W\n\$ '

# Simple color prompt
if [ -n "$IS_COLOR" ]; then
  export PS1='\n\t\n\[\033[${COLOR_BLUE}\]\W\[\033[${COLOR_RESET}\]\n\$ '
fi

# Fancy color prompt
if [ -n "$IS_COLOR" ] && [ -n "$IS_INTERACTIVE" ]; then
  export PS1='\n\t$(_prompt_error)\n\[\033[${COLOR_BLUE}\]\W\[\033[${COLOR_RESET}\]$(_prompt_git_branch)\n\$ '
fi

_prompt_git_branch() {
  [ -z "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ] && return
  local branch="$(git symbolic-ref --short HEAD)"
  local modified="$(git status --porcelain | wc -l | tr -d '[:space:]')"
  printf " ⌥ \033[${COLOR_GREEN}${branch}\033[${COLOR_RESET}"
  [ "$modified" -gt 0 ] && echo " (\033[${COLOR_RED}${modified}\033[${COLOR_RESET})"
}

_prompt_error() {
  [ $? -ne 0 ] && printf " \033[${COLOR_RED}⨯\033[${COLOR_RESET}"
}
