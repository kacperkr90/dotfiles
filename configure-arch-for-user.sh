#!/bin/bash

# packages
sudo pacman -S git xorg xorg-xinit zsh alsa-utils ttf-font-awesome adobe-source-code-pro-fonts curl 

# xorg
cp /usr/share/X11/xorg.conf.d/* /etc/X11/xorg.conf

# zsh
chsh -s /bin/zsh

# dwm
chmod u+x configure-dwm.sh
bash dwm-setup.sh

# st
chmod u+x configure-st.sh
bash st-setup.sh

# sound
