#!/usr/bin/env sh

# NNN config
export NNN_OPTS="EUiSQ"

export NNN_COLORS="#E2E2E2E2;3333"
BLK="3E" CHR="A7" DIR="DC" EXE="E2" REG="FF" HARDLINK="3E" SYMLINK="2D" MISSING="A0" ORPHAN="A0" FIFO="E3" SOCK="3E" OTHER="FF"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

#export NNN_OPENER="nuke"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_TRASH=0
export NNN_TMPFILE="/tmp/.lastd" #cd on quit
export NNN_LOCKER="cmatrix" #cd on quit

export LC_COLLATE="C" # hidden files on top

# Plugins
NNN_PLUG="d:dragdrop;"
NNN_PLUG+="n:bulknew;"
NNN_PLUG+="f:fzcd;"
NNN_PLUG+="u:getplugs;"
NNN_PLUG+="e:suedit;"
NNN_PLUG+="v:rsynccp;"
NNN_PLUG+="p:preview-tui;"
#NNN_PLUG+="p:preview-tabbed;"
export NNN_PLUG

# Bookmarks
NNN_BMS="h:~/;"
NNN_BMS+="d:~/Downloads;"
NNN_BMS+="w:~/workshop;"
NNN_BMS+="g:~/.config;"
NNN_BMS+="s:/run/media/$USER/Storage;"
NNN_BMS+="a:/run/media/$USER/Storage/shows;"
NNN_BMS+="c:/run/media/$USER/Storage/codes;"
NNN_BMS+="p:/run/media/$USER/Storage/ccc;"
NNN_BMS+="m:/run/media/$USER/Storage/multimedia;"
export NNN_BMS
