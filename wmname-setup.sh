#!/bin/bash

CONFIG_DIR=$HOME/.config
WMNAME_DIR=$CONFIG_DIR/wmname
DOTFILES_DIR=$CONFIG_DIR/dotfiles

# ensure that directories exists
if [ ! -d "$CONFIG_DIR/" ]; then
  mkdir -p $CONFIG_DIR
fi

if [ ! -d "$WMNAME_DIR" ]; then
  git clone https://git.suckless.org/wmname $WMNAME_DIR
fi

cd $WMNAME_DIR

sudo make install

cd $DOTFILES_DIR