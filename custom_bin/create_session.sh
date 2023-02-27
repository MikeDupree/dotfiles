#!/bin/bash

if [ -z "$1" ] 
then
  echo "No Session Name!"
  exit 1
fi

if [ -z "$2" ] 
then
  echo "No workspace layout"
fi
session=$1
window=${session}:0
pane=${window}.0
tmux new -s "$session" -d

#
# Workspace Configuration
#
echo "CMD $0  :: NAME $1 :: Workspace type :: $2"

if [ $2 = "workspace" ]
then
  echo "Workspace Enabled"
  tmux split-window -t "$pane" -v
  tmux resize-pane -t "$pane" -D 10
fi
#tmux send-keys -t "$pane" C-l 'cat /home/$USER/success.txt' C-m

#
# Attach to the new session.
#
tmux select-pane -t "$pane"
tmux select-window -t "$window"
tmux attach-session -t "$session"
