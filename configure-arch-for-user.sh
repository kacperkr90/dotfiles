#!/bin/bash

# packages
sudo pacman -S git xorg xorg-xinit zsh alsa-utils ttf-font-awesome adobe-source-code-pro-fonts curl dmenu

# xorg
cp /usr/share/X11/xorg.conf.d/* /etc/X11/xorg.conf.d/
ln -s $HOME/.config/dotfiles/.xinitrc $HOME/.xinitrc

# zsh
chmod u+x zsh/zsh-setup.sh
bash zsh/zsh-setup.sh

# dwm
chmod u+x dwm-setup.sh
bash dwm-setup.sh

# slstatus
chmod u+x slstatus/slstatus-setup.sh
bash slstatus/slstatus-setup.sh

# st
chmod u+x st/st-setup.sh
bash st/st-setup.sh
