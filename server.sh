#!/bin/sh
 BINDIR=$(dirname "$(readlink -fn "$0")")
 cd "$BINDIR"
 java -Xms450M -Xmx1024M -jar craftbukkit.jar nogui
