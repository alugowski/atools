#!/usr/bin/env zsh

# find our own directory
export ATOOLS_SCRIPTS_HOME=${0:a:h}

PLATFORM="Linux"
if uname | grep -q "Darwin" ; then
	PLATFORM="Darwin"
fi

source $ATOOLS_SCRIPTS_HOME/aliases.sh
if [ "$PLATFORM" = "Darwin" ] ; then
  source $ATOOLS_SCRIPTS_HOME/aliases-mac.sh
fi

#  prompt
source $ATOOLS_SCRIPTS_HOME/prompt-zsh.sh
