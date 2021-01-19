#!/bin/bash

# Mount a phone using simple-mtpfs
# install using `brew install simple-mtpfs`. Might prompt an installation of OSXFuse.
alias mount_phone_fg="simple-mtpfs -f ~/phone"

# Remove the locked flag
# This flag is set for files that were locked in-camera
alias unlock="chflags -R nouchg"

# Nassie access
nassie-smb-over-ssh () {
  $ATOOLS_SCRIPTS_HOME/scripts/smb-over-ssh/smb-over-ssh.sh nassie nlugowski
}
