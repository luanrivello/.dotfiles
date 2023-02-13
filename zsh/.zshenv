#!/bin/sh

ZDOTDIR=$HOME/.config/zsh
. $ZDOTDIR/.zshenv

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave"
export IMAGE="sxiv -f"
export VIDEO="mpv -f"
#export PAGER="less -SR"
export PAGER="most -s"
#export MANPAGER="nvimpager"
export MANPAGER="most -s"

# ZSH
#source ~/.aliases

## Plugins
#plugins=(git pip vi-mode extract)

# Vim
set -o vi
# eval spaceship_vi_mode_enable

## Theme
ZSH_THEME="spaceship"

### spaceship config
SPACESHIP_EXEC_TIME_PREFIX='('
SPACESHIP_EXEC_TIME_SUFFIX=')'
SPACESHIP_EXEC_TIME_ELAPSED=0
SPACESHIP_VI_MODE_PREFIX=' '
SPACESHIP_VI_MODE_INSERT='\033[32m⫸'
SPACESHIP_VI_MODE_NORMAL='\033[32m⪢'
SPACESHIP_VI_MODE_VISUAL='\033[32m⅀'
SPACESHIP_VI_MODE_REPLACE_ONE='\033[31m⨝'
SPACESHIP_VI_MODE_PREFIX='\033[0m'

SPACESHIP_PROMPT_ORDER=(
    user
    dir
    host
    git
    package
    node
    docker
    ruby
    golang
    php
    rust
    haskell
    julia
    aws
    conda
    pyenv
    exec_time
    line_sep
    jobs
    vi_mode
)

## fontpreview config
export FONTPREVIEW_SEARCH_PROMPT="> "
export FONTPREVIEW_SIZE=532x365
export FONTPREVIEW_POSITION="+100+100"
export FONTPREVIEW_FONT_SIZE=38
export FONTPREVIEW_BG_COLOR="#000000"
export FONTPREVIEW_FG_COLOR="#FFFFFF"
export FONTPREVIEW_PREVIEW_TEXT="ABCDEFGHIJKLM\nNOPQRSTUVWXYZ\nabcdefghijklm\nnopqrstuvwxyz\n1234567890\n!@$\%(){}[]"

## NNN config
#BLK="12" CHR="12" DIR="1A" EXE="2D" REG="93" HARDLINK="A2" SYMLINK="87" MISSING="3F" ORPHAN="A0" FIFO="D6" SOCK="CB" OTHER="C4"
#export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
#export NNN_COLORS="#38383838;5555"
#export NNN_FIFO="/tmp/nnn.fifo"
#export NNN_TRASH=0
#export LC_COLLATE="C" # hidden files on top
#
#NNN_PLUG="d:dragdrop;"
#NNN_PLUG+="n:bulknew;"
#NNN_PLUG+="f:fzcd;"
#NNN_PLUG+="u:getplugs;"
#NNN_PLUG+="e:suedit;"
#NNN_PLUG+="v:rsynccp;"
#NNN_PLUG+="p:preview-tui;"
##NNN_PLUG+="p:preview-tabbed;"
#export NNN_PLUG
#
#NNN_BMS="h:/home/thermal;"
#NNN_BMS+="d:~/Downloads;"
#NNN_BMS+="w:~/workshop;"
#NNN_BMS+="g:~/.config;"
#NNN_BMS+="s:/run/media/thermal/Storage;"
#NNN_BMS+="a:/run/media/thermal/Storage/shows;"
#NNN_BMS+="c:/run/media/thermal/Storage/codes;"
#NNN_BMS+="p:/run/media/thermal/Storage/ccc;"
#NNN_BMS+="m:/run/media/thermal/Storage/multimedia;"
#export NNN_BMS

# n () # to cd on quit {
#     if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
#         echo "nnn is already running"
#         return
#     fi
#     export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
#     nnn "$@"
#     if [ -f "$NNN_TMPFILE" ]; then
#             . "$NNN_TMPFILE"
#             rm -f "$NNN_TMPFILE" > /dev/null
#     fi
# }
