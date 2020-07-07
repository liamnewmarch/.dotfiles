_tmux_list_sessions() {
  local sessions="$(tmux start-server \; list-sessions)"
  [ -z "$sessions" ] && return
  local num="$(echo $sessions | wc -l | tr -d '[:space:]')"
  if [ "$num" -eq 1 ]; then
    printf "There is \033[${COLOR_BLUE}1\033[${COLOR_RESET} active tmux session."
  else
    printf "There are \033[${COLOR_BLUE}${num}\033[${COLOR_RESET} active tmux sessions."
  fi
}

[ -n "$IS_INTERACTIVE" ] && [ -z "$TMUX" ] && printf "\n* $(_tmux_list_sessions)\n\n"
