# General
set -g aggressive-resize on
set -g base-index 1
set -g bell-action none
set -g default-terminal "screen-256color"
set -g mouse on
set -g prefix C-a
set -sg escape-time 10
setw -g mode-keys vi
setw -g xterm-keys on

# Status Bar
set -g status-interval 1
set -g status-position top
set -g status-right '#(date +"%b %_d %H:%M") | #(whoami)@#(hostname -s)'

# Key Bindings
bind ! split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
bind b break-pane
bind k confirm kill-window
bind q confirm kill-session
bind r source-file ~/.tmux.conf
bind t select-layout tiled
bind x kill-pane

bind -n S-Left previous-window
bind -n S-Right next-window

bind -n M-S-Left resize-pane -L 5
bind -n M-S-Right resize-pane -R 5
bind -n M-S-Down resize-pane -D 5
bind -n M-S-Up resize-pane -U 5

# vim-like Copy & Paste
bind Escape copy-mode
bind p paste-buffer
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-selection-and-cancel
bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-selection-and-cancel
bind -T copy-mode-vi Enter send-keys -X copy-selection-and-cancel

# macOS Copy & Paste
if-shell 'test "$(uname)" = "Darwin"' \
  'bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"; \
   bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"; \
   bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "pbcopy"'
