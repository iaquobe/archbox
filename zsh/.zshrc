# Created by newuser for 5.8



### VISUALS

# prompt
PS1='%B[%F{red}%n%f%F{yellow}@%f%F{green}%m%f%F{blue} %~%f]%# %b'
[[ -n "$SSH_CLIENT" ]] && PS1="%F{blue}SSH:%f$PS1"
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



### BINDINGS

# vim bindings with normal backspace behaviour
bindkey -v '^?' backward-delete-char

# remove + and - bindings
bindkey -M vicmd -r "+"
bindkey -M vicmd -r "\x2d"

# loading functions 
autoload -Uz compinit
compinit



### ALIASES

# disable output and detach from terminal
alias muted='muted() { $@ &>/dev/null &; disown }; muted'

# ls with colors
alias ls='ls --color'
LS_COLORS='di=94:fi=93:ln=96:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=92:*.rpm=90'
export LS_COLORS

# suspend
alias suspend='systemctl suspend'

# vim shortcuts
alias vim=nvim
alias v=nvim
alias vi=nvim
alias calendar='vim -c "Calendar -task"'
alias rss='newsbeuter -u ~/.config/newsbeuter/urls -C ~/.config/newsbeuter/config'

# connect to contabo server
alias vps='ssh iaquobe@5.189.146.192 -p 8361 -o ServerAliveInterval=15'

# run script in python debugger
alias pdb='python -m pdb'

# git defaults args
alias git='git --no-pager'
alias gl='git log --all --graph --decorate'

# set kb mapping
alias skb='setxkbmap de -option caps:swapescape'
alias uskb='setxkbmap de -option'

#programs that should not block the terminal
muted_prog=( zathura firefox vimiv spotify alacritty )
for prog in $muted_prog
do
	alias $prog="muted $prog"
done

# open mpv window with webcam
alias webcam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'

#auto cd
setopt autocd

# compile auto completion
compdef _precommand muted

# for java application that dont show anything otherwise
export _JAVA_AWT_WM_NONREPARENTING=1

# source syntax highlighting
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[path]=none
