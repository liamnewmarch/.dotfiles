_tmux_list_sessions() {
  local sessions="$(tmux start-server \; list-sessions)"
  [ -z "$sessions" ] && return
  local num="$(echo $sessions | wc -l | tr -d '[:space:]')"
  local plural="session$([ "$num" -eq 1 ] || echo 's')"
  echo -e "\nThere are $num active tmux $plural.\n"
}

[ -n "$IS_INTERACTIVE" ] && [ -z "$TMUX" ] && _tmux_list_sessions
