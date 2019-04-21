export ZSH="/home/felipecortez/.oh-my-zsh"

ZSH_THEME="felipecortez"
EDITOR="nvim"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias copy="xclip -selection clipboard"
alias synctime="systemctl restart systemd-timesyncd.service"

export KEYTIMEOUT=1

bindkey -v
