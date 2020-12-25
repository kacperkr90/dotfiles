autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' menu select