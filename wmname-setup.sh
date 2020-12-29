#!/bin/bash

CONFIG_DIR=$HOME/.config
WMNAME_DIR=$HOME/apps/suckless/wmname
DOTFILES_DIR=$CONFIG_DIR/dotfiles

# ensure that directories exists
[ ! -d "$CONFIG_DIR/" ] && mkdir -p $CONFIG_DIR
[ ! -d "$WMNAME_DIR" ] && git clone https://git.suckless.org/wmname $WMNAME_DIR

cd $WMNAME_DIR

sudo make install

cd $DOTFILES_DIR
