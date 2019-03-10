#!/bin/bash

ln -sf ./.vimrc $HOME/.vimrc
ln -sf ./.tmux.conf $HOME/.tmux.conf
ln -sf ./.zshrc $HOME/.zshrc
cp -rf ./.vim/* $HOME/.vim/ 2>/dev/null
