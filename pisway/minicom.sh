#!/bin/bash

# Configuration
DEVICE="/dev/ttyUSB0"
BAUD="115200"
SESSION_NAME="serial"

# Command breakdown:
# -s : sets the name of the tmux session
# minicom ... : the command to run inside that session
CMD="tmux new-session -s $SESSION_NAME minicom -D $DEVICE -b $BAUD"

# Launch foot
foot $CMD
