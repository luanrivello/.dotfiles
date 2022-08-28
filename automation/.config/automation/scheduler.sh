#! /usr/bin/env bash

#dateformat='+%G-%m-%d %H:%M'
weekday=$(date "+%u" -d "$h1 today")
dotrep=$("-C ~/.dotfiles/")

echo $weekday

if [[ $weekday == 7 ]];
then
    echo "update"

    # Dotfiles Update
    git $dotrep add .
    git $dotrep status
    git $dotrep commit -m "Scheduled Update"
    git $dotrep push origin main

    # ZSH update
    z4h update

    pacman -Syu
fi

#exit 0
