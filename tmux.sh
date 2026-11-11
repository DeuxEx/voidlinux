xbps-install tmux


touch /etc/tmux.conf

echo "set -g default-terminal "tmux-256color"" > /etc/tmux.conf
echo "set -ag terminal-overrides ",xterm-256color:RGB"" > /etc/tmux.conf
echo "set -g default-command "${SHELL}"" > /etc/tmux.conf



