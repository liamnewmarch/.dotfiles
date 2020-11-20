# Control characters
# Used in colour escape sequences.
ASCII_SOH="$(printf "\001")"  # Start of header (unprintable)
ASCII_SOT="$(printf "\002")"  # Start of text (printable)
ASCII_ESC="$(printf "\033")"  # Escape


# Colour variables
export COLOR_RESET='0'
export COLOR_BLACK='0;30'
export COLOR_RED='0;31'
export COLOR_GREEN='0;32'
export COLOR_YELLOW='0;33'
export COLOR_BLUE='01;34'
export COLOR_MAGENTA='0;35'
export COLOR_CYAN='0;36'
export COLOR_WHITE='0;37'
export COLOR_BRIGHT_BLACK='0;90'
export COLOR_BRIGHT_RED='0;91'
export COLOR_BRIGHT_GREEN='0;92'
export COLOR_BRIGHT_YELLOW='0;93'
export COLOR_BRIGHT_BLUE='0;94'
export COLOR_BRIGHT_MAGENTA='0;95'
export COLOR_BRIGHT_CYAN='0;96'
export COLOR_BRIGHT_WHITE='0;97'


# Prints the given string in a non-printable sequence.
# Args: (string).
zeroprint() {
  printf '%s%s%s' "$ASCII_SOH" "$1" "$ASCII_SOT"
}


# Prints the given colour into a non-printable colour sequence.
# Args: (colour).
colorseq() {
  if [ -n "$IS_COLOR" ]; then
    printf '%s' "$(zeroprint "$(printf '%s[%sm' "$ASCII_ESC" "$1")")"
  fi
}


# Prints string(s) in the given colour.
# Args: (colour, ...strings[])
color() {
  color=$1; shift
  printf '%s%s%s' "$(colorseq "$color")" "$@" "$(colorseq "$COLOR_RESET")"
}


# Colour functions – prints string(s) in a specific colour.
# Args: (...strings[])

black() {
  printf '%s' "$(color "$COLOR_BLACK" "$@")"
}

red() {
  printf '%s' "$(color "$COLOR_RED" "$@")"
}

green() {
  printf '%s' "$(color "$COLOR_GREEN" "$@")"
}

yellow() {
  printf '%s' "$(color "$COLOR_YELLOW" "$@")"
}

blue() {
  printf '%s' "$(color "$COLOR_BLUE" "$@")"
}

magenta() {
  printf '%s' "$(color "$COLOR_MAGENTA" "$@")"
}

cyan() {
  printf '%s' "$(color "$COLOR_CYAN" "$@")"
}

white() {
  printf '%s' "$(color "$COLOR_WHITE" "$@")"
}
