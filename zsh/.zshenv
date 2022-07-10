#!/bin/sh

# ZSH
## Plugins
plugins=(git pip vi-mode extract)

# Vim
eval spaceship_vi_mode_enable

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

