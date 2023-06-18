#!/bin/sh

# NNN config
export NNN_OPTS="axS"

BLK="#E0E0FF" CHR="#7F2726" DIR="#F8CA0A" EXE="#44ff88" REG="#FFFF33" HARDLINK="#2288FF" SYMLINK="#33EEFF" MISSING="#CC88FF" ORPHAN="#FF4488" FIFO="D6" SOCK="CB" OTHER="C4"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

#export NNN_OPENER="nuke"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_TRASH=0

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
