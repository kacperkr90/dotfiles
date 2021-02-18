#!/bin/bash

DOTFILES_DIR=$HOME/.config/dotfiles

# packages

sudo pacman -S git xorg xorg-xinit zsh alsa-utils ttf-font-awesome adobe-source-code-pro-fonts curl dmenu xcompmgr feh sxhkd firefox slock xautolock htop firefox discord keepassxc jdk8-openjdk jdk11-openjdk bc arandr sxiv neovim pulseaudio-alsa pulsemixer pamixer unrar unzip openssh docker fzf openvpn zathura zathura-pdf-mupdf lynx libreoffice-still p7zip newsboat

read -p "Press enter to continue"

# add user to docker group
sudo gpasswd -a $USER docker

# enable & start services
systemctl enable --now docker.service
systemctl enable --now openvpn-client@configuration.service

# xorg
sudo 
cp /usr/share/X11/xorg.conf.d/* /etc/X11/xorg.conf.d/
ln -s $DOTFILES_DIR/.xinitrc $HOME/.xinitrc

# keybinds
chmod u+x sxhkd/sxhkd-setup.sh
./sxhkd/sxhkd-setup.sh

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
chmod u+x $DOTFILES_DIR/wmname-setup.sh
./$DOTFILES_DIR/wmname-setup.sh

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

## lf
git clone https://aur.archlinux.org/lf-git.git $AUR_DIR/lf-git
cd $AUR_DIR/lf-git
makepkg -si
mkdir -p $HOME/.config/lf && ln -sf $DOTFILES_DIR/lfrc $HOME/.config/lf/

## systemd-resolved
git clone https://aur.archlinux.org/openvpn-update-systemd-resolved.git $AUR_DIR/openvpn-update-systemd-resolved
cd $AUR_DIR/openvpn-update-systemd-resolved
makepkg -si
systemctl enable --now systemd-resolved.service

## brave-bin
git clone https://aur.archlinux.org/brave-bin.git $AUR_DIR/brave-bin
cd $AUR_DIR/brave-bin
makepkg -si

cd $DOTFILES_DIR
