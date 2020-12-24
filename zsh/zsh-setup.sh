#!/bin/zsh

CONFIG_DIR=$HOME/.config

# ensure that directories exists
if [ ! -d "$CONFIG_DIR/" ]; then
  mkdir -p $CONFIG_DIR
fi

# create soft links to dot files
ln -s $CONFIG_DIR/dotfiles/.zshrc $HOME/.zshrc
ln -s $CONFIG_DIR/dotfiles/.zprofile $HOME/.zprofile

# change shell
chsh -s /bin/zsh