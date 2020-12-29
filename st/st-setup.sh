#!/bin/bash

CONFIG_DIR=$HOME/.config
ST_DIR=$HOME/apps/suckless/st
DOTFILES_DIR=$CONFIG_DIR/dotfiles
ST_CONFIG=$DOTFILES_DIR/st

# ensure that directories exists
[ ! -d "$CONFIG_DIR/" ] && mkdir -p $CONFIG_DIR
[ ! -d "$ST_DIR" ] && git clone https://git.suckless.org/st $ST_DIR

cd $ST_DIR

# alpha
curl -O https://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff
git apply st-alpha-0.8.2.diff

# font
git apply $ST_CONFIG/my-font.diff

# install
sudo make install

cd $DOTFILES_DIR
