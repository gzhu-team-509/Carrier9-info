#!/bin/sh
# Remove broken links and link files that relate to the USB storage mount point.

# The path to USB storage mount point.
EXPATH="/mnt/sda1/"

# Get absolute path which has no trailing slash.
EXPATH=`readlink -f "$EXPATH"`

# Remove broken symlinks.
find "/usr" -type l -exec sh -c 'for x; do [ -e "$x" ] || rm "$x"; done' _ {} +
find "/etc" -type l -exec sh -c 'for x; do [ -e "$x" ] || rm "$x"; done' _ {} +

# Make symlinks
CMD="for x; do if [ ! -e \"\${x#$EXPATH}\" ]; then ln -s \"\$x\" \"\${x#$EXPATH}\"; fi; done"
find "$EXPATH/etc" -exec sh -c "$CMD" _ {} +
find "$EXPATH/usr" -exec sh -c "$CMD" _ {} +
