#!/bin/bash

# Neovim Setup
alias vim='nvim'
alias vimdiff='nvim -d'

# Add an "alert" alias for long running commands.
# Example $ sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Reload/Edit Profile
alias sauce="source ~/.bash_profile"
alias profile="vim ~/.bash_profile"
alias vimrc="vim ~/.vimrc"

# Navigation
alias ls='lsd'
alias l='lsd -alh'
alias lt='l -t | less'
alias ll='lsd -alF'
alias la='ls -A'
alias l='ls -CF'
# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Clipboard
# Uncomment on Linux
# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'

alias cwd="pwd | pbcopy" # OS X only

# Network
alias wifipass="security find-generic-password -g -D \"AirPort network password\" -a"
alias wifipow="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s"
alias serve="python -m SimpleHTTPServer 5000"

# Security
alias randpw="openssl rand -base64 12"

# clean swp files
alias cleanswap='rm -rf /var/tmp/*.swp'

# Silver searcher
alias ag='ag --color-path=1 --path-to-ignore ~/.agignore'

# delete all pyc
alias rmpyc="find . -name \"*.pyc\" -exec rm -rf {} \;"

# Generate CTags
alias gentags="ctags -R --exclude=.git ."

# Check outline cert
alias outlinecert="echo | openssl s_client -connect outline.com:443 2>/dev/null | openssl x509 -noout -dates"
