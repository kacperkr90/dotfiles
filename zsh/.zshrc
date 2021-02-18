[ -f "$HOME/.aliases_work" ] && source $HOME/.aliases_work

[ -f "$DOTFILES_DIR/zsh/.aliases" ] && source $DOTFILES_DIR/zsh/.aliases

fpath=("$HOME/.zprompts" "$fpath[@]")
autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt agnoster

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
HIST_IGNORE_ALL_DUPS=true

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

GPG_TTY=$(tty)
export GPG_TTY
