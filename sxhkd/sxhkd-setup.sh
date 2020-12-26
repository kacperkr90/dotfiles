#!/bin/bash

CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$CONFIG_DIR/dotfiles

echo "export XDG_CONFIG_HOME=\"\$HOME/.config\"" | sudo tee -a /etc/profile
mkdir -p $XDG_CONFIG_HOME/sxhkd

ln -s $DOTFILES_DIR/sxhkd/sxhkdrc $XDG_CONFIG_HOME/sxhkd/sxhkdrc