#!/bin/bash

INSTALL_FOLDER=/usr/local/bin
WATCHER_PROGRAM=watcher.bash

# If you have your own video player that you would like to use then do not install mplayer.
sudo apt-get install coreutils grep mplayer
sudo cp "$WATCHER_PROGRAM" "$INSTALL_FOLDER/watcher"
