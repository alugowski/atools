#!/bin/bash

# Wrap VIM's text encoding detector
set +H  # disable history lookup so the !echo below doesn't get misinterpreted
alias detect_encoding="vim -c 'execute \"silent !echo \" . &fileencoding | q'"

# clear that clears iTerm2's scrollback too
# see https://superuser.com/a/726295/129020
alias clear="printf '\e]50;ClearScrollback\a'"

