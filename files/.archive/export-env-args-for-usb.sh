# Assume a USB storage is mounted at /mnt/sda1.
# Don't append a trailing slash to the path.
EXPATH=/mnt/sda1


# `link_if_not_exists $1` used to link file between normal file systems
# and external file systems.
link_if_not_exists () {
    if [ "x$1" == "x" ]; then
            echo "link_if_not_exists() takes one argument."
        fi

    if [ ! -e "$1" ]; then
        ln -s $EXPATH/$1 $1
    fi
}


if [ -e $OPTWARE_PATH ]; then
    echo "[info] $EXPATH is mounted."

    # Set up environment variables.
    export PATH=$PATH:$EXPATH/usr/bin/
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$EXPATH/usr/lib/

    # git-core
    link_if_not_exists /usr/share/git-core

    # pip
    link_if_not_exists /etc/pip.conf
    alias pip="pip3"
    alias pip3="python3 -m pip"

else
    echo "[info] Can't mount $EXPATH, no such directory."

    # Remove broken symlinks.
    find /usr -type l -exec sh -c 'for x; do [ -e "$x" ] || rm "$x"; done' _ {} +
    find /etc -type l -exec sh -c 'for x; do [ -e "$x" ] || rm "$x"; done' _ {} +
fi
