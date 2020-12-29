#!/bin/bash

CONFIG_DIR=$HOME/.config
DWM_DIR=$HOME/apps/suckless/dwm
DOTFILES_DIR=$CONFIG_DIR/dotfiles
DWM_CONFIG=$DOTFILES_DIR/dwm

# ensure that directories exists
[ ! -d "$CONFIG_DIR/" ] && mkdir -p $CONFIG_DIR
[ ! -d "$DWM_DIR" ] && git clone https://git.suckless.org/dwm $DWM_DIR

cd $DWM_DIR

curl -O https://dwm.suckless.org/patches/autostart/dwm-autostart-20200610-cb3f58a.diff
git apply dwm-autostart-20200610-cb3f58a.diff

git apply $DWM_CONFIG/my-changes.diff

DWM_AUTOSTART_DIR=$HOME/.local/share/dwm
mkdir -p $DWM_AUTOSTART_DIR
ln -sf $DOTFILES_DIR/dwm/autostart.sh $DWM_AUTOSTART_DIR/

sudo make install

cd $DOTFILES_DIR



