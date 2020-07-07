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
  local session="\033[${COLOR_RED}session\033[${COLOR_RESET}"
  local user="\033[${COLOR_BLUE}${USER}\033[${COLOR_RESET}"
  local host="\033[${COLOR_PURPLE}${name}\033[${COLOR_RESET}"
  echo -e "New $session as $user on $host"
}
