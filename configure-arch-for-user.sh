#!/bin/bash

DOTFILES_DIR=$HOME/.config/dotfiles

# packages

sudo pacman -S git \ 
	xorg xorg-xinit \
	zsh \
	alsa-utils \
	ttf-font-awesome \
	ttf-ms-fonts \
	adobe-source-code-pro-fonts \
	curl \
	dmenu \
	picom \
	feh \
	sxhkd \
	firefox \
	htop

# xorg
cp /usr/share/X11/xorg.conf.d/* /etc/X11/xorg.conf.d/
ln -s $DOTFILES_DIR/.xinitrc $HOME/.xinitrc

# picom
chmod u+x picom/picom-setup.sh
bash picom/picom-setup.sh

# zsh
chmod u+x zsh/zsh-setup.sh
bash zsh/zsh-setup.sh

# dwm
chmod u+x dwm/dwm-setup.sh
bash dwm/dwm-setup.sh

# slstatus
chmod u+x slstatus/slstatus-setup.sh
bash slstatus/slstatus-setup.sh

# st
chmod u+x st/st-setup.sh
bash st/st-setup.sh

# wmname
chmod u+x wmname-setup.sh
bash wmname-setup.sh

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

# keybinds
chmod u+x sxhkd/sxhkd-setup.sh
bash sxhkd/sxhkd-setup.sh
