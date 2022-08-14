#! bin/bash

#dateformat='+%G-%m-%d %H:%M'
weekday=$(date "+%u" -d "$h1 today")
dotrep=$("-C ~/.dotfiles/")

echo $weekday

if [[ $weekday == 7 ]];
then
    echo "update"
    git $dotrep add .
    git $dotrep status
    git $dotrep commit -m "Scheduled Update"
    pacman -Syu
fi

#exit 0
