xbps-install micro -Suy


mkdir -p /etc/micro
touch /etc/micro/settings.json
touch /etc/micro/bindings.json
sudo chmod -R 755 /etc/micro


tee /etc/micro/settings.json << 'EOF'
{
    "autoclose": true,
    "autoindent": true,
    "clipboard": "external",
    "colorcolumn": 80,
    "colorscheme": "monokai",
    "cursorline": true,
    "diffgutter": true,
    "eofnewline": true,
    "hlsearch": true,
    "hltaberrors": true,
    "ignorecase": true,
    "incsearch": true,
    "linter": true,
    "mouse": true,
    "rmtrailingws": true,
    "ruler": true,
    "savecursor": true,
    "saveundo": true,
    "scrollbar": true,
    "smartpaste": true,
    "softwrap": false,
    "statusformatl": "$(filename) $(modified)($(line),$(col)) $(status.paste)| ft:$(opt:filetype) | $(opt:fileformat) | $(opt:encoding)",
    "tabsize": 4,
    "tabstospaces": true
}
EOF



tee /etc/micro/bindings.json << 'EOF'
{
    "Ctrl-o": "Save",
    "Ctrl-x": "Quit",
    "Ctrl-r": "OpenFile",
    "Ctrl-g": "ToggleHelp",
    "Ctrl-c": "CursorLocation",

    "Ctrl-w": "Find",
    "Alt-w": "FindNext",
    "Ctrl-\\": "command:replace",

    "Ctrl-k": "CutLine|Cut",
    "Ctrl-u": "Paste",
    "Alt-6": "CopyLine|Copy",
    "Alt-u": "Undo",
    "Alt-e": "Redo",
    "Alt-a": "SelectAll",

    "Ctrl-a": "StartOfLine",
    "Ctrl-e": "EndOfLine",
    "Ctrl-y": "PageUp",
    "Ctrl-v": "PageDown",
    "Alt-\\": "StartOfText",
    "Alt-/": "EndOfText",
    "Ctrl-_": "JumpLine",
    "Alt-Right": "WordRight",
    "Alt-Left": "WordLeft",

    "Alt-x": "CommandMode",
    "Alt-d": "DuplicateLine",
    "Alt-Up": "MoveLinesUp",
    "Alt-Down": "MoveLinesDown",
    "Alt-c": "command:comment",
    "Alt-t": "AddTab"
}
EOF
