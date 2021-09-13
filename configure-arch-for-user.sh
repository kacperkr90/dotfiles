#!/bin/bash

DOTFILES_DIR=$HOME/.config/dotfiles

# packages

sudo pacman -S git xorg zsh plasma-desktop kde-applications aegisub lxsplit libreoffice-fresh thunderbird thunderbird-i18n-pl vlc mpv qbittorrent discord

# zsh
chmod u+x zsh/zsh-setup.sh
./zsh/zsh-setup.sh

systemctl enable sddm.service

cd $DOTFILES_DIR
