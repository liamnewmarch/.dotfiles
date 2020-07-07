#!/bin/zsh
# Liam’s theme, builds on top of the ‘fancy prompt’ found in
# ~/.profile.d/prompt.sh, but adapted for Zsh.

PROMPT='
$(date +"%H:%M:%S") %F{red}%(?..⨯)%f
%F{blue}%3~%f $(_prompt_git_branch)
%F{blue}\$%f '

PROMPT2='%F{blue}…%f'
