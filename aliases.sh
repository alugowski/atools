#!/bin/bash

# Wrap VIM's text encoding detector
set +H  # disable history lookup so the !echo below doesn't get misinterpreted
alias detect_encoding="vim -c 'execute \"silent !echo \" . &fileencoding | q'"

# clear that clears iTerm2's scrollback too
# see https://superuser.com/a/726295/129020
alias clear="printf '\e]50;ClearScrollback\a'"

# Mount a phone using simple-mtpfs
# install using `brew install simple-mtpfs`. Might prompt an installation of OSXFuse.
alias mount_phone_fg="simple-mtpfs -f ~/phone"

# Remove the locked flag
# This flag is set for files that were locked in-camera
alias unlock="chflags -R nouchg"

# Create and activate a new Python virtualenv, or activate an already existing one
venv () {
	if [ ! -d env/ ]; then
		echo "Creating env/ ..."
		python -m venv env

		echo "Upgrading pip..."
		source env/bin/activate
		pip install --upgrade pip
	fi

	echo "Activating env..."
	source env/bin/activate
}
