#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1="\[\033[38;5;9m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;9m\]\W\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"


source $HOME/.config/zsh/all.sh
