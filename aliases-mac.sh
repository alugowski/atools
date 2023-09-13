#!/bin/bash

# Mount a phone using simple-mtpfs
# install using `brew install simple-mtpfs`. Might prompt an installation of OSXFuse.
alias mount_phone_fg="simple-mtpfs -f ~/phone"

# Remove the locked flag
# This flag is set for files that were locked in-camera
alias unlock="chflags -R nouchg"

# Nassie access
nassie-smb-over-ssh () {
  $ATOOLS_SCRIPTS_HOME/scripts/smb-over-ssh/smb-over-ssh.sh nassie -C nlugowski
}

kill-smb-over-ssh-tunnels () {
  $ATOOLS_SCRIPTS_HOME/scripts/smb-over-ssh/smb-over-ssh.sh -k
}

# Restart Logitech Options. Useful if the Logitech mouse scroll wheel stops working.
alias logirestart="kill $(ps aux | grep LogiMgrDaemon.app | awk 'FNR == 1 {print $2}')"

# x86 Homebrew
# installed with: arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
alias ibrew="arch -x86_64 /usr/local/bin/brew"


condashellinit () {
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
}
