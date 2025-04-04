gdb-tmux() {
  local id="$(tmux split-pane -hPF "#D" "tail -f /dev/null")"
  tmux last-pane
  local tty="$(tmux display-message -p -t "$id" '#{pane_tty}')"
  gdb -ex "dashboard -output $tty" "$@"
  tmux kill-pane -t "$id"
}
