#!/bin/bash

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ll='ls -la'
alias psgrep='ps -A | grep'
alias sha1='openssl sha1'
alias lt='du -sh * | sort -h'
#alias gh='history | grep'

# Print external IP address
alias externalip='wget -qO - http://ipecho.net/plain ; echo'

# Wrap VIM's text encoding detector
set +H  # disable history lookup so the !echo below doesn't get misinterpreted
alias detect_encoding="vim -c 'execute \"silent !echo \" . &fileencoding | q'"

# clear that clears iTerm2's scrollback too
# see https://superuser.com/a/726295/129020
alias clear="printf '\e]50;ClearScrollback\a'"

# Create and activate a new Python virtualenv, or activate an already existing one
venv () {
	ENVDIR="${1:-venv}"
	if [ -d .venv ]; then
		ENVDIR=".venv"
	elif [ -d env ]; then
		ENVDIR="env"
	fi

	if [ ! -d "$ENVDIR/" ]; then
		if command -v python &> /dev/null
		then
			PYTHON="python"
			PIP="pip"
		else
			PYTHON="python3"
			PIP="pip3"
		fi


		echo "Creating $ENVDIR/ ..."
		$PYTHON -m venv $ENVDIR

		echo "Upgrading pip..."
		source $ENVDIR/bin/activate
		$PIP install --upgrade pip
	fi

	echo "Activating $ENVDIR"
	source $ENVDIR/bin/activate
}
