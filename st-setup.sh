#!/bin/zsh

git clone https://git.suckless.org/st $HOME/st
cd $HOME/st

# solarized theme
curl -O https://st.suckless.org/patches/solarized/st-no_bold_colors-0.8.1.diff
curl -O https://st.suckless.org/patches/solarized/st-solarized-dark-20180411-041912a.diff

git apply st-no_bold_colors-0.8.1.diff
git apply st-solarized-dark-20180411-041912a.diff

# install
sudo make install
cd $HOME