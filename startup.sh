#!/bin/bash
# Commands to run after a reboot

# SSH agent
echo
echo "Setup ssh-agent"
eval $(ssh-agent -s)

if [ -f ~/.ssh/google_compute_engine ]; then
	ssh-add ~/.ssh/google_compute_engine
fi
