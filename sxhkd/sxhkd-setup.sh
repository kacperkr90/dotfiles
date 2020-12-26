#!/bin/bash

CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$CONFIG_DIR/dotfiles

sudo echo "export XDG_CONFIG_HOME=\"\$HOME/.config\"" >> /etc/profile
mkdir -p $XDG_CONFIG_HOME/sxhkd/sxhkdrc

sudo cp $DOTFILES_DIR/sxhkd/sxhkd.service /etc/systemd/system/
systemctl enable sxhkd.service