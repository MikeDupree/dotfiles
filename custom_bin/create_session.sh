#!/bin/sh

if [ -z "$1" ] 
then
  echo "No Session Name!"
  exit 1
fi

session=$1
window=${session}:0
pane=${window}.0
tmux new -s "$session" -d
tmux split-window -t "$pane" -v
tmux resize-pane -t "$pane" -D 10
tmux send-keys -t "$pane" C-l 'cat /home/$USER/success.txt' C-m
tmux select-pane -t "$pane"
tmux select-window -t "$window"
tmux attach-session -t "$session"
