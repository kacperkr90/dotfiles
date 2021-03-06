#!/bin/bash

CONFIG_DIR=$HOME/.config
SLSTATUS_DIR=$HOME/apps/suckless/slstatus
DOTFILES_DIR=$CONFIG_DIR/dotfiles
SLSTATUS_CONFIG=$DOTFILES_DIR/slstatus

# ensure that directories exists
[ ! -d "$CONFIG_DIR/" ] && mkdir -p $CONFIG_DIR
[ ! -d "$SLSTATUS_DIR" ] && git clone https://git.suckless.org/slstatus $SLSTATUS_DIR

cd $SLSTATUS_DIR

git apply $SLSTATUS_CONFIG/my-bar.diff
sudo make install

cd $DOTFILES_DIR