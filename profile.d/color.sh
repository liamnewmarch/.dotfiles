if [ -n "$IS_COLOR" ]; then
  export COLOR_RESET='0'
  export COLOR_BLACK='0;30'
  export COLOR_RED='0;31'
  export COLOR_GREEN='0;32'
  export COLOR_YELLOW='0;33'
  export COLOR_BLUE='01;34'
  export COLOR_PURPLE='0;35'
  export COLOR_CYAN='0;36'
  export COLOR_WHITE='0;37'
fi

color() {
  if [ -n "$IS_COLOR" ]; then
    printf "\001\033[${1}m\002${@:2}\001\033[${COLOR_RESET}m\002"
  else
    printf "${@:2}"
  fi
}

black() {
  printf "$(color "$COLOR_BLACK" "$@")"
}

red() {
  printf "$(color "$COLOR_RED" "$@")"
}

green() {
  printf "$(color "$COLOR_GREEN" "$@")"
}

yellow() {
  printf "$(color "$COLOR_YELLOW" "$@")"
}

blue() {
  printf "$(color "$COLOR_BLUE" "$@")"
}

purple() {
  printf "$(color "$COLOR_PURPLE" "$@")"
}

cyan() {
  printf "$(color "$COLOR_CYAN" "$@")"
}

white() {
  printf "$(color "$COLOR_WHITE" "$@")"
}
