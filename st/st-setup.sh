#!/bin/zsh

CONFIG_DIR=$HOME/.config
ST_DIR=$CONFIG_DIR/st
DOTFILES_DIR=$CONFIG_DIR/dotfiles
ST_CONFIG=$DOTFILES_DIR/st

# ensure that directories exists
if [ ! -d "$CONFIG_DIR/" ]; then
  mkdir -p $CONFIG_DIR
fi

if [ ! -d "$ST_DIR" ]; then
  git clone https://git.suckless.org/st $ST_DIR
fi

cd $ST_DIR

# solarized theme
curl -O https://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff
curl -O https://st.suckless.org/patches/solarized/st-no_bold_colors-0.8.1.diff
curl -O https://st.suckless.org/patches/solarized/st-solarized-dark-20180411-041912a.diff
git apply st-alpha-0.8.2.diff
git apply st-no_bold_colors-0.8.1.diff
git apply st-solarized-dark-20180411-041912a.diff

# font
git apply $ST_CONFIG/my-font.diff

# install
sudo make install

cd $DOTFILES_DIR