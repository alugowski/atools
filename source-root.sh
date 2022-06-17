#!/bin/bash

# find our own directory
# this is based on the gapps scripts
script_link="$( command readlink "$BASH_SOURCE" )" || script_link="$BASH_SOURCE"
apparent_sdk_dir="${script_link%/*}"
if [ "$apparent_sdk_dir" == "$script_link" ]; then
  apparent_sdk_dir=.
fi
sdk_dir="$( command cd -P "$apparent_sdk_dir" > /dev/null && command pwd -P )"

export ATOOLS_SCRIPTS_HOME="$sdk_dir"

PLATFORM="Linux"
if uname | grep -q "Darwin" ; then
	PLATFORM="Darwin"
fi

source $ATOOLS_SCRIPTS_HOME/aliases.sh
if [ "$PLATFORM" == "Darwin" ] ; then
  source $ATOOLS_SCRIPTS_HOME/aliases-mac.sh
fi

# run startup-only scripts
# use ssh-agent as a proxy for a marker of whether or not the startup scripts have been run
# if ! ps aux | grep ssh-agent | grep -q -v grep ; then
source $ATOOLS_SCRIPTS_HOME/ssh-find-agent.sh
if ! ssh-find-agent -a ; then
	echo "running startup"
	source $ATOOLS_SCRIPTS_HOME/startup.sh

	if [ "$PLATFORM" == "Darwin" ] ; then
		source $ATOOLS_SCRIPTS_HOME/startup-mac.sh
	fi
fi

# bash prompt
source $ATOOLS_SCRIPTS_HOME/prompt-bash.sh
