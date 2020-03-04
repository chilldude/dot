export TERM=xterm-256color

# get directory this script is in
SOURCE=${(%):-%N}
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
ZDOT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# default editor
export EDITOR=nvim

# source aliases
source ~/.bash_aliases

# up arrow readline completion
echo '# arrow up
"\e[A":history-search-backward
## arrow down
"\e[B":history-search-forward' > ~/.inputrc

# antigen
source $ZDOT_DIR/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle sudo
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found

antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship
antigen apply

##############
# GPG CONFIG #
##############
GPG_TTY=$(tty)
export GPG_TTY

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# NVM
export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
alias loadnvm=". $NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/openssl/bin:$PATH"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# GOLAND
alias goland='/usr/local/bin/goland'

# DIRENV
eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tonychen/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tonychen/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tonychen/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tonychen/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="$(python -m site --user-base)/bin:${PATH}"

# Android
export PATH=/Users/tkc/Library/Android/sdk/platform-tools:$PATH
export PATH=/Users/tkc/Library/Android/sdk/tools:$PATH
