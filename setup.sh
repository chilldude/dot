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

# install nvim
if ! brew install neovim/neovim/neovim
    then echo "neovim depends on gperf"; fi

rm -rf ~/.config/nvim
mkdir -p ~/.config/
ln -s $dir/vim ~/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -sf $dir/zsh/.zshrc ~/.zshrc
