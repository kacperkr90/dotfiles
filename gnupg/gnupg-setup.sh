#!/bin/bash

echo "Installing gnupg package if not installed..."
command -v gpg && echo "Package gnupg is installed." || (echo "Package gnupg is not installed. Installing..." && sudo pacman -S gnupg)

echo "Linking gpg-agent.conf to $GNUPGHOME..." 
ln -sf $DOTFILES_DIR/gnupg/gpg-agent.conf $GNUPGHOME/gpg-agent.conf

echo "Reloading the gpg-agent"
gpg-connect-agent reloadagent /bye
