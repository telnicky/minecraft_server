#!/bin/sh
 BINDIR=$(dirname "$(readlink -fn "$0")")
 cd "$BINDIR"
 java -Xms32M -Xmx450M -jar craftbukkit.jar nogui
