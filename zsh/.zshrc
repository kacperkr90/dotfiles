[ -f "$HOME/.aliases_work" ] && source $HOME/.aliases_work

[ -f "$HOME/.aliases" ] && source $HOME/.aliases

fpath=("$HOME/.zprompts" "$fpath[@]")
autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt agnoster

SAVEHIST=1000
HISTFILE=~/.zsh_history

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
