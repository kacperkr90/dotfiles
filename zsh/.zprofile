#!/bin/zsh

export EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES_DIR=$XDG_CONFIG_HOME/dotfiles

[ -f "$XDG_CONFIG_HOME/.work_env" ] && source $XDG_CONFIG_HOME/.work_env

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec ssh-agent startx
fi
