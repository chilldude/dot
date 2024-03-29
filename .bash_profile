#!/bin/bash

##################
# General Config #
##################

# fasd init
eval "$(fasd --init auto)"

# Default Editor
export EDITOR=nvim

# Arrow completion
echo '# arrow up
"\e[A":history-search-backward
## arrow down
"\e[B":history-search-forward' > ~/.inputrc

# Shell Color
export CLICOLOR=1

# See bash(1) for more options
HISTCONTROL=ignoreboth

# History
# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=10000
HISTFILESIZE=20000

# User configuration
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Extracting files
extract () {
  if [ -f $1 ] ; then
      case $1 in
   *.tar.bz2)  tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
   *.tar.gz)   tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
   *.tar.xz)   tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
   *.bz2)      bunzip2 $1 && cd $(basename "$1" /bz2) ;;
   *.rar)      unrar x $1 && cd $(basename "$1" .rar) ;;
   *.gz)       gunzip $1 && cd $(basename "$1" .gz) ;;
   *.tar)      tar xvf $1 && cd $(basename "$1" .tar) ;;
   *.tbz2)     tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
   *.tgz)      tar xvzf $1 && cd $(basename "$1" .tgz) ;;
   *.zip)      unzip $1 && cd $(basename "$1" .zip) ;;
   *.Z)        uncompress $1 && cd $(basename "$1" .Z) ;;
   *.7z)       7z x $1 && cd $(basename "$1" .7z) ;;
   *)      echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# Copy to clipboard
function pb() {
    echo "$@" | pbcopy
}

###########
# ALIASES #
###########

if [ -f ~/.aliases ]; then
    . ~/.bash_aliases
fi

#######
# AWS #
#######
source ~/.awscred

######
# PM #
######
source ~/.pm_shortcuts

##############
# GPG CONFIG #
##############
GPG_TTY=$(tty)
export GPG_TTY

# TODO
# Ripgrep

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
