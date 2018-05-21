# Adam's utility scripts

## Installation

Run `install.sh`

This will add a `source source-root.sh` call to your `~/.bashrc` or `~/.bash_profile` that then sources appropriate things.

It will also run the `once*` scripts for any system settings that should be done only once.

## System startup actions

Called only once on first shell after a startup

* start ssh-agent
* set up TCP keep-alive on a mac

## Each time

* useful aliases
* git prompt setup
