#!/bin/usr/env sh

CONFIG=$HOME/.config
ZDOTDIR=$CONFIG/zsh
HISTFILE=$CONFIG/zsh/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Plugin Zap
#zap update && zap clean
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh" \
|| zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)

# source
#plug "zap-zsh/fzf"
plug "spaceship-prompt/spaceship-prompt"
plug "spaceship-prompt/spaceship-vi-mode"
plug "$CONFIG/zsh/spaceship.zsh"

plug "zap-zsh/vim"
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "jeffreytse/zsh-vi-mode"

plug "$CONFIG/zsh/.zshenv"
plug "$HOME/.enviroment"
plug "$HOME/.aliases"
plug "$CONFIG/nnn/nnn.sh"

# keybinds
#bindkey '^ ' autosuggest-accept

#Completion
# load + start compinit
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Shell startup
[ $SHLVL -eq 1 ] && fastfetch
