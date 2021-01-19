# Connect to an SMB host via an SSH tunnel

A lightweight VPN to a single host for just SMB. Useful to access shares or TimeMachine remotely.

It works as follows. Set up an SSH tunnel to forward SMB's port 445, then register the tunnel with `dns-sd` so the SMB host is discovered by Finder.

The script accepts a label that the SMB host will appear under. If this is the same as that host's NetBIOS name then this should work as if you were on the local network with that host.

The intended application is to be able to use a networked TimeMachine while away from home.

# Usage

```
smb-over-ssh.sh lets you see a SMB host via an SSH tunnel.

Tunnel Setup:
smb-over-ssh.sh [-q] HostLabel SSH_connection_args

Leave the terminal open, as the ssh and dns-sd processes are left in the background.

Shutdown:
smb-over-ssh.sh -k

Options
 -q, --quiet               Quiet mode.
 -k, --kill                Kill all smb-over-ssh.sh tunnels.
 -h, --help                Show this screen.
 HostLabel                 A label for the SMB host that will be visible in Finder.
                           Make this a single word else Finder won't connect.
                           If it is the same as the host's NetBIOS name then even TimeMachine will work.
 SSH_connection_args       Arguments forwarded to ssh to make the connection.
 ```
