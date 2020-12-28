#!/bin/bash

CONFIG_DIR=$HOME/.config
DWM_DIR=$HOME/apps/suckless/dwm
DOTFILES_DIR=$CONFIG_DIR/dotfiles
DWM_CONFIG=$DOTFILES_DIR/dwm

# ensure that directories exists
[ ! -d "$CONFIG_DIR/" ] && mkdir -p $CONFIG_DIR
[ ! -d "$DWM_DIR" ] && git clone https://git.suckless.org/dwm $DWM_DIR

cd $DWM_DIR

git apply $DWM_CONFIG/my-changes.diff
sudo make install

cd $DOTFILES_DIR