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
  echo -e "New $(red 'session') as $(blue "$USER") on $(purple "$name")"
}
