_tmux_list_sessions() {
  local sessions="$(tmux start-server \; list-sessions)"
  [ -z "$sessions" ] && return
  local num="$(echo $sessions | wc -l | tr -d '[:space:]')"
  if [ "$num" -eq 1 ]; then
    echo "\n* There is $(blue "$num") active tmux session.\n"
  else
    echo "\n* There are $(blue "$num") active tmux sessions.\n"
  fi
}

[ -n "$IS_INTERACTIVE" ] && [ -z "$TMUX" ] && _tmux_list_sessions
