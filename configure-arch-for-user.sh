#!/bin/bash

DOTFILES_DIR=$HOME/.config/dotfiles

# packages

sudo pacman -S git xorg zsh plasma kde-applications aegisub lxsplit libreoffice-fresh thunderbird thunderbird-i18n-pl vlc mpv qbittorrent discord

# zsh
chmod u+x zsh/zsh-setup.sh
./zsh/zsh-setup.sh

echo 'Installing AURs...'
# aur
AUR_DIR=$HOME/apps/AUR
mkdir -p $HOME/apps/AUR

## slack
git clone https://aur.archlinux.org/nvidia-390xx-utils.git $AUR_DIR/nvidia-390xx-utils
cd $AUR_DIR/nvidia-390xx-utils
makepkg -si

cd $DOTFILES_DIR
