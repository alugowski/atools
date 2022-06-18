#!/usr/bin/env zsh

# Git prompt
source "/opt/homebrew/opt/zsh-git-prompt/zshrc.sh"
PROMPT='%B%m %~%b $(git_super_status) %# '

