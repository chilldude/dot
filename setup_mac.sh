#!/bin/bash

set -x -e

# get directory this script is in
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# update permissions
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/sbin
chmod u+w /usr/local/bin /usr/local/lib /usr/local/sbin

# link up git dotfiles to home dotfiles
ln -sf $dir/.bash_profile ~/.bash_profile
ln -sf $dir/.bash_aliases ~/.bash_aliases
ln -sf $dir/.gitconfig ~/.gitconfig
mkdir -p ~/.config/terminator/
ln -sf $dir/terminator/config ~/.config/terminator/

# install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install nvim
if ! brew install neovim/neovim/neovim
    then echo "neovim depends on gperf"; fi

pip install --user neovim
pip3 install neovim
sudo gem install neovim

# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rm -rf ~/.config/nvim
mkdir -p ~/.config/
ln -s $dir/vim ~/.config/nvim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -sf $dir/zsh/zshrc ~/.zshrc

# install antigen
# https://github.com/zsh-users/antigen
curl -L git.io/antigen > $dir/zsh/antigen/antigen.zsh

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

# command line utilities
# brew install git
brew install fasd
brew install gpg
brew cask install keybase
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install lsd
brew install the_silver_searcher

# Fonts for LSD
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
