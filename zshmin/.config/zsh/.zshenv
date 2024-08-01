# Autocomplete Hidden
setopt globdots

#My Functions
animeupdate() {
    mpv -fs "$@" && \

    if [[ $(basename "$PWD") == "shows" ]]; then
        #title=$(echo $@ | sed "s/ (.*$//" | sed "s/^\[.*\] //" | sed 's/\<0//g' | sed "s/ S\([0-9]\) -/ \1 -/")
        #anime=$(echo $title | awk -F "-" '{NF--; print}' | sed 's/-//g' | sed 's/[ \t]*$//g')
        #anime=$(echo $@                             |
        #        tr -d "'"                                   |
        #        sed 's/.mkv//g'                             |
        #        sed 's/([^)]*)//g'                          |
        #        sed 's/\[[^]]*\]//g'                        |
        #        sed 's/^[[:space:]]*//;s/[[:space:]]\+/ /g' |
        #        sed 's/\( [0-9]\+[0-9] \).*/\1/'
        #)
        ##ep=$(echo $title | awk -F "-" '{print $NF}' | sed 's/ //g')        
        #ep=${anime: -2}                                   # Konosuba - |02|
        #animelist $anime $ep

        write-local-anilist $@
        #write-online-anilist $@
    fi

}

cdrec() {
    cd "$@" && \

    listall=$(command ls -1A) && \
    firstitem=$(echo $listall | sed -n 1p) && \

    # if there is nothing inside or if you are trying to go back the directories then dont run
    if [[ -z $firstitem ]] || [[ $(echo "$@" | cut -c1-2) == ".." ]]; then
        return
    # else if there is only 1 item and its a directory then cd and run again
    elif [[ $(echo $listall | wc -l) == 1 && $(file -b $firstitem) == "directory" ]]; then
        cdrec $firstitem
    fi
}

cdls() {
    if [ -z "$@" ]; then
        cd
    elif [ -f "$@" ]; then
        nvim "$@" 
    else
      cdrec "$@" && exa --icons --group-directories-first -x
    fi
}
#End My Functions

