#!/bin/bash

# git prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_FETCH_REMOTE_STATUS=0
GIT_PROMPT_IGNORE_SUBMODULES=1
# GIT_PROMPT_SHOW_UNTRACKED_FILES=no

if command -v brew &> /dev/null && [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
	source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
else
	echo "To get bash prompt:"
	echo "brew install bash-git-prompt"
	echo
	echo "or install from sources from https://github.com/magicmonty/bash-git-prompt"
fi
