#!/bin/bash
# Commands to run after a reboot

# TCP keepalive
# Google uses a shorter keepalive than Apple so GCE SSH sessions easily, and annoyingly, time out.
echo
echo "Decrease keepalive interval because google cloud ssh sessions time out relatively quickly"
echo "Using sudo:"
sudo sysctl -w net.inet.tcp.always_keepalive=1 net.inet.tcp.keepidle=10000 net.inet.tcp.keepinit=10000 net.inet.tcp.keepintvl=10000
