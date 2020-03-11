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
# eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tonychen/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tonychen/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tonychen/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tonychen/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="$(python -m site --user-base)/bin:${PATH}"

###########
# Android #
###########
export ANDROID_HOME="/Users/tkc/Library/Android/sdk"
export ANDROID_NDK="/opt/android_ndk/android-ndk-r17c"
export ANDROID_NDK_HOME="/opt/android_ndk/android-ndk-r17c"
export ANDROID_NDK_REPOSITORY="/opt/android_ndk"
export PATH=${PATH}:/opt/gradle/gradle-4.10.3/bin
export PATH=/Users/tkc/Library/Android/sdk/platform-tools:$PATH
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

####################
# Spaceship Prompt #
####################
SPACESHIP_PROMPT_ORDER=(
  # time        # Time stamps section (Disabled)
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  package     # Package version (Disabled)
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode       # Xcode section (Disabled)
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia       # Julia section (Disabled)
  docker      # Docker section (Disabled)
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember       # Ember.js section (Disabled)
  # kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode     # Vi-mode indicator (Disabled)
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
