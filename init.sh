#!/bin/bash

ln -sf $PWD/.vimrc $HOME/.vimrc
ln -sf $PWD/.tmux.conf $HOME/.tmux.conf
ln -sf $PWD/.zshrc $HOME/.zshrc
cp -rf $PWD/.vim/* $HOME/.vim/ 2>/dev/null
