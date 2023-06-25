#!/usr/bin/env sh

# NNN config
export NNN_OPTS="EUiQ"

export NNN_COLORS="#DCDCDC;3333"
BLK="3E" CHR="A7" DIR="D6" EXE="A7" REG="DC" HARDLINK="3E" SYMLINK="FF" MISSING="A0" ORPHAN="A0" FIFO="68" SOCK="3E" OTHER="DC"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

#export NNN_OPENER="nuke"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_TRASH=0
#export NNN_TMPFILE="/tmp/.lastd" #cd on quit
export NNN_LOCKER='neo -sac yellow --charset=braille -S6 -G5 -b2' 

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

n () {
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}
