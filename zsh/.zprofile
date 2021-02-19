#!/bin/zsh

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES_DIR=$XDG_CONFIG_HOME/dotfiles
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

[ -f "$XDG_CONFIG_HOME/.work_env" ] && source $XDG_CONFIG_HOME/.work_env

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec ssh-agent startx
fi
