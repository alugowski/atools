#!/bin/bash
# Commands to run after a reboot

# SSH agent
echo
echo "Setup ssh-agent"
eval $(ssh-agent -s)

ssh-add ~/.ssh/google_compute_engine
