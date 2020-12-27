#!/bin/bash

DOTFILES_DIR=$HOME/.config/dotfiles

# packages

sudo pacman -S git xorg xorg-xinit zsh alsa-utils ttf-font-awesome adobe-source-code-pro-fonts curl dmenu picom feh sxhkd firefox i3lock xautolock htop firefox discord keepassxc

read -p "Press enter to continue"

# xorg
sudo cp /usr/share/X11/xorg.conf.d/* /etc/X11/xorg.conf.d/
ln -s $DOTFILES_DIR/.xinitrc $HOME/.xinitrc

# picom
chmod u+x picom/picom-setup.sh
./picom/picom-setup.sh

# zsh
chmod u+x zsh/zsh-setup.sh
./zsh/zsh-setup.sh

# dwm
chmod u+x dwm/dwm-setup.sh
./dwm/dwm-setup.sh

# slstatus
chmod u+x slstatus/slstatus-setup.sh
./slstatus/slstatus-setup.sh

# st
chmod u+x st/st-setup.sh
./st/st-setup.sh

# wmname
chmod u+x wmname-setup.sh
./wmname-setup.sh

# aur
AUR_DIR=$HOME/apps/AUR
mkdir -p $HOME/apps/AUR

## slack
git clone https://aur.archlinux.org/slack-desktop.git $AUR_DIR/slack-desktop
cd $AUR_DIR/slack-desktop
makepkg -si

## intellij-idea
git clone https://aur.archlinux.org/intellij-idea-ultimate-edition.git $AUR_DIR/intellij-idea
cd $AUR_DIR/intellij-idea
makepkg -si

## google-chrome
git clone https://aur.archlinux.org/google-chrome.git $AUR_DIR/google-chrome
cd $AUR_DIR/google-chrome
makepkg -si


cd $DOTFILES_DIR
# keybinds
chmod u+x sxhkd/sxhkd-setup.sh
./sxhkd/sxhkd-setup.sh
