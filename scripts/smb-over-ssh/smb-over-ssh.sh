#!/usr/bin/env bash

## CONFIGURATION PARAMETERS

# The remote host with SMB service
SMB_HOST="127.0.0.1"

# Port for tunneled SMB service (a random-ish number)
LOCAL_SMB_PORT="19548"

# Port to connect to on the remote end. 445 is SMB default
REMOTE_SMB_PORT="445"

# The label for the service that is registered with dns-sd and will be visible in Finder.
# Finder won't connect if this isn't a single word.
LABEL=""

# Quiet mode
QUIET=false

## NO NEED TO EDIT BELOW THIS LINE

createTunnel() {
    if [ $# -eq 0 ]; then
      echo "SSH connection arguments missing."
      exit 1
    fi

    if [ "$QUIET" = "false" ]; then echo "Connecting to $@" >&2; fi

    # Create tunnel to port 445 on remote host and make it available at port $LOCAL_SMB_PORT at localhost
    # Also tunnel ssh for connection testing purposes
    ssh -gNf -L "$LOCAL_SMB_PORT:$SMB_HOST:$REMOTE_SMB_PORT" "$@"

    if [[ $? -eq 0 ]]; then
        # Register SMB as service via dns-sd
        if [ "$QUIET" = "false" ]; then echo "Registering '$LABEL' with dns-sd"; fi

        dns-sd -R "$LABEL" _smb._tcp . "$LOCAL_SMB_PORT" > /dev/null &

        if [ "$QUIET" = "false" ]; then echo "Tunnel created successfully"; fi
        exit 0
    else
        if [ "$QUIET" = "false" ]; then echo "An error occurred creating a tunnel. RC was $?"; fi
        exit 1
    fi
}

killTunnel() {
    MYPID=`getPid`
    for i in $MYPID; do kill $i; done
    if [ "$QUIET" = "false" ]; then echo "All processes for all tunnels killed"; fi
    exit 0
}

status() {
    MYPID=`getPid`
    if [[ -z "$MYPID" ]]; then
        if [ "$QUIET" = "false" ]; then echo "Tunnel is NOT ACTIVE"; fi
        exit 0
    fi
    if [ "$QUIET" = "false" ]; then echo "Tunnel is ACTIVE"; fi
    exit 1
}

getPid() {
    MYPID=`ps aux | egrep -w \
      "ssh -gNf -L $LOCAL_SMB_PORT:$SMB_HOST:$REMOTE_SMB_PORT|dns-sd -R" \
      | grep -v egrep | awk '{print $2}'`
    echo $MYPID
}

help() {
    SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
    echo "
$SCRIPT_NAME lets you see a SMB host via an SSH tunnel.

Tunnel Setup:
$SCRIPT_NAME [-q] HostLabel SSH_connection_args

Leave the terminal open, as the ssh and dns-sd processes are left in the background.

Shutdown:
$SCRIPT_NAME -k

Options
 -q, --quiet               Quiet mode.
 -k, --kill                Kill all $SCRIPT_NAME tunnels.
 -h, --help                Show this screen.
 HostLabel                 A label for the SMB host that will be visible in Finder.
                           Make this a single word else Finder won't connect.
                           If it is the same as the host's NetBIOS name then even TimeMachine will work.
 SSH_connection_args       Arguments forwarded to ssh to make the connection.

"
exit 0
}

# commandline parameters

while [ $# -gt 0 ]; do
    case "$1" in
        -s|--status)
            status
        ;;
        -k|--kill)
            killTunnel
        ;;
        -q|--quiet)
            QUIET=true
        ;;
        -h|--help)
            help
        ;;
        *)
        LABEL="$1"
        shift
        break
        ;;
    esac
    shift       # Check next set of parameters.
done

MYPID=`getPid`
if [[ -z "$MYPID" ]]; then
    createTunnel "$@"
else
    if [ "$QUIET" = "false" ]; then echo "Tunnel is already active"; fi
fi
