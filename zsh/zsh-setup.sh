#!/bin/zsh

CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$CONFIG_DIR/dotfiles
ZSH_CONFIG_DIR=$DOTFILES_DIR/zsh
THEME_DIR=$HOME/apps/agnoster-zsh-theme

# ensure that directories exists
[ ! -d "$CONFIG_DIR/" ] && mkdir -p $CONFIG_DIR
mkdir -p ~/.zprompts

# install agnoster theme
[ ! -d "$THEME_DIR" ] && git clone https://github.com/agnoster/agnoster-zsh-theme $THEME_DIR
ln -sf $THEME_DIR/agnoster.zsh-theme ~/.zprompts/prompt_agnoster_setup

# create soft links to dot files
ln -sf $ZSH_CONFIG_DIR/.zshrc $HOME/.zshrc
ln -sf $ZSH_CONFIG_DIR/.zprofile $HOME/.zprofile
ln -sf $ZSH_CONFIG_DIR/.aliases $HOME/.aliases

# change shell
chsh -s /bin/zsh
