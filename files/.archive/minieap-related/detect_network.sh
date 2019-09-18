#!/bin/sh

# Detect whether MiniEAP is kicked off by server,
# therefore need to restart MiniEAP.

if [ ! -z "`pgrep minieap`" ]
then
    /usr/bin/curl https://www.baidu.com > /dev/null
    if [ $? -gt 0 ]
    then
        /usr/bin/restart_minieap.sh
        echo MiniEAP restarted.
    else
        echo MiniEAP works fine.
    fi
else
    echo MiniEAP is not running.
fi
