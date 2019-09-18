#!/bin/sh

# Reconnect MiniEAP.

/usr/sbin/minieap -k
/usr/sbin/minieap &

exit 0
