# Created by newuser for 5.8
# prompt
PS1='%B[%F{red}%n%f%F{yellow}@%f%F{green}%m%f%F{blue} %~%f]%# %b'
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim


# man pages colored
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# vim bindings with normal backspace behaviour
bindkey -v '^?' backward-delete-char


# remove + and - bindings
bindkey -M vicmd -r "+"
bindkey -M vicmd -r "\x2d"

# loading functions 
autoload -Uz compinit
compinit

# aliases

alias muted='muted() { $@ &>/dev/null &; disown }; muted'
alias fuck='sudo $(fc -ln -1)'

alias ls='devicons-ls'
alias lsl='devicons-ls -lh'

alias vim=nvim
alias v=nvim
alias tv='muted alacritty -e nvim'

alias vps='ssh iaquobe@5.189.146.192'

alias git='git --no-pager'
alias gl='git log --all --graph --decorate'

#programs that should not block the terminal
muted_prog=( zathura firefox vimb vimiv st spotify alacritty )
for prog in $muted_prog
do
	alias $prog="muted $prog"
done

alias webcam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'
alias suspend='systemctl suspend'
alias feh="echo sure you don't want to use vimiv"

compdef _precommand muted


setopt autocd

source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[path]=none
