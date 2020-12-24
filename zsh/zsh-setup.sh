#!/bin/zsh

CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$CONFIG_DIR/dotfiles
ZSH_CONFIG_DIR=$DOTFILES_DIR/zsh

# ensure that directories exists
if [ ! -d "$CONFIG_DIR/" ]; then
  mkdir -p $CONFIG_DIR
fi

# create soft links to dot files
ln -s $ZSH_CONFIG_DIR/.zshrc $HOME/.zshrc
ln -s $ZSH_CONFIG_DIR/.zprofile $HOME/.zprofile

# change shell
chsh -s /bin/zsh