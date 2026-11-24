xbps-install micro -Suy


mkdir -p /etc/micro
touch /etc/micro/settings.json
touch /etc/micro/bindings.json


tee /etc/micro/settings.json << 'EOF'
{
    "autoindent": true,
    "colorscheme": "default",
    "mouse": true,
    "savecursor": true,
    "softwrap": false,
    "tabsize": 4,
    "tabstospaces": true
}
EOF



tee /etc/micro/bindings.json << 'EOF'
{
    "Ctrl-o": "Save",
    "Ctrl-x": "Quit",
    "Ctrl-r": "OpenFile",
    "Ctrl-w": "Find",
    "Alt-w": "FindNext",
    "Ctrl-\\": "command:replace",
    "Ctrl-k": "CutLine|Cut",
    "Ctrl-u": "Paste",
    "Alt-6": "CopyLine|Copy",
    "Ctrl-y": "PageUp",
    "Ctrl-v": "PageDown",
    "Ctrl-a": "StartOfLine",
    "Ctrl-e": "EndOfLine",
    "Ctrl-g": "ToggleHelp",
    "Ctrl-c": "CursorLocation",
    "Alt-u": "Undo",
    "Alt-e": "Redo"
}
EOF
