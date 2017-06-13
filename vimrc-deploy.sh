#!/bin/bash

VUNDLE_DIR="$HOME/.vim/"
if [ ! -d "$VUNDLE_DIR" ]; then  # If there is no ~/.vim directory
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
cp .vimrc ~/.vimrc
vim +PluginInstall +qall

