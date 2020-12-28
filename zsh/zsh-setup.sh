#!/bin/zsh

CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$CONFIG_DIR/dotfiles
ZSH_CONFIG_DIR=$DOTFILES_DIR/zsh

# ensure that directories exists
[ ! -d "$CONFIG_DIR/" ] && mkdir -p $CONFIG_DIR

# create soft links to dot files
ln -s $ZSH_CONFIG_DIR/.zshrc $HOME/.zshrc
ln -s $ZSH_CONFIG_DIR/.zprofile $HOME/.zprofile
ln -s $ZSH_CONFIG_DIR/.aliases $HOME/.aliases

# change shell
chsh -s /bin/zsh