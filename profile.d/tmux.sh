_tmux_num_sessions() {
  tmux start-server \; list-sessions | wc -l | tr -d '[:space:]'
}
