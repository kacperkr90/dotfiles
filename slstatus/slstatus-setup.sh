#!/bin/bash

CONFIG_DIR=$HOME/.config
SLSTATUS_DIR=$CONFIG_DIR/slstatus
DOTFILES_DIR=$CONFIG_DIR/dotfiles
SLSTATUS_CONFIG=$DOTFILES_DIR/slstatus

# ensure that directories exists
if [ ! -d "$CONFIG_DIR/" ]; then
  mkdir -p $CONFIG_DIR
fi

if [ ! -d "$SLSTATUS_DIR" ]; then
  git clone https://git.suckless.org/slstatus $SLSTATUS_DIR
fi

cd $SLSTATUS_DIR

git apply $SLSTATUS_CONFIG/my-bar.diff
sudo make install

cd $DOTFILES_DIR