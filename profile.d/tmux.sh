_tmux_num_sessions() {
  if [ -n "$(command -v tmux)" ]; then
    tmux start-server \; list-sessions | wc -l | tr -d '[:space:]'
  else
    printf 0
  fi
}
