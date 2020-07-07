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
  echo "$(color "$COLOR_BLACK" "$@")"
}

red() {
  echo "$(color "$COLOR_RED" "$@")"
}

green() {
  echo "$(color "$COLOR_GREEN" "$@")"
}

yellow() {
  echo "$(color "$COLOR_YELLOW" "$@")"
}

blue() {
  echo "$(color "$COLOR_BLUE" "$@")"
}

purple() {
  echo "$(color "$COLOR_PURPLE" "$@")"
}

cyan() {
  echo "$(color "$COLOR_CYAN" "$@")"
}

white() {
  echo "$(color "$COLOR_WHITE" "$@")"
}
