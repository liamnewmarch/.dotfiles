motd() {
  host='localhost'
  # shellcheck disable=SC2153
  [ -n "$HOST" ] && host="$HOST"
  # shellcheck disable=SC2039
  [ -n "$HOSTNAME" ] && host="$HOST_NICKNAME"
  [ -n "$HOST_NICKNAME" ] && host="$HOST_NICKNAME"
  session='session'
  user=${USER:-'user'}

  printf '%s\n' "New $(red "$session") as $(blue "$user") on $(magenta "$host")"

  if [ -n "$IS_INTERACTIVE" ] && [ -z "$TMUX" ]; then
    num_tmux="$(_tmux_num_sessions)"
    [ -z "$num_tmux" ] || [ "$num_tmux" -eq 0 ] && return
    if [ "$num_tmux" -eq 1 ]; then
      printf '\n%s\n' "$(yellow '•') There is $(blue '1') active tmux session"
    else
      printf '\n%s\n' "$(yellow '•') There are $(blue "$num_tmux") active tmux sessions"
    fi
  fi
}

# Show message of the day
[ -n "$IS_INTERACTIVE" ] && [ "$(command -v motd)" ] && motd
