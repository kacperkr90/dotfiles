if [[ -a "$HOME/.aliases_work" ]]; then
  source $HOME/.aliases_work
fi

source $HOME/.aliases

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' menu select