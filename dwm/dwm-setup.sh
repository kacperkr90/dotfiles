#!/bin/bash

CONFIG_DIR=$HOME/.config
DWM_DIR=$CONFIG_DIR/dwm
DOTFILES_DIR=$CONFIG_DIR/dotfiles
DWM_CONFIG=$DOTFILES_DIR/dwm

# ensure that directories exists
if [ ! -d "$CONFIG_DIR/" ]; then
  mkdir -p $CONFIG_DIR
fi

if [ ! -d "$DWM_DIR" ]; then
  git clone https://git.suckless.org/dwm $DWM_DIR
fi

cd dwm
sudo make install
cd ..