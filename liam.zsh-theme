# Liam’s theme, builds on top of the ‘fancy prompt’ found in
# ~/.profile.d/prompt.sh, but adapted for Zsh.

PROMPT='
$(_prompt_time)$(_prompt_error)
$(_prompt_dir)$(_prompt_git_branch)
%{$fg[blue]%}$%{$reset_color%} '

PROMPT2='%{$fg[blue]%}»%{$reset_color%} '

function _prompt_dir() {
  print "%{$fg_bold[blue]%}%3~%{$reset_color%}"
}

function _prompt_time() {
  date +'%H:%M:%S'
}
