#!/bin/bash

set -x -e

# get directory this script is in
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# link up git dotfiles to home dotfiles
ln -sf $dir/.bash_profile ~/.bash_profile
ln -sf $dir/.bash_aliases ~/.bash_aliases
ln -sf $dir/.gitconfig ~/.gitconfig
ln -sf $dir/zsh/zshrc ~/.zshrc
mkdir -p ~/.config/terminator/
ln -sf $dir/terminator/config ~/.config/terminator/

# install brew
# OSX:
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# linux:
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

# install nvim
if ! brew install neovim/neovim/neovim
    then echo "neovim depends on gperf"; fi

rm -rf ~/.config/nvim
mkdir -p ~/.config/
ln -s $dir/vim ~/.config/nvim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -sf $dir/zsh/.zshrc ~/.zshrc

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

# command line utilities
brew install git
brew install fasd
brew install gpg
brew cask install keybase
