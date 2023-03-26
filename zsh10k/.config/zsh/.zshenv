# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.
#
# Do not modify this file unless you know exactly what you are doing.
# It is strongly recommended to keep all shell customization and configuration
# (including exported environment variables such as PATH) in ~/.zshrc or in
# files sourced from ~/.zshrc. If you are certain that you must export some
# environment variables in ~/.zshenv, do it where indicated by comments below.

#My Functions
animeupdate() {
    devour mpv -fs "$@" && \

    if [[ $(basename "$PWD") == "shows" ]]; then
        title=$(echo $@ | sed "s/ (.*$//" | sed "s/^\[.*\] //" | sed 's/\<0//g' | sed "s/ S\([0-9]\) -/ \1 -/")
        anime=$(echo $title | awk -F "-" '{NF--; print}' | sed 's/-//g' | sed 's/[ \t]*$//g')
        ep=$(echo $title | awk -F "-" '{print $NF}' | sed 's/ //g')
        animelist $anime $ep
    fi

}

cdrec() {
    cd "$@" && \

    listall=$(ls -1A) && \
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
    cdrec "$@" && ls -a --color=auto
}
#End My Functions

if [ -n "${ZSH_VERSION-}" ]; then
  # If you are certain that you must export some environment variables
  # in ~/.zshenv (see comments at the top!), do it here:
  #
  #   export GOPATH=$HOME/go
  #
  # Do not change anything else in this file.

  : ${ZDOTDIR:=~}
  setopt no_global_rcs
  [[ -o no_interactive && -z "${Z4H_BOOTSTRAPPING-}" ]] && return
  setopt no_rcs
  unset Z4H_BOOTSTRAPPING
fi

Z4H_URL="https://raw.githubusercontent.com/romkatv/zsh4humans/v5"
: "${Z4H:=${XDG_CACHE_HOME:-$HOME/.cache}/zsh4humans/v5}"

umask o-w

if [ ! -e "$Z4H"/z4h.zsh ]; then
  mkdir -p -- "$Z4H" || return
  >&2 printf '\033[33mz4h\033[0m: fetching \033[4mz4h.zsh\033[0m\n'
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL -- "$Z4H_URL"/z4h.zsh >"$Z4H"/z4h.zsh.$$ || return
  elif command -v wget >/dev/null 2>&1; then
    wget -O-   -- "$Z4H_URL"/z4h.zsh >"$Z4H"/z4h.zsh.$$ || return
  else
    >&2 printf '\033[33mz4h\033[0m: please install \033[32mcurl\033[0m or \033[32mwget\033[0m\n'
    return 1
  fi
  mv -- "$Z4H"/z4h.zsh.$$ "$Z4H"/z4h.zsh || return
fi

. "$Z4H"/z4h.zsh || return

setopt rcs

