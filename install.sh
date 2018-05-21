#!/bin/bash

# find our own directory
# this is based on the gapps scripts
script_link="$( command readlink "$BASH_SOURCE" )" || script_link="$BASH_SOURCE"
apparent_sdk_dir="${script_link%/*}"
if [ "$apparent_sdk_dir" == "$script_link" ]; then
  apparent_sdk_dir=.
fi
sdk_dir="$( command cd -P "$apparent_sdk_dir" > /dev/null && command pwd -P )"

ATOOLS_SCRIPTS_HOME="$sdk_dir"

# Figure out where to install to: .bash_profile in Mac, else .bashrc
PLATFORM="Linux"
BASHRC=~/.bashrc
if uname | grep -q "Darwin" ; then
	BASHRC=~/.bash_profile
	PLATFORM="Darwin"
fi

# See if we're already installed
SOURCE_CMD="source $ATOOLS_SCRIPTS_HOME/source-root.sh"

if grep -q "$SOURCE_CMD" "$BASHRC" ; then
	echo "Already installed to $BASHRC"
	exit
fi

# Install
echo "Installing to $BASHRC"
echo >> $BASHRC
echo "# atools scripts" >> $BASHRC
echo "$SOURCE_CMD" >> $BASHRC

# Run post-install scripts
echo "Running post install commands"
source $ATOOLS_SCRIPTS_HOME/once.sh
if [ "$PLATFORM" == "Darwin" ] ; then
	source $ATOOLS_SCRIPTS_HOME/once-mac.sh
fi
