xbps-install nano

tee /etc/nanorc << 'EOF'
#https://github.com/scopatz/nanorc/blob/master/install.sh
set titlecolor brightwhite,blue
set statuscolor brightwhite,green
set numbercolor cyan
set selectedcolor white,magenta
set linenumbers
set softwrap
set autoindent
set tabsize 4
set backup
set backupdir "/home/nanobackup"
set minibar
#set constantshow = "gotta have line numbers somewhere and the status line takes up space either way, unless you minibar/zero"
set constantshow
#set zap = "Let an unmodified Backspace or Delete erase the marked region (instead of a single character, and without affecting the cutbuffer)".
set zap
bind ^c copy main
bind ^v paste main
bind ^z undo main
bind DEL cut main
include "~/.nano/sh.nanorc"
include "~/.nano/rust.nanorc"
include "~/.nano/json.nanorc"
include "~/.nano/xml.nanorc"
include "~/.nano/c.nanorc"
include "~/.nano/csharp.nanorc"
include "~/.nano/git.nanorc"
EOF


tee /root/.nano/c.nanorc << 'EOF'
## Here is an example for C/C++.
##
syntax "C" "\.(c(c|pp|xx)?|C)$" "\.(h(h|pp|xx)?|H)$" "\.ii?$" "\.(def)$" "\.ino"
magic "^(C|C\+\+) (source|program)"
comment "//"
color brightred "\<[A-Z_][0-9A-Z_]+\>"
color green "\<(float|double|bool|char|wchar_t|int|short|long|sizeof|enum|void|static|const|struct|union|typedef|extern|(un)?signed|inline)\>"
color green "\<((s?size)|(char(16|32))|((u_?)?int(_fast|_least)?(8|16|32|64))|u?int(max|ptr))_t\>"
color green "\<(class|namespace|template|public|protected|private|typename|this|friend|virtual|using|mutable|volatile|register|explicit)\>"
color green "\<(for|if|while|do|else|case|default|switch)\>"
color green "\<(try|throw|catch|operator|new|delete)\>"
color green "\<((const|dynamic|reinterpret|static)_cast)\>"
color green "\<(alignas|alignof|asm|auto|compl|concept|constexpr|decltype|export|noexcept|nullptr|requires|static_assert|thread_local|typeid|override|final)\>"
color green "\<(and|and_eq|bitand|bitor|not|not_eq|or|or_eq|xor|xor_eq)\>"
color brightmagenta "\<(goto|continue|break|return)\>"
color brightcyan "^[[:space:]]*#[[:space:]]*(define|include|(un|ifn?)def|endif|el(if|se)|if|warning|error)"
color brightmagenta "'([^'\]|(\\["'abfnrtv\\]))'" "'\\(([0-3]?[0-7]{1,2}))'" "'\\x[0-9A-Fa-f]{1,2}'"

##
## GCC builtins
color green "__attribute__[[:space:]]*\(\([^)]*\)\)" "__(aligned|asm|builtin|hidden|inline|packed|restrict|section|typeof|weak)__"

#Operator Color
color yellow "[.:;,+*|=!\%]" "<" ">" "/" "-" "&"

#Parenthetical Color
color magenta "[(){}]" "\[" "\]"


##
## String highlighting.  You will in general want your comments and
## strings to come last, because syntax highlighting rules will be
## applied in the order they are read in.
color cyan "<[^= 	]*>" ""(\\.|[^"])*""
##
## This string is VERY resource intensive!
#color cyan start=""(\\.|[^"])*\\[[:space:]]*$" end="^(\\.|[^"])*""

## printf-family format specifiers
color yellow "%(\#|(0-+))?(hh|h|l|ll|q|L|j|z|Z|t)?[A-Za-z]" "%%"

## Comment highlighting
color brightblue "//.*"
color brightblue start="/\*" end="\*/"

# Highlighting for documentation comments
color magenta "@param [a-zA-Z_][a-z0-9A-Z_]+"
color magenta "@return"
color magenta "@author.*"

## Trailing whitespace
color ,green "[[:space:]]+$"
EOF



tee /root/.nano/csharp.nanorc << 'EOF'
syntax "C#" "\.cs$"

# Class
color brightmagenta  "class +[A-Za-z0-9]+ *((:) +[A-Za-z0-9.]+)?"

# Annotation
color magenta   "@[A-Za-z]+"

color brightblue "[A-Za-z_][A-Za-z0-9_]*[[:space:]]*[()]"
color green     "\<(bool|byte|sbyte|char|decimal|double|float|IntPtr|int|uint|long|ulong|object|short|ushort|string|base|this|var|void)\>"
color cyan  "\<(alias|as|case|catch|checked|default|do|dynamic|else|finally|fixed|for|foreach|goto|if|is|lock|new|null|return|switch|throw|try|unchecked|while)\>"
color cyan  "\<(abstract|async|class|const|delegate|enum|event|explicit|extern|get|implicit|in|internal|interface|namespace|operator|out|override|params|partial|private|protected|public|readonly|ref|sealed|set|sizeof|stackalloc|static|struct|typeof|unsafe|using|value|virtual|volatile|yield)\>"
# LINQ-only keywords (ones that cannot be used outside of a LINQ query - lots others can)
color cyan  "\<(from|where|select|group|info|orderby|join|let|in|on|equals|by|ascending|descending)\>"
color brightred     "\<(break|continue)\>"
color brightcyan "\<(true|false)\>"
color red "[-+/*=<>?:!~%&|]"
color blue   "\<([0-9._]+|0x[A-Fa-f0-9_]+|0b[0-1_]+)[FL]?\>"
color yellow ""(\\.|[^"])*"|'(\\.|[^'])*'"
color magenta   "\\([btnfr]|'|\"|\\)"
color magenta   "\\u[A-Fa-f0-9]{4}"
color brightblack "(^|[[:space:]])//.*"
color brightblack start="^\s*/\*" end="\*/"
color brightwhite,cyan "TODO:?"
color ,green "[[:space:]]+$"
color ,red "	+ +| +	+"
EOF



tee /root/.nano/git.nanorc << 'EOF'
syntax "git-config" "git(config|modules)$|\.git/config$"

color brightcyan "\<(true|false)\>"
color cyan "^[[:space:]]*[^=]*="
color brightmagenta "^[[:space:]]*\[.*\]$"
color yellow ""(\\.|[^"])*"|'(\\.|[^'])*'"
color brightblack "(^|[[:space:]])#([^{].*)?$"
color ,green "[[:space:]]+$"
color ,red "	+"

# This code is free software; you can redistribute it and/or modify it under
# the terms of the new BSD License.
#
# Copyright (c) 2010, Sebastian Staudt

# A nano configuration file to enable syntax highlighting of some Git specific
# files with the GNU nano text editor (http://www.nano-editor.org)
#
syntax "git-commit" "COMMIT_EDITMSG|TAG_EDITMSG"

# Commit message
color yellow ".*"

# Comments
color brightblack "^#.*"

# Files changes
color white       "#[[:space:]](deleted|modified|new file|renamed):[[:space:]].*"
color red         "#[[:space:]]deleted:"
color green       "#[[:space:]]modified:"
color brightgreen "#[[:space:]]new file:"
color brightblue  "#[[:space:]]renamed:"

# Untracked filenames
color black "^#	[^/?*:;{}\\]+\.[^/?*:;{}\\]+$"

color brightmagenta "^#[[:space:]]Changes.*[:]"
color brightred "^#[[:space:]]Your branch and '[^']+"
color brightblack "^#[[:space:]]Your branch and '"
color brightwhite "^#[[:space:]]On branch [^ ]+"
color brightblack "^#[[:space:]]On branch"

# Recolor hash symbols

# Recolor hash symbols
color brightblack "#"

# Trailing spaces (+LINT is not ok, git uses tabs)
color ,green "[[:space:]]+$"


# This syntax format is used for interactive rebasing
syntax "git-rebase-todo" "git-rebase-todo"

# Default
color yellow ".*"

# Comments
color brightblack "^#.*"

# Rebase commands
color green       "^(e|edit) [0-9a-f]{7,40}"
color green       "^#  (e, edit)"
color brightgreen "^(f|fixup) [0-9a-f]{7,40}"
color brightgreen "^#  (f, fixup)"
color brightwhite "^(p|pick) [0-9a-f]{7,40}"
color brightwhite "^#  (p, pick)"
color blue        "^(r|reword) [0-9a-f]{7,40}"
color blue        "^#  (r, reword)"
color brightred   "^(s|squash) [0-9a-f]{7,40}"
color brightred   "^#  (s, squash)"
color yellow      "^(x|exec) [^ ]+ [0-9a-f]{7,40}"
color yellow      "^#  (x, exec)"

# Recolor hash symbols
color brightblack "#"

# Commit IDs
color brightblue "[0-9a-f]{7,40}"
EOF



tee /root/.nano/json.nanorc << 'EOF'
syntax "JSON" "\.json$"
header "^\{$"
# You can't add a comment to JSON.
comment ""

color blue   "\<[-]?[1-9][0-9]*([Ee][+-]?[0-9]+)?\>"  "\<[-]?[0](\.[0-9]+)?\>"
color cyan  "\<null\>"
color brightcyan "\<(true|false)\>"
color yellow ""(\\.|[^"])*"|'(\\.|[^'])*'"
color brightyellow "\"(\\"|[^"])*\"[[:space:]]*:"  "'(\'|[^'])*'[[:space:]]*:"
color magenta   "\\u[0-9a-fA-F]{4}|\\[bfnrt'"/\\]"
color ,green "[[:space:]]+$"
color ,red "	+ +| +	+"
EOF


tee /root/.nano/rust.nanorc << 'EOF'
# Nano configuration for Rust
# Copyright 2015 The Rust Project Developers.
#
# NOTE: Rules are applied in order: later rules re-colorize matching text.


syntax "Rust" "\.rs"
comment "//"

# function definition
color magenta "fn [a-z0-9_]+"

# Reserved words
color yellow "\<(abstract|alignof|as|become|box|break|const|continue|crate|do|else|enum|extern|false|final|fn|for|if|impl|in|let|loop|macro|match|mod|move|mut|offsetof|override|priv|pub|pure|ref|return|sizeof|static|self|struct|super|true|trait|type|typeof|unsafe|unsized|use|virtual|where|while|yield)\>"

# macros
color red "[a-z_]+!"

# Constants
color magenta "[A-Z][A-Z_]+"

# Traits/Enums/Structs/Types/etc.
color magenta "[A-Z][a-z]+"

# Strings
color green "\".*\""
color green start="\".*\\$" end=".*\""
# NOTE: This isn't accurate but matching "#{0,} for the end of the string is too liberal
color green start="r#+\"" end="\"#+"

# Comments
color blue "^\s*//.*"
color blue start="^\s*/\*" end="\*/"

# Attributes
color magenta start="#!\[" end="\]"

# Some common markers
color brightcyan "(XXX|TODO|FIXME|\?\?\?)"

## Trailing spaces
color ,green "[[:space:]]+$"
EOF



tee /root/.nano/sh.nanorc << 'EOF'
## Here is an example for Bourne shell scripts.
##
syntax "SH" "\.sh$" "\.ash" "\.bashrc" "bashrc" "\.bash_aliases" "bash_aliases" "\.bash_functions" "bash_functions" "\.bash_login" "\.bash_logout" "\.bash_profile" "bash_profile" "\.profile" "revise\..+$"
header "^#!.*/(env +)?(ba|da|a)?sh( |$)"
magic "(POSIX|Bourne-Again) shell script.*text"
comment "#"

linter dash -n

## keywords:
color green "\<(case|do|done|elif|else|esac|fi|for|function|if|in|select|then|time|until|while)\>"
color green "(\{|\}|\(|\)|\;|\]|\[|`|\\|\$|<|>|!|=|&|\|)"
color green "-[Ldefgruwx]\>"
color green "-(eq|ne|gt|lt|ge|le|s|n|z)\>"
## builtins:
color brightblue "\<(alias|bg|bind|break|builtin|caller|cd|command|compgen|complete|compopt|continue|declare|dirs|disown|echo|enable|eval|exec|exit|export|false|fc|fg|getopts|hash|help|history|jobs|kill|let|local|logout|mapfile|popd|printf|pushd|pwd|read|readarray|readonly|return|set|shift|shopt|source|suspend|test|times|trap|true|type|typeset|ulimit|umask|unalias|unset|wait)\>"
## not buitins:
## cat|chmod|chown|cp|env|grep|install|ln|make|mkdir|mv|rm|sed|tar|touch
icolor brightgreen "^\s+[0-9A-Z_]+\s+\(\)"
icolor brightred "\$\{?[0-9A-Z_!@#$*?-]+\}?"
color brightyellow ""(\\.|[^"])*"" "'(\\.|[^'])*'"
color cyan "(^|[[:space:]])#.*$"
color ,green "[[:space:]]+$"
EOF



tee /root/.nano/xml.nanorc << 'EOF'
## Here is an example for xml files.
##

syntax "XML" ".*\.([jrs]?html?|xml|sgml?|rng|vue|mei|musicxml)$"
header "<\?xml.*version=.*\?>"
magic "(XML|SGML) (sub)?document"
comment "<!--|-->"

color white "^.+$"
color green  start="<" end=">"
color cyan   "<[^> ]+"
color cyan   ">"
color yellow start="<!DOCTYPE" end="[/]?>"
color yellow start="<!--" end="-->"
color red    "&[^;]*;"

## Trailing spaces
color ,green "[[:space:]]+$"
EOF



