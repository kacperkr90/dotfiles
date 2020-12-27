#!/bin/bash

CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$CONFIG_DIR/dotfiles

echo "export XDG_CONFIG_HOME=\"\$HOME/.config\"" | sudo tee -a /etc/profile
mkdir -p $CONFIG_DIR/sxhkd

ln -s $DOTFILES_DIR/sxhkd/sxhkdrc $CONFIG_DIR/sxhkd/sxhkdrc