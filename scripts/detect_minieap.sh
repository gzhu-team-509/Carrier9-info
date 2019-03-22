#!/bin/sh

# Detects if MiniEAP is running,
# If not, restart it.

minieap_process=`pgrep minieap`
if [ -z "$minieap_process" ]; then
	# Start MiniEAP when there is none
	if [ "x$1" == "x" ]; then
		/usr/bin/minieap.sh
		echo MiniEAP restarted.
	elif [ "x$1" == "xnoexec" ]; then
		echo MiniEAP is down.
	else
		echo USAGE: $0 \[noexec\]
		echo If noexec is given, MiniEAP won\'t be restarted.
	fi
else 
	echo MiniEAP is running.
fi
