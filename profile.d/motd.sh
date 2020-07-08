motd() {
  local name='local'
  local names=(
    $NICKNAME
    ${HOSTNAME%%.*}
    ${HOST%%.*}
  )
  for n in $names; do
    if [ -n "$n" ]; then
      name="$n"
      break
    fi
  done
  local session='session'
  local user=${USER:-'user'}

  printf "New $(red "$session") as $(blue "$user") on $(purple "$name")\n"

  if [ -n "$IS_INTERACTIVE" ] && [ -z "$TMUX" ]; then
    local num_tmux="$(_tmux_num_sessions)"
    [ -z "$num_tmux" ] || [ $num_tmux -eq 0 ] && return
    if [ $num_tmux -eq 1 ]; then
      printf "\n* There is $(blue '1') active tmux session\n"
    else
      printf "\n* There are $(blue "$num_tmux") active tmux sessions\n"
    fi
  fi
}
