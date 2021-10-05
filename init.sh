#!/bin/sh

mkdir -p $HOME/.vim
cp -af $PWD/.vim/* $HOME/.vim/ 2>/dev/null
ln -sf $PWD/.vimrc $HOME/.vimrc
ln -sf $PWD/.tmux.conf $HOME/.tmux.conf
ln -sf $PWD/.zshrc $HOME/.zshrc
