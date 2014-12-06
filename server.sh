#!/bin/sh
 BINDIR=$(dirname "$(readlink -fn "$0")")
 cd "$BINDIR"
 java -Xms450M -Xmx1024M -jar craftbukkit-1.7.9-R0.2.jar nogui
