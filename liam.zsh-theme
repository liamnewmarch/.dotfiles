#!/bin/zsh
# Liam’s theme, builds on top of the ‘fancy prompt’ found in
# ~/.profile.d/prompt.sh, but adapted for Zsh.

PROMPT='
$(date +"%H:%M:%S") $(red "%%(?.."⨯")")
$(blue "%%3~") $(_prompt_git_branch)
$(blue "\$") '

PROMPT2='$(blue "…") '
