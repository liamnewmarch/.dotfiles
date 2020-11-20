# shellcheck disable=SC2153
if [ -n "$IS_COLOR" ]; then
  export LSCOLORS='exfxcxdxbxegedabagacad'
  export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

  if [ -n "$IS_MACOS" ]; then
    alias ls='ls -G'
  fi

  if [ -n "$IS_LINUX" ];  then
    alias ls='ls --color=auto'
  fi
fi

alias ll='ls -1Fhs'
alias la='ls -AFhl'
