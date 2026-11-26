#install nano from the xbps repository (void)
sudo xbps-install nano

#create the backupfolder for automatic backup
mkdir -p /home/nanobackup


# here are the tee generated templates for some important filetypes (that i usually use)
tee /etc/nanorc > /dev/null << 'EOF'
#https://github.com/scopatz/nanorc/blob/master/install.sh

# ==============================================================================
# 1. CODING & YAML/PYTHON INDENTATION (CRITICAL FOR DEVOPS)
# ==============================================================================
set autoindent
set tabsize 4
# Convert tabs to spaces (prevents YAML/Python syntax errors; use Alt+P to toggle)
set tabstospaces
# Backspace deletes a full indentation level (4 spaces) at once
set smarthome
set trimblanks

# ==============================================================================
# 2. UI, LINE NUMBERS & VISUAL GUIDES
# ==============================================================================
set linenumbers
set minibar
set constantshow
# Subtle vertical guide at 80 chars for clean code/commit formatting
set guidestripe 80
# Show trailing whitespace and tabs visually (great for catching broken YAML)
set whitespace "»·"

# High-contrast colors (matching dark DevOps themes)
set titlecolor brightwhite,blue
set statuscolor brightwhite,green
set numbercolor cyan
set selectedcolor white,magenta
set stripecolor ,black

# ==============================================================================
# 3. NAVIGATION, SEARCH & MOUSE
# ==============================================================================
# Click to place cursor & scroll with mouse wheel (hold Shift to select for Kitty)
set mouse
set zap
set indicator
# Smart case-insensitive search (case-sensitive only if you type uppercase)
set casesensitive
set regexp

# ==============================================================================
# 4. BACKUPS & SAFETY
# ==============================================================================
set backup
set backupdir "/home/nanobackup"

# Remember cursor position when reopening files
set positionlog

# ==============================================================================
# 5. MODERN KEYBINDINGS (DESKTOP-STYLE + DEVOPS EXTRAS)
# ==============================================================================
bind ^C copy main
bind ^V paste main
bind ^Z undo main
bind ^Y redo main
bind ^F whereis main
bind ^S savefile main
bind ^Q exit main
# Keep Delete as normal delete (so it doesn't overwrite your Ctrl+C clipboard)
bind DEL delete main
# Comment/uncomment line or selected block with Ctrl+/
bind ^_ comment main

# ==============================================================================
# 6. SYNTAX HIGHLIGHTING (VOID LINUX SYSTEM PATHS)
# ==============================================================================
include "/usr/share/nano/*.nanorc"
include "/usr/share/nano/extra/*.nanorc"
include "~/.nano/sh.nanorc"
include "~/.nano/rust.nanorc"
include "~/.nano/json.nanorc"
include "~/.nano/xml.nanorc"
include "~/.nano/c.nanorc"
include "~/.nano/csharp.nanorc"
include "~/.nano/git.nanorc"
include "~/.nano/conf.nanorc"
include "~/.nano/css.nanorc"
include "~/.nano/lua.nanorc"
include "~/.nano/markdown.nanorc"
include "~/.nano/nanorc.nanorc"
include "~/.nano/python.nanorc"
include "~/.nano/systemd.nanorc"
include "~/.nano/xml.nanorc"
include "~/.nano/yaml.nanorc"
include "~/.nano/batch.nanorc"
include "~/.nano/dockerfile.nanorc"
include "~/.nano/ini.nanorc"
include "~/.nano/man.nanorc"
include "~/.nano/sql.nanorc"
include "~/.nano/toml.nanorc"
EOF



tee /root/.nano/toml.nanorc > /dev/null << 'EOF'
syntax "toml" "\.toml$"
comment "#"

# Booleans
color magenta "true|false"

# Numbers
color green "[+-]?[[:space:]]*[0-9]+(\.[0-9]+)?([Ee][+-]?[0-9]+)?"
color green "[0-9]+(_[0-9]+)*"

# Tables / unwrapped keys
color brightgreen "[a-zA-Z0-9_]*(\.[a-zA-Z0-9_]+)*"

# Invalid Table names
color ,red "^[[:space:]]*\[\]"
color ,red "^[[:space:]]*\[[a-zA-Z0-9_]\.\]"
color ,red "^[[:space:]]*\[.*\.\..*\]"
color ,red "^[[:space:]]*\[\..*?\]"

# Strings
color brightyellow ""(\.|[^"])*"" "'(\.|[^'])*'"
color yellow start="\"\"\"" end="\"\"\""

# Comments
color brightblue "#.*"

# Keyless value
color ,red "^[[:space:]]*=.*"

# Trailing whitespace
color ,green "[[:space:]]+$"


# MIT License

# Copyright (c) 2017 Uninteresting Account

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
EOF



tee /root/.nano/sql.nanorc > /dev/null << 'EOF'
syntax "SQL" "\.sql$" "sqliterc$"

icolor cyan "\<(ALL|ASC|AS|ALTER|AND|ADD|AUTO_INCREMENT)\>"
icolor cyan "\<(BETWEEN|BINARY|BOTH|BY|BOOLEAN)\>"
icolor cyan "\<(CHANGE|CHECK|COLUMNS|COLUMN|CROSS|CREATE)\>"
icolor cyan "\<(DATABASES|DATABASE|DATA|DELAYED|DESCRIBE|DESC|DISTINCT|DELETE|DROP|DEFAULT)\>"
icolor cyan "\<(ENCLOSED|ESCAPED|EXISTS|EXPLAIN)\>"
icolor cyan "\<(FIELDS|FIELD|FLUSH|FOR|FOREIGN|FUNCTION|FROM)\>"
icolor cyan "\<(GROUP|GRANT|HAVING)\>"
icolor cyan "\<(IGNORE|INDEX|INFILE|INSERT|INNER|INTO|IDENTIFIED|IN|IS|IF)\>"
icolor cyan "\<(JOIN|KEYS|KILL|KEY)\>"
icolor cyan "\<(LEADING|LIKE|LIMIT|LINES|LOAD|LOCAL|LOCK|LOW_PRIORITY|LEFT|LANGUAGE)\>"
icolor cyan "\<(MODIFY|NATURAL|NOT|NULL|NEXTVAL)\>"
icolor cyan "\<(OPTIMIZE|OPTION|OPTIONALLY|ORDER|OUTFILE|OR|OUTER|ON)\>"
icolor cyan "\<(PROCEDURE|PROCEDURAL|PRIMARY)\>"
icolor cyan "\<(READ|REFERENCES|REGEXP|RENAME|REPLACE|RETURN|REVOKE|RLIKE|RIGHT)\>"
icolor cyan "\<(SHOW|SONAME|STATUS|STRAIGHT_JOIN|SELECT|SETVAL|SET)\>"
icolor cyan "\<(TABLES|TERMINATED|TO|TRAILING|TRUNCATE|TABLE|TEMPORARY|TRIGGER|TRUSTED)\>"
icolor cyan "\<(UNIQUE|UNLOCK|USE|USING|UPDATE|VALUES|VARIABLES|VIEW)\>"
icolor cyan "\<(WITH|WRITE|WHERE|ZEROFILL|TYPE|XOR)\>"
color green     "\<(VARCHAR|TINYINT|TEXT|DATE|SMALLINT|MEDIUMINT|INT|INTEGER|BIGINT|FLOAT|DOUBLE|DECIMAL|DATETIME|TIMESTAMP|TIME|YEAR|UNSIGNED|CHAR|TINYBLOB|TINYTEXT|BLOB|MEDIUMBLOB|MEDIUMTEXT|LONGBLOB|LONGTEXT|ENUM|BOOL|BINARY|VARBINARY)\>"

# SQLite meta commands
icolor cyan "\.\<(databases|dump|echo|exit|explain|header(s)?|help)\>"
icolor cyan "\.\<(import|indices|mode|nullvalue|output|prompt|quit|read)\>"
icolor cyan "\.\<(schema|separator|show|tables|timeout|width)\>"
color brightcyan  "\<(ON|OFF)\>"

color blue   "\<([0-9]+)\>"
color yellow ""(\\.|[^"])*"|'(\\.|[^'])*'"
color yellow   "`(\\.|[^\\`])*`"
color brightblack  "\-\-.*$"
color ,green "[[:space:]]+$"
color ,red "	+ +| +	+"
EOF



tee /root/.nano/man.nanorc > /dev/null << 'EOF'
## Here is an example for manpages.
##
syntax "Man" "\.[1-9]x?$"
magic "troff or preprocessor input"
comment ".\""

color green "\.(S|T)H.*$"
color brightgreen "\.(S|T)H" "\.TP"
color brightred "\.(BR?|I[PR]?).*$"
color brightblue "\.(BR?|I[PR]?|PP)"
color brightwhite "\\f[BIPR]"
color yellow "\.(br|DS|RS|RE|PD)"
EOF



tee /root/.nano/ini.nanorc > /dev/null << 'EOF'
syntax "INI" "\.(ini|desktop|lfl|override|cfg)$" "(mimeapps\.list|pinforc|setup\.cfg)$" "weechat/.+\.conf$"
header "^\[[A-Za-z]+\]$"

color brightcyan "\<(true|false)\>"
color cyan "^[[:space:]]*[^=]*="
color brightmagenta "^[[:space:]]*\[.*\]$"
color red "[=;]"
color yellow ""(\\.|[^"])*"|'(\\.|[^'])*'"
color brightblue "(^|[[:space:]])(#([^{].*)?|;.*)$"
color ,green "[[:space:]]+$"
color ,red "	+ +| +	+"
EOF



tee /root/.nano/dockerfile.nanorc > /dev/null << 'EOF'
## Syntax highlighting for Dockerfiles
syntax "Dockerfile" "Dockerfile[^/]*$" "\.dockerfile$"

## Keywords
icolor red "^(FROM|RUN|CMD|LABEL|MAINTAINER|EXPOSE|ENV|ADD|COPY|ENTRYPOINT|VOLUME|USER|WORKDIR|ARG|ONBUILD|STOPSIGNAL|HEALTHCHECK|SHELL)[[:space:]]"

## Brackets & parenthesis
color brightgreen "(\(|\)|\[|\])"

## Double ampersand
color brightmagenta "&&"

## Comments
icolor cyan "^[[:space:]]*#.*$"

## Blank space at EOL
color ,green "[[:space:]]+$"

## Strings, single-quoted
color brightwhite "'([^']|(\\'))*'" "%[qw]\{[^}]*\}" "%[qw]\([^)]*\)" "%[qw]<[^>]*>" "%[qw]\[[^]]*\]" "%[qw]\$[^$]*\$" "%[qw]\^[^^]*\^" "%[qw]![^!]*!"

## Strings, double-quoted
color brightwhite ""([^"]|(\\"))*"" "%[QW]?\{[^}]*\}" "%[QW]?\([^)]*\)" "%[QW]?<[^>]*>" "%[QW]?\[[^]]*\]" "%[QW]?\$[^$]*\$" "%[QW]?\^[^^]*\^" "%[QW]?![^!]*!"

## Single and double quotes
color brightyellow "('|\")"
EOF



tee /root/.nano/batch.nanorc > /dev/null << 'EOF'
## Here is an example for Batch file shell script.
## Author: davidhcefx (https://github.com/davidhcefx), based on Mitch Bumgarner's version.
## License: MIT License

syntax "batch" "\.(bat|cmd)$"
header "^@[eE](cho|CHO) (on|off|ON|OFF)"
comment "::"

# Native commands, symbols, and comparisons.
icolor green "\<(ASSOC|CALL|CD|CLS|CMDEXTVERSION|COLOR|COPY|DATE|DEL|DIR|ECHO|ENDLOCAL|ERASE|ERRORLEVEL|EXIT|FOR|FTYPE|GOTO|IF|MD|MKLINK|MOVE|PATH|PAUSE|POPD|PROMPT|PUSHD|RD|REM|REN|SET|SETLOCAL|SHIFT|START|TIME|TITLE|TYPE|VER|VERIFY|VOL)\>"
icolor green "\<(EQU|NEQ|LSS|LEQ|GTR|GEQ|DEFINED|EXIST|NOT)\>"
color  green "[:|<>=&@\\^]"

# Options.
color brightmagenta "[[:blank:]]/[A-Za-z]+\>"

# Common commands. (with Sublime and Github highlighting as a reference)
icolor brightblue "\<(APPEND|ARP|AT|ATTRIB|AUTOFAIL|BACKUP|BCDBOOT|BCDEDIT|BITSADMIN|BREAK|CACLS|CERTREQ|CERTUTIL|CHANGE|CHCP|CHDIR|CHKDSK|CHKNTFS|CHOICE|CIPHER|CleanMgr|CLIP|CMD|CMDKEY|COMP|COMPACT|CONVERT|CSVDE|DEFRAG|DELTREE|DevCon|DIRQUOTA|DISKCOMP|DISKCOPY|DISKPART|DISKSHADOW|DNSCMD|DOSKEY|DriverQuery|DSACLs|DSAdd|DSGet|DSQuery|DSMod|DSMove|DSRM|Dsmgmt|EVENTCREATE|EXPAND|EXPLORER|EXTRACT|FC|FIND|FINDSTR|FORFILES|FORMAT|FREEDISK|FSUTIL|FTP|GETMAC|GPRESULT|GPUPDATE|GRAFTABL|HELP|HOSTNAME|iCACLS|IEXPRESS|IPCONFIG|INUSE|KEYB|LABEL|LODCTR|LOGMAN|LOGOFF|MAKECAB|MKDIR|MODE|MORE|MOUNTVOL|MSG|MSIEXEC|MSINFO32|MSTSC|NET|NETDOM|NETSH|NBTSTAT|NETSTAT|NLTEST|NSLOOKUP|NTBACKUP|NTDSUtil|OPENFILES|PATHPING|PING|POWERCFG|PRINT|PRNCNFG|PRNMNGR|Query|RASDIAL|RASPHONE|RECOVER|REG|REGEDIT|REGSVR32|REGINI|RENAME|REPLACE|Reset|RESTORE|RMDIR|ROBOCOPY|ROUTE|RUNAS|RUNDLL32|SC|SCHTASKS|SetSPN|SETX|SFC|SHUTDOWN|SORT|SSH|SUBINACL|SUBST|SYSTEMINFO|TAKEOWN|TASKLIST|TASKKILL|TELNET|TIMEOUT|TRACERT|TREE|TSDISCON|TSKILL|TypePerf|TZUTIL|VSSADMIN|W32TM|WAITFOR|WBADMIN|WECUTIL|WEVTUTIL|WHERE|WHOAMI|WINRM|WINRS|WMIC|XCACLS|XCOPY)\>"

# Variable names. (spaces not allowed)
color brightred "%([[:alpha:]`~@#$*(){}:',.?+=_-]|\[|\])([[:alnum:]`~@#$*(){}:',.?+=_-]|\[|\])*%"
color brightred "!([[:alnum:]`~@#$%*(){}:',.?+=_-]|\[|\])([[:alnum:]`~@#$%*(){}:',.?+=_-]|\[|\])*!"

# Parameter names for arguments and loop.
color brightred "%(~[[:alpha:]$]*)?[0-9*]\>" "%%(~[[:alpha:]$]*)?[[:alpha:]]\>"

# Comments.
icolor cyan "^[[:space:]]*(\<rem\>|::).*"

# Strings.
icolor brightyellow ""(\^.|[^"])*""

# Trailling whitespace
color ,green "[[:space:]]+$"
EOF



tee /root/.nano/yaml.nanorc > /dev/null << 'EOF'
syntax "yaml" "\.ya?ml$"
#comment "#"
header "^---" "%YAML"

# Values
color green "(:|^|\s)+\S+"

# Keys
color red "(^|\s+).*+\s*:(\s|$)"

# Special values
color yellow "[:-]\s+(true|false|null)\s*$"
color yellow "[:-]\s+[0-9]+\.?[0-9]*(\s*($|#))"
color yellow "(^| )!!(binary|bool|float|int|map|null|omap|seq|set|str) "

# Separator
color brightwhite "^\s+-"
color brightwhite ":(\s|\t|$)"

# Comments
color brightblue "(^|[[:space:]])#.*$"

# Trailing whitespace
color ,red "[[:space:]]+$"
EOF



tee /root/.nano/xml.nanorc > /dev/null << 'EOF'
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



tee /root/.nano/systemd.nanorc > /dev/null << 'EOF'
syntax "Systemd" "\.(service|socket|timer)$"
header "^\[Unit\]$"

color cyan  "^(Accept|After|Alias|AllowIsolate|Also|AmbientCapabilities|ANSI_COLOR|_AUDIT_LOGINUID|_AUDIT_SESSION|Backlog|Before|BindIPv6Only|BindsTo|BindToDevice|BlockIOReadBandwidth|BlockIOWeight|BlockIOWriteBandwidth|_BOOT_ID|Broadcast|BUG_REPORT_URL|BusName|Capabilities|CapabilityBoundingSet|CHASSIS|cipher|class|_CMDLINE|CODE_FILE|CODE_FUNC|CODE_LINE|_COMM|Compress|ConditionACPower|ConditionCapability|ConditionDirectoryNotEmpty|ConditionFileIsExecutable|ConditionFileNotEmpty|ConditionHost|ConditionKernelCommandLine|ConditionNull|ConditionPathExists|ConditionPathExistsGlob|ConditionPathIsDirectory|ConditionPathIsMountPoint|ConditionPathIsReadWrite|ConditionPathIsSymbolicLink|ConditionSecurity|ConditionVirtualization|Conflicts|ControlGroup|ControlGroupAttribute|ControlGroupModify|ControlGroupPersistent|controllers|Controllers|CPE_NAME|CPUAffinity|CPUSchedulingPolicy|CPUSchedulingPriority|CPUSchedulingResetOnFork|CPUShares|CrashChVT|CrashShell|__CURSOR|debug|DefaultControllers|DefaultDependencies|DefaultLimitAS|DefaultLimitCORE|DefaultLimitCPU|DefaultLimitDATA|DefaultLimitFSIZE|DefaultLimitLOCKS|DefaultLimitMEMLOCK|DefaultLimitMSGQUEUE|DefaultLimitNICE|DefaultLimitNOFILE|DefaultLimitNPROC|DefaultLimitRSS|DefaultLimitRTPRIO|DefaultLimitRTTIME|DefaultLimitSIGPENDING|DefaultLimitSTACK|DefaultStandardError|DefaultStandardOutput|Description|DeviceAllow|DeviceDeny|DirectoryMode|DirectoryNotEmpty|Documentation|DumpCore|entropy|Environment|EnvironmentFile|ERRNO|event_timeout|_EXE|ExecReload|ExecStart|ExecStartPost|ExecStartPre|ExecStop|ExecStopPost|ExecStopPre|filter|FONT|FONT_MAP|FONT_UNIMAP|ForwardToConsole|ForwardToKMsg|ForwardToSyslog|FreeBind|freq|FsckPassNo|fstab|_GID|Group|GuessMainPID|HandleHibernateKey|HandleLidSwitch|HandlePowerKey|HandleSuspendKey|hash|HibernateKeyIgnoreInhibited|HOME_URL|_HOSTNAME|ICON_NAME|ID|IdleAction|IdleActionSec|ID_LIKE|ID_MODEL|ID_MODEL_FROM_DATABASE|IgnoreOnIsolate|IgnoreOnSnapshot|IgnoreSIGPIPE|InaccessibleDirectories|InhibitDelayMaxSec|init|IOSchedulingClass|IOSchedulingPriority|IPTOS|IPTTL|JobTimeoutSec|JoinControllers|KeepAlive|KEYMAP|KEYMAP_TOGGLE|KillExcludeUsers|KillMode|KillOnlyUsers|KillSignal|KillUserProcesses|LidSwitchIgnoreInhibited|LimitAS|LimitCORE|LimitCPU|LimitDATA|LimitFSIZE|LimitLOCKS|LimitMEMLOCK|LimitMSGQUEUE|LimitNICE|LimitNOFILE|LimitNPROC|LimitRSS|LimitRTPRIO|LimitRTTIME|LimitSIGPENDING|LimitSTACK|link_priority|valueListenDatagram|ListenFIFO|ListenMessageQueue|ListenNetlink|ListenSequentialPacket|ListenSpecial|ListenStream|LogColor|LogLevel|LogLocation|LogTarget|luks|_MACHINE_ID|MakeDirectory|Mark|MaxConnections|MaxFileSec|MaxLevelConsole|MaxLevelKMsg|MaxLevelStore|MaxLevelSyslog|MaxRetentionSec|MemoryLimit|MemorySoftLimit|MESSAGE|MESSAGE_ID|MessageQueueMaxMessages|MessageQueueMessageSize|__MONOTONIC_TIMESTAMP|MountFlags|NAME|NAutoVTs|Nice|NonBlocking|NoNewPrivileges|NotifyAccess|OnActiveSec|OnBootSec|OnCalendar|OnFailure|OnFailureIsolate|OnStartupSec|OnUnitActiveSec|OnUnitInactiveSec|OOMScoreAdjust|Options|output|PAMName|PartOf|PassCredentials|PassSecurity|PathChanged|PathExists|PathExistsGlob|PathModified|PermissionsStartOnly|_PID|PIDFile|PipeSize|PowerKeyIgnoreInhibited|PRETTY_HOSTNAME|PRETTY_NAME|Priority|PRIORITY|PrivateDevices|PrivateNetwork|PrivateTmp|PropagatesReloadTo|ProtectControlGroups|ProtectHome|ProtectKernelModules|ProtectKernelTunables|ProtectSystem|pss|RateLimitBurst|RateLimitInterval|ReadOnlyDirectories|ReadWriteDirectories|__REALTIME_TIMESTAMP|ReceiveBuffer|RefuseManualStart|RefuseManualStop|rel|ReloadPropagatedFrom|RemainAfterExit|RestrictAddressFamilies|RestrictNamespaces|RestrictRealtime|RequiredBy|Requires|RequiresMountsFor|RequiresOverridable|Requisite|RequisiteOverridable|ReserveVT|ResetControllers|Restart|RestartPreventExitStatus|RestartSec|RootDirectory|RootDirectoryStartOnly|RuntimeKeepFree|RuntimeMaxFileSize|RuntimeMaxUse|RuntimeWatchdogSec|samples|scale_x|scale_y|Seal|SecureBits|_SELINUX_CONTEXT|SendBuffer|SendSIGKILL|Service|ShowStatus|ShutdownWatchdogSec|size|SmackLabel|SmackLabelIPIn|SmackLabelIPOut|SocketMode|Sockets|SourcePath|_SOURCE_REALTIME_TIMESTAMP|SplitMode|StandardError|StandardInput|StandardOutput|StartLimitAction|StartLimitBurst|StartLimitInterval|static_node|StopWhenUnneeded|Storage|string_escape|none|replaceSuccessExitStatus|SupplementaryGroups|SUPPORT_URL|SuspendKeyIgnoreInhibited|SyslogFacility|SYSLOG_FACILITY|SyslogIdentifier|SYSLOG_IDENTIFIER|SyslogLevel|SyslogLevelPrefix|SYSLOG_PID|SystemCallArchitectures|SystemCallFilter|SYSTEMD_ALIAS|_SYSTEMD_CGROUP|_SYSTEMD_OWNER_UID|SYSTEMD_READY|_SYSTEMD_SESSION|_SYSTEMD_UNIT|_SYSTEMD_USER_UNIT|SYSTEMD_WANTS|SystemKeepFree|SystemMaxFileSize|SystemMaxUse|SysVStartPriority|TCPCongestion|TCPWrapName|timeout|TimeoutSec|TimeoutStartSec|TimeoutStopSec|TimerSlackNSec|Transparent|_TRANSPORT|tries|TTYPath|TTYReset|TTYVHangup|TTYVTDisallocate|Type|_UID|UMask|Unit|User|UtmpIdentifier|VERSION|VERSION_ID|WantedBy|Wants|WatchdogSec|What|Where|WorkingDirectory)="
color green "^\.include\>"
color red "="
color brightmagenta  "^\[(Unit|Install|Service|Socket)\]"
color brightyellow "\$MAINPID"
color brightcyan "\<(true|false)\>"
color brightblue "(^|[[:space:]])#([^{].*)?$"
color ,green "[[:space:]]+$"
color ,red "	+ +| +	+"
EOF



tee /root/.nano/python.nanorc > /dev/null << 'EOF'
## Python syntax highlighting rules for Nano

syntax "python" "\.py$"
header "^#!.*/(env +)?python[-0-9._]*( |$)"
magic "Python script"
comment "#"

linter pyflakes

## built-in objects
color cyan "\<(None|self|True|False)\>"
## built-in attributes
color cyan "\<(__builtin__|__dict__|__methods__|__members__|__class__|__bases__|__import__|__name__|__doc__|__self__|__debug__)\>"
## built-in functions
color cyan "\<(abs|append|apply|buffer|callable|chr|clear|close|closed|cmp|coerce|compile|complex|conjugate|copy|count|delattr|dir|divmod|eval|execfile|exec|extend|fileno|filter|float|flush|get|getattr|globals|has_key|hasattr|hash|hex|id|index|input|insert|int|intern|isatty|isinstance|issubclass|items|keys|len|list|locals|long|map|max|min|mode|name|oct|open|ord|pop|pow|print|range|raw_input|read|readline|readlines|reduce|reload|remove|repr|reverse|round|seek|setattr|slice|softspace|sort|str|tell|truncate|tuple|type|unichr|unicode|update|values|vars|write|writelines|xrange|zip|bool)\>"
## built-in functions that were previously keywords
color brightblue "\<(print|exec)\>([[:space:]]|$)"
## special method names
color cyan "\<(__abs__|__add__|__and__|__call__|__cmp__|__coerce__|__complex__|__concat__|__contains__|__del__|__delattr__|__delitem__|__delslice__|__div__|__divmod__|__float__|__getattr__|__getitem__|__getslice__|__hash__|__hex__|__init__|__int__|__inv__|__invert__|__len__|__long__|__lshift__|__mod__|__mul__|__neg__|__nonzero__|__oct__|__or__|__pos__|__pow__|__radd__|__rand__|__rcmp__|__rdiv__|__rdivmod__|__repeat__|__repr__|__rlshift__|__rmod__|__rmul__|__ror__|__rpow__|__rrshift__|__rshift__|__rsub__|__rxor__|__setattr__|__setitem__|__setslice__|__str__|__sub__|__xor__|__bool__)\>"
## exception classes
color cyan "\<(Exception|StandardError|ArithmeticError|LookupError|EnvironmentError|AssertionError|AttributeError|EOFError|FloatingPointError|IOError|ImportError|IndexError|KeyError|KeyboardInterrupt|MemoryError|NameError|NotImplementedError|OSError|OverflowError|RuntimeError|SyntaxError|SystemError|SystemExit|TypeError|UnboundLocalError|UnicodeError|ValueError|WindowsError|ZeroDivisionError)\>"
## types
color brightcyan "\<(NoneType|TypeType|IntType|LongType|FloatType|ComplexType|StringType|UnicodeType|BufferType|TupleType|ListType|DictType|FunctionType|LambdaType|CodeType|ClassType|UnboundMethodType|InstanceType|MethodType|BuiltinFunctionType|BuiltinMethodType|ModuleType|FileType|XRangeType|TracebackType|FrameType|SliceType|EllipsisType)\>"
## definitions
color brightcyan "def [a-zA-Z_0-9]+" 
## keywords
color brightblue "\<(and|as|assert|async|await|break|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|map|not|or|pass|raise|return|try|with|while|yield)\>"

## decorators
color brightgreen "@.*[(]"

## operators
color magenta "[.:;,+*|=!\%@]" "<" ">" "/" "-" "&"

## parentheses
color magenta "[(){}]" "\[" "\]"

## numbers
icolor brightyellow "\b(([1-9][0-9]+)|0+)\.[0-9]+j?\b" "\b([1-9][0-9]*[Lj]?)\b" "\b0o?[0-7]*L?\b" "\b0x[1-9a-f][0-9a-f]*L?\b" "\b0b[01]+\b"


## strings
color yellow "['][^']*[^\\][']" "[']{3}.*[^\\][']{3}"
color yellow "["][^"]*[^\\]["]" "["]{3}.*[^\\]["]{3}"

## comments
color green "^#.*|[[:space:]]#.*$"

## block comments
color yellow start=""""[^"]" end=""""" start="'''[^']" end="'''"

## trailing spaces
color ,green "[[:space:]]+$"

## reminders
color brightwhite,yellow "(FIXME|TODO|XXX)"
EOF



tee /root/.nano/nanorc.nanorc > /dev/null << 'EOF'
## Here is an example for nanorc files.
##
syntax "Nanorc" "\.?nanorc$"
comment "#"

## Possible errors and parameters
icolor brightred "^[[:space:]]*((un)?set|include|syntax|i?color).*$"
## Colors
icolor black " black"
icolor red " red"
icolor green " green"
icolor yellow " yellow"
icolor blue " blue"
icolor magenta " magenta"
icolor cyan " cyan"
icolor white " white"
icolor normal " normal"
icolor brightblack " brightblack"
icolor brightred " brightred"
icolor brightgreen " brightgreen"
icolor brightyellow " brightyellow"
icolor brightblue " brightblue"
icolor brightmagenta " brightmagenta"
icolor brightcyan " brightcyan"
icolor brightwhite " brightwhite"
icolor brightnormal " brightnormal"
icolor ,black ",black "
icolor ,red ",red "
icolor ,green ",green "
icolor ,yellow ",yellow "
icolor ,blue ",blue "
icolor ,magenta ",magenta "
icolor ,cyan ",cyan "
icolor ,white ",white "
icolor ,normal ",normal"
icolor magenta "^[[:space:]]*i?color\>" "\<(start|end)="
icolor yellow "^[[:space:]]*(set|unset)[[:space:]]+(errorcolor|functioncolor|keycolor|numbercolor|selectedcolor|statuscolor|stripecolor|titlecolor)[[:space:]]+(bright)?(white|black|red|blue|green|yellow|magenta|cyan|normal)?(,(white|black|red|blue|green|yellow|magenta|cyan|normal))?\>"

## Keywords
icolor brightgreen "^[[:space:]]*(set|unset)[[:space:]]+(afterends|allow_insecure_backup|atblanks|autoindent|backup|backupdir|boldtext|brackets|breaklonglines|casesensitive|constantshow|cutfromcursor|emptyline|errorcolor|fill|functioncolor|guidestripe|historylog|jumpyscrolling|keycolor|linenumbers|locking|matchbrackets|morespace|mouse|multibuffer|noconvert|nohelp|nonewlines|nopauses|nowrap|numbercolor|operatingdir|positionlog|preserve|punct|quickblank|quotestr|rawsequences|rebinddelete|regexp|selectedcolor|showcursor|smarthome|smooth|softwrap|speller|statuscolor|stripecolor|suspend|tabsize|tabstospaces|tempfile|titlecolor|trimblanks|unix|view|whitespace|wordbounds|wordchars|zap)\>"
icolor green "^[[:space:]]*(bind|set|unset|syntax|header|include|magic)\>"
## Strings
icolor white ""(\\.|[^"])*""
## Comments
icolor brightblue "^[[:space:]]*#.*$"
icolor cyan "^[[:space:]]*##.*$"

## Trailing whitespace
icolor ,green "[[:space:]]+$"
EOF



tee /root/.nano/markdown.nanorc > /dev/null << 'EOF'
syntax "Markdown" "\.(md|mkd|mkdn|markdown)$"

# Tables (Github extension)
color cyan ".*[ :]\|[ :].*"

# quotes
color brightblack  start="^>" end="^$"
color brightblack  "^>.*"

# Emphasis
color green "(^|[[:space:]])(_[^ ][^_]*_|\*[^ ][^*]*\*)"

# Strong emphasis
color brightgreen "(^|[[:space:]])(__[^ ][^_]*__|\*\*[^ ][^*]*\*\*)"

# strike-through
color red "(^|[[:space:]])~~[^ ][^~]*~~"

# horizontal rules
color brightmagenta "^(---+|===+|___+|\*\*\*+)\s*$"

# headlines
color brightmagenta  "^#{1,6}.*"

# lists
color blue   "^[[:space:]]*[\*+-] |^[[:space:]]*[0-9]+\. "

# leading whitespace
color black    "^[[:space:]]+"

# misc
color magenta   "\(([CcRr]|[Tt][Mm])\)" "\.{3}" "(^|[[:space:]])\-\-($|[[:space:]])"

# links
color brightblue "\[[^]]+\]"
color brightblue "\[([^][]|\[[^]]*\])*\]\([^)]+\)"

# images
color magenta "!\[[^][]*\](\([^)]+\)|\[[^]]+\])"

# urls
color brightyellow "https?://[^ )>]+"

# code
color yellow   "`[^`]*`|^ {4}[^-+*].*"
# code blocks
color yellow start="^```[^$]" end="^```$"
color yellow "^```$"

## Trailing spaces
color ,green "[[:space:]]+$"
EOF



tee /root/.nano/lua.nanorc > /dev/null << 'EOF'
##############################################################################
#
# Lua syntax highlighting for Nano.
#
# Author:  Matthew Wild <mwild1 (at) gmail.com>
# License: GPL 2  or later
#
# Version: 2007-06-06
#
# Notes: Originally based on Ruby syntax rc by Josef 'Jupp' Schugt
##############################################################################


# Automatically use for '.lua' files
syntax "Lua" ".*\.lua$"
magic "Lua script"
comment "--"

linter luacheck --no-color

# General
color brightwhite ".+"

# Operators
color brightyellow ":|\*\*|\*|/|%|\+|-|\^|>|>=|<|<=|~=|=|\.\.|\<(not|and|or)\>"

# Statements
color brightblue "\<(do|end|while|repeat|until|if|elseif|then|else|for|in|function|local|return)\>"

# Keywords
color brightyellow "\<(debug|string|math|table|io|coroutine|os|utf8|bit32)\>\."
color brightyellow "\<(_ENV|_G|_VERSION|assert|collectgarbage|dofile|error|getfenv|getmetatable|ipairs|load|loadfile|module|next|pairs|pcall|print|rawequal|rawget|rawlen|rawset|require|select|setfenv|setmetatable|tonumber|tostring|type|unpack|xpcall)\s*\("

# Standard library
color brightyellow "io\.\<(close|flush|input|lines|open|output|popen|read|tmpfile|type|write)\>"
color brightyellow "math\.\<(abs|acos|asin|atan2|atan|ceil|cosh|cos|deg|exp|floor|fmod|frexp|huge|ldexp|log10|log|max|maxinteger|min|mininteger|modf|pi|pow|rad|random|randomseed|sinh|sqrt|tan|tointeger|type|ult)\>"
color brightyellow "os\.\<(clock|date|difftime|execute|exit|getenv|remove|rename|setlocale|time|tmpname)\>"
color brightyellow "package\.\<(config|cpath|loaded|loadlib|path|preload|seeall|searchers|searchpath)\>"
color brightyellow "string\.\<(byte|char|dump|find|format|gmatch|gsub|len|lower|match|pack|packsize|rep|reverse|sub|unpack|upper)\>"
color brightyellow "table\.\<(concat|insert|maxn|move|pack|remove|sort|unpack)\>"
color brightyellow "utf8\.\<(char|charpattern|codes|codepoint|len|offset)\>"
color brightyellow "coroutine\.\<(create|isyieldable|resume|running|status|wrap|yield)\>"
color brightyellow "debug\.\<(debug|getfenv|gethook|getinfo|getlocal|getmetatable|getregistry|getupvalue|getuservalue|setfenv|sethook|setlocal|setmetatable|setupvalue|setuservalue|traceback|upvalueid|upvaluejoin)\>"
color brightyellow "bit32\.\<(arshift|band|bnot|bor|btest|bxor|extract|replace|lrotate|lshift|rrotate|rshift)\>"

# File handle methods
color brightyellow "\:\<(close|flush|lines|read|seek|setvbuf|write)\>"

# false, nil, true
color brightmagenta "\<(false|nil|true)\>"

# External files
color brightgreen "(\<(dofile|require|include)|%q|%!|%Q|%r|%x)\>"

# Numbers
color red "\<([0-9]+)\>"

# Symbols
color brightmagenta "(\(|\)|\[|\]|\{|\})"

# Strings
color red "\"(\\.|[^\\\"])*\"|'(\\.|[^\\'])*'"

# Multiline strings
color red start="\s*\[\[" end="\]\]"

# Escapes
color red "\\[0-7][0-7][0-7]|\\x[0-9a-fA-F][0-9a-fA-F]|\\[abefnrs]|(\\c|\\C-|\\M-|\\M-\\C-)."

# Shebang
color brightcyan "^#!.*"

# Simple comments
color green "\-\-.*$"

# Multiline comments
color green start="\s*\-\-\s*\[\[" end="\]\]"

# Trailing whitespaces
color ,green "[[:space:]]+$"
EOF



tee /root/.nano/css.nanorc > /dev/null << 'EOF'
## Here is an example for css files.
##

syntax "CSS" "\.(css|scss|less)$"
color brightred     "."
color brightyellow  start="\{" end="\}"
color brightwhite   start=":" end="[;^\{]"
color brightblue    ":active|:focus|:hover|:link|:visited|:link|:after|:before|$"
color brightblue    start="\/\*" end="\*\/"
color green         ";|:|\{|\}"

## Trailing spaces
color ,green "[[:space:]]+$"
EOF



tee /root/.nano/conf.nanorc > /dev/null << 'EOF'
## Here is an example for nanorc files.
##
syntax "Conf" "\.c[o]?nf$"
## Possible errors and parameters
## Strings
icolor white ""(\\.|[^"])*""
## Comments
icolor brightblue "^[[:space:]]*#.*$"
icolor cyan "^[[:space:]]*##.*$"
## Trailing spaces
color ,green "[[:space:]]+$"
EOF



tee /root/.nano/c.nanorc > /dev/null << 'EOF'
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



tee /root/.nano/csharp.nanorc > /dev/null << 'EOF'
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



tee /root/.nano/git.nanorc > /dev/null << 'EOF'
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



tee /root/.nano/json.nanorc > /dev/null << 'EOF'
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


tee /root/.nano/rust.nanorc > /dev/null << 'EOF'
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



tee /root/.nano/sh.nanorc > /dev/null << 'EOF'
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



tee /root/.nano/xml.nanorc > /dev/null << 'EOF'
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



cp -R /root/.nano/ ~/
